<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Illuminate\Support\Facades\Auth;  

class HttpExceptionHandler extends ExceptionHandler
{
    public function render($request, \Throwable $e)
    {
        if ($e instanceof NotFoundHttpException) {
            // Pass the Auth information to the view
            return response()->view('errors.404', ['auth' => Auth::user()], 404); 
        }

        return parent::render($request, $e);
    }
}