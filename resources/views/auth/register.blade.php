@extends('layouts.auth')

@section('title')
    {{ __('Register') }}
@endsection

@php
    $logo = \App\Models\Utility::get_file('logo/');
    $settings = \App\Models\Utility::settings();
    config([
        'captcha.secret' => isset($settings['google_recaptcha_secret']) ? $settings['google_recaptcha_secret'] : '',
        'captcha.sitekey' => isset($settings['google_recaptcha_key']) ? $settings['google_recaptcha_key'] : '',
        'options' => [
            'timeout' => 30,
        ],
    ]);
@endphp

@push('custom-scripts')
    @if ($settings['recaptcha_module'] == 'yes')
        {!! NoCaptcha::renderJs() !!}
    @endif
@endpush

<style>
    #language {
        background-color: #1b385d !important;
    }
</style>

@section('language-bar')
    {{-- <div class="form-group auth-lang">
        <select name="language" id="language" class="form-control px-3"
            onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            @foreach (\App\Models\Utility::languages() as $code => $language)
                <option @if ($lang == $code) selected @endif value="{{ route('register', [$ref, $code]) }}">
                    {{ ucfirst($language) }}</option>
            @endforeach
        </select>
    </div> --}}
@endsection

@section('content')
    <div class="col-sm-8 col-lg-5">
        <div class="text-center pb-4">
            <img src="{{ $logo . 'logo.png' . '?' . time() }}" style="height: 40px; width:163px;">
        </div>

        <div class="card shadow zindex-100 mb-0">
            <div class="card-body px-md-5 py-5">
                @if (session('status'))
                    <div class="mb-4 font-medium text-lg text-green-600 text-danger">
                        {{ __('Email SMTP settings does not configured so please contact to your site admin.') }}
                    </div>
                @endif
                <div class="mb-3">
                    <h6 class="h3">{{ __('Register') }}</h6>
                </div>

                <span class="clearfix"></span>
                <form method="POST" action="{{ route('register') }}">
                    @csrf
                    <input type="hidden" name="interested_plan_id"
                        value="{{ request()->has('plan') ? request()->plan : 0 }}">
                    <input type="hidden" name="is_register_trial"
                        value="{{ request()->has('trial') ? request()->has('trial') : 0 }}">
                    <div class="form-group">
                        <label class="form-control-label">{{ __('Name') }}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                placeholder="Enter Name" name="name" value="{{ old('name') }}" required
                                autocomplete="name" autofocus>
                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{{ __('Email address') }}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror"
                                placeholder="Enter Email Address" name="email" value="{{ old('email') }}" required
                                autocomplete="email">
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-control-label">{{ __('Password') }}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="password" type="password"
                                class="form-control @error('password') is-invalid @enderror" placeholder="Enter Password"
                                name="password" required autocomplete="new-password">
                            <div class="input-group-append">
                                <span class="input-group-text toggle-password"
                                    onclick="togglePasswordVisibility('password', this.querySelector('i'))">
                                    <i class="fas fa-eye-slash"></i>
                                </span>
                            </div>
                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{{ __('Confirm password') }}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="password-confirm" type="password" class="form-control"
                                placeholder="Enter Confirm Password" name="password_confirmation" required
                                autocomplete="new-password">
                            <div class="input-group-append">
                                <span class="input-group-text toggle-password"
                                    onclick="togglePasswordVisibility('password-confirm', this.querySelector('i'))">
                                    <i class="fas fa-eye-slash"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="my-4">
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="check-terms" required>
                            <label class="custom-control-label" for="check-terms">{{ __('I agree to the') }} <a
                                    href="https://www.taskmagix.com/in/terms-of-service.php">{{ __('terms and conditions') }}</a></label>
                        </div>
                    </div>
                    @if ($settings['recaptcha_module'] == 'yes')
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
                            <input type="hidden" name="ref_code" value="{{ $ref }}">
                            <span class="btn-inner--text">{{ __('Create my account') }}</span>
                            <span class="btn-inner--icon"><i class="fas fa-long-arrow-alt-right"></i></span>
                        </button>
                    </div>
                </form>
            </div>
            <div class="card-footer px-md-5"><small>{{ __('Already have an acocunt?') }}</small>
                <a href="{{ route('login', $lang) }}" class="small font-weight-bold">{{ __('Login') }}</a>
            </div>
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
