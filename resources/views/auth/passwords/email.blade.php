@extends('layouts.auth')

@section('title')
    {{__('Password reset')}}
@endsection

@php
$logo = \App\Models\Utility::get_file('logo/');
$settings = \App\Models\Utility::settings();
    config(
        [
            'captcha.secret' => isset($settings['google_recaptcha_secret']) ? $settings['google_recaptcha_secret'] :'',
            'captcha.sitekey' => isset($settings['google_recaptcha_key']) ? $settings['google_recaptcha_key'] :'' ,
            'options' => [
                'timeout' => 30,
            ],
        ]
    );
@endphp
<style>
    #language{
        background-color: #1b385d !important;
    }
</style>
@push('custom-scripts')
    @if(isset($settings['recaptcha_module']) == 'yes')
            {!! NoCaptcha::renderJs() !!}
    @endif
@endpush
@section('language-bar')
    {{-- <div class="form-group auth-lang">
        <select name="language" id="language" class="form-control px-3" onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            @foreach(Utility::languages() as $code => $language)
                <option @if($lang == $code) selected @endif value="{{ route('password.request',$code) }}">{{ ucfirst($language)}}</option>
            @endforeach
        </select>
    </div> --}}
@endsection

@section('content')
    <div class="col-sm-8 col-lg-5 col-xl-4">
        <div class="text-center pb-4">
            <img src="{{$logo.'logo.png'.'?'.time()}}" style="height: 40px; width:163px;">
        </div>
        <div class="card shadow zindex-100 mb-0">
            <div class="card-body px-md-5 py-5">
                <div class="mb-4">
                    <h6 class="h3">{{__('Forgot Password')}}</h6>
                    <p class="text-muted">{{__('Enter your email below to proceed.')}}</p>
                    @if (session('status'))
                        <div class="badge badge-pill badge-primary" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                </div>
                <span class="clearfix"></span>
                <form method="POST" action="{{ route('password.email') }}">
                    @csrf
                    <div class="form-group">
                        <label class="form-control-label">{{__('Email Address')}}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" placeholder="name@example.com" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        @if(isset($settings['recaptcha_module']) && $settings['recaptcha_module'] == 'yes')
                            <div class="form-group col-lg-12 col-md-12 mt-3">
                                {!! NoCaptcha::display() !!}
                                @error('g-recaptcha-response')
                                <span class="small text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        @endif

                    </div>
                    <div class="mt-4">
                        <button type="submit" class="btn btn-sm btn-primary btn-icon rounded-pill">
                            <span class="btn-inner--text">{{__('Send Password Reset Link')}}</span>
                            <span class="btn-inner--icon"><i class="fas fa-long-arrow-alt-right"></i></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
