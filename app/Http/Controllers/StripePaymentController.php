<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Order;
use App\Models\Plan;
use App\Models\User;
use App\Models\UserCoupon;
use App\Models\InvoicePayment;
use App\Models\Utility;
use App\Models\Invoice;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Redirect;
use Log;


class StripePaymentController extends Controller
{

    public $currancy;
    public $is_stripe_enabled;
    public $stripe_key;
    public $stripe_secret;

    public function paymentSetting($user_id)
    {
        if (Auth::check())
        {
            $payment_setting = Utility::getAdminPaymentSetting($user_id);
            $this->currancy  = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';

        }else{

            $payment_setting = Utility::getCompanyPaymentSetting($user_id);
            $this->currancy  = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';
        }
        
        $this->is_stripe_enabled = isset($payment_setting['is_stripe_enabled']) ? $payment_setting['is_stripe_enabled'] : 'off';
        $this->stripe_key        = isset($payment_setting['stripe_key']) ? $payment_setting['stripe_key'] : 'off';
        $this->stripe_secret     = isset($payment_setting['stripe_secret']) ? $payment_setting['stripe_secret'] : 'off';
    }

    public function payment($code)
    {
        if(Auth::user()->type != 'admin')
        {
            $planID = \Illuminate\Support\Facades\Crypt::decrypt($code);
            $plan   = Plan::find($planID);

            if($plan)
            {
                if($plan->id == 1)
                {
                    Auth::user()->assignPlan(1);

                    return redirect()->route('home')->with('success', __('Free Plan Activated Successfully.!'));
                }
                else
                {
                    $paymentSetting = Utility::getPaymentSetting(1);

                    return view('plans.payment', compact('plan', 'paymentSetting'));
                }
            }
            else
            {
                return redirect()->back()->with('error', __('Plan Is Deleted.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function planGetStripePaymentStatus(Request $request)
{    
    Session::forget('stripe_session');

    $this->paymentSetting(1);

    $paymentSetting = Utility::getPaymentSetting(1);

    try
    {
        if($request->return_type == 'success')
        {
            $objUser                    = \Auth::user();
            $objUser->is_plan_purchased = 1;
            if($objUser->is_trial_done == 1)
            {
                $objUser->is_trial_done = 2;
            }
            $objUser->save();

            $assignPlan = $objUser->assignPlan($request->plan_id, $request->payment_frequency);

            
            if($assignPlan['is_success'])
            {
                $plan           = Plan::find($request['plan_id']);
                $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                Order::create([
                    'order_id' => $orderID,
                    'name' => null,
                    'email' => null,
                    'card_number' => null,
                    'card_exp_month' => null,
                    'card_exp_year' => null,
                    'plan_name' => $plan->name,
                    'plan_id' => $plan->id,
                    'price' => $request->price,
                    'price_currency' => $this->currancy,
                    'txn_id' => '',
                    'payment_type' => __('Stripe'),
                    'receipt' => $plan['receipt_url'],
                    'payment_status' => 'succeeded',
                    'receipt' => null,
                    'user_id' => $objUser->id,
                ]);

                return redirect()->route('profile')->with('success', __('Plan Activated Successfully!'));
            }
            else
            {
                return redirect()->route('profile')->with('error', __($assignPlan['error']));
            }
        }
        else
        {
            return redirect()->route('profile')->with('error', __('Your Payment has failed!'));
        }
    }
    catch(\Exception $exception)
    {
        Log::debug($exception->getMessage());
        return redirect()->route('profile')->with('error', __('An error occurred during plan activation'));
    }
}

    public function stripePost(Request $request)
    {
        $this->paymentSetting(1);

        $paymentSetting = Utility::getAdminPaymentSetting(1);

        if($paymentSetting['enable_stripe'] == 'on' && !empty($paymentSetting['stripe_key']) && !empty($paymentSetting['stripe_secret']))
        {
            $planID         = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
            $plan           = Plan::find($planID);

            $authuser       = Auth::user();
            $stripe_session = '';

            if($plan)
            {
                /* Check for code usage */
                $plan->discounted_price = false;
                $payment_frequency      = $request->stripe_payment_frequency;
                $price                  = $plan->{$payment_frequency . '_price'};
                if(isset($request->coupon) && !empty($request->coupon))
                {
                    $request->coupon = trim($request->coupon);
                    $coupons         = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
                    if(!empty($coupons))
                    {
                        $usedCoupun             = $coupons->used_coupon();
                        $discount_value         = ($price / 100) * $coupons->discount;
                        $plan->discounted_price = $price - $discount_value;

                        if($usedCoupun >= $coupons->limit)
                        {
                            return redirect()->back()->with('error', __('This coupon code has expired.'));
                        }
                        $price = $price - $discount_value;
                    }
                    else
                    {
                        return redirect()->back()->with('error', __('This coupon code is invalid or has expired.'));
                    }
                }

                if($price <= 0)
                {

                    $authuser->plan = $plan->id;
                    $authuser->save();

                    $assignPlan = $authuser->assignPlan($plan->id);

                    if($assignPlan['is_success'] == true && !empty($plan))
                    {
                        if(!empty($authuser->payment_subscription_id) && $authuser->payment_subscription_id != '')
                        {
                            try
                            {
                                $authuser->cancel_subscription($authuser->id);
                            }
                            catch(\Exception $exception)
                            {
                                Log::debug($exception->getMessage());
                            }
                        }

                        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                        Order::create([
                                          'order_id' => $orderID,
                                          'name' => null,
                                          'email' => null,
                                          'card_number' => null,
                                          'card_exp_month' => null,
                                          'card_exp_year' => null,
                                          'plan_name' => $plan->name,
                                          'plan_id' => $plan->id,
                                          'price' => $price,
                                          'price_currency' => $this->currancy,
                                          'txn_id' => '',
                                          'payment_type' => __('Stripe'),
                                          'receipt' => isset($data['receipt_url']) ? $data['receipt_url'] : 'free coupon',
                                          'payment_status' => 'succeeded',
                                          'receipt' => null,
                                          'user_id' => $authuser->id,
                                      ]);

                        return redirect()->route('home')->with('success', __('Plan Successfully Upgraded.'));
                    }
                    else
                    {
                        return redirect()->back()->with('error', __('Plan fail to upgrade.'));
                    }
                }

                try
                {
                    $payment_frequency      = $request->stripe_payment_frequency;
                    $payment_plan = $request->stripe_payment_frequency;
                    $payment_type = $request->payment_type;

                    /* Payment details */
                    $code = '';
                    if(isset($request->coupon) && !empty($request->coupon) && $plan->discounted_price)
                    {
                        $price = $plan->discounted_price;

                        $code  = $request->coupon;
                    }

                    $product = $plan->name;
                    /* Final price */
                    $stripe_formatted_price = in_array($this->currancy, [

                        'MGA',
                        'BIF',
                        'CLP',
                        'PYG',
                        'DJF',
                        'RWF',
                        'GNF',
                        'UGX',
                        'JPY',
                        'VND',
                        'VUV',
                        'XAF',
                        'KMF',
                        'KRW',
                        'XOF',
                        'XPF',
                        ]) ? number_format($price, 2, '.', '') : number_format($price, 2, '.', '') * 100;
                    $return_url_parameters = function ($return_type)
                    {

                        return '&return_type=' . $return_type .  '&payment_processor=stripe';
                    };

                    /* Initiate Stripe */
                    \Stripe\Stripe::setApiKey($paymentSetting['stripe_secret']);
                    try {
                        switch($payment_type)
                    {
                        case 'one-time':
                            $stripe_session = \Stripe\Checkout\Session::create([
                                'payment_method_types' => ['card'],
                                'line_items' => [
                                                [
                                                    'name' => $product,
                                                    'description' => $payment_plan,
                                                    'amount' => $stripe_formatted_price,
                                                    'currency' => $this->currancy,
                                                    'quantity' => 1,
                                                ],
                                            ],
                                            'metadata' => [
                                                'user_id' => $authuser->id,
                                                'package_id' => $plan->id,
                                                'payment_frequency' => $payment_frequency,
                                                'code' => $code,
                                            ],
                                            'success_url' => route('stripe.payment.status', [
                                                'plan_id' => $plan->id,
                                                'price' => $price,
                                                'payment_frequency' => $payment_frequency,
                                                $return_url_parameters('success'),
                                            ]),
                                            'cancel_url' => route('stripe.payment.status', [
                                                'plan_id' => $plan->id,
                                                $return_url_parameters('cancel'),
                                            ]),
                                        ]);
                            break;

                        case 'recurring':

                            // Try to get the product related to the package
                            try
                            {
                                $stripe_product = \Stripe\Product::retrieve($plan->id);
                            }
                            catch(\Exception $e)
                            {
                                /* The product probably does not exist */
                                Log::debug($e->getMessage());
                            }

                            if(!isset($stripe_product))
                            {
                                /* Create the product if not already created */
                                $stripe_product = \Stripe\Product::create([
                                                                              'id' => $plan->id,
                                                                              'name' => $product,
                                                                              'type' => 'service',
                                                                          ]);
                            }

                            /* Generate the plan id with the proper parameters */
                            $stripe_plan_id = $plan->id . '_' . $payment_plan . '_' . $stripe_formatted_price . '_' .$this->currancy;

                            /* Check if we already have a payment plan created and try to get it */
                            try
                            {
                                $stripe_plan = \Stripe\Plan::retrieve($stripe_plan_id);
                            }
                            catch(\Exception $e)
                            {
                                /* The plan probably does not exist */
                                Log::debug($e->getMessage());
                            }

                            /* Create the plan if it doesnt exist already */
                            if(!isset($stripe_plan))
                            {
                                try
                                {
                                    $stripe_plan = \Stripe\Plan::create([
                                                                            'amount' => $stripe_formatted_price,
                                                                            'interval' => $payment_plan == 'monthly' ? 'month' : 'year',
                                                                            'product' => $stripe_product->id,
                                                                            'currency' => $this->currancy,
                                                                            'id' => $stripe_plan_id,
                                                                        ]);
                                }
                                catch(\Exception $e)
                                {
                                    Log::debug($e->getMessage());
                                }
                            }

                            $stripe_session = \Stripe\Checkout\Session::create([
                                    'payment_method_types' => ['card'],
                                    'subscription_data' => [
                                        'items' => [
                                            ['plan' => $stripe_plan->id],
                                        ],
                                        'metadata' => [
                                            'user_id' => $authuser->id,
                                            'package_id' => $plan->id,
                                            'payment_frequency' => $payment_frequency,
                                            'code' => $code,
                                        ],
                                    ],
                                    'metadata' => [
                                        'user_id' => $authuser->id,
                                        'package_id' => $plan->id,
                                        'payment_frequency' => $payment_frequency,
                                        'code' => $code,
                                    ],
                                    'client_reference_id' => $authuser->id . '###' . $plan->id . '###' . $payment_plan . '###' . time(),
                                    'success_url' => route('stripe.payment.status', [
                                        'plan_id' => $plan->id,
                                        'payment_frequency' => $payment_frequency,
                                        $return_url_parameters('success'),
                                    ]),
                                    'cancel_url' => route('stripe.payment.status', [
                                        'plan_id' => $plan->id,
                                        $return_url_parameters('cancel'),
                                    ]),
                                ]);

                            break;
                    }
                  
                    Utility::referralTransaction($plan, $stripe_formatted_price);

                    } catch (\Throwable $th)
                    {
                        return redirect()->route('payment', $request->plan_id)->with('error', $th->getMessage());
                    }
                    $stripe_session = $stripe_session ?? false;

                    // return $stripe_session;
                }
                catch(\Exception $e)
                {
                    Log::debug($e->getMessage());
                }

                return redirect()->route('payment', $request->plan_id)->with(['stripe_session' => $stripe_session]);
            }
            else
            {

                return redirect()->route('payment', $request->plan_id)->with('error', __('Plan Is Deleted.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Please Enter Stripe Details.'));
        }
    }

    public function webhookStripe(Request $request)
    {
        $paymentSetting = Utility::getPaymentSetting();

        /* Initiate Stripe */
        \Stripe\Stripe::setApiKey($paymentSetting['stripe_secret']);

        $payload    = @file_get_contents('php://input');
        $sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
        $event      = null;

        try
        {
            $event = \Stripe\Webhook::constructEvent(
                $payload, $sig_header, $paymentSetting['stripe_webhook_secret']
            );

            if(!in_array($event->type, [
                'invoice.paid',
                'checkout.session.completed',
            ]))
            {
                die();
            }

            $session = $event->data->object;

            $payment_id   = $session->id;
            $payer_id     = $session->customer;
            $payer_object = \Stripe\Customer::retrieve($payer_id);
            $payer_name   = $payer_object->name;
            $payer_email  = $payer_object->email;

            Log::debug('event');
            Log::debug($event);

            if($session->payment_intent)
            {
                try
                {
                    $stripe = new \Stripe\StripeClient($paymentSetting['stripe_secret']);
                    $s      = $stripe->paymentIntents->retrieve($session->payment_intent, []);
                    Log::debug('payment_intent');
                    Log::debug($s);
                }
                catch(\Exception $e)
                {
                    Log::debug($e->getMessage());
                }
            }

            switch($event->type)
            {
                /* Handling recurring payments */ case 'invoice.paid':

                $payment_total = in_array($this->currancy, [
                    'MGA',
                    'BIF',
                    'CLP',
                    'PYG',
                    'DJF',
                    'RWF',
                    'GNF',
                    'UGX',
                    'JPY',
                    'VND',
                    'VUV',
                    'XAF',
                    'KMF',
                    'KRW',
                    'XOF',
                    'XPF',
                ]) ? $session->amount_paid : $session->amount_paid / 100;

                $payment_currency = strtoupper($session->currency);

                /* Process meta data */
                $metadata = $session->lines->data[0]->metadata;

                $user_id           = (int)$metadata->user_id;
                $package_id        = (int)$metadata->package_id;
                $payment_frequency = $metadata->payment_frequency;
                $code              = isset($metadata->code) ? $metadata->code : '';

                /* Vars */
                $payment_type            = $session->subscription ? 'recurring' : 'one-time';
                $payment_subscription_id = $payment_type == 'recurring' ? 'stripe###' . $session->subscription : '';

                break;

                /* Handling one time payments */ case 'checkout.session.completed':

                /* Exit when the webhook comes for recurring payments as the invoice.payment_succeeded event will handle it */ if($session->subscription)
            {
                die();
            }

                $payment_total    = in_array($this->currancy, [
                    'MGA',
                    'BIF',
                    'CLP',
                    'PYG',
                    'DJF',
                    'RWF',
                    'GNF',
                    'UGX',
                    'JPY',
                    'VND',
                    'VUV',
                    'XAF',
                    'KMF',
                    'KRW',
                    'XOF',
                    'XPF',
                ]) ? $session->amount_total : $session->amount_total / 100;
                $payment_currency = strtoupper($session->currency);

                /* Process meta data */
                $metadata = $session->metadata;

                $user_id           = (int)$metadata->user_id;
                $package_id        = (int)$metadata->package_id;
                $payment_frequency = $metadata->payment_frequency;
                $code              = isset($metadata->code) ? $metadata->code : '';

                /* Vars */
                $payment_type            = $session->subscription ? 'recurring' : 'one-time';
                $payment_subscription_id = $payment_type == 'recurring' ? 'stripe###' . $session->subscription : '';

                break;
            }

            $plan = Plan::find($package_id);
            if(!$plan)
            {
                http_response_code(400);
                die();
            }

            /* Make sure the account still exists */
            $user = User::find($user_id);

            if(!$user)
            {
                http_response_code(400);
                die();
            }

            /* Unsubscribe from the previous plan if needed */
            if(!empty($user->payment_subscription_id) && $user->payment_subscription_id != $payment_subscription_id)
            {
                try
                {
                    $user->cancel_subscription($user_id);
                }
                catch(\Exception $exception)
                {
                    Log::debug($exception->getMessage());
                }
            }

            Order::create([
                        'order_id' => $payment_id,
                        'subscription_id' => $session->subscription,
                        'payer_id' => $payer_id,
                        'name' => $payer_name,
                        'card_number' => '',
                        'card_exp_month' => '',
                        'card_exp_year' => '',
                        'plan_name' => $plan->name,
                        'plan_id' => $plan->id,
                        'price' => $payment_total,
                        'price_currency' => $payment_currency,
                        'txn_id' => '',
                        'payment_type' => 'STRIPE',
                        'payment_frequency' => $payment_frequency,
                        'payment_status' => '',
                        'receipt' => '',
                        'user_id' => $user->id,
                    ]);

            if(!empty($code))
            {
                $coupons = Coupon::where('code', strtoupper($code))->where('is_active', '1')->first();

                $userCoupon         = new UserCoupon();
                $userCoupon->user   = $user->id;
                $userCoupon->coupon = $coupons->id;
                $userCoupon->order  = $payment_id;
                $userCoupon->save();
                $usedCoupun = $coupons->used_coupon();
                if($coupons->limit <= $usedCoupun)
                {
                    $coupons->is_active = 0;
                    $coupons->save();
                }
            }

            $user->payment_subscription_id = $payment_subscription_id;
            $user->save();

        }
        catch(\UnexpectedValueException $e)
        {

            Log::debug($e->getMessage());

            // Invalid payload
            http_response_code(400);
            exit();

        }
        catch(\Stripe\Error\SignatureVerification $e)
        {

            Log::debug($e->getMessage());
            // Invalid signature
            http_response_code(400);
            exit();

        }
    }

    public function invoicePayWithStripe(Request $request,$id)
    {
        $invoice_id = \Illuminate\Support\Facades\Crypt::decrypt($id);

        $amount = $request->amount;
        $settings = Utility::settings();

        $validatorArray = [
            'amount' => 'required',
            'invoice_id' => 'required',
        ];

        $validator      = Validator::make(
            $request->all(), $validatorArray
        )->setAttributeNames(['invoice_id' => 'Invoice']);

        $invoice = Invoice::find($invoice_id);
        $invoice_id = $invoice->created_by;

        $paymentSetting = Utility::getPaymentSetting($invoice->created_by);

        $amount = number_format((float)$request->amount, 2, '.', '');
        $invoice_getdue = number_format((float)$invoice->getDue(), 2, '.', '');

        try
        {
            $stripe_formatted_price = in_array(
                $this->currancy, [
                                    'MGA',
                                    'BIF',
                                    'CLP',
                                    'PYG',
                                    'DJF',
                                    'RWF',
                                    'GNF',
                                    'UGX',
                                    'JPY',
                                    'VND',
                                    'VUV',
                                    'XAF',
                                    'KMF',
                                    'KRW',
                                    'XOF',
                                    'XPF',
                               ]
            ) ? number_format($amount, 2, '.', '') : number_format($amount, 2, '.', '') * 100;
            $return_url_parameters = function ($return_type){
                return '&return_type=' . $return_type . '&payment_processor=stripe';
            };

            /* Initiate Stripe */
            \Stripe\Stripe::setApiKey($paymentSetting['stripe_secret']);

            $stripe_session = \Stripe\Checkout\Session::create(
                [
                    'payment_method_types' => ['card'],
                    'line_items' => [
                        [
                            'name' => $settings['company_name'] . " - " . User::invoiceNumberFormat($invoice->invoice_id),
                            'description' => 'payment for Invoice',
                            'amount' => (int)$stripe_formatted_price,
                            'currency' => $settings['site_currency'],
                            'quantity' => 1,
                        ],
                    ],
                    'metadata' => [
                        'invoice_id' => $request->invoice_id,
                    ],
                    'success_url' => route(
                        'invoice.stripe', [
                                            'invoice_id' => encrypt($invoice_id),
                                            'TXNAMOUNT' => $amount,
                                            $return_url_parameters('success'),
                                        ]
                    ),
                    'cancel_url' => route(
                        'invoice.stripe', [
                                            'invoice_id' => encrypt($invoice_id),
                                            'TXNAMOUNT' => $amount,
                                            $return_url_parameters('cancel'),
                                        ]
                    ),
                ]
            );


            $stripe_session = $stripe_session ?? false;
            try{

                return new RedirectResponse($stripe_session->url);
            }
            catch(\Exception $e)
            {
                Log::debug($e->getMessage());
                return redirect()->route('pay.invoice',$id)->with('error', __('Transaction has been failed!'));
            }
        }
        catch(\Exception $e)
        {

            Log::debug($e->getMessage());
            return redirect()->route('pay.invoice',$id)->with('error', $e->getMessage());
        }
    }

    public function getInvociePaymentStatus(Request $request,$invoice_id)
    {
        Session::forget('stripe_session');
        try
        {
            if($request->return_type == 'success')
            {
                if(!empty($invoice_id))
                {
                    $invoice_id = decrypt($invoice_id);

                    $invoice    = Invoice::find($invoice_id);

                    $this->paymentSetting($invoice->created_by);
                    if($invoice)
                    {
                        try
                        {

                            if($request->return_type == 'success')
                            {
                                $invoice_payment                 = new InvoicePayment();
                                $invoice_payment->transaction_id = app('App\Http\Controllers\InvoiceController')->transactionNumber($invoice->created_by);
                                $invoice_payment->invoice_id     = $invoice_id;
                                $invoice_payment->amount         = isset($request->TXNAMOUNT) ? $request->TXNAMOUNT : 0;
                                $invoice_payment->date           = date('Y-m-d');
                                $invoice_payment->payment_id     = 0;
                                $invoice_payment->payment_type   = __('STRIPE');
                                $invoice_payment->client_id      = 0;
                                $invoice_payment->notes          = '';
                                $invoice_payment->save();


                                $invoice_getdue = number_format((float)$invoice->getDue(), 2, '.', '');

                                if($invoice_getdue <= 0.0)
                                {

                                    Invoice::change_status($invoice->id, 3);
                                }
                                else{

                                    Invoice::change_status($invoice->id, 2);
                                }
                                if(\Auth::check())
                                {
                                        $user = Auth::user();
                                }
                                else
                                {
                                    $user=User::where('id',$invoice->created_by)->first();
                                }
                                if($user->type != 'owner')
                                {
                                    $user=User::where('id',$user->created_by)->first();
                                }
                                $settings  = Utility::settingsById($invoice->created_by);
                                $uArr = [
                                    'invoice_id' => Utility::invoiceNumberFormat($invoice->invoice_id),
                                    'owner_name' => $user->name,
                                ];

                                if(isset($settings['invoice_status_notificaation']) && $settings['invoice_status_notificaation'] == 1){
                                    Utility::send_slack_msg('invoice_status_updated',$uArr,$user->id);
                                }

                                if(isset($settings['telegram_invoice_status_notificaation']) && $settings['telegram_invoice_status_notificaation'] == 1){
                                    Utility::send_telegram_msg('invoice_status_updated',$uArr,$user->id);
                                }
                                //webhook
                                $module ='Invoice Status Updated';

                                $webhook=  Utility::webhookSetting($module,$user->id);

                                if($webhook)
                                {
                                    $parameter = json_encode($invoice_payment);
                                    // 1 parameter is  URL , 2 parameter is data , 3 parameter is method
                                    $status = Utility::WebhookCall($webhook['url'],$parameter,$webhook['method']);
                                    if($status == true)
                                    {
                                        return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('success', __('Payment added Successfully'));
                                    }
                                    else
                                    {
                                        return redirect()->back()->with('error', __('Webhook call failed.'));
                                    }
                                }
                                if(\Auth::check())
                                {
                                    return redirect()->back()->with('success', __('Payment Added Successfully'));
                                }
                                else
                                {
                                    return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice->id))->with('success', __('Payment Successfully Added'));
                                }


                            }else
                            {

                                return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('error', __('Transaction has been failed!'));
                            }
                        }
                        catch(\Exception $e)
                        {
                            return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('error', __('Transaction has been failed!'));
                        }
                    }else{
                        return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('error', __('Invoice Not Found.'));
                    }
                }else{
                    return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('error', __('Invoice Not Found.'));
                }
            }
            else
            {
                return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('error', __('Transaction has been failed!'));
            }
        }
        catch(\Exception $exception)
        {
            return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice_id))->with('error', $exception->getMessage());

        }
    }


}
