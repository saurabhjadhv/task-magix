@extends('layouts.admin')

@section('title')
    {{ __('Referral Program') }}
@endsection

@push('css')
    <link rel="stylesheet" href="{{ asset('assets/libs/summernote/summernote-bs4.css') }}">
@endpush

@push('theme-script')
    <script src="{{ asset('assets/libs/summernote/summernote-bs4.js') }}"></script>
@endpush
@php
    $settings = Utility::getAdminPaymentSetting();
    $currency = isset($settings['currency']) ? $settings['currency'] : '$';

@endphp
@section('content')
    <div class="row">
        <div class="col-lg-3 order-lg-2">
            <div class="card">
                <div class="list-group list-group-flush" id="tabs">
                    <div data-href="#transaction" class="list-group-item text-primary">
                        <div class="media">
                            <i class="fas fa-exchange-alt pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Transaction') }}</a>
                            </div>
                        </div>
                    </div>
                    <div data-href="#payout_request" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-money-check-alt pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Payout Request') }}</a>
                            </div>
                        </div>
                    </div>
                    <div data-href="#settings" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-cog pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Settings') }}</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-9 order-lg-1">
            <div id="transaction" class="tabs-card">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0">{{ __('Transaction') }}</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table pc-dt-simple" id="transaction">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>{{ __('Company Name') }}</th>
                                        <th>{{ __('Referral Company Name') }}</th>
                                        <th>{{ __('Plan Name') }}</th>
                                        <th>{{ __('Plan Price') }}</th>
                                        <th>{{ __('Commission (%)') }}</th>
                                        <th>{{ __('Commission Amount') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($transactions as $key => $transaction)
                                        <tr>
                                            <td> {{ ++$key }} </td>
                                            <td>{{ !empty($transaction->getCompany) ? $transaction->getCompany->name : '-' }}
                                            </td>
                                            <td>{{ !empty($transaction->getUser) ? $transaction->getUser->name : '-' }}
                                            </td>
                                            <td>{{ !empty($transaction->getPlan) ? $transaction->getPlan->name : '-' }}
                                            </td>
                                            <td>{{ $currency . $transaction->plan_price }}</td>
                                            <td>{{ $transaction->commission }}</td>
                                            <td>{{ $currency . ($transaction->plan_price * $transaction->commission) / 100 }}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div id="payout_request" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0">{{ __('Payout Request') }}</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table pc-dt-simple" id="payout-request">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>{{ __('Company Name') }}</th>
                                        <th>{{ __('Requested Date')}}</th>
                                        <th>{{ __('Requested Amount') }}</th>
                                        <th>{{ __('Action') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($payRequests as $key => $transaction)
                                        <tr>
                                            <td> {{( ++ $key)}} </td>
                                            <td>{{ !empty( $transaction->getCompany) ? $transaction->getCompany->name : '-'}}</td>
                                            <td>{{ $transaction->date }}</td>
                                            <td>{{ $currency . $transaction->req_amount }}</td>
                                            <td>
                                                <a href="{{route('amount.request',[$transaction->id,1])}}" class="btn btn-success btn-xs">
                                                    <i class="fas fa-check"></i>
                                                </a>
                                                <a href="{{route('amount.request',[$transaction->id,0])}}" class="btn btn-danger btn-xs">
                                                    <i class="fas fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div id="settings" class="tabs-card d-none">
                <div class="card">
                    {{ Form::open(['route' => 'referral-program.store', 'method' => 'POST', 'enctype' => 'multipart/form-data']) }}
                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                                <h5 class="h6 mb-0">{{ __('Settings') }}</h5>
                            </div>
                            <div class=" col-6 text-end">
                                <div class="switch__container custom-control custom-switch float-right" onclick="enablecookie()">
                                    {{ Form::checkbox('is_enable', 'on', isset($setting['is_enable']) && $setting['is_enable'] == '1' ? 'checked' : '', ['class' => 'custom-control-input', 'id' => 'is_enabled']) }}
                                    <label for="is_enabled" class="custom-control-label"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row cookieDiv {{ isset($setting['is_enable']) && $setting['is_enable'] == '0' ? 'disabledCookie ' : '' }}">
                            <div class="col-md-12">
                                <div class="form-group">
                                    {{ Form::label('percentage', __('Commission Percentage (%)'), ['class' => 'form-control-label']) }}
                                    {{ Form::number('percentage', isset($setting) ? $setting->percentage : '', ['class' => 'form-control','id'=>'percentage' ,'placeholder' => __('Enter Commission Percentage')]) }}
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    {{ Form::label('minimum_threshold_amount', __('Minimum Threshold Amount'), ['class' => 'form-control-label']) }}
                                    <div class="input-group">
                                        <span class="input-group-prepend"><span
                                            class="input-group-text">{{ "$" }}</span></span>
                                    {{ Form::number('minimum_threshold_amount', isset($setting) ? $setting->minimum_threshold_amount : '', ['class' => 'form-control','id'=>'minimum_threshold_amount', 'placeholder' => __('Enter Minimum Payout')]) }}
                                </div>
                                </div>
                            </div>
                            <div class="form-group col-12">
                                {{ Form::label('guideline', __('GuideLines'), ['class' => 'form-control-label text-dark guideline']) }}
                                <textarea class="summernote-simple" id="summernote-simple" name="guideline" rows="8">{!! isset($setting) ? $setting->guideline : '' !!}</textarea>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="submit"
                                class="btn btn-sm btn-primary rounded-pill">{{ __('Save changes') }}</button>
                        </div>
                    </div>
                    {{ Form::close() }}
                </div>
            </div>


        </div>
    </div>
@endsection

@push('script')
    <script>
        // For Sidebar Tabs
        $(document).ready(function() {
            $('.list-group-item').on('click', function() {
                var href = $(this).attr('data-href');
                $('.tabs-card').addClass('d-none');
                $(href).removeClass('d-none');
                $('#tabs .list-group-item').removeClass('text-primary');
                $(this).addClass('text-primary');
            });
        });
    </script>
     <script type="text/javascript">
        function enablecookie() {
            const element = $('#enable_cookie').is(':checked');
            $('.cookieDiv').addClass('disabledCookie');
            if (element == true) {
                $('.cookieDiv').removeClass('disabledCookie');
                $("#cookie_logging").attr('checked', true);
            } else {
                $('.cookieDiv').addClass('disabledCookie');
                $("#cookie_logging").attr('checked', false);
            }
        }
    </script>

@endpush
