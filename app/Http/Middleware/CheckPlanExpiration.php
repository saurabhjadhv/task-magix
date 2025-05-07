<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckPlanExpiration
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            $user = Auth::user();

            // Check if the owner's plan has expired
            if ($user->type == 'owner' && $user->plan != 1 && !empty($user->plan_expire_date) && $user->plan_expire_date < date('Y-m-d')) {
                // Owner's plan is expired, redirect to home with an error message
                return redirect()->route('home')->with('error', __('Your plan has expired. Please renew.'));
            }

            // Check if the user is created by an owner with an expired plan
            if ($user->type == 'user' || $user->type == 'client') {
                $ownerId = $user->created_by;

                // Check if the user has a created_by ID
                if ($ownerId) {
                    $owner = \App\Models\User::find($ownerId);

                    // Check if the owner exists and if their plan has expired
                    if ($owner && $owner->type == 'owner' && $owner->plan != 1 && !empty($owner->plan_expire_date) && $owner->plan_expire_date < date('Y-m-d')) {
                        // User created by an owner with an expired plan, redirect to home with an error message
                        return redirect()->route('home')->with('error', __('Your owner\'s plan has expired. Please contact them.'));
                    }
                }
            }
        }

        return $next($request);
    }
}