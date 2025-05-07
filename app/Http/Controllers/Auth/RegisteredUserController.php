<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Env;
use App\Models\User;
use App\Models\UserContact;
use App\Models\Plan;
use App\Models\Utility;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Spatie\Permission\Models\Role;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */

    public function __construct()
    {
        $this->middleware('guest');
    }

    public function create()
    {
        if (Utility::getValByName('SIGNUP') == 'on') {
            return view('auth.register');
        } else {
            return abort('404', 'Page Not Found');
        }
    }


    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    // public function store(Request $request)
    // {
    //     $request->validate([
    //         'name' => 'required|string|max:255',
    //         'email' => 'required|string|email|max:255|unique:users',
    //         'password' => ['required', 'confirmed', Rules\Password::defaults()],
    //     ]);

    //     if (env('RECAPTCHA_MODULE') == 'on') {
    //         $validation['g-recaptcha-response'] = 'required|captcha';
    //     } else {
    //         $validation = [];
    //     }
    //     $this->validate($request, $validation);


    //     $default_language = Utility::getValByName('default_language');

    //     $user = User::create([
    //         'name' => $request->name,
    //         'email' => $request->email,
    //         // 'email_verified_at' => $date,
    //         'password' => Hash::make($request->password),
    //         'type' => 'owner',
    //         'lang' => !empty($default_language) ? $default_language : 'en',
    //         // 'plan' => Plan::first()->id,
    //         'created_by' => 1,
    //     ]);
    //     $user->assignPlan(1);

    //     $userrole = 'owner';
    //     $UserContact = UserContact::create([
    //         'parent_id' => 1,
    //         'user_id' => $user->id,
    //         'role' => $userrole,
    //     ]);

    //     $settings  = Utility::settings();
    //     Auth::login($user);

    //     if ($settings['verification_btn'] == 'on') {
    //         Utility::getSMTPDetails(1);
    //         try {
    //             event(new Registered($user));

    //             if (empty($lang)) {
    //                 $lang = env('default_language');
    //             }
    //             \App::setLocale($lang);
    //         } catch (\Exception $e) {

    //             $user->delete();

    //             return redirect('/register/lang')->with('status', __('Email SMTP settings does not configure so please contact to your site admin.'));
    //         }

    //         return view('auth.verify', compact('lang'));
    //     } else {


    //         $uArr = [
    //             'email' => $user->email,
    //             'password' => $user->password,
    //         ];

    //         // send email
    //         $resp = Utility::sendUserEmailTemplate('User Invited', $user->email, $uArr);

    //         $user->email_verified_at = date('h:i:s');
    //         $user->save();
    //         return redirect(RouteServiceProvider::HOME);
    //     }
    // }


    public function store(Request $request)
    {

        // if (Utility::getValByName('recaptcha_module') == 'yes') {
        //     $validation['g-recaptcha-response'] = 'required|captcha';
        // } else {
        //     $validation = [];
        // }
        // $this->validate($request, $validation);


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

        $request->validate([
            'name' => 'required|string|max:60|min:4|regex:/^[a-zA-Z\s]+$/',
            'email' => [
                'required',
                'string',
                'email', 
                'min:8',
                'max:80',
                'unique:users',
    
                function ($attribute, $value, $fail) {
                    $parts = explode('@', $value);
    
                    if (count($parts) < 2) {
                        $fail('The email format is invalid.');
                        return;
                    }
    
                    if (preg_match('/\d/', $parts[1])) {
                        $fail('The email should not contain numbers after the @ symbol.');
                    }
    
                    if (preg_match('/\.\.+/', $value)) {
                        $fail('The email should not contain multiple consecutive dots.');
                    }
    
                    $domain = $parts[1];
                    if (preg_match('/(?:\.[a-zA-Z]{2,}){2,}$/', $domain)) {
                        $fail('The email should not contain repeated top-level domains (e.g., .com.com /a@com etc).');
                    }
    
                    if (!preg_match('/@.*\./', $value)) {
                        $fail('The email must contain a dot (.) after the @ symbol.');
                    }
                },
            ],

            'password' => [
                'required',
                'max:16',
                'min:8',
                'confirmed',
                'regex:/[a-z]/', 
                'regex:/[A-Z]/', 
                'regex:/[0-9]/', 
                'regex:/[@$!%*?&#]/',
        ],
    
                    ], [
                    'email.regex' => 'The email format is invalid.',
                    'password.regex' => 'The password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.',
            ]);

        do {
            $code = rand(100000, 999999);
        } while (User::where('referral_code', $code)->exists());

        $settings  = Utility::settings();

        if ($settings['verification_btn'] == 'off') {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'type' => 'owner',
                'lang' => !empty($default_language) ? $default_language : 'en',
                'email_verified_at' => date('Y-m-d H:i:s'),
                'referral_code'=> $code,
                'used_referral_code'=> $request->ref_code,
                'created_by' => 1,
            ]);
            $user->assignPlan(1);

            $userrole = 'owner';
            $UserContact = UserContact::create([
                'parent_id' => 1,
                'user_id' => $user->id,
                'role' => $userrole,
            ]);

            $uArr = [
                'email' => $user->email,
                'password' => $request->password,
            ];

            $resp = Utility::sendEmailTemplate('User Invited', [$user->id => $user->email], $uArr);

            Auth::login($user);

            return redirect(RouteServiceProvider::HOME);
        } else {

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                // 'email_verified_at' => $date,
                'password' => Hash::make($request->password),
                'type' => 'owner',
                'lang' => !empty($default_language) ? $default_language : 'en',
                // 'plan' => Plan::first()->id,
                'created_by' => 1,
                'referral_code'=> $code,
                'used_referral_code'=> $request->ref_code,
            ]);

            if (empty($lang)) {
                $lang = Utility::getValByName('default_language');
            }
            \App::setLocale($lang);
            Utility::getSMTPDetails(1);

            try {
                event(new Registered($user));

                if (empty($lang)) {
                    $lang = env('default_language');
                }
                \App::setLocale($lang);
            } catch (\Exception $e) {

                $user->delete();

                return redirect('/register/lang')->with('status', __('Email SMTP settings does not configure so please contact to your site admin.'));
            }

            $uArr = [
                'email' => $user->email,
                'password' => $request->password,
            ];

            $resp = Utility::sendEmailTemplate('User Invited', [$user->id => $user->email], $uArr);
            
            Auth::login($user);

            return view('auth.verify', compact('lang'));
        }
    }

    // Register Form
    public function showRegistrationForm($ref='',$lang = 'en')
    {
        $settings = Utility::settings();

        if (Utility::getValByName('SIGNUP') == 'on') {

            \App::setLocale($lang);
            if($ref == '')
            {
                $ref = 0;
            }

            $refCode = User::where('referral_code' , '=', $ref)->first();

                if($refCode->referral_code != $ref)
                {
                    return redirect()->route('register');
                }

            return view('auth.register', compact('lang','ref'));

        } else {
            return abort('404', 'Page Not Found');
        }
    }
}
