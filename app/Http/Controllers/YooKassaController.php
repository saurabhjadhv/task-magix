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
use YooKassa\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class YooKassaController extends Controller
{

    public function planPayWithYooKassa(Request $request)
    {
        $payment_setting = Utility::getAdminPaymentSetting();
        $yookassa_shop_id = $payment_setting['yookassa_shop_id'];
        $yookassa_secret_key = $payment_setting['yookassa_secret_key'];
        $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'RUB';

        $planID = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $authuser = Auth::user();
        $plan                  = Plan::find($planID);

        if ($plan) {
            $coupon_id = 0;
            $get_amount     = (float)$plan->{$request->yookassa_payment_frequency . '_price'};

            if (!empty($request->coupon)) {
                $coupons = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
                if (!empty($coupons)) {
                    $usedCoupun          = $coupons->used_coupon();
                    $discount_value      = ($get_amount / 100) * $coupons->discount;
                    $get_amount          = $get_amount - $discount_value;

                    $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

                    $userCoupon           = new UserCoupon();
                    $userCoupon->user     = $authuser->id;
                    $userCoupon->coupon   = $coupons->id;
                    $userCoupon->order    = $orderID;
                    $userCoupon->save();

                    if ($coupons->limit == $usedCoupun) {
                        return redirect()->back()->with('error', __('This coupon code has expired.'));
                    }
                } else {
                    return redirect()->back()->with('error', __('This coupon code is invalid or has expired.'));
                }
            }
            try {

                if (is_int((int)$yookassa_shop_id)) {
                    $client = new Client();

                    $client->setAuth((int)$yookassa_shop_id, $yookassa_secret_key);
                    $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                    $payment = $client->createPayment(
                        array(
                            'amount' => array(
                                'value' => $get_amount,
                                'currency' => $currency_code,
                            ),
                            'confirmation' => array(
                                'type' => 'redirect',
                                'return_url' => route('plan.get.yookassa.status', [$plan->id, 'order_id' => $orderID, 'price' => $get_amount]),
                            ),
                            'capture' => true,
                            'description' => 'Заказ №1',
                        ),
                        uniqid('', true)
                    );

                    $authuser = Auth::user();
                    $authuser->plan = $plan->id;
                    $authuser->save();


                    if (!empty($authuser->payment_subscription_id) && $authuser->payment_subscription_id != '') {
                        try {
                            $authuser->cancel_subscription($authuser->id);
                        } catch (\Exception $exception) {
                            Log::debug($exception->getMessage());
                        }
                    }


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
                            'price' => $get_amount == null ? 0 : $get_amount,
                            'price_currency' => $currency_code,
                            'txn_id' => '',
                            'payment_type' => __('YooKassa'),
                            'payment_status' => 'pending',
                            'receipt' => null,
                            'user_id' => $authuser->id,
                        ]
                    );


                    Session::put('payment_id', $payment['id']);

                    if ($payment['confirmation']['confirmation_url'] != null) {
                        return redirect($payment['confirmation']['confirmation_url']);
                    } else {
                        return redirect()->route('profile')->with('error', 'Something went wrong, Please try again');
                    }

                    // return redirect()->route('profile')->with('success', __('Plan Successfully Activated'));

                } else {
                    return redirect()->back()->with('error', 'Please Enter  Valid Shop Id Key');
                }
            } catch (\Throwable $th) {

                return redirect()->back()->with('error', $th);
            }
        }
    }

    public function planGetYooKassaStatus(Request $request, $planId)
    {

        $payment_setting = Utility::getAdminPaymentSetting();
        $yookassa_shop_id = $payment_setting['yookassa_shop_id'];
        $yookassa_secret_key = $payment_setting['yookassa_secret_key'];

        if (is_int((int)$yookassa_shop_id)) {
            $client = new Client();
            $client->setAuth((int)$yookassa_shop_id, $yookassa_secret_key);
            $paymentId = Session::get('payment_id');
            Session::forget('payment_id');
            if ($paymentId == null) {
                return redirect()->back()->with('error', __('Transaction Unsuccessful'));
            }

            $payment = $client->getPaymentInfo($paymentId);

            if (isset($payment) && $payment->status == "succeeded") {

                $plan = Plan::find($planId);
                $user = auth()->user();
                $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                try {
                    $Order                 = Order::where('order_id', $request->order_id)->first();
                    $Order->payment_status = 'succeeded';
                    $Order->save();

                    $assignPlan = $user->assignPlan($plan->id);
                    $coupons = Coupon::find($request->coupon_id);

                    if (!empty($request->coupon_id)) {
                        if (!empty($coupons)) {
                            $userCoupon = new UserCoupon();
                            $userCoupon->user = $user->id;
                            $userCoupon->coupon = $coupons->id;
                            $userCoupon->order = $orderID;
                            $userCoupon->save();
                            $usedCoupun = $coupons->used_coupon();
                            if ($coupons->limit <= $usedCoupun) {
                                $coupons->is_active = 0;
                                $coupons->save();
                            }
                        }
                    }

                    if ($assignPlan['is_success']) {

                        Utility::referralTransaction($plan, $get_amount);

                        return redirect()->route('profile')->with('success', __('Plan Activated Successfully.'));
                    } else {
                        return redirect()->route('profile')->with('error', __($assignPlan['error']));
                    }
                } catch (\Exception $e) {
                    return redirect()->route('profile')->with('error', __($e->getMessage()));
                }
            } else {
                return redirect()->back()->with('error', 'Please Enter Valid Shop ID Key');
            }
        }
    }

    public function invoicePayWithYookassa(Request $request)
    {
        $invoice_id = $request->invoice_id;
        $invoice = Invoice::find($invoice_id);
        $payment_setting = Utility::getCompanyPaymentSetting($_REQUEST['invoice_creator']);
        $yookassa_shop_id = $payment_setting['yookassa_shop_id'];
        $yookassa_secret_key = $payment_setting['yookassa_secret_key'];
        // $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'RUB';

        if (Auth::check()) {
            $user = Auth::user();
        } else {
            $user = User::where('id', $invoice->created_by)->first();
        }
        if ($user->type != 'owner') {
            $user = User::where('id', $user->created_by)->first();
        }

        $get_amount = $request->amount;
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        try {
            if ($invoice && $get_amount != 0) {

                if ($get_amount > $invoice->getDue())
                {
                    return redirect()->back()->with('error', __('Invalid Amount.'));
                }
                else{

                if (is_int((int)$yookassa_shop_id)) {
                    $client = new Client();
                    $client->setAuth((int)$yookassa_shop_id, $yookassa_secret_key);
                    $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                    $payment = $client->createPayment(
                        array(
                            'amount' => array(
                                'value' => $get_amount,
                                'currency' =>'RUB',
                            ),
                            'confirmation' => array(
                                'type' => 'redirect',
                                'return_url' => route('invoice.yookassa.status', [
                                    'invoice_id'=>$invoice->id,
                                    'amount'=>$get_amount
                                ]),
                            ),
                            'capture' => true,
                            'description' => 'Заказ №1',
                        ),
                        uniqid('', true)
                    );

                    Session::put('invoice_payment_id', $payment['id']);

                    if ($payment['confirmation']['confirmation_url'] != null) {
                        return redirect($payment['confirmation']['confirmation_url']);
                    } else {
                        return redirect()->back()->with('error', 'Something went wrong, Please try again');
                    }


                } else {
                    return redirect()->back()->with('error', 'Please Enter  Valid Shop Id Key');
                }
            }
            } else {
                return redirect()->back()->with('error', 'Invoice Not Found.');
            }
        } catch (\Throwable $e) {

            return redirect()->back()->with('error', __($e));
        }
    }
    public function getInvociePaymentStatus(Request $request,$invoice_id)
    {

        $payment_setting = Utility::getCompanyPaymentSetting($invoice_id);
        $yookassa_shop_id = $payment_setting['yookassa_shop_id'];
        $yookassa_secret_key = $payment_setting['yookassa_secret_key'];
        // $get_amount = $request->amount;

        $invoice = Invoice::find($request->invoice_id);
        $orderID  = strtoupper(str_replace('.', '', uniqid('', true)));

        if(Auth::check()){
            $user = Auth::user();
        }
        else{

            $user=User::where('id',$invoice->created_by)->first();
        }
        if($user->type != 'owner')
        {
            $user=User::where('id',$user->created_by)->first();
        }

        if ($invoice) {
            try {
                if (is_int((int)$yookassa_shop_id)) {
                    $client = new Client();
                    $client->setAuth((int)$yookassa_shop_id, $yookassa_secret_key);
                    $paymentId = Session::get('invoice_payment_id');

                    if ($paymentId == null) {
                        return redirect()->back()->with('error', __('Transaction Unsuccessful'));
                    }
                    $payment = $client->getPaymentInfo($paymentId);

                    Session::forget('invoice_payment_id');

                    if (isset($payment) && $payment->status == "succeeded") {

                        $user = auth()->user();
                        try {

                            $invoice_payment                 = new InvoicePayment();
                            $invoice_payment->invoice_id     = $request->invoice_id;
                            $invoice_payment->transaction_id = $orderID;
                            $invoice_payment->date           = Date('Y-m-d');
                            $invoice_payment->amount         = $request->has('amount') ? $request->amount : 0;
                            $invoice_payment->client_id      = $user->id;;
                            $invoice_payment->payment_type   = 'Yookassa';
                            $invoice_payment->payment_id     = 0;
                            $invoice_payment->save();

                        //     $payment = BillPayment::where('bill_id', $invoice->id)->sum('amount');

                        //     if ($payment >= $invoice->total_amount) {
                        //         $invoice->status = 'PAID';
                        //         $invoice->due_amount = 0.00;
                        //     } else {
                        //         $invoice->status = 'Partialy Paid';
                        //         $invoice->due_amount = $invoice->due_amount - $get_amount;
                        //     }
                        //     $invoice->save();

                        //     if (Auth::check()) {
                        //         return redirect()->route('pay.invoice', Crypt::encrypt($request->invoice_id))->with('success', __('Invoice paid Successfully!'));
                        //     } else {
                        //         return redirect()->route('pay.invoice', encrypt($request->invoice_id))->with('ERROR', __('Transaction fail'));
                        //     }

                        // } catch (\Exception $e) {
                        //     return redirect()->route('pay.invoice')->with('error', __($e->getMessage()));
                        // }
                        if(($invoice->getDue() - $invoice_payment->amount) == 0)
                        {
                            Invoice::change_status($invoice->id, 3);
                        } else
                        {
                            Invoice::change_status($invoice->id, 2);
                        }
                        $invoice->save();

                        $settings  = Utility::settingsById($invoice->created_by);

                        $uArr = [
                            'invoice_id' => Utility::invoiceNumberFormat($invoice->invoice_id),
                            'owner_name' => $user->name,
                        ];
                        if (isset($settings['invoice_status_notificaation']) && $settings['invoice_status_notificaation'] == 1) {
                            Utility::send_slack_msg('invoice_status_updated', $uArr, $user->id);
                        }

                        if (isset($settings['telegram_invoice_status_notificaation']) && $settings['telegram_invoice_status_notificaation'] == 1) {
                            Utility::send_telegram_msg('invoice_status_updated', $uArr, $user->id);
                        }

                        //webhook
                        $module = 'Invoice Status Updated';

                        $webhook =  Utility::webhookSetting($module, $user->id);

                        if ($webhook)
                        {
                            $parameter = json_encode($invoice_payment);
                            // 1 parameter is  URL , 2 parameter is data , 3 parameter is method
                            $status = Utility::WebhookCall($webhook['url'], $parameter, $webhook['method']);
                            if ($status != true)
                            {
                                $msg = "Webhook call failed.";
                            }
                        }
                        if (Auth::user())
                        {
                            return redirect()->route('invoices.show', $invoice_id)->with('success', __('Invoice Paid Successfully!') . ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                        } else {
                            $id = \Crypt::encrypt($invoice_id);
                            return redirect()->route('pay.invoice', $id)->with('success', __('Invoice Paid Successfully!') . ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                        }

                } catch (\Exception $e)
                {
                    return redirect()->route('invoices.show', $invoice_id)->with('error', __($e->getMessage()));
                }
                    } else {
                        return redirect()->back()->with('error', 'Please Enter Valid Shop ID Key');
                    }
                }
            } catch (\Exception $e) {
                if (Auth::check()) {
                    return redirect()->route('pay.invoice', $request->invoice_id)->with('error', $e->getMessage());
                } else {
                    return redirect()->route('pay.invoice', encrypt($request->invoice_id))->with('success', $e->getMessage());
                }
            }
        } else {
            if (Auth::check()) {
                return redirect()->route('pay.invoice', $request->invoice_id)->with('error', __('Invoice Not Found.'));
            } else {
                return redirect()->route('pay.invoice', encrypt($request->invoice_id))->with('success', __('Invoice Not Found.'));
            }
        }
    }

}
