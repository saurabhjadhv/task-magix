<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\LoginDetail;
use App\Models\Utility;
use App\Models\User;
use Carbon\Carbon;
use App\Models\Plan;
use App\Models\Plan as ModelsPlan;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */

    public function __construct()
    {
        if(!file_exists(storage_path() . "/installed"))
        {
            header('location:install');
            die;
        }
    }

    public function store(LoginRequest $request)
    {

        if (Utility::getValByName('recaptcha_module') == 'yes') {
            $recaptcha = $request->input('g-recaptcha-response');
            $secret = Utility::getValByName('google_recaptcha_secret');

            $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=$recaptcha");
            $responseKeys = json_decode($response, true);

            if (intval($responseKeys["success"]) !== 1) {
             // Handle failed captcha validation
            return back()->withErrors(['g-recaptcha-response' => 'Captcha verification failed. Please try again.']);

            }
        }
    


        $request->authenticate();
        $request->session()->regenerate();
        $user = Auth::user();
        if($user->is_active == 1 && $user->is_disable == 0)
        {
            auth()->logout();
            return redirect()->back()->with('status', 'User Is Not Active Please Activate User.');
        }

        $timezone = Utility::getValByName('timezone');
        $timezone = $timezone ? $timezone : 'UTC';

        date_default_timezone_set($timezone);
        // Update Last Login Time
        $user->update(
            [
                'last_login_at' =>  Carbon::now()->toDateTimeString(),
            ]
        );

        if($user->type == 'owner')
        {
            $free_plan = Plan::where('annual_price', '=', '0.0')->first();
            $plan      = Plan::find($user->plan);

            if($user->plan != $free_plan->id)
            {
                if(date('Y-m-d') > $user->plan_expire_date )
                {
                    $user->plan             = $free_plan->id;
                    $user->plan_expire_date = null;
                    $user->save();

                    // return redirect()->route('home')->with('error', 'Your Plan Expired Limit Is Over, Please Upgrade Your Plan');
                    $datetime1 = new \DateTime($user->plan_expire_date);
                    $datetime2 = new \DateTime(date('Y-m-d'));
                    //                    $interval  = $datetime1->diff($datetime2);
                    $interval = $datetime2->diff($datetime1);
                    $days     = $interval->format('%r%a');
                    if($days <= 0)
                    {
                        $user->assignPlan(1);

                        return redirect()->intended(RouteServiceProvider::HOME)->with('error', __('Your Plan Is Expired.'));
                    }
                }
            }
        }

            //  User Last Login

            $ip = $_SERVER['REMOTE_ADDR']; // Your Ip Address Here

            $query = @unserialize(file_get_contents('http://ip-api.com/php/' . $ip));

            // Check if zip is missing and set a default value
             if (empty($query['zip'])) {
                 \Log::warning("Zip code missing for IP: $ip");
                 $query['zip'] = '00000'; 
             }

             if (isset($query['status']) && $query['status'] != 'fail') {
                 $whichbrowser = new \WhichBrowser\Parser($_SERVER['HTTP_USER_AGENT']);
                 if ($whichbrowser->device->type == 'bot') {
                     return;
                 }
        
            $referrer = isset($_SERVER['HTTP_REFERER']) ? parse_url($_SERVER['HTTP_REFERER']) : null;

            /* Detect Extra Details About The User */
            $query['browser_name'] = $whichbrowser->browser->name ?? null;
            $query['os_name'] = $whichbrowser->os->name ?? null;
            $query['browser_language'] = isset($_SERVER['HTTP_ACCEPT_LANGUAGE']) ? mb_substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2) : null;
            $query['device_type'] = Utility::get_device_type($_SERVER['HTTP_USER_AGENT']);
            $query['referrer_host'] = !empty($referrer['host']);
            $query['referrer_path'] = !empty($referrer['path']);

            isset($query['timezone']) ? date_default_timezone_set($query['timezone']): '';

            $json = json_encode($query);

                $login_detail = new LoginDetail();
                $login_detail->user_id = Auth::user()->id;
                $login_detail->ip = $ip;
                $login_detail->date = date('Y-m-d H:i:s');
                $login_detail->Details = $json;
                $login_detail->type = Auth::user()->type;
                $login_detail->created_by = \Auth::user()->creatorId();
                $login_detail->save();
        }


        return redirect()->intended(RouteServiceProvider::HOME);
    }

    public function showLoginForm($lang = '')
    {
        if(empty($lang))
        {
            $lang = Utility::getValByName('default_language');
        }

        \App::setLocale($lang);

        return view('auth.login', compact('lang'));
    }

    // public function showLoginForm($lang = '')
    // {
    //     if($lang == '')
    //     {
    //         $lang = \App\models\Utility::getValByName('default_language');
    //     }
    //     \App::setLocale($lang);

    //     return view('auth.login', compact('lang'));
    // }

    public function showLinkRequestForm($lang = '')
    {
        if(empty($lang))
        {
            $lang = Utility::getValByName('default_language');
        }

        \App::setLocale($lang);

        return view('auth.passwords.email', compact('lang'));
        /*return view('auth.passwords.email', compact('lang'));*/
    }

    /**
     * Destroy An Authenticated Session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {

        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }


}