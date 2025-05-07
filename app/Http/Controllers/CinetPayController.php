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

class CinetPayController extends Controller
{

    public function planPayWithCinetPay(Request $request)
    {
        // dd($request->all());
        $payment_setting = Utility::getAdminPaymentSetting();
        $cinetpay_api_key = !empty($payment_setting['cinetpay_api_key']) ? $payment_setting['cinetpay_api_key'] : '';
        $cinetpay_site_id = !empty($payment_setting['cinetpay_site_id']) ? $payment_setting['cinetpay_site_id'] : '';
        // $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'NPR';
        $currency_code ='USD';
        $user = Auth::user();
        $planID = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan = Plan::find($planID);
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
        if ($plan) {

            $get_amount = round((float)$plan->{$request->cinetpay_payment_frequency . '_price'});
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
                                    'payment_type' => 'CinetPay',
                                    'payment_status' => 'success',
                                    'receipt' => null,
                                    'user_id' => $authuser->id,
                                ]
                            );
                            $assignPlan = $authuser->assignPlan($plan->id);
                            return redirect()->route('profile')->with('success', __('Plan Successfully Activated'));
                        }
                    }
                } else {
                    return redirect()->back()->with('error', __('This Coupon Code Is Invalid Or Has Expired.'));
                }
            }

            try {
                if (
                    $currency_code != 'XOF' &&
                    $currency_code != 'CDF' &&
                    $currency_code != 'USD' &&
                    $currency_code != 'KMF' &&
                    $currency_code != 'GNF'
                ) {
                    return redirect()->route('plans.index')->with('error', __('Available Currencies: XOF, CDF, USD, KMF, GNF'));
                }
                $call_back = route('plan.cinetpay.return') . '?_token=' . csrf_token();
                $returnURL = route('plan.cinetpay.notify') . '?_token=' . csrf_token();

                $cinetpay_data =  [
                    "amount" => $get_amount,
                    "currency" => $currency_code,
                    "apikey" => $cinetpay_api_key,
                    "site_id" => $cinetpay_site_id,
                    "transaction_id" => $orderID,
                    "description" => "Plan Purchase",
                    "return_url" => $call_back,
                    "notify_url" => $returnURL,
                    "metadata" => "user001",
                    'customer_name' => isset($authuser->name) ? $authuser->name : 'Test',
                    'customer_surname' => isset($authuser->name) ? $authuser->name : 'Test',
                    'customer_email' => isset($authuser->email) ? $authuser->email : 'test@gmail.com',
                    'customer_phone_number' => isset($authuser->mobile_number) ? $authuser->mobile_number : '1234567890',
                    'customer_address' => isset($authuser->address) ? $authuser->address  : 'A-101, Alok Area, USA',
                    'customer_city' => 'Texas',
                    'customer_country' => 'BF',
                    'customer_state' => 'USA',
                    'customer_zip_code' => isset($authuser->zipcode) ? $authuser->zipcode : '432876',
                ];
                $curl = curl_init();


                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://api-checkout.cinetpay.com/v2/payment',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => "",
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 45,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => json_encode($cinetpay_data),
                    CURLOPT_SSL_VERIFYPEER => 0,
                    CURLOPT_HTTPHEADER => array(
                        "content-type:application/json"
                    ),
                ));
                $response = curl_exec($curl);
                $err = curl_error($curl);
                curl_close($curl);

                //On Récupère La Réponse De CinetPay
                $response_body = json_decode($response, true);
                $coupons = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
                if ($response_body['code'] == '201') {
                    $cinetpaySession = [
                        'order_id' => $orderID,
                        'amount' => $get_amount,
                        'plan_id' => $plan->id,
                        'coupon_id' => !empty($coupons->id) ? $coupons->id : '',
                        'coupon_code' => !empty($request->coupon) ? $request->coupon : '',
                    ];

                    $request->session()->put('cinetpaySession', $cinetpaySession);

                    Order::create(
                        [
                            'order_id' => $orderID,
                            'name' => null,
                            'email' => null,
                            'card_number' => null,
                            'card_exp_month' => null,
                            'card_exp_year' => null,
                            'plan_name' => !empty($plan->name) ? $plan->name : 'Basic Package',
                            'plan_id' => $plan->id,
                            'price' => !empty($get_amount) ? $get_amount : 0,
                            'price_currency' => $currency_code,
                            'txn_id' => '',
                            'payment_type' => __('CinetPay'),
                            'payment_status' => 'pending',
                            'receipt' => null,
                            'user_id' => $authuser->id,
                        ]
                    );

                    $payment_link = $response_body["data"]["payment_url"]; // Retrieving The Payment URL
                    return redirect($payment_link);
                } else {
                    return back()->with('error', ('Permission Denied'));
                }
            } catch (\Exception $e) {
                \Log::debug($e->getMessage());
                return redirect()->route('plans.index')->with('error', $e->getMessage());
            }
        }
    }

    public function planCinetPayReturn(Request $request)
    {

        $cinetpaySession = $request->session()->get('cinetpaySession');
        $request->session()->forget('cinetpaySession');

        if (isset($request->transaction_id) || isset($request->token)) {
            $payment_setting = Utility::getAdminPaymentSetting();

            $cinetpay_check = [
                "apikey" => $payment_setting['cinetpay_api_key'],
                "site_id" => $payment_setting['cinetpay_site_id'],
                "transaction_id" => $request->transaction_id
            ];

            $response = $this->getPayStatus($cinetpay_check);

            $response_body = json_decode($response, true);
            $authuser = Auth::user();
            $plan = Plan::find($cinetpaySession['plan_id']);
            $getAmount = $cinetpaySession['amount'];
            $currency = isset($payment_setting['currency']) ? $payment_setting['currency'] : '';
            $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

            if ($response_body['code'] == '00') {

                $order                 = Order::where('order_id', $request['order_id'])->first();
                $order->payment_status = 'success';
                $order->save();

                $assignPlan = $authuser->assignPlan($plan->id);
                if ($request->coupon_code) {
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
                }

                if ($assignPlan['is_success']) {
                    return redirect()->route('plans.index')->with('success', __('Plan Activated Successfully!'));
                } else {
                    return redirect()->route('plans.index')->with('error', __($assignPlan['error']));
                }
            } else {

                return redirect()->route('plans.index')->with('error', __('Your Payment Has Failed!'));
            }
        } else {
            return redirect()->route('plans.index')->with('error', __('Your Payment Has Failed!'));
        }
    }


    public function planCinetPayNotify(Request $request)
    {
        /* 1- Recovery Of Parameters Posted On The URL By CinetPay
         * https://docs.cinetpay.com/api/1.0-fr/checkout/notification#les-etapes-pour-configurer-lurl-de-notification
         * */
        if (isset($request->cpm_trans_id)) {
            // Using Your Transaction Identifier, Check That The Order Has Not Yet Been Processed
            $VerifyStatusCmd = "1"; // Status Value To Retrieve From Your Database
            if ($VerifyStatusCmd == '00') {
                //The Order Has Already Been Processed
                // Scarred You Script
                die();
            }
            $payment_setting = Utility::getAdminPaymentSetting();

            /* 2- Otherwise, We Check The Status Of The Transaction In The Event Of A Payment Attempt On CinetPay
            * https://docs.cinetpay.com/api/1.0-fr/checkout/notification#2-verifier-letat-de-la-transaction */
            $cinetpay_check = [
                "apikey" => $payment_setting['cinetpay_api_key'],
                "site_id" => $payment_setting['cinetpay_site_id'],
                "transaction_id" => $request->cpm_trans_id
            ];

            $response = $this->getPayStatus($cinetpay_check); // Call Query Function To Retrieve Status

            //We Get The Response From CinetPay
            $response_body = json_decode($response, true);
            if ($response_body['code'] == '00') {
                /* Correct, On Délivre Le Service
                 * https://docs.cinetpay.com/api/1.0-fr/checkout/notification#3-delivrer-un-service*/
                echo 'Congratulations, Your Payment Has Been Successfully Completed';
            } else {
                // Transaction A Échoué
                echo 'Failure, Code:' . $response_body['code'] . ' Description' . $response_body['description'] . ' Message: ' . $response_body['message'];
            }
            // Update The Transaction In Your Database
            /*  $order->update(); */
        } else {
            print("Cpm_trans_id Non Found");
        }
    }

    public function getPayStatus($data)
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api-checkout.cinetpay.com/v2/payment/check',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 45,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_SSL_VERIFYPEER => 0,
            CURLOPT_HTTPHEADER => array(
                "content-type:application/json"
            ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err)
            return redirect()->route('plans.index')->with('error', __('Something Went Wrong!'));

        else
            return ($response);
    }

    public function invoicePayWithCinetPay(Request $request)
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
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
        $cinetpay_api_key = !empty($payment_setting['cinetpay_api_key']) ? $payment_setting['cinetpay_api_key'] : '';
        $cinetpay_site_id = !empty($payment_setting['cinetpay_site_id']) ? $payment_setting['cinetpay_site_id'] : '';
        // $currency_code = !empty($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'USD';
        $currency_code ='USD';
        $get_amount = round($request->amount);

            try {

                if (
                    $currency_code != 'XOF' &&
                    $currency_code != 'CDF' &&
                    $currency_code != 'USD' &&
                    $currency_code != 'KMF' &&
                    $currency_code != 'GNF'
                ) {
                    return redirect()->route('pay.invoice', encrypt($invoiceID))->with('error', __('Available Currencies: XOF, CDF, USD, KMF, GNF'));
                }
                $call_back = route('invoice.cinetpay.return') . '?_token=' . csrf_token();
                $returnURL = route('invoice.cinetpay.notify') . '?_token=' . csrf_token();
                $cinetpay_data =  [
                    "amount" => $get_amount,
                    "currency" => $currency_code,
                    "apikey" => $cinetpay_api_key,
                    "site_id" => $cinetpay_site_id,
                    "transaction_id" => $orderID,
                    "description" => "Plan Purchase",
                    "return_url" => $call_back,
                    "notify_url" => $returnURL,
                    "metadata" => "user001",
                    'customer_name' => isset($user->name) ? $user->name : 'Test',
                    'customer_surname' => isset($user->name) ? $user->name : 'Test',
                    'customer_email' => isset($user->email) ? $user->email : 'test@gmail.com',
                    'customer_phone_number' => isset($user->mobile_number) ? $user->mobile_number : '1234567890',
                    'customer_address' => isset($user->address) ? $user->address  : 'A-101, Alok Area, USA',
                    'customer_city' => 'Texas',
                    'customer_country' => 'BF',
                    'customer_state' => 'USA',
                    'customer_zip_code' => isset($user->zipcode) ? $user->zipcode : '432876',
                ];

                $curl = curl_init();

                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://api-checkout.cinetpay.com/v2/payment',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => "",
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 45,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => json_encode($cinetpay_data),
                    CURLOPT_SSL_VERIFYPEER => 0,
                    CURLOPT_HTTPHEADER => array(
                        "content-type:application/json"
                    ),
                ));
                $response = curl_exec($curl);
                $err = curl_error($curl);
                curl_close($curl);


                //On Récupère La Réponse De CinetPay
                $response_body = json_decode($response, true);

                if ($response_body['code'] == '201') {
                    $cinetpaySession = [

                        'amount' => $get_amount,
                        'plan_id' => $plan->id,

                    ];

                    $request->session()->put('cinetpaySession', $cinetpaySession);

                    $payment_link = $response_body["data"]["payment_url"]; // Retrieving The Payment URL
                    return redirect($payment_link);
                } else {
                    return back()->with('error', ('Permission Denied'));
                }
            } catch (\Exception $e) {
                \Log::debug($e->getMessage());
                return redirect()->route('pay.invoice', $invoice->id)->with('error', __($e->getMessage()));
            }


    }

    public function invoiceCinetPayReturn(Request $request)
    {
        try {

            $cinetpaySession = $request->session()->get('cinetpaySession');
            $request->session()->forget('cinetpaySession');

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
                    $invoice_payment                 = new InvoicePayment();
                    $invoice_payment->invoice_id     = $request->invoice_id;
                    $invoice_payment->transaction_id = $orderID;
                    $invoice_payment->date           = Date('Y-m-d');
                    $invoice_payment->amount         = $request->has('amount') ? $request->amount : 0;
                    $invoice_payment->client_id      = $user->id;;
                    $invoice_payment->payment_type   = 'CinetPay';
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
        }catch (\Exception $e){
            return redirect()->route('pay.invoice')->with('error', __($e->getMessage()));
        }
    }

    public function invoiceCinetPayNotify(Request $request)
    {
        /* 1- Recovery Of Parameters Posted On The URL By CinetPay
         * https://docs.cinetpay.com/api/1.0-fr/checkout/notification#les-etapes-pour-configurer-lurl-de-notification
         * */
        if (isset($request->cpm_trans_id)) {
            // Using Your Transaction Identifier, Check That The Order Has Not Yet Been Processed
            $VerifyStatusCmd = "1"; // Status Value To Retrieve From Your Database
            if ($VerifyStatusCmd == '00') {
                //The Order Has Already Been Processed
                // Scarred You Script
                die();
            }
            $payment_setting = Utility::getAdminPaymentSetting();

            /* 2- Otherwise, We Check The Status Of The Transaction In The Event Of A Payment Attempt On CinetPay
            * https://docs.cinetpay.com/api/1.0-fr/checkout/notification#2-verifier-letat-de-la-transaction */
            $cinetpay_check = [
                "apikey" => $payment_setting['cinetpay_api_key'],
                "site_id" => $payment_setting['cinetpay_site_id'],
                "transaction_id" => $request->cpm_trans_id
            ];

            $response = $this->getPayStatus($cinetpay_check); // Call Query Function To Retrieve Status

            //We Get The Response From CinetPay
            $response_body = json_decode($response, true);
            if ($response_body['code'] == '00') {
                /* Correct, On Délivre Le Service
                 * https://docs.cinetpay.com/api/1.0-fr/checkout/notification#3-delivrer-un-service*/
                echo 'Congratulations, Your Payment Has Been Successfully Completed';
            } else {
                // Transaction A Échoué
                echo 'Failure, Code:' . $response_body['code'] . ' Description' . $response_body['description'] . ' Message: ' . $response_body['message'];
            }
            // Update The Transaction In Your Database
            /*  $order->update(); */
        } else {
            print("Cpm_trans_id Non Found");
        }
    }

}
