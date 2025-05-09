<?php

namespace App\Http\Controllers;
use App\Models\Plan;
use App\Models\Coupon;
use App\Models\UserCoupon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Utility;

class PaymentWallPaymentController extends Controller
{
    public $secret_key;
    public $public_key;
    public $is_enabled;
    public $currancy;
    public $currency_code;

    public function paymentwall(Request $request){
        $data = $request->all();

        $admin_payment_setting = Utility::getAdminPaymentSetting();

        return view('plans.paymentwall',compact('data','admin_payment_setting'));
    }
    public function paymentConfig($invoice_id = null)
    {
        if(Auth::check()){
            $user = Auth::user();
        }
        // if($user->type == 'company')
        // {
        //     $payment_setting = Utility::getAdminPaymentSetting();
        // }
        // else
        // {
        //     $payment_setting = Utility::getCompanyPaymentSetting();
        // }
        if(isset($_REQUEST['from']) && $_REQUEST['from'] == 'invoice')
        {
            $payment_setting = Utility::getCompanyPaymentSetting($_REQUEST['invoice_creator']);
            $invoice         = Invoice::find($invoice_id);
            $this->currency_code  = (isset($invoice->project)) ? $invoice->project->currency_code : 'USD';
        }
        else
        {
            $payment_setting = Utility::getAdminPaymentSetting();
            $this->currancy = isset($payment_setting['currency']) ? $payment_setting['currency'] : '';
            $this->currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';
        }

        $this->secret_key = isset($payment_setting['paymentwall_private_key ']) ? $payment_setting['paymentwall_private_key  '] : '';
        $this->public_key = isset($payment_setting['paymentwall_public_key']) ? $payment_setting['paymentwall_public_key'] : '';
        $this->is_enabled = isset($payment_setting['is_paymentwall_enabled']) ? $payment_setting['is_paymentwall_enabled'] : 'off';

        return $this;
    }

