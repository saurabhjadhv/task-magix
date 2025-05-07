<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Utility;
use Illuminate\Support\Facades\Auth;
use App\Models\Invoice;
use App\Models\Coupon;
use App\Models\UserCoupon;
use App\Models\Order;
use App\Models\Plan;
use App\Models\User;
use App\Models\InvoicePayment;

class NepalsteController extends Controller
{
    public function planPayWithNepalste(Request $request)
    {
        $payment_setting = Utility::getAdminPaymentSetting();
        $public_key = isset($payment_setting['nepalste_public_key']) ? $payment_setting['nepalste_public_key'] : '';
        // $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'NPR';
        $currency_code ='NPR';
        $user = Auth::user();
        $planID = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan = Plan::find($planID);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
        if ($plan) {

            $get_amount = round((float)$plan->{$request->nepalste_payment_frequency . '_price'});
            if (!empty($request->coupon)) {
                $coupons = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
                if (!empty($coupons)) {
                    $usedCoupun = $coupons->used_coupon();
                    $discount_value = ($get_amount / 100) * $coupons->discount;
                    $get_amount = $get_amount - $discount_value;

                    $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

                    $userCoupon = new UserCoupon();
                    $userCoupon->user = Auth::user()->id;
                    $userCoupon->coupon = $coupons->id;
                    $userCoupon->order = $orderID;
                    $userCoupon->save();

                    if ($coupons->limit == $usedCoupun) {
                        return redirect()->back()->with('error', __('This Coupon Code Has Expired.'));
                    }
                    if ($get_amount <= 0) {
                        $authuser = Auth::user();
                        $authuser->plan = $plan->id;
                        $authuser->save();
                        $assignPlan = $authuser->assignPlan($plan->id);
                        if ($assignPlan['is_success'] == true && !empty($plan)) {

                            $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                            $userCoupon = new UserCoupon();

                            $userCoupon->user = $authuser->id;
                            $userCoupon->coupon = $coupons->id;
                            $userCoupon->order = $orderID;
                            $userCoupon->save();
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
                                    'payment_type' => 'Nepalste',
                                    'payment_status' => 'success',
                                    'receipt' => null,
                                    'user_id' => $authuser->id,
                                ]
                            );
                            $assignPlan = $authuser->assignPlan($plan->id);
                            return redirect()->route('profile')->with('success', __('Plan successfully activated'));
                        }
                    }
                } else {
                    return redirect()->back()->with('error', __('This Coupon Code Is Invalid Or Has Expired.'));
                }
            }


            if (!empty($request->coupon)) {
                $response = ['get_amount' => $get_amount, 'plan' => $plan, 'coupon_id' => $coupons->id];
            } else {
                $response = ['get_amount' => $get_amount, 'plan' => $plan];
            }

            $parameters = [
                'identifier' => 'DFU80XZIKS',
                'currency' => $currency_code,
                'amount' => $get_amount,
                'details' => $plan->name,
                'ipn_url' => route('plan.get.nepalste.status', $response),
                'cancel_url' => route('plan.get.nepalste.status'),
                'success_url' => route('plan.get.nepalste.status', $response),
                'public_key' => $public_key,
                'site_logo' => 'https://nepalste.com.np/assets/images/logoIcon/logo.png',
                'checkout_theme' => 'dark',
                'customer_name' => 'John Doe',
                'customer_email' => 'john@mail.com',
            ];
            //live end point
            // $url = "https://nepalste.com.np/payment/initiate";

