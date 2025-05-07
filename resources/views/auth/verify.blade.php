@extends('layouts.auth')

@section('title')
    {{ __('Email Verification') }}
@endsection

@php
    $logo = \App\Models\Utility::get_file('logo/');
    if (empty($lang)) {
        $lang = Utility::getValByName('default_language');
    }
@endphp

@section('language-bar')
    {{-- <div class="form-group auth-lang">
        <select name="language" id="language" class="form-control px-3"
            onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            @foreach (\App\Models\Utility::languages() as $code => $language)
                <option @if ($lang == $code) selected @endif
                    value="{{ route('verification.notice', $code) }}">{{ ucfirst($language) }}</option>
            @endforeach
        </select>
    </div> --}}
@endsection
<style>
    #language{
        background-color: #1b385d !important;
    }
</style>
@section('content')
    <div class="col-sm-8 col-lg-5 col-xl-4">
        <div class="text-center pb-4">
            <img src="{{ $logo . 'logo.png'.'?'.time() }}" style="height: 40px; width:163px;>
        </div>
        <div class="card shadow zindex-100 mb-0">
            <div class="card-body px-md-5 py-5">
                <div class="mb-5 mt-3">
                    <h6 class="h3">{{ __('Verify Your Email Address') }}</h6>
                    @if (session('status') == 'verification-link-sent')
                        <div class="text-with-green-and-white-border" style="font-weight: 600;color: #3fad3f;border-radius: 10px;border: 2px solid white;padding: 10px;background: white;display: inline-block;">
                            {{ __('A fresh verification link has been sent to your email address.') }}
                        </div>
                    @endif
                </div>
                <div class="mt-4 flex items-center justify-between">
                    <span class="text-dark">{{ __('Before proceeding, please check your email for a verification link.') }}
                    {{ __('If you did not receive the email') }}</span>
                    <div class="row mt-3">
                        <div class="col-auto">
                            <form method="POST" action="{{ route('verification.send') }}">
                                @csrf
                                <button type="submit" class="btn btn-success btn-sm">{{ __('Resend Verification Email') }}
                                </button>
                            </form>
                        </div>
                        <div class="col-auto">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="btn btn-danger btn-sm">{{ __('Logout') }}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