    public function planPayWithPaymentWall(Request $request,$plan_id)
    {
        $planID    = \Illuminate\Support\Facades\Crypt::decrypt($plan_id);
        // $res['msg'] = __("error");
        // $res['plan']=$planID;
        // return $res;

        $plan      = Plan::find($planID);
        $user   = Auth::user();
        $coupon_id = '';
        if($plan)
        {

             /* Check for code usage */
             $plan->discounted_price = false;
             $price                  = $plan->{$request->amount . '_price'};
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

                     $price     = $price - $discount_value;
                     $coupon_id = $coupons->id;
                 }
                 else
                 {
                     return redirect()->back()->with('error', __('This Coupon Code Is Invalid Or Has Expired.'));
                 }
             }
            if($price <= 0)
            {
                $user->plan = $plan->id;
                $user->save();

                $assignPlan = $user->assignPlan($plan->id, $request->paymentwall_payment_frequency);

                if($assignPlan['is_success'] == true && !empty($plan))
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
                            'price' => $price,
                            'price_currency' => !empty($this->currency_code) ? $this->currency_code : 'usd',
                            'txn_id' => '',
                            'payment_type' => __('Zero Price'),
                            'payment_status' => 'succeeded',
                            'receipt' => null,
                            'user_id' => $user->id,
                        ]
                    );

                    $res['msg']  = __("Plan successfully upgraded.");
                    $res['flag'] = 2;

                    return $res;
                }
            }
            else {
                    $orderID = time();
                    \Paymentwall_Config::getInstance()->set(array(
                        'private_key' => 'sdrsefrszdef'
                    ));
                    $parameters = $request->all();
                    $chargeInfo = array(
                        'email' => $parameters['email'],
                        'history[registration_date]' => '1489655092',
                        'amount' => $price,
                        'currency' => !empty($this->currency_code) ? $this->currency_code : 'USD',
                        'token' => $parameters['brick_token'],
                        'fingerprint' => $parameters['brick_fingerprint'],
                        'description' => 'Order #123'
                    );
                    $charge = new \Paymentwall_Charge();
                    $charge->create($chargeInfo);
                    $responseData = json_decode($charge->getRawResponseData(),true);
                    $response = $charge->getPublicData();
                    if ($charge->isSuccessful() AND empty($responseData['secure'])) {
                        if ($charge->isCaptured()) {
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
                            $order->price          = isset($result['data']['amount']) ? ($result['data']['amount'] / 100) : 0;
                            $order->price_currency = $this->currency_code;
                            $order->txn_id         = isset($result['data']['id']) ? $result['data']['id'] : $pay_id;
                            $order->payment_type   = 'Paymentwall';
                            $order->payment_status = 'success';
                            $order->receipt        = '';
                            $order->user_id        = $user->id;
                            $order->save();
                            $assignPlan = $authuser->assignPlan($plan->id);
                            if($assignPlan['is_success'])
                            {
                                Utility::referralTransaction($plan, $result['data']['amount']);

                                $res['msg'] = __("Plan Successfully Upgraded.");
                                 $res['flag'] = 1;
                                 return $res;
                            }
                        } elseif ($charge->isUnderReview()) {
                            // decide on risk charge
                        }
                    } elseif (!empty($responseData['secure'])) {
                        $response = json_encode(array('secure' => $responseData['secure']));
                    } else {
                        $errors = json_decode($response, true);
                                 $res['flag'] = 2;
                                 return $res;
                    }
                    echo $response;
                }
        }
    }
    public function planeerror(Request $request, $flag)
    {
        if ($flag == 1) {
            return redirect()->route('profile')->with('error', __('Transaction Has Been Successfull! '));
        } else {
            return redirect()->route('profile')->with('error', __('Transaction Has Been Failed! '));
        }
    }

    public function invoicepaymentwall(Request $request){

        $data = $request->all();

        $company_payment_setting = Utility::getPaymentSetting();

        return view('invoices.paymentwall',compact('data','company_payment_setting'));
    }



    public function invoiceerror($flag, $invoice_id)
    {
        if ($flag == 1) {
            return redirect()->route('invoices.show', $invoice_id)->with('error', __('Payment Successfully Added. '));
        } else {
            return redirect()->route("invoices.show", $invoice_id)->with('error', __('Transaction Has Been Failed! '));
        }
    }


    public function invoicePayWithPaymentwall(Request $request,$invoiceID)
    {
        $invoice   = Invoice::find($invoiceID);

        if(\Auth::check())
        {
            $user=\Auth::user();
        }
        else
        {
            $user= User::where('id',$invoice->created_by)->first();
        }

        if($invoice)
        {
            $price = $request->amount;

            if($price < 0)
            {
                $res_data['email']       = $user->email;
                $res_data['total_price'] = $request->amount;
                $res_data['currency']    = $this->currency_code;
                $res_data['flag']        = 1;
                $res_data['invoice_id']  = $invoice->id;

                // return $res_data;
            }
            else
            {
                $authuser = Auth::user();
                \Paymentwall_Config::getInstance()->set(array(
                    'private_key' => ''
                ));
                $parameters = $request->all();
                $chargeInfo = array(
                    'email' => $parameters['email'],
                    'history[registration_date]' => '1489655092',
                    'amount' => $price,
                    'currency' => !empty($this->currency_code) ? $this->currency_code : 'USD',
                    'token' => $parameters['brick_token'],
                    'fingerprint' => $parameters['brick_fingerprint'],
                    'description' => 'Order #123'
                );
                $charge = new \Paymentwall_Charge();
                $charge->create($chargeInfo);
                $responseData = json_decode($charge->getRawResponseData(),true);
                $response = $charge->getPublicData();

                if ($charge->isSuccessful() AND empty($responseData['secure'])) {
                    if ($charge->isCaptured()) {


                        $invoice_payment                 = new InvoicePayment();
                        $invoice_payment->transaction_id = app('App\Http\Controllers\InvoiceController')->transactionNumber();
                        $invoice_payment->invoice_id     = $invoice->id;
                        $invoice_payment->amount         = isset($invoice_data['total_price']) ? $invoice_data['total_price'] : 0;
                        $invoice_payment->date           = date('Y-m-d');
                        $invoice_payment->payment_id     = 0;
                        $invoice_payment->payment_type   = 'PaymentWall';
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
                                return redirect()->back()->with('success', __('Invoice successfully.'));
                            }
                            else
                            {
                                return redirect()->back()->with('error', __('Webhook call failed.'));
                            }
                        }

                        $assignPlan = $authuser->assignPlan($invoice->id);
                        if($assignPlan['is_success'])
                        {
                            $res['msg'] = __("Invoice successfully .");
                            $res['flag'] = 1;
                            return $res;
                        }
                    } elseif ($charge->isUnderReview()) {
                        // decide on risk charge
                    }
                } elseif (!empty($responseData['secure'])) {
                    $response = json_encode(array('secure' => $responseData['secure']));
                } else {
                    $errors = json_decode($response, true);
                            $res['invoice']=$invoiceID;
                            $res['flag'] = 2;
                            return $res;
                }
                echo $response;

            }
        }

    }
}
