<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Plan;
use App\Models\Project;
use App\Models\User;
use App\Models\Utility;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PlanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->type == 'admin' || Auth::user()->type == 'owner')
        {
            $plans = Plan::all();
            $payment_setting = Utility::getAdminPaymentSetting();

            return view('plans.index', compact('plans','payment_setting'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if(Auth::user()->type == 'admin')
        {
            $plan = new Plan();
            $payment_setting = Utility::getAdminPaymentSetting();

            return view('plans.create', compact('plan','payment_setting'));
        }
        else
        {
            return response()->json(
                [
                    'is_success' => false,
                    'error' => __('Permission Denied.'),
                ], 401
            );
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(\Auth::user()->type == 'admin')
        {
            $validation                     = [];
            $validation['name']             = 'required|unique:plans';
            $validation['monthly_price']    = 'required|numeric|min:0';
            $validation['annual_price']     = 'required|numeric|min:0';
            $validation['max_users']        = 'required|numeric';
            $validation['max_projects']     = 'required|numeric';
            $validation['trial_days']       = 'required|numeric';
            $validation['storage_limit']    = 'required|numeric';

            $validator = \Validator::make($request->all(), $validation);

            if($validator->fails())
            {
                $messages = $validator->getMessageBag();

                return redirect()->back()->with('error', $messages->first());
            }

            $paymentSetting = Utility::getPaymentSetting();

            if((isset($paymentSetting['enable_stripe']) && $paymentSetting['enable_stripe'] == 'on') || (isset($paymentSetting['enable_paypal']) && $paymentSetting['enable_paypal'] == 'on') || (isset($paymentSetting['is_paystack_enabled']) && $paymentSetting['is_paystack_enabled'] == 'on') || (isset($paymentSetting['is_flutterwave_enabled']) && $paymentSetting['is_flutterwave_enabled'] == 'on') || (isset($paymentSetting['is_razorpay_enabled']) && $paymentSetting['is_razorpay_enabled'] == 'on') || (isset($paymentSetting['is_mercado_enabled']) && $paymentSetting['is_mercado_enabled'] == 'on') || (isset($paymentSetting['is_paytm_enabled']) && $paymentSetting['is_paytm_enabled'] == 'on') || (isset($paymentSetting['is_mollie_enabled']) && $paymentSetting['is_mollie_enabled'] == 'on') || (isset($paymentSetting['is_skrill_enabled']) && $paymentSetting['is_skrill_enabled'] == 'on') || (isset($paymentSetting['is_coingate_enabled']) && $paymentSetting['is_coingate_enabled'] == 'on')|| (isset($paymentSetting['is_payfast_enabled']) && $paymentSetting['is_payfast_enabled'] == 'on')|| (isset($paymentSetting['is_paymentwall_enabled']) && $paymentSetting['is_paymentwall_enabled'] == 'on')|| (isset($paymentSetting['is_toyyibpay_enabled']) && $paymentSetting['is_toyyibpay_enabled'] == 'on') || (isset($paymentSetting['is_iyzipay_enabled']) && $paymentSetting['is_iyzipay_enabled'] == 'on' || (isset($paymentSetting['is_yookassa_enabled']) && $paymentSetting['is_yookassa_enabled'] == 'on') || (isset($paymentSetting['is_xendit_enabled']) && $paymentSetting['is_xendit_enabled'] == 'on')  || (isset($paymentSetting['is_midtrans_enabled']) && $paymentSetting['is_midtrans_enabled'] == 'on')  || (isset($paymentSetting['is_fedapay_enabled']) && $paymentSetting['is_fedapay_enabled'] == 'on')|| (isset($paymentSetting['is_paiementpro_enabled']) && $paymentSetting['is_paiementpro_enabled'] == 'on')|| (isset($paymentSetting['is_nepalste_enabled']) && $paymentSetting['is_nepalste_enabled'] == 'on')|| (isset($paymentSetting['is_payhere_enabled']) && $paymentSetting['is_payhere_enabled'] == 'on')|| (isset($paymentSetting['is_cinetpay_enabled']) && $paymentSetting['is_cinetpay_enabled'] == 'on') ))
            {
                $post           = $request->all();
                $post['status'] = $request->has('status') ? 1 : 0;
                $post['enable_chatgpt'] = $request->has('enable_chatgpt') ? 'on' : 'off';

                if(Plan::create($post))
                {
                    return redirect()->back()->with('success', __('Plan Created Successfully!'));
                }
                else
                {
                    return redirect()->back()->with('error', __('Something Is Wrong'));
                }
            }
            else
            {
                return redirect()->back()->with('error', __('Please set Stripe or PayPal payment details for add new plan'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Plan $plan
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Plan $plan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Plan $plan
     *
     * @return \Illuminate\Http\Response
     */
    public function edit(Plan $plan)
    {
        if(\Auth::user()->type == 'admin')
        {
            $payment_setting = Utility::getAdminPaymentSetting();
            return view('plans.edit', compact('plan','payment_setting'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Plan $plan
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Plan $plan)
    {

        if(\Auth::user()->type == 'admin')
        {
            if($plan)
            {
                $validation         = [];
                $validation['name'] = 'required|unique:plans,name,' . $plan->id;
                if($plan->id != 1)
                {
                    $validation['monthly_price'] = 'required|numeric|min:0';
                    $validation['annual_price']  = 'required|numeric|min:0';
                    $validation['trial_days']    = 'required|numeric';
                }
                if($plan->id == 1)
                {
                    $request['status'] = 1;
                }
                $validation['max_users']    = 'required|numeric';
                $validation['max_projects'] = 'required|numeric';


                $validator = \Validator::make($request->all(), $validation);
                if($validator->fails())
                {
                    $messages = $validator->getMessageBag();

                    return redirect()->back()->with('error', $messages->first());
                }

                $paymentSetting = Utility::getPaymentSetting();
                if(($paymentSetting['enable_stripe'] == 'on' && !empty($paymentSetting['stripe_key']) && !empty($paymentSetting['stripe_secret'])) || ($paymentSetting['enable_paypal'] == 'on' && !empty($paymentSetting['paypal_client_id']) && !empty($paymentSetting['paypal_secret_key'])) || ($request->monthly_price <= 0 && $request->annual_price <= 0))
                {

                    $post           = $request->all();
                    $post['status'] = $request->has('status') ? 1 : 0;
                    $post['enable_chatgpt'] = $request->has('enable_chatgpt') ? 'on' : 'off';


                    if($plan->update($post))
                    {
                        return redirect()->back()->with('success', __('Plan Updated Successfully!'));
                    }
                    else
                    {
                        return redirect()->back()->with('error', __('Something Is Wrong'));
                    }
                }
                else
                {
                    return redirect()->back()->with('error', __('Please set Stripe or PayPal payment details for add new plan'));
                }
            }
            else
            {
                return redirect()->back()->with('error', __('Plan Not Found'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Plan $plan
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Plan $plan)
    {
        $userPlan = User::where('plan', $plan->id)->first();
        if($userPlan != null)
        {
            return redirect()->back()->with('error',__('The company has subscribed to this plan, so it cannot be deleted.'));
        }

        $plan->delete();
        return redirect()->route('plans.index')->with('success', __('Plan Successfully Deleted.'));
    }

    public function orderList()
    {
       $role = Auth::user()->type;

        if(\Auth::user()->type == 'admin')
        {
            $orders = Order::select([
                'orders.*',
                'users.name as user_name',
            ])
            ->join('users', 'orders.user_id', '=', 'users.id')
            ->orderBy('orders.created_at', 'DESC')
            ->with('use_coupon.coupon_detail')
            ->get();

            $userOrders = Order::select('*')
            ->whereIn('id', function ($query) {
                $query->selectRaw('MAX(id)')
                    ->from('orders')
                    ->groupBy('user_id');
            })
            ->orderBy('created_at', 'desc')
            ->get();

            $payment_setting = Utility::getAdminPaymentSetting();

            return view('plans.orderlist', compact('orders' , 'userOrders','payment_setting'));
        }else{

            $orders = Order::select([
                                        'orders.*',
                                        'users.name as user_name',
                                    ])->join('users', 'orders.user_id', '=', 'users.id')->orderBy('orders.created_at', 'DESC')->get();

            $payment_setting = Utility::getAdminPaymentSetting();

            return view('plans.orderlist', compact('orders','payment_setting'));
        }

    }

    public function refund(Request $request, $id, $user_id)
    {
        Order::where('id', $request->id)->update(['is_refund' => 1]);

        $user = User::find($user_id);

        $assignPlan = $user->assignPlan(1);

        return redirect()->back()->with('success', __('We successfully planned a refund and assigned a free plan.'));
    }


    public function takeAPlanTrial(Request $request, $plan_id)
    {
        $plan = Plan::find($plan_id);
        $user = Auth::user();
        if($plan && $user->is_trial_done == 0)
        {
            $days                   = $plan->trial_days == '-1' ? '36500' : $plan->trial_days;
            $user->is_trial_done    = 1;
            $user->plan             = $plan->id;
            $user->plan_expire_date = Carbon::now()->addDays($days)->isoFormat('YYYY-MM-DD');
            $user->save();

            $users       = User::where('created_by', '=', $user->getCreatedBy());
            $usr_contact = $users->count();

            if($usr_contact > 0)
            {
                $users     = $users->get();
                $userCount = 0;

                foreach($users as $user)
                {
                    $userCount++;
                    $user->is_active = $userCount <= $plan->max_users ? 1 : 0;
                    $user->save();
                }
            }

            $user_project = $user->projects()->pluck('project_id')->toArray();

            if(count($user_project) > 0)
            {
                $projects     = Project::whereIn('id', $user_project)->get();
                $projectCount = 0;

                foreach($projects as $project)
                {
                    $projectCount++;
                    $project->is_active = $projectCount <= $plan->max_projects ? 1 : 0;
                    $project->save();
                }
            }

            return redirect()->route('home')->with('success', __('Your trial has been started'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function changeUserPlan(Request $request, $plan_id)
    {
        $plan = Plan::find($plan_id);
        $user = Auth::user();

        if($plan && $user->type != 'admin')
        {
            $user->is_register_trial  = 0;
            $user->interested_plan_id = 0;
            $user->save();

            return redirect('/check');
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function orderdestory(order $order ,$id)
    {
        $order = Order::find($id);
        // $file =$order->receipt;
        $file_path = $order->receipt;
        $result = Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);
        if ($result)
        {
            $order->delete();
            return redirect()->back()->with('success', __('Order Successfully Deleted.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Something Is Wrong.'));
        }
    }
}
