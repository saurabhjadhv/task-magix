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
                'captcha.sitekey' => isset($settings['google_recaptcha_key']) ? $settings['google_recaptcha_key'] :'',
                'options' => [
                    'timeout' => 30,
                ],
            ]
        );
@endphp


@push('custom-scripts')
    @if($settings['recaptcha_module'] == 'yes')
            {!! NoCaptcha::renderJs() !!}
    @endif
@endpush

@section('content')
    <div class="col-sm-8 col-lg-5 col-xl-4">
        <div class="text-center pb-4">
            <img src="{{$logo.'logo.png'.'?'.time()}}" style="height: 40px; width:163px;">
        </div>
        <div class="card shadow zindex-100 mb-0">
            <div class="card-body px-md-5 py-5">
                <div class="mb-5">
                    <h6 class="h3">{{__('Reset Password')}}</h6>
                </div>
                <span class="clearfix"></span>
                <form method="POST" action="{{ route('password.update') }}">
                    @csrf
                    <input type="hidden" name="token" value="{{ $request->route('token') }}">
                    <div class="form-group">
                        <label class="form-control-label">{{__('Email Address')}}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" placeholder="Enter Email" name="email" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-control-label">{{__('Password')}}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" placeholder="Enter Password" name="password" required autocomplete="new-password">
                             <div class="input-group-append">
								 <span class="input-group-text toggle-password" onclick="togglePasswordVisibility('password', this.querySelector('i'))">
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
                        <label class="form-control-label">{{__('Confirm Password')}}</label>
                        <div class="input-group input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Enter Confirm Password">
							 <div class="input-group-append">
							    <span class="input-group-text toggle-password" onclick="togglePasswordVisibility('password-confirm', this.querySelector('i'))">
                <i class="fas fa-eye-slash"></i>
            </span>
                       		 </div>
                        </div>
                    </div>
                    @if($settings['recaptcha_module'] == 'yes')
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
                            <span class="btn-inner--text">{{__('Reset Password')}}</span>
                            <span class="btn-inner--icon"><i class="fas fa-long-arrow-alt-right"></i></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
  <script>
	function togglePasswordVisibility(targetId, icon) {
		const passwordInput = document.getElementById(targetId);
		const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
		passwordInput.setAttribute('type', type);

		// Toggle the icon between fa-eye and fa-eye-slash
		if (type === 'password') {
			icon.classList.remove('fa-eye');
			icon.classList.add('fa-eye-slash');
		} else {
			icon.classList.remove('fa-eye-slash');
			icon.classList.add('fa-eye');
		}
	}

    </script>