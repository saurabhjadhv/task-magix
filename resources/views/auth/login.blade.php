@extends('layouts.auth')

@section('title')
    {{__('Login')}}
@endsection

@php
    $logo=\App\Models\Utility::get_file('logo/');
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

@push('custom-scripts')
    @if(isset($settings['recaptcha_module']) == 'yes')
            {!! NoCaptcha::renderJs() !!}
    @endif
@endpush
<style>
    #language{
        background-color: #1b385d !important;
    }
</style>
@section('language-bar')
    {{-- <div class="form-group auth-lang">
        <select name="language" id="language" class="form-control px-3" onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            @foreach(\App\Models\Utility::languages() as $code => $language)
                <option @if($lang == $code) selected @endif value="{{ route('login',$code) }}">{{ ucfirst($language)}}</option>
            @endforeach
        </select>
    </div> --}}
@endsection

@section('content')
    <div class="col-sm-8 col-lg-4">
        <div class="text-center pb-4">
            <img src="{{$logo.'logo.png'.'?'.time()}}" style="height: 40px; width:163px;">
        </div>
        @if (session('status'))
            <div>
                <div class="mb-4 font-medium text-lg text-green-600 text-danger">
                    {{ __('Your Account is disable,please contact your Administrator') }}
                </div>
            </div>
        @endif
        <div class="card shadow zindex-100 mb-0">
            <div class="card-body px-md-5 py-5">
                <div class="mb-4">
                    <h6 class="h3">{{__('Login')}}</h6>
                    <p class="text-muted mb-0">{{__('Login to your account to continue.')}}</p>
                </div>
                <span class="clearfix"></span>
                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="form-group">
                        <label class="form-control-label">{{__('Email address')}}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" placeholder="Enter Email Address" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus/>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group mb-0">
                        <div class="d-flex align-items-center justify-content-between">
                            <div>
                                <label class="form-control-label">{{__('Password')}}</label>
                            </div>
                            
                        </div>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" placeholder="Enter Password" name="password" required autocomplete="current-password"/>
                            @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                            <div class="input-group-append">
                             <span class="input-group-text toggle-password" onclick="togglePasswordVisibility('password', this.querySelector('i'))">
								<i class="fas fa-eye-slash"></i>
							</span>
                            </div>
                        </div>
                        @if (Route::has('password.request'))
                                <div class="mb-2 text-right">
                                    <a href="{{ route('password.request',$lang) }}" class="small text-muted text-underline--dashed border-primary">{{__('Forgot password?')}}</a>
                                </div>
                            @endif
                        <div class="my-4">
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="custom-control-label" for="remember">{{ __('Remember Me') }}</label>
                            </div>
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

                        <div class="mt-4">
                            <button type="submit" class="btn btn-sm btn-primary btn-icon rounded-pill">
                                <span class="btn-inner--text">{{__('Login')}}</span>
                                <span class="btn-inner--icon"><i class="fas fa-long-arrow-alt-right"></i></span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            @if(\App\Models\Utility::getValByName('SIGNUP') == 'on')
                <div class="card-footer px-md-5"><small>{{__('Not registered?')}}</small>
                    <a href="{{ route('register',$lang) }}" class="small font-weight-bold">{{__('Register')}}</a>
                </div>
            @endif


        </div>
    </div>
@endsection
<script>
    function togglePasswordVisibility(targetId, icon) {
        const passwordInput = document.getElementById(targetId);
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        if (type === 'password') {
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            icon.classList.remove('fa-eye-slash'); 
            icon.classList.add('fa-eye');
        }
    }
</script>