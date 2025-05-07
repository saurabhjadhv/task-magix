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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;
use Obydul\LaraSkrill\SkrillClient;
use Obydul\LaraSkrill\SkrillRequest;

class SkrillPaymentController extends Controller
{
    public $email;
    public $is_enabled;
    public $currancy;
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
            $this->currancy  = (isset($invoice->project)) ? $invoice->project->currency_code : 'USD';
        }
        else
        {
            $payment_setting = Utility::getAdminPaymentSetting();
            $this->currancy = isset($payment_setting['currency']) ? $payment_setting['currency'] : '';
            $this->currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';
        }

        $this->email      = isset($payment_setting['skrill_email']) ? $payment_setting['skrill_email'] : '';
        $this->is_enabled = isset($payment_setting['is_skrill_enabled']) ? $payment_setting['is_skrill_enabled'] : 'off';
    }

    public function planPayWithSkrill(Request $request)
    {

        $authuser   = Auth::user();
        $planID     = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan       = Plan::find($planID);
        $coupons_id = '';

        if($plan)
        {
            /* Check for code usage */
            $plan->discounted_price = false;
            $price                  = $plan->{$request->skrill_payment_frequency . '_price'};

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
                    $price      = $price - $discount_value;
                    $coupons_id = $coupons->id;
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
                $assignPlan = $authuser->assignPlan($plan->id, $request->skrill_payment_frequency);

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
                            'price_currency' => !empty($this->currency_code) ? $this->currency_code : 'usd',
                            'txn_id' => '',
                            'payment_type' => __('Zero Price'),
                            'payment_status' => 'succeeded',
                            'receipt' => null,
                            'user_id' => $authuser->id,
                        ]
                    );

                    return redirect()->back()->with('success', __('Plan Activated Successfully!'));
                }
                else
                {
                    return redirect()->back()->with('error', __('Plan Fail To Upgrade.'));
                }
            }
            $tran_id             = md5(date('Y-m-d') . strtotime('Y-m-d H:i:s') . 'user_id');
            $skill               = new SkrillRequest();
            $skill->pay_to_email = $this->email;
            $skill->return_url   = route(
                'plan.skrill', [
                                 $request->plan_id,
                                 'tansaction_id=' . MD5($tran_id),
                                 'payment_frequency=' . $request->skrill_payment_frequency,
                                 'coupon_id=' . $coupons_id,
                             ]
            );

            $skill->cancel_url   = route('plan.skrill', [$request->plan_id]);

            // create object instance of SkrillRequest
            $skill->transaction_id  = MD5($tran_id); // generate transaction id
            $skill->amount          = $price;
            $skill->currency        = $this->currency_code;
            $skill->language        = 'EN';
            $skill->prepare_only    = '1';
            $skill->merchant_fields = 'site_name, customer_email';
            $skill->site_name       = Auth::user()->name;
            $skill->customer_email  = Auth::user()->email;
            // create object instance of SkrillClient
            $client = new SkrillClient($skill);
            $sid    = $client->generateSID(); //return SESSION ID
            // handle error
            $jsonSID = json_decode($sid);
            if($jsonSID != null && $jsonSID->code == "BAD_REQUEST")
            {
                return redirect()->back()->with('error', $jsonSID->message);
            }


            // do the payment
            $redirectUrl = $client->paymentRedirectUrl($sid); //return redirect url
            if($tran_id)
            {
                $data = [
                    'amount' => $price,
                    'trans_id' => MD5($request['transaction_id']),
                    'currency' => $this->currency_code,
                    'coupon_id'=>$coupons_id,
                ];
                session()->put('skrill_data', $data);
            }

            return redirect($redirectUrl);
        }
        else
        {
            return redirect()->back()->with('error', __('Plan Is Deleted.'));
        }
    }

    public function getPaymentStatus(Request $request, $plan)
    {
        $planID  = \Illuminate\Support\Facades\Crypt::decrypt($plan);
        $plan    = Plan::find($planID);
        $user    = Auth::user();
        $orderID = time();

        if($plan)
        {
            try
            {
                if(session()->has('skrill_data'))
                {
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

                    $get_data = session()->get('skrill_data');

                    if($get_data['coupon_id'] && $get_data['coupon_id'] != '')
                    {
                        $coupons = Coupon::find($get_data['coupon_id']);
                        if(!empty($coupons))
                        {
                            $userCoupon         = new UserCoupon();
                            $userCoupon->user   = $user->id;
                            $userCoupon->coupon = $coupons->id;
                            $userCoupon->order  = $orderID;
                            $userCoupon->save();

                            $usedCoupun = $coupons->used_coupon();
                            if($coupons->limit <= $usedCoupun)
                            {
                                $coupons->is_active = 0;
                                $coupons->save();
                            }
                        }
                    }

                    $user->is_plan_purchased = 1;
                    if($user->is_trial_done == 1)
                    {
                        $user->is_trial_done = 2;
                        $user->save();
                    }

                    $order                 = new Order();
                    $order->order_id       = $orderID;
                    $order->name           = $user->name;
                    $order->card_number    = '';
                    $order->card_exp_month = '';
                    $order->card_exp_year  = '';
                    $order->plan_name      = $plan->name;
                    $order->plan_id        = $plan->id;
                    $order->price          = isset($get_data['amount']) ? $get_data['amount'] : 0;
                    $order->price_currency = $this->currency_code;
                    $order->txn_id         = isset($request->transaction_id) ? $request->transaction_id : '';
                    $order->payment_type   = 'Skrill';
                    $order->payment_status = 'succeeded';
                    $order->receipt        = '';
                    $order->user_id        = $user->id;
                    $order->save();

                    $assignPlan = $user->assignPlan($plan->id, $request->payment_frequency);

                    if($assignPlan['is_success'])
                    {
                        Utility::referralTransaction($plan, $get_data['amount']);

                        return redirect()->route('profile')->with('success', __('Plan Activated Successfully!'));
                    }
                    else
                    {
                        return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __($assignPlan['error']));
                    }
                }
                else
                {
                    return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __('Transaction has been failed.'));
                }
            }
            catch(\Exception $e)
            {
                return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __('Plan Not Found!'));
            }
        }
    }

    public function invoicePayWithSkrill(Request $request)
    {
        $invoice = $request->invoice_id;
        $invoiceId = Invoice::find($invoice);
        $user = User::where('id' , $invoiceId->created_by)->first();

        $validatorArray = [
            'amount' => 'required',
            'invoice_id' => 'required',
        ];

        $validator      = Validator::make($request->all(), $validatorArray)->setAttributeNames(
            ['invoice_id' => 'Invoice']
        );

        if($validator->fails())
        {
            return redirect()->back()->with('error', __($validator->errors()->first()));
        }
        $invoice = Invoice::find($request->invoice_id);
        if($invoice->getDue() < $request->amount)
        {
            return redirect()->route('invoices.show', $invoice->id)->with('error', __('Invalid Amount.'));

        }

        $tran_id             = md5(date('Y-m-d') . strtotime('Y-m-d H:i:s') . 'user_id');
        $skill               = new SkrillRequest();
        $skill->pay_to_email = $this->email;
        $skill->return_url   = route(
            'invoice.skrill', [
                                encrypt($invoice->id),
                                'tansaction_id=' . MD5($tran_id),
                            ]
        );
        $skill->cancel_url   = route('invoice.skrill', encrypt($invoice->id));

        // create object instance of SkrillRequest
        $skill->transaction_id  = MD5($tran_id); // generate transaction id
        $skill->amount          = $request->amount;
        $skill->currency        = $this->currency_code;
        $skill->language        = 'EN';
        $skill->prepare_only    = '1';
        $skill->merchant_fields = 'site_name, customer_email';
        $skill->site_name       = $user->name;
        $skill->customer_email  = $user->email;

        // create object instance of SkrillClient
        $client = new SkrillClient($skill);
        $sid    = $client->generateSID(); //return SESSION ID

        // handle error
        $jsonSID = json_decode($sid);
        if($jsonSID != null && $jsonSID->code == "BAD_REQUEST")
        {
            return redirect()->back()->with('error', $jsonSID->message);
        }

        // do the payment
        $redirectUrl = $client->paymentRedirectUrl($sid); //return redirect url
        if($tran_id)
        {
            $data = [
                'amount' => $request->amount,
                'trans_id' => MD5($request['transaction_id']),
                'currency' => $this->currency_code,
            ];
            session()->put('skrill_data', $data);
        }

        return redirect($redirectUrl);
    }

    public function getInvoicePaymentStatus($invoice_id, Request $request)
    {
        if(!empty($invoice_id))
        {
            $invoice_id = decrypt($invoice_id);
            $invoice    = Invoice::find($invoice_id);

            if(\Auth::check())
            {

                $user = Auth::user();
            }
            else
            {
                $user   = User::where('id',$invoice->created_by)->first();
            }
            if($user->type != 'owner')
            {

                $user = User::where('id',$user->created_by)->first();
            }
            if($invoice)
            {
                try
                {
                    if(session()->has('skrill_data'))
                    {
                        $get_data                        = session()->get('skrill_data');
                        $invoice_payment                 = new InvoicePayment();
                        $invoice_payment->transaction_id = app('App\Http\Controllers\InvoiceController')->transactionNumber();
                        $invoice_payment->invoice_id     = $invoice->id;
                        $invoice_payment->amount         = isset($get_data['amount']) ? $get_data['amount'] : 0;
                        $invoice_payment->date           = date('Y-m-d');
                        $invoice_payment->payment_id     = 0;
                        $invoice_payment->payment_type   = 'Skrill';
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
                        session()->forget('skrill_data');
                        if(Auth::user())
                        {
                            return redirect()->route('invoices.show', $invoice_id)->with('success', __('Invoice Added Successfully'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                        }
                        else
                        {
                            $id= Crypt::encrypt($invoice_id);
                            return redirect()->route('pay.invoice', $id)->with('success', __('Invoice Paid Successfully!'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                        }
                    }
                    else
                    {
                        return redirect()->route('invoices.show', $invoice_id)->with('error', __('Transaction Failed'));
                    }
                }
                catch(\Exception $e)
                {
                    return redirect()->route('invoices.show', $invoice_id)->with('error', __('Something Went Wrong.'));
                }
            }
            else
            {
                return redirect()->route('invoices.show', $invoice_id)->with('error', __('Invoice Not Found.'));
            }
        }
        else
        {
            return redirect()->route('invoices.index')->with('error', __('Invoice Not Found.'));
        }
    }
}
