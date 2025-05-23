@extends('layouts.admin')

@section('title')
    {{ __('Account Settings') }}
@endsection

@push('theme-script')
    <script src="{{ asset('assets/libs/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js') }}"></script>
@endpush

@php
    $logo = \App\Models\Utility::get_file('/');
@endphp

@push('css')
    <style>
        .ahref:hover,
        .ahref.active {
            color: #fff !important;
        }
    </style>
@endpush

@section('content')
    <div class="row">
        <div class="col-lg-4 order-lg-2">
            <div class="card">
                <div class="list-group list-group-flush" id="tabs">
                    <div data-href="#tabs-1" class="list-group-item text-primary">
                        <div class="media">
                            <i class="fas fa-user"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Basic') }}</a>
                                <p class="mb-0 text-sm">{{ __('Details about your personal information.') }}</p>
                            </div>
                        </div>
                    </div>
                    <div data-href="#tabs-2" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-lock"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Security') }}</a>
                                <p class="mb-0 text-sm">{{ __('Details about your personal information.') }}</p>
                            </div>
                        </div>
                    </div>
                    @if (\Auth::user()->type == 'owner')
                        <div data-href="#tabs-3" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-credit-card"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1">{{ __('Billing') }}</a>
                                    <p class="mb-0 text-sm">{{ __('Details about your plan & purchase.') }}</p>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-lg-8 order-lg-1">
            <div class="card bg-gradient-warning hover-shadow-lg border-0">
                <div class="card-body py-3">
                    <div class="row row-grid align-items-center">
                        <div class="col-lg-8">
                            <div class="media align-items-center">

                                @if ($user->avatar)
                                    <a href="#" class="avatar avatar-lg rounded-circle mr-3">
                                        <img src="{{ $logo . $user->avatar }}" class="avatar avatar-lg">
                                    </a>
                                @else
                                    <a href="#" class="avatar avatar-lg rounded-circle mr-3">
                                        <img class="avatar avatar-lg" {{ $user->img_avatar }}>
                                    </a>
                                @endif
                                <div class="media-body">
                                    <h5 class="text-white mb-0">{{ $user->name }}</h5>
                                    <div>
                                        {{ Form::open(['route' => ['update.profile'], 'enctype' => 'multipart/form-data', 'id' => 'update_avatar']) }}
                                        <input type="file" name="avatar" id="avatar"
                                            class="custom-input-file custom-input-file-link"
                                            data-multiple-caption="{count} files selected" multiple />
                                        <label for="avatar">
                                            <span class="text-white">{{ __('Change Avatar') }}</span>
                                        </label>
                                        {{ Form::close() }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tabs-1" class="tabs-card">
                <div class="card">
                    <div class="card-header">
                        <h5 class=" h6 mb-0">{{ __('Basic Setting') }}</h5>
                    </div>
                    <div class="card-body">
                        {{ Form::open(['route' => ['update.profile'], 'id' => 'update_profile']) }}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('name', __('Name'), ['class' => 'form-control-label']) }}
                                    {{ Form::text('name', $user->name, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter your name')]) }}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('email', __('Email Address'), ['class' => 'form-control-label']) }}
                                    {{ Form::email('email', $user->email, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter your email address')]) }}
                                    <small
                                        class="form-text text-muted mt-2">{{ __("This is the main email address that we'll send notifications.") }}</small>
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('dob', __('Date Of Birth'), ['class' => 'form-control-label']) }}
                                    {{ Form::date('dob', $user->dob, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Select your birthdate'), 'max' => date('d-m-Y')]) }}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('Gender') }}</label>
                                    {{ Form::select('gender', ['female' => __('Female'), 'male' => __('Male')], $user->gender, ['class' => 'form-control', 'placeholder' => __('Select your gender')]) }}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('phone', __('Phone'), ['class' => 'form-control-label']) }}
                                    {{ Form::text('phone', $user->phone, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter your phone number')]) }}
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('facebook', __('Facebook'), ['class' => 'form-control-label']) }}
                                    {{ Form::text('facebook', $user->facebook, ['class' => 'form-control', 'placeholder' => __('Enter your facebook profile url')]) }}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('whatsapp', __('WhatsApp Number'), ['class' => 'form-control-label']) }}
                                    {{ Form::text('whatsapp', $user->whatsapp, ['class' => 'form-control', 'placeholder' => __('Enter your whatsapp number')]) }}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('instagram', __('Instagram'), ['class' => 'form-control-label']) }}
                                    {{ Form::text('instagram', $user->instagram, ['class' => 'form-control', 'placeholder' => __('Enter your instagram profile url')]) }}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('likedin', __('LinkedIn'), ['class' => 'form-control-label']) }}
                                    {{ Form::text('likedin', $user->likedin, ['class' => 'form-control', 'placeholder' => __('Enter your linkedIn profile url')]) }}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    {{ Form::label('skills', __('Skills'), ['class' => 'form-control-label']) }}
                                    <small class="form-text text-muted mb-2 mt-0">{{ __('Seprated By Comma.') }}</small>
                                    {{ Form::text('skills', $user->skills, ['class' => 'form-control', 'data-toggle' => 'tags', 'placeholder' => __('Enter your skills')]) }}
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="text-right">
                            {{ Form::hidden('from', 'profile') }}
                            <button type="submit"
                                class="btn btn-sm btn-primary rounded-pill">{{ __('Save Changes') }}</button>
                        </div>
                        {{ Form::close() }}
                    </div>
                </div>
            </div>
            <div id="tabs-2" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class=" h6 mb-0">{{ __('Security Setting') }}</h5>
                    </div>
                    <div class="card-body">
                        {{ Form::open(['route' => ['update.profile'], 'id' => 'update_profile']) }}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('old_password', __('Old Password'), ['class' => 'form-control-label']) }}
                                    <div class="input-group">
                                        {{ Form::password('old_password', ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter your old password'), 'id' => 'old_password']) }}
                                        <div class="input-group-append">
                                            <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('old_password', 'old-password-icon')">
                                                <i id="old-password-icon" class="fas fa-eye-slash"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('password', __('New Password'), ['class' => 'form-control-label']) }}
                                    <div class="input-group">
                                        {{ Form::password('password', ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter your new password'), 'id' => 'password']) }}
                                        
                                        <div class="input-group-append">
                                            <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('password', 'new-password-icon')">
                                                <i id="new-password-icon" class="fas fa-eye-slash"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    {{ Form::label('password_confirmation', __('Confirm Password'), ['class' => 'form-control-label']) }}
                                    <div class="input-group">
                                        {{ Form::password('password_confirmation', ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter your confirm password'), 'id' => 'password_confirmation']) }}
                                        <div class="input-group-append">
                                            <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('password_confirmation', 'confirm-password-icon')">
                                                <i id="confirm-password-icon" class="fas fa-eye-slash"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="text-right">
                            {{ Form::hidden('from', 'password') }}
                            <button type="submit" class="btn btn-sm btn-primary rounded-pill">{{ __('Save Changes') }}</button>
                        </div>
                        {{ Form::close() }}
                    </div>
                </div>
            </div>

            <div id="tabs-3" class="tabs-card d-none">
                <ul class="nav nav-dark nav-tabs nav-overflow" role="tablist">
                    @if (\Auth::user()->type != 'admin')
                        <li class="nav-item">
                            <a href="#plans" id="plans-tab" class="ahref nav-link active" data-toggle="tab"
                                role="tab" aria-controls="home" aria-selected="true">
                                <i class="fas fa-award mr-2"></i>{{ __('Plans') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#orders" id="orders-tab" class="ahref nav-link" data-toggle="tab" role="tab"
                                aria-controls="home" aria-selected="true">
                                <i class="fas fa-file-invoice mr-2"></i>{{ __('Orders') }}
                            </a>
                        </li>
                    @endif
                </ul>
                <div class="tab-content pt-4">
                    @if (\Auth::user()->type != 'admin')
                        <div class="tab-pane fade show active" id="plans" role="tabpanel"
                            aria-labelledby="plans-tab">
                            <div class="container">
                                @include('plans.planlist', [
                                    'size' => '6',
                                    'paymentSetting' => \App\Models\Utility::getPaymentSetting(),
                                ])
                            </div>
                        </div>
                    @endif
                    <div class="tab-pane fade show {{ \Auth::user()->type == 'admin' ? 'active' : '' }}" id="orders"
                        role="tabpanel" aria-labelledby="orders-tab">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table" width="100%">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>{{ __('Order Id') }}</th>
                                                        <th>{{ __('Name') }}</th>
                                                        <th>{{ __('Plan Name') }}</th>
                                                        <th>{{ __('Price') }}</th>
                                                        <th>{{ __('Status') }}</th>
                                                        <th>{{ __('Type') }}</th>
                                                        <th>{{ __('Date') }}</th>
                                                        <th>{{ __('Coupon') }}</th>
                                                        <th class="text-right">{{ __('Invoice') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @if ($orders->count() > 0)
                                                        @foreach ($orders as $order)
                                                            <tr>
                                                                <td>{{ $order->order_id }}</td>
                                                                <td>{{ $order->user_name }}</td>
                                                                <td>{{ $order->plan_name }}</td>
                                                                <td>{{ isset($payment_setting['currency']) ? $payment_setting['currency'] : '$' }}
                                                                    {{ number_format($order->price) }}</td>
                                                                <td>
                                                                    @if (
                                                                        $order->payment_status == 'succeeded' ||
                                                                            $order->payment_status == 'approved' ||
                                                                            $order->payment_status == 'success')
                                                                        <span
                                                                            class="badge badge-success">{{ ucfirst($order->payment_status) }}</span>
                                                                    @else
                                                                        <span
                                                                            class="badge badge-danger">{{ ucfirst($order->payment_status) }}</span>
                                                                    @endif
                                                                </td>
                                                                <td>{{ $order->payment_type }}</td>
                                                                <td>{{ $order->created_at->format('d M Y') }}</td>
                                                                <td>{{ !empty($order->use_coupon) ? $order->use_coupon->coupon_detail->name : '-' }}
                                                                </td>
                                                                <td class="text-right">
                                                                    @if ($order->receipt == 'free coupon')
                                                                        <p>{{ __('Used 100 % discount coupon code.') }}</p>
                                                                    @elseif(!empty($order->receipt))
                                                                        <a href="{{ $order->receipt }}" target="_blank"
                                                                            class="text-primary"><i
                                                                                class="fas fa-file-invoice"></i></a>
                                                                    @else
                                                                        {{ '-' }}
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    @else
                                                        <tr>
                                                            <th scope="col" colspan="8">
                                                                <h6 class="text-center">{{ __('No Orders Found.') }}</h6>
                                                            </th>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        $(document).ready(function() {
            $('.list-group-item').on('click', function() {
                var href = $(this).attr('data-href');
                $('.tabs-card').addClass('d-none');
                $(href).removeClass('d-none');
                $('#tabs .list-group-item').removeClass('text-primary');
                $(this).addClass('text-primary');
            });
        });
        document.getElementById("avatar").onchange = function() {
            document.getElementById("update_avatar").submit();
        };
    </script>

<script>
    function togglePasswordVisibility(fieldId, iconId) {
        const passwordField = document.getElementById(fieldId);
        const icon = document.getElementById(iconId);
    
        if (passwordField && icon) {
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            }
        } else {
            console.error('Password field or icon not found.');
        }
    }
    </script>
@endpush
