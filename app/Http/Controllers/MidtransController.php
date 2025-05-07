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

class MidtransController extends Controller
{
    public function planPayWithMidtrans(Request $request)
    {
        $payment_setting = Utility::getAdminPaymentSetting();
        $midtrans_secret = $payment_setting['midtrans_secret'];
        $mode = $payment_setting['midtrans_mode'];
        $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'IDR';
        $user = Auth::user();
        $planID = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan = Plan::find($planID);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
        if ($plan) {

            $get_amount = round((float)$plan->{$request->midtrans_payment_frequency . '_price'});

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
                } else {
                    return redirect()->back()->with('error', __('This Coupon Code Is Invalid Or Has Expired.'));
                }
            }
            // Set your Merchant Server Key
            \Midtrans\Config::$serverKey = $midtrans_secret;
            // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
            if ($mode == 'sandbox') {
                \Midtrans\Config::$isProduction = false;
            } else {
                \Midtrans\Config::$isProduction = true;
            }
            // Set sanitization on (default)
            \Midtrans\Config::$isSanitized = true;
            // Set 3DS transaction for credit card to true
            \Midtrans\Config::$is3ds = true;

            $params = array(
                'transaction_details' => array(
                    'order_id' => $orderID,
                    'gross_amount' => $get_amount,
                ),
                'customer_details' => array(
                    'first_name' => $user->name,
                    'last_name' => '',
                    'email' => $user->email,
                    'phone' => '8787878787',
                ),
            );
            $snapToken = \Midtrans\Snap::getSnapToken($params);
            $authuser = Auth::user();

            $authuser->plan = $plan->id;
            $authuser->save();

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
                    'payment_type' => __('Midtrans'),
                    'payment_status' => 'pending',
                    'receipt' => null,
                    'user_id' => $authuser->id,
                ]
            );

            $data = [
                'snap_token' => $snapToken,
                'midtrans_secret' => $midtrans_secret,
                'order_id' => $orderID,
                'plan_id' => $plan->id,
                'amount' => $get_amount,
                'mode' => $mode,
                'fallback_url' => 'plan.get.midtrans.status'
            ];

            return view('midtrans.payment', compact('data'));
        }
    }

    public function planGetMidtransStatus(Request $request)
    {
        $response = json_decode($request->json, true);
        if (isset($response['status_code']) && $response['status_code'] == 200) {
            $plan = Plan::find($request['plan_id']);
            $user = auth()->user();
            $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
            try {
                $Order                 = Order::where('order_id', $request['order_id'])->first();
                $Order->payment_status = 'succeeded';
                $Order->save();

                $assignPlan = $user->assignPlan($plan->id);

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


                    return redirect()->route('profile')->with('success', __('Plan Activated Successfully.'));
                } else {
                    return redirect()->route('profile')->with('error', __($assignPlan['error']));
                }
            } catch (\Exception $e) {
                return redirect()->route('profile')->with('error', __($e->getMessage()));
            }
        } else {
            return redirect()->back()->with('error', $response['status_message']);
        }
    }

    public function invoicePayWithMidtrans(Request $request)
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

        $payment_setting = Utility::getCompanyPaymentSetting();
        $midtrans_secret = $payment_setting['midtrans_secret'];
        $mode = $payment_setting['midtrans_mode'];
        $currency_code = !empty($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'IDR';
        $get_amount = round($request->amount);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        try {
            if ($invoice) {

                 // Set your Merchant Server Key
                \Midtrans\Config::$serverKey = $midtrans_secret;
                // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
                if ($mode == 'sandbox') {
                    \Midtrans\Config::$isProduction = false;
                } else {
                    \Midtrans\Config::$isProduction = true;
                }
                // Set sanitization on (default)
                \Midtrans\Config::$isSanitized = true;
                // Set 3DS transaction for credit card to true
                \Midtrans\Config::$is3ds = true;

                $params = array(
                    'transaction_details' => array(
                        'order_id' => $orderID,
                        'gross_amount' => $get_amount,
                    ),
                    'customer_details' => array(
                        'first_name' => $user->name,
                        'last_name' => '',
                        'email' => $user->email,
                        'phone' => '8787878787',
                    ),
                );

                $snapToken = \Midtrans\Snap::getSnapToken($params);


                $data = [
                    'snap_token' => $snapToken,
                    'midtrans_secret' => $midtrans_secret,
                    'invoice_id'=>$invoice->id,
                    'amount'=>$get_amount,
                    'mode' => $mode,
                    'fallback_url' => 'invoice.midtrans.status'
                ];

                return view('midtrans.payment', compact('data'));
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
        $invoice = Invoice::find($request->invoice_id);

        if (Auth::check()) {
            $user = Auth::user();
        } else {
            $user = User::where('id', $invoice->created_by)->first();
        }
        if ($user->type != 'owner') {
            $user = User::where('id', $user->created_by)->first();
        }

        $response = json_decode($request->json, true);

        if ($invoice) {
            try {
                if (isset($response['status_code']) && $response['status_code'] == 200) {

                    try {
                        $invoice_payment                 = new InvoicePayment();
                        $invoice_payment->invoice_id     = $request->invoice_id;
                        $invoice_payment->transaction_id = $orderID;
                        $invoice_payment->date           = Date('Y-m-d');
                        $invoice_payment->amount         = $request->has('amount') ? $request->amount : 0;
                        $invoice_payment->client_id      = $user->id;;
                        $invoice_payment->payment_type   = 'Midtrans';
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
                        return redirect()->route('pay.invoice')->with('error', __($e->getMessage()));
                    }

                }else{
                    return redirect()->back()->with('error', $response['status_message']);
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
