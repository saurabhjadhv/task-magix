<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;

class PasswordResetLinkController extends Controller
{
    /**
     * Display the password reset link request view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {

        return view('auth.forgot-password');
    }

    /**
     * Handle an incoming password reset link request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

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

        // if(Utility::getValByName('recaptcha_module') == 'yes')
        // {
        //     $validation['g-recaptcha-response'] = 'required|captcha';
        // }else{
        //     $validation = [];
        // }
        // $this->validate($request, $validation);
        Utility::getSMTPDetails(1);

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.

        try{
            $status = Password::sendResetLink(
                $request->only('email')
            );

            return $status == Password::RESET_LINK_SENT
                    ? back()->with('status', __($status))
                    : back()->withInput($request->only('email'))
                            ->withErrors(['email' => __($status)]);
        }
        catch(\Exception $e)
        {
            return redirect()->back()->withErrors('E-Mail has been not sent due to SMTP configuration');
        }
    }
}
