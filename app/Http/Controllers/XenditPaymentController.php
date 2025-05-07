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
use Xendit\Xendit;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class XenditPaymentController extends Controller
{
    public function planPayWithXendit(Request $request)
    {

        $payment_setting = Utility::getAdminPaymentSetting();
        $xendit_api = $payment_setting['xendit_api'];
        $currency_code = isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'PHP';

        $planID = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan = Plan::find($planID);
        $user = Auth::user();
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        if ($plan) {

            $get_amount = (float)$plan->{$request->xendit_payment_frequency . '_price'};

            if (!empty($request->coupon)) {
                $coupons = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();
                if (!empty($coupons)) {
                    $usedCoupun = $coupons->used_coupon();
                    $discount_value = ($get_amount / 100) * $coupons->discount;
                    $get_amount = $get_amount - $discount_value;
                    $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

                    $userCoupon = new UserCoupon();
                    $userCoupon->user =  $user->id;
                    $userCoupon->coupon = $coupons->id;
                    $userCoupon->order = $orderID;
                    $userCoupon->save();

                    if ($coupons->limit == $usedCoupun) {
                        return redirect()->back()->with('error', __('This coupon code has expired.'));
                    }
                } else {
                    return redirect()->back()->with('error', __('This coupon code is invalid or has expired.'));
                }
            }
            $response = ['orderId' => $orderID, 'user' => $user, 'get_amount' => $get_amount, 'plan' => $plan, 'currency' => $currency_code];
            Xendit::setApiKey($xendit_api);
            $params = [
                'external_id' => $orderID,
                'payer_email' => Auth::user()->email,
                'description' => 'Payment for order ' . $orderID,
                'amount' => $get_amount,
                'callback_url' =>  route('plan.xendit.status'),
                'success_redirect_url' => route('plan.xendit.status', $response),
                'failure_redirect_url' => route('profile'),
            ];
            $invoice = \Xendit\Invoice::create($params);
            Session::put('invoice',$invoice);

            return redirect($invoice['invoice_url']);
        }
    }

    public function planGetXenditStatus(Request $request)
    {
        $data = request()->all();

        $fixedData = [];
        foreach ($data as $key => $value) {
            $fixedKey = str_replace('amp;', '', $key);
            $fixedData[$fixedKey] = $value;
        }

        $payment_setting = Utility::getAdminPaymentSetting();
        $xendit_api = $payment_setting['xendit_api'];
        Xendit::setApiKey($xendit_api);

        $session = Session::get('invoice');
        $getInvoice = \Xendit\Invoice::retrieve($session['id']);

        $authuser = User::find($fixedData['user']);
        $plan = Plan::find($fixedData['plan']);

        if($getInvoice['status'] == 'PAID'){

            Order::create(
                [
                    'order_id'          => $fixedData['orderId'],
                    'name'              => null,
                    'email'             => null,
                    'card_number'       => null,
                    'card_exp_month'    => null,
                    'card_exp_year'     => null,
                    'plan_name'         => $plan->name,
                    'plan_id'           => $plan->id,
                    'price'             => $fixedData['get_amount'] == null ? 0 : $fixedData['get_amount'],
                    'price_currency'    => $fixedData['currency'],
                    'txn_id'            => '',
                    'payment_type'      => __('Xendit'),
                    'payment_status'    => 'succeeded',
                    'receipt'           => null,
                    'user_id'           => $authuser->id,
                ]
            );

            $assignPlan = $authuser->assignPlan($plan->id, $request->payment_frequency);

            if($assignPlan['is_success'])
            {
                Utility::referralTransaction($plan,$fixedData['get_amount']);

                return redirect()->route('profile')->with('success', __('Plan Activated Successfully!'));
            }
            else
            {
                return redirect()->route('profile')->with('error', __($assignPlan['error']));
            }
        }
    }

    public function invoicePayWithXendit(Request $request)
    {
        $invoice_id = $request->invoice_id;
        $invoice = Invoice::find($invoice_id);
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
        $get_amount = $request->amount;
        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

        try {
            if ($invoice) {
                $payment_setting = Utility::getCompanyPaymentSetting($_REQUEST['invoice_creator']);
                $xendit_api = $payment_setting['xendit_api'];
                $currency_code = isset($payment_setting['site_currency']) ? $payment_setting['site_currency'] : 'RUB';
                $response = ['orderId' => $orderID, 'user' => $user, 'get_amount' => $get_amount, 'invoice' => $invoice, 'currency' => $currency_code];
                Xendit::setApiKey($xendit_api);
                $params = [
                    'external_id' => $orderID,
                    'payer_email' => $user->email,
                    'description' => 'Payment for order ' . $orderID,
                    'amount' => $get_amount,
                    'callback_url' =>  route('invoice.xendit.status'),
                    'success_redirect_url' => route('invoice.xendit.status', $response),
                ];

                $Xenditinvoice = \Xendit\Invoice::create($params);
                Session::put('invoicepay',$Xenditinvoice);
                return redirect($Xenditinvoice['invoice_url']);

            } else {
                return redirect()->back()->with('error', 'Invoice Not Found.');
            }
        } catch (\Throwable $e) {

            return redirect()->back()->with('error', __($e));
        }
    }

    public function getInvociePaymentStatus(Request $request)
    {
        $data = request()->all();
        $fixedData = [];
        foreach ($data as $key => $value) {
            $fixedKey = str_replace('amp;', '', $key);
            $fixedData[$fixedKey] = $value;
        }

        $session = Session::get('invoicepay');
        $invoice = Invoice::find($fixedData['invoice']);

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
                $payment_setting = Utility::getCompanyPaymentSetting($user->id);
                $orderID  = strtoupper(str_replace('.', '', uniqid('', true)));
                $xendit_api = $payment_setting['xendit_api'];
                Xendit::setApiKey($xendit_api);
                $getInvoice = \Xendit\Invoice::retrieve($session['id']);

                if($getInvoice['status'] == 'PAID'){

                    // $invoice_payment                = new InvoicePayment();
                    // $invoice_payment->bill_id       = $invoice->id;
                    // $invoice_payment->txn_id        = app('App\Http\Controllers\BillController')->transactionNumber($user->id);
                    // $invoice_payment->amount         = $request->get_amount;
                    // $invoice_payment->date           = date('Y-m-d');
                    // $invoice_payment->method   = 'Xendit';
                    // $invoice_payment->save();


                    $invoice_payment                 = new InvoicePayment();
                    $invoice_payment->invoice_id     = $invoice->id;
                    $invoice_payment->transaction_id = $orderID;
                    $invoice_payment->date           = date('Y-m-d');
                    $invoice_payment->amount         = $fixedData['get_amount'] == null ? 0 : $fixedData['get_amount'];
                    $invoice_payment->client_id      = $user->id;
                    $invoice_payment->payment_type   = 'Xendit';
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

                }
            } catch (\Exception $e) {
                if (Auth::check()) {
                    return redirect()->route('pay.invoice', $request->invoice_id)->with('error', $e->getMessage());
                } else {
                    return redirect()->route('pay.invoice', encrypt($request->invoice_id))->with('success', $e->getMessage());
                }
            }
        }else{
            if (Auth::check()) {
                return redirect()->route('pay.invoice', $request->invoice_id)->with('error', __('Invoice Not Found.'));
            } else {
                return redirect()->route('pay.invoice', encrypt($request->invoice_id))->with('success', __('Invoice Not Found.'));
            }
        }
    }
}
