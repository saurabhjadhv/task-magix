<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\Order;
use App\Models\Plan;
use App\Models\User;
use App\Models\UserCoupon;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Mollie\Api\MollieApiClient;

class MolliePaymentController extends Controller
{

    public $api_key;
    public $profile_id;
    public $partner_id;
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
            $payment_setting      = Utility::getAdminPaymentSetting();
            $this->currancy       = isset($payment_setting['currency']) ? $payment_setting['currency'] : '';
            $this->currency_code  = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';
        }

        $this->api_key    = isset($payment_setting['mollie_api_key']) ? $payment_setting['mollie_api_key'] : '';
        $this->profile_id = isset($payment_setting['mollie_profile_id']) ? $payment_setting['mollie_profile_id'] : '';
        $this->partner_id = isset($payment_setting['mollie_partner_id']) ? $payment_setting['mollie_partner_id'] : '';
        $this->is_enabled = isset($payment_setting['is_mollie_enabled']) ? $payment_setting['is_mollie_enabled'] : 'off';

    }
    public function planPayWithMollie(Request $request)
    {

        $authuser   = Auth::user();
        $planID     = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan       = Plan::find($planID);
        $coupons_id = '';

        if($plan)
        {
            /* Check for code usage */
            $plan->discounted_price = false;
            $price                  = $plan->{$request->mollie_payment_frequency . '_price'};

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

                $assignPlan = $authuser->assignPlan($plan->id, $request->mollie_payment_frequency);

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

                    return redirect()->route('profile')->with('success', __('Plan Activated Successfully!'));
                }
                else
                {
                    return redirect()->back()->with('error', __('Plan Fail To Upgrade.'));
                }
            }
            $mollie = new \Mollie\Api\MollieApiClient();
            $mollie->setApiKey($this->api_key);

            // try{
                $payment = $mollie->payments->create(
                    [
                        "amount" => [
                            // "currency" => $this->currency_code,
                            "currency" => 'USD',
                            "value" => str_replace(',', '', number_format($price, 2)),
                        ],
                            "description" => "payment for product",
                            "redirectUrl" => route(
                                'plan.mollie', [
                                                $request->plan_id,
                                                'TXNAMOUNT='.$price,
                                                'payment_frequency=' . $request->mollie_payment_frequency,
                                                'coupon_id=' . $coupons_id,
                                            ]
                            ),
                    ]
                );

                session()->put('mollie_payment_id', $payment->id);

                return redirect($payment->getCheckoutUrl())->with('payment_id', $payment->id);
            // }catch(\Exception $e)
            // {
            //     \Log::debug($e->getMessage());

            //     return redirect()->route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice->id))->with('error', $e->getMessage());
            // }
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
                $mollie = new \Mollie\Api\MollieApiClient();
                $mollie->setApiKey($this->api_key);

                if(session()->has('mollie_payment_id'))
                {
                    $payment = $mollie->payments->get(session()->get('mollie_payment_id'));

                    if($payment->isPaid())
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
                        $order->price          = isset($request->TXNAMOUNT) ? $request->TXNAMOUNT : 0;
                        $order->price_currency = $this->currency_code;
                        $order->txn_id         = isset($request->TXNID) ? $request->TXNID : '';
                        $order->payment_type   = 'Mollie';
                        $order->payment_status = 'success';
                        $order->receipt        = '';
                        $order->user_id        = $user->id;
                        $order->save();

                        $assignPlan = $user->assignPlan($plan->id, $request->payment_frequency);

                        if($assignPlan['is_success'])
                        {
                            Utility::referralTransaction($plan, $request->TXNAMOUNT);

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
                else
                {
                    return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __('Transaction Has Been Failed!'));
                }
            }
            catch(\Exception $e)
            {
                return redirect()->route('payment', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))->with('error', __('Plan Not Found!'));
            }
        }
    }

    public function invoicePayWithMollie(Request $request)
    {
        $validatorArray = [
            'amount' => 'required',
            'invoice_id' => 'required',
        ];
        $validator      = Validator::make($request->all(),
        $validatorArray)->setAttributeNames(
            ['invoice_id' => 'Invoice']
        );

        if($validator->fails())
        {
            return redirect()->back()->with('error', __($validator->errors()->first()));
        }
        try {
            $invoice = Invoice::find($request->invoice_id);
            if($invoice->getDue() < $request->amount)
            {
                return redirect()->route('invoices.show', $invoice->id)->with('error', __('Invalid Amount.'));
            }
            $mollie = new MollieApiClient();
            $mollie->setApiKey($this->api_key);

            $payment = $mollie->payments->create(
                [
                    "amount" => [
                        "currency" => $this->currancy,
                        "value" => number_format($request->amount, 2),
                    ],
                    "description" => "payment for invoice",
                    "redirectUrl" => route('invoice.mollie', encrypt($invoice->id)),
                    ]
                );

            session()->put('mollie_payment_id', $payment->id);

            return redirect($payment->getCheckoutUrl())->with('payment_id', $payment->id);
        } catch (Exception $e) {

            return redirect()->back()->with('error',$e->getMessage());
        }
    }

    public function getInvoicePaymentStatus($invoice_id, Request $request)
    {
        if(!empty($invoice_id))
        {
            $mollie = new \Mollie\Api\MollieApiClient();
            $mollie->setApiKey($this->api_key);

            $invoice_id = decrypt($invoice_id);
            $invoice    = Invoice::find($invoice_id);
            $user = User::where('id' , $invoice->created_by)->first();
            $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));

            if($invoice && session()->has('mollie_payment_id'))
            {
                try
                {
                    $payment = $mollie->payments->get(session()->get('mollie_payment_id'));

                    if($payment->isPaid())
                    {
                        $invoice_payment                 = new InvoicePayment();
                        $invoice_payment->transaction_id = $orderID;
                        $invoice_payment->invoice_id     = $invoice->id;
                        $invoice_payment->amount         = isset($payment->amount->value) ? $payment->amount->value : 0;
                        $invoice_payment->date           = date('Y-m-d');
                        $invoice_payment->payment_id     = 0;
                        $invoice_payment->payment_type   = 'Mollie';
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
                                $msg= "Webhook call failed.";
                            }
                        }
                        if(Auth::user())
                        {

                            return redirect()->route('invoices.show', $invoice_id)->with('success', __('Invoice Added Successfully'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                        }
                        else{
                            $id= \Crypt::encrypt($invoice_id);
                            return redirect()->route('pay.invoice', $id)->with('success', __('Invoice Paid Successfully!'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                        }

                    }
                    else
                    {
                        return redirect()->route('invoices.show', $invoice_id)->with('error', __('Transaction Fail'));
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

