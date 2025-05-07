<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use App\Models\Utility;
use Illuminate\Auth\Events\Registered;

class EmailVerificationNotificationController extends Controller
{
    /**
     * Send a new email verification notification.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    { 
        if ($request->user()->hasVerifiedEmail()) {
            return redirect()->intended(RouteServiceProvider::HOME);
        }

        if (empty($lang)) {
            $lang = Utility::getValByName('default_language');
        }
        \App::setLocale($lang);
        Utility::getSMTPDetails(1);

        try {
            if (empty($lang)) {
                $lang = env('default_language');
            }
            \App::setLocale($lang);
        } catch (\Exception $e) {
            return redirect('/register/lang')->with('status', __('Email SMTP settings does not configure so please contact to your site admin.'));
        }

        $request->user()->sendEmailVerificationNotification();

        return back()->with('status', 'verification-link-sent');
    }
}
