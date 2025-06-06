<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Plan;
use App\Models\User;
use App\Models\UserCoupon;
use App\Models\Utility;
use CoinGate\CoinGate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CoingatePaymentController extends Controller
{
    public $mode;
    public $coingate_auth_token;
    public $is_enabled;
    public $currency;
    public $currency_code;

    public function __construct()
    {
        $this->middleware(
            [
                'XSS',
            ]
        );

        if(isset($_REQUEST['from']) && $_REQUEST['from'] == 'invoice')
        {
            $payment_setting = Utility::getCompanyPaymentSetting($_REQUEST['invoice_creator']);
            $invoice         = Invoice::find($_REQUEST['invoice_creator']);
            $this->currency  = isset($invoice->project) ? $invoice->project->currency_code : 'USD';
        }
        else
        {
            $payment_setting = Utility::getAdminPaymentSetting();
            // $this->currancy = isset($payment_setting['currency']) ? $payment_setting['currency'] : '';
            $this->currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';

        }

        $this->coingate_auth_token = isset($payment_setting['coingate_auth_token']) ? $payment_setting['coingate_auth_token'] : '';
        $this->mode                = isset($payment_setting['coingate_mode']) ? $payment_setting['coingate_mode'] : 'off';
        $this->is_enabled          = isset($payment_setting['is_coingate_enabled']) ? $payment_setting['is_coingate_enabled'] : 'off';
    }

    public function planPayWithCoingate(Request $request)
    {
        $authuser   = Auth::user();
        $planID     = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan       = Plan::find($planID);
        $coupons_id = '';

        if($plan)
        {
            /* Check for code usage */
            $plan->discounted_price = false;
            $price                  = $plan->{$request->coingate_payment_frequency . '_price'};

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
                        return redirect()->back()->with('error', __('This Coupon Code Has Expired.'));
                    }
                    $price      = $price - $discount_value;
                    $coupons_id = $coupons->id;
                }
                else
                {
                    return redirect()->back()->with('error', __('This Coupon Code Is Invalid Or Has Expired.'));
                }
            }

            if($price <= 0)
            {
                $authuser->plan = $plan->id;
                $authuser->save();

                $assignPlan = $authuser->assignPlan($plan->id, $request->coingate_payment_frequency);

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
                            \Log::debug($exception->getMessage());
                        }
                    }

                    $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                    Order::create(
                        [
                            'order_id' => $orderID,
                            'name' => null,
                            'email' => null,
                            'card_number' => null,
                            'card_exp_month' => null,
                            'card_exp_year' => null,
                            'plan_name' => $plan->name,
                            'plan_id' => $plan->id,
                            'price' => $price == null ? 0 : $price,
                            'price_currency' => $this->currency_code,
                            'txn_id' => '',
                            'payment_type' => __('Zero Price'),
                            'payment_status' => 'succeeded',
                            'receipt' => null,
                            'user_id' => $authuser->id,
                        ]
                    );

                    return redirect()->route('profile')->with('success', __('Plan Activated Successfully!'));
                }
                else
                {
                    return redirect()->route('profile')->with('error', __('Plan Fail To Upgrade.'));
                }
            }
            CoinGate::config(
                array(
                    'environment' => $this->mode,
                    'auth_token' => $this->coingate_auth_token,
                    'curlopt_ssl_verifypeer' => FALSE,
                )
            );

            $post_params = array(
                'order_id' => time(),
                'price_amount' => $price,
                'price_currency' => 'USD',
                'receive_currency' => 'USD',
                'callback_url' => route(
                    'plan.coingate', [
                                       $request->plan_id,
                                       'payment_frequency=' . $request->coingate_payment_frequency,
                                       'coupon_id=' . $coupons_id,
                                   ]
                ),
                'cancel_url' => route('plan.coingate', [$request->plan_id]),
                'success_url' => route(
                    'plan.coingate', [
                                       $request->plan_id,
                                       'payment_frequency=' . $request->coingate_payment_frequency,
                                       'coupon_id=' . $coupons_id,
                                   ]
                ),
                'title' => 'Plan #' . time(),
            );

            $order = \CoinGate\Merchant\Order::create($post_params);
            if($order)
            {
                return redirect($order->payment_url);
            }
            else
            {
                return redirect()->back()->with('error', __('Something Went Wrong.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', 'Plan Is Deleted.');
        }

    }

    public function getPaymentStatus(Request $request, $plan)
    {
        $planID = \Illuminate\Support\Facades\Crypt::decrypt($plan);
        $plan   = Plan::find($planID);
        $price  = $plan->{$request->payment_frequency . '_price'};
        $user   = Auth::user();

        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        if($plan)
        {
            try
            {
                if($request->has('payment_frequency'))
                {
                    if($request->has('coupon_id') && $request->coupon_id != '')
                    {
                        $coupons = Coupon::find($request->coupon_id);
                        if(!empty($coupons))
                        {
                            $userCoupon         = new UserCoupon();
                            $userCoupon->user   = $user->id;
                            $userCoupon->coupon = $coupons->id;
                            $userCoupon->order  = $orderID;
                            $userCoupon->save();
                            $discount_value = ($price / 100) * $coupons->discount;
                            $price          = $price - $discount_value;
                            $usedCoupun     = $coupons->used_coupon();
                            if($coupons->limit <= $usedCoupun)
                            {
                                $coupons->is_active = 0;
                                $coupons->save();
                            }
                        }
                    }

                    if(!empty($user->payment_subscription_id) && $user->payment_subscription_id != '')
                    {
                        try
                        {
                            $user->cancel_subscription($user->id);
                        }
                        catch(\Exception $exception)
                        {
                            \Log::debug($exception->getMessage());
                        }
                    }

                    $order                 = new Order();
                    $order->order_id       = $orderID;
                    $order->name           = $user->name;
                    $order->card_number    = '';
                    $order->card_exp_month = '';
                    $order->card_exp_year  = '';
                    $order->plan_name      = $plan->name;
                    $order->plan_id        = $plan->id;
                    $order->price          = $price;
                    $order->price_currency = $this->currency_code;
                    $order->txn_id         = isset($request->transaction_id) ? $request->transaction_id : '';
                    $order->payment_type   = 'Coingate';
                    $order->payment_status = 'succeeded';
                    $order->receipt        = '';
                    $order->user_id        = $user->id;
                    $order->save();

                    $assignPlan = $user->assignPlan($plan->id, $request->payment_frequency);

                    if($assignPlan['is_success'])
                    {
                        Utility::referralTransaction($plan, $price);

                        return redirect()->route('profile')->with('success', __('Plan Activated Successfully!'));
                    }
                    else
                    {
                        return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __($assignPlan['error']));
                    }
                }
                else
                {
                    return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __('Transaction Has Been Failed.'));
                }
            }
            catch(\Exception $e)
            {
                return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __('Plan Not Found!'));
            }
        }
    }

    public function invoicePayWithCoingate(Request $request)
    {
        $validatorArray = [
            'amount' => 'required',
            'invoice_id' => 'required',
        ];
        $validator      = Validator::make(
            $request->all(), $validatorArray
        )->setAttributeNames(
            ['invoice_id' => 'Invoice']
        );
        if($validator->fails())
        {
            return redirect()->back()->with('error', __($validator->errors()->first()));
        }
        $invoice = Invoice::find($request->invoice_id);

        // if($invoice->getDue() < $request->amount)
        // {
        //     return redirect()->route('invoices.show', $invoice->id)->with('error', __('Invalid Amount.'));
        // }
        CoinGate::config(
            array(
                'environment' => $this->mode,
                'auth_token' => $this->coingate_auth_token,
                'curlopt_ssl_verifypeer' => FALSE,
            )
        );
        $post_params = array(
            'order_id' => time(),
            'price_amount' => $request->amount,
            'price_currency' => 'USD',
            'receive_currency' => 'USD',
            'callback_url' => route('invoice.coingate', [encrypt($invoice->id)]),
            'cancel_url' => route('invoice.coingate', [encrypt($invoice->id)]),
            'success_url' => route(
                'invoice.coingate', [
                                      encrypt($invoice->id),
                                      'success=true',
                                  ]
            ),
            'title' => 'Plan #' . time(),
        );

        try{

            $order       = \CoinGate\Merchant\Order::create($post_params);
        }
        catch(\Exception $e)
        {
            return redirect()->back()->with('error', __('Badauthtoken Auth Token Is Not Valid.'));
        }

        if($order)
        {
            $request->session()->put('invoice_data', $post_params);

            return redirect($order->payment_url);
        }
        else
        {

            return redirect()->back()->with('error', __('Something Went Wrong.'));
        }

    }

    public function getInvoicePaymentStatus($invoice_id, Request $request)
    {
        if(!empty($invoice_id))
        {
            $invoice_id   = decrypt($invoice_id);
            $invoice      = Invoice::find($invoice_id);
            $invoice_data = $request->session()->get('invoice_data');
            $user  = User::where('id' , $invoice->created_by)->first();

            $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));

            if($invoice && !empty($invoice_data))
            {
                try
                {
                    if($request->has('success') && $request->success == 'true')
                    {
                        $invoice_payment                 = new InvoicePayment();
                        $invoice_payment->transaction_id = $orderID;
                        $invoice_payment->invoice_id     = $invoice->id;
                        $invoice_payment->amount         = isset($invoice_data['price_amount']) ? $invoice_data['price_amount'] : 0;
                        $invoice_payment->date           = date('Y-m-d');
                        $invoice_payment->payment_id     = 0;
                        $invoice_payment->payment_type   = 'Coingate';
                        $invoice_payment->notes          = '';
                        $invoice_payment->client_id      = $user->id;
                        $invoice_payment->save();

                        if(($invoice->getDue() - $invoice_payment->amount) == 0)
                        {
                            Invoice::change_status($invoice->id, 3);
                        }
                        else
                        {
                            Invoice::change_status($invoice->id, 2);
                        }
                        if(\Auth::check())
                        {
                            $user = Auth::user();
                        }
                        else
                        {
                            $user = User::where('id',$invoice->created_by)->first();
                        }
                        if($user->type != 'owner')
                        {
                            $user = User::where('id',$user->created_by)->first();
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

                            if($status != true)
                            {
                                $msg= "Webhook Call Failed.";
                            }
                        }

                        $request->session()->forget('invoice_data');
                        if(Auth::user())
                            {
                                return redirect()->route('invoices.show', $invoice_id)->with('success', __('Invoice Added Successfully'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                            }
                            else
                            {

                                $id= \Crypt::encrypt($invoice_id);
                                return redirect()->route('pay.invoice', $id)->with('success', __('Invoice Paid Successfully!'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                            }
                        }
                        else
                        {
                            if(Auth::user())
                            {
                                return redirect()->route('invoices.show', $invoice_id)->with('error', __('Transaction Fail'));
                            }
                            else{

                                $id= \Crypt::encrypt($invoice_id);
                                return redirect()->route('pay.invoice', $id)->with('error', __('Transaction Fail'));
                            }
                        }
                }
                catch(\Exception $e)
                {
                    return redirect()->route('invoices.show')->with('error', __('Invoice Not Found!'));
                }
            }
            else
            {
                if(Auth::user())
                {
                    return redirect()->route('invoices.show', $invoice_id)->with('error', __('Invoice Not Found.'));
                }
                else{
                    $id= \Crypt::encrypt($invoice_id);
                    return redirect()->route('pay.invoice', $id)->with('error', __('Invoice Not Found.'));
                }
            }
        }
        else
        {
            return redirect()->route('invoices.index')->with('error', __('Invoice Not Found.'));
        }
    }
}
