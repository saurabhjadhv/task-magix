<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Plan;
use App\Models\PlanRequest;
use App\Models\User;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PlanRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->type == 'admin')
        {
            $plan_requests = PlanRequest::all();

            return view('plan_request.index', compact('plan_requests'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /*
     *@plan_id = Plan ID encoded
    */
    public function requestView($plan_id)
    {
        if(Auth::user()->type != 'admin')
        {
            $planID = \Illuminate\Support\Facades\Crypt::decrypt($plan_id);
            $payment_setting = Utility::getAdminPaymentSetting();
            $plan   = Plan::find($planID);
            if(!empty($plan))
            {
                return view('plan_request.show', compact('plan','payment_setting'));
            }
            else
            {
                return redirect()->back()->with('error', __('Something Went Wrong.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /*
     * @plan_id = Plan ID encoded
     * @duration = what duration is selected by user while request
    */
    public function userRequest($plan_id,$duration)
    {
        $objUser = Auth::user();

        if(Auth::user()->type == 'owner')
        {
            try
            {
                $planID = \Illuminate\Support\Facades\Crypt::decrypt($plan_id);
            } catch (\Exception $e)
            {
                return redirect()->back()->with('error',  $e->getMessage());
            }
            if(!empty($planID))
            {
                PlanRequest::create([
                                        'user_id' => $objUser->id,
                                        'plan_id' => $planID,
                                        'duration' => ($duration == 'annual') ? 'annual' : 'monthly',
                                    ]);
                // Update User Table
                $objUser->update(['requested_plan' => $planID]);

                return redirect()->back()->with('success', __('Request Send Successfully.'));
            }
            else
            {
                return redirect()->back()->with('error', __('Something Went Wrong.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('You already send request to another plan.'));
        }
    }

    /*
     * @id = Project ID
     * @response = 1(accept) or 0(reject)
    */
    public function acceptRequest($id, $response)
    {
        if(Auth::user()->type == 'admin')
        {
            $plan_request = PlanRequest::find($id);
            if(!empty($plan_request))
            {
                $user = User::find($plan_request->user_id);

                if($response == 1)
                {
                    $user->requested_plan = $plan_request->plan_id;
                    $user->plan           = $plan_request->plan_id;
                    $user->save();

                    $plan       = Plan::find($plan_request->plan_id);
                    $assignPlan = $user->assignPlan($plan_request->plan_id, $plan_request->duration);
                    $price      = $plan->{$plan_request->duration . '_price'};

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
                        $payment_setting = Utility::getAdminPaymentSetting();
                        $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                        Order::create([
                                          'order_id' => $orderID,
                                          'name' => null,
                                          'email' => null,
                                          'card_number' => null,
                                          'card_exp_month' => null,
                                          'card_exp_year' => null,
                                          'plan_name' => $plan->name,
                                          'plan_id' => $plan->id,
                                          'price' => $price,
                                          'price_currency' => isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'usd',
                                          'txn_id' => '',
                                          'payment_type' => __('Manually Upgrade By Super Admin'),
                                          'payment_status' => 'succeeded',
                                          'receipt' => null,
                                          'user_id' => $user->id,
                                      ]);

                        $plan_request->delete();

                        return redirect()->back()->with('success', __('Plan Successfully Upgraded.'));
                    }
                    else
                    {
                        return redirect()->back()->with('error', __('Plan Fail To Upgrade.'));
                    }
                }
                else
                {
                    $user->update(['requested_plan' => '0']);

                    $plan_request->delete();

                    return redirect()->back()->with('success', __('Request Rejected Successfully.'));
                }
            }
            else
            {
                return redirect()->back()->with('error', __('Something Went Wrong.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /*
     * @id = User ID
    */
    public function cancelRequest($id)
    {
        if(Auth::user()->type != 'admin')
        {
            $user = User::find($id);
            $user->update(['requested_plan' => '0']);
            PlanRequest::where('user_id', $id)->delete();

            return redirect()->back()->with('success', __('Request Canceled Successfully.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }
}
