<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'plan/paytm/*',
        'invoice/paytm/*',
        'plan-pay-with-paymentwall/*',
        'invoice-pay-with-paymentwall/*',
        'plan-pay-with-paytm',
        'iyzipay/callback/*',
        'plan-paytab-success/*',
        'invoice-paytab-success/*',
        '/aamarpay*',
    ];
}