            //test end point
            $url = "https://nepalste.com.np/sandbox/payment/initiate";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POSTFIELDS,  $parameters);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $result = curl_exec($ch);
            curl_close($ch);

            $result = json_decode($result, true);
            if (isset($result['success'])) {
                return redirect($result['url']);
            } else {
                return redirect()->back()->with('error', __($result['message']));
            }
        }
    }

    public function planGetNepalsteStatus(Request $request)
    {
        $payment_setting = Utility::getAdminPaymentSetting();
        // $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';
        $currency_code ='NPR';

        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        $getAmount = $request->get_amount;
        $authuser = Auth::user();
        $plan = Plan::find($request->plan);
        if($plan){
            $order = new Order();
            $order->order_id = $orderID;
            $order->name = $authuser->name;
            $order->card_number = '';
            $order->card_exp_month = '';
            $order->card_exp_year = '';
            $order->plan_name = isset($plan->name) ? $plan->name : '' ;
            $order->plan_id = isset($plan->id) ? $plan->id : '' ;
            $order->price = isset($getAmount) ?  $getAmount : '0';
            $order->price_currency = $currency_code;
            $order->txn_id = $orderID;
            $order->payment_type = __('Neplaste');
            $order->payment_status = 'success';
            $order->txn_id = '';
            $order->receipt = '';
            $order->user_id = $authuser->id;
            $order->save();
            $assignPlan = $authuser->assignPlan($plan->id);

            $coupons = Coupon::find($request->coupon_id);
            if (!empty($request->coupon_id)) {
                if (!empty($coupons)) {
                    $userCoupon = new UserCoupon();
                    $userCoupon->user = $authuser->id;
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
                return redirect()->route('profile')->with('success', __('Plan Activated Successfully.'));
            } else {
                return redirect()->route('profile')->with('error', __($assignPlan['error']));
            }
        } else {
            return redirect()->route('profile')->with('error', __('Transaction Failed.'));
        }
    }

    public function invoicePayWithNepalste(Request $request)
    {
        $invoice_id = $request->invoice_id;
        $invoice = Invoice::find($invoice_id);
        $getAmount = $request->amount;

        if (Auth::check()) {
            $user = Auth::user();
        } else {
            $user = User::where('id', $invoice->created_by)->first();
        }
        if ($user->type != 'owner') {
            $user = User::where('id', $user->created_by)->first();
        }

        $payment_setting = Utility::getCompanyPaymentSetting($user->id);
        $public_key = isset($payment_setting['nepalste_public_key']) ? $payment_setting['nepalste_public_key'] : '';
        // $currency_code = !empty($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'IDR';
        $currency_code ='NPR';
        $get_amount = round($request->amount);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        try {
            if ($invoice) {
                $response =
                    [
                        'get_amount' => $get_amount,
                        'invoice' => $invoice->id
                    ];

                $parameters = [
                    'identifier' => 'DFU80XZIKS',
                    'currency' => $currency_code,
                    'amount' => $get_amount,
                    'details' => 'details',
                    'ipn_url' => route('invoice.nepalste.status', $response),
                    'cancel_url' => route('invoice.nepalste.status'),
                    'success_url' => route('invoice.nepalste.status', $response),
                    'public_key' => $public_key,
                    'site_logo' => 'https://nepalste.com.np/assets/images/logoIcon/logo.png',
                    'checkout_theme' => 'dark',
                    'customer_name' => 'John Doe',
                    'customer_email' => 'john@mail.com',
                ];
                //live end point
                // $url = "https://nepalste.com.np/payment/initiate";

                //test end point
                $url = "https://nepalste.com.np/sandbox/payment/initiate";

                $ch = curl_init();
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_POSTFIELDS,  $parameters);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $result = curl_exec($ch);
                curl_close($ch);
                $result = json_decode($result, true);
                if (isset($result['success'])) {
                    return redirect($result['url']);
                } else {
                    return redirect()->back()->with('error', __($result['message']));
                }
            } else {
                return redirect()->back()->with('error', 'Invoice Not Found.');
            }
        } catch (\Throwable $e) {

            return redirect()->back()->with('error', __($e));
        }
    }

    public function getInvociePaymentStatus(Request $request)
    {
        $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));
        $invoice = Invoice::find($request->invoice);

        if (Auth::check()) {
            $user = Auth::user();
        } else {
            $user = User::where('id', $invoice->created_by)->first();
        }
        if ($user->type != 'owner') {
            $user = User::where('id', $user->created_by)->first();
        }
        if ($invoice) {
            try {
                $invoice_payment                 = new InvoicePayment();
                $invoice_payment->invoice_id     = $request->invoice;
                $invoice_payment->transaction_id = $orderID;
                $invoice_payment->date           = Date('Y-m-d');
                $invoice_payment->amount         = $request->get_amount ? $request->get_amount : 0;
                $invoice_payment->client_id      = $user->id;;
                $invoice_payment->payment_type   = 'Nepalste';
                $invoice_payment->payment_id     = 0;
                $invoice_payment->save();

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
                    return redirect()->route('invoices.show', $invoice->id)->with('success', __('Invoice Paid Successfully!') . ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                } else {
                    $id = \Crypt::encrypt($invoice->id);

                    return redirect()->route('pay.invoice', $id)->with('success', __('Invoice Paid Successfully!') . ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
                }
            } catch (\Exception $e) {
                return redirect()->route('pay.invoice',$request->invoice)->with('error', __($e->getMessage()));
            }
        } else {
            if (Auth::check()) {
                return redirect()->back()->with('error', __('Invoice Not Found.'));
            } else {
                return redirect()->route('pay.invoice', encrypt($request->invoice))->with('success', __('Invoice Not Found.'));
            }
        }
    }

}
