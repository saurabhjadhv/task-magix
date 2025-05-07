<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Order;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\Plan;
use App\Models\User;
use App\Models\UserCoupon;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PaiementProController extends Controller
{
    public function planPayWithpaiementpro(Request $request)
    {
        $payment_setting = Utility::getAdminPaymentSetting();
        $merchant_id = isset($payment_setting['paiementpro_merchant_id']) ? $payment_setting['paiementpro_merchant_id'] : '';
        $currency = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'USD';
        $planID = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);

        $plan = Plan::find($planID);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
        $user = Auth::user();

        if ($plan) {
            $get_amount = round((float)$plan->{$request->paiementpro_payment_frequency . '_price'});

            if (!empty($request->coupon)) {
                $coupons = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
                if (!empty($coupons)) {
                    $usedCoupun = $coupons->used_coupon();
                    $discount_value = ($get_amount / 100) * $coupons->discount;

                    $get_amount = $get_amount - $discount_value;

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
                                    'price_currency' => $currency,
                                    'txn_id' => '',
                                    'payment_type' => __('Paiement Pro'),
                                    'payment_status' => 'success',
                                    'receipt' => null,
                                    'user_id' => $authuser->id,
                                ]
                            );
                            $assignPlan = $authuser->assignPlan($plan->id);
                            return redirect()->route('plans.index')->with('success', __('Plan Successfully Activated'));
                        }
                    }
                } else {
                    return redirect()->back()->with('error', __('This Coupon Code Is Invalid Or Has Expired.'));
                }
            }
            $coupons = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
            if (!empty($request->coupon)) {
                $call_back = route('plan.get.paiementpro.status', [
                    'get_amount' => $get_amount,
                    'plan' => $plan,
                    'coupon_id' => $coupons->id
                ]);
            } else {
                $call_back = route('plan.get.paiementpro.status', [
                    'get_amount' => $get_amount,
                    'plan' => $plan,
                ]);
            }
            $merchant_id = isset($payment_setting['paiementpro_merchant_id']) ? $payment_setting['paiementpro_merchant_id'] : '';
            $data = array(
                'merchantId' => $merchant_id,
                'amount' =>  $get_amount,
                'description' => "Api PHP",
                'channel' => $request->channel,
                'countryCurrencyCode' => $currency,
                'referenceNumber' => "REF-" . time(),
                'customerEmail' => $user->email,
                'customerFirstName' => $user->name,
                'customerLastname' =>  $user->name,
                'customerPhoneNumber' => $request->mobile_number,
                'notificationURL' => $call_back,
                'returnURL' => $call_back,
                'returnContext' => json_encode([
                    'coupon_code' => $request->coupon_code,
                ]),
            );
            $data = json_encode($data);
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://www.paiementpro.net/webservice/onlinepayment/init/curl-init.php");
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8'));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_HEADER, FALSE);
            curl_setopt($ch, CURLOPT_POST, TRUE);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            $response = curl_exec($ch);

            curl_close($ch);
            $response = json_decode($response);
            if (isset($response->success) && $response->success == true) {
                // Redirect To Approve Href
                return redirect($response->url);

                return redirect()
                    ->route('plans.index', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))
                    ->with('error', 'Something Went Wrong. Or Unknown Error Occurred');
            } else {
                return redirect()
                    ->route('plans.index', \Illuminate\Support\Facades\Crypt::encrypt($plan->id))
                    ->with('error', $response->message ?? 'Something Went Wrong.');
            }
        } else {
            return redirect()->route('plans.index')->with('error', __('Plan Is Deleted.'));
        }
    }

    public function planGetPaiementProStatus(Request $request)
    {
        $payment_setting = Utility::getAdminPaymentSetting();
        $currency = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : '';

        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
        $getAmount = $request->get_amount;
        $authuser = Auth::user();
        $plan = Plan::find($request->plan);

            $order = new Order();
            $order->order_id = $orderID;
            $order->name = $authuser->name;
            $order->card_number = '';
            $order->card_exp_month = '';
            $order->card_exp_year = '';
            $order->plan_name = $plan->name;
            $order->plan_id = $plan->id;
            $order->price = $getAmount;
            $order->price_currency = $currency;
            $order->txn_id = $orderID;
            $order->payment_type = __('Paiement Pro');
            $order->payment_status = 'success';
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
    }

    public function invoicePayWithPaiementPro(Request $request)
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
        $merchant_id = isset($payment_setting['paiementpro_merchant_id']) ? $payment_setting['paiementpro_merchant_id'] : '';
        $currency_code = !empty($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'IDR';
        $get_amount = round($request->amount);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        try {
            if ($invoice) {
                $merchant_id = isset($payment_setting['paiementpro_merchant_id']) ? $payment_setting['paiementpro_merchant_id'] : '';
                $data = array(
                    'merchantId' => $merchant_id,
                    'amount' =>  $getAmount,
                    'description' => "Api PHP",
                    'channel' => $request->channel,
                    'countryCurrencyCode' => 'USD',
                    'referenceNumber' => "REF-" . time(),
                    'customerEmail' => $user->email,
                    'customerFirstName' => $user->name,
                    'customerLastname' =>  $user->name,
                    'customerPhoneNumber' => $request->mobile_number,
                    'notificationURL' => route('invoice.paiementpro.status',$invoice_id),
                    'returnURL' => route('invoice.paiementpro.status',$invoice_id),
                    'returnContext' => json_encode([
                        'coupon_code' => $request->coupon_code,
                    ]),
                );
                $data = json_encode($data);
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, "https://www.paiementpro.net/webservice/onlinepayment/init/curl-init.php");
                curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8'));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
                curl_setopt($ch, CURLOPT_HEADER, FALSE);
                curl_setopt($ch, CURLOPT_POST, TRUE);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
                $response = curl_exec($ch);

                curl_close($ch);
                $response = json_decode($response);
                if (isset($response->success) && $response->success == true) {
                    // Redirect To Approve Href
                    return redirect($response->url);

                }

            } else {
                return redirect()->back()->with('error', 'Invoice Not Found.');
            }
        } catch (\Throwable $e) {

            return redirect()->back()->with('error', __($e));
        }
    }
    public function getInvociePaymentStatus(Request $request, $invoice_id)
    {
        $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));
        $invoice = Invoice::find($invoice_id);

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
                $invoice_payment->invoice_id     = $invoice_id;
                $invoice_payment->transaction_id = $orderID;
                $invoice_payment->date           = Date('Y-m-d');
                $invoice_payment->amount         = $request->has('amount') ? $request->amount : 0;
                $invoice_payment->client_id      = $user->id;;
                $invoice_payment->payment_type   = 'Paiement Pro';
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

                // Webhook
                $module = 'Invoice Status Updated';
                $webhook =  Utility::webhookSetting($module, $user->id);

                if ($webhook)
                {
                    $parameter = json_encode($invoice_payment);
                    // 1 Parameter Is  URL , 2 Parameter Is Data , 3 Parameter Is Method
                    $status = Utility::WebhookCall($webhook['url'], $parameter, $webhook['method']);
                    if ($status != true)
                    {
                        $msg = "Webhook Call Failed.";
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
        } else {
            if (Auth::check()) {
                return redirect()->route('pay.invoice', $request->invoice_id)->with('error', __('Invoice Not Found.'));
            } else {
                return redirect()->route('pay.invoice', encrypt($request->invoice_id))->with('success', __('Invoice Not Found.'));
            }
        }
    }
}
