@extends('layouts.admin')

@section('title')
    {{ __('Referral Program') }}
@endsection
@php
    $settings = Utility::getAdminPaymentSetting();
    $currency = isset($settings['currency']) ? $settings['currency'] : '$';
    $company_name = \Auth::user()->name;
@endphp

@section('content')
    <div class="row">
        <div class="col-lg-3 order-lg-2">
            <div class="card">
                <div class="list-group list-group-flush" id="tabs">
                    <div data-href="#guideline" class="list-group-item text-primary">
                        <div class="media">
                            <i class="fas fa-exchange-alt pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('GuideLine') }}</a>
                            </div>
                        </div>
                    </div>
                    <div data-href="#referral-transaction" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-retweet pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Referral Transaction') }}</a>
                            </div>
                        </div>
                    </div>
                    <div data-href="#payout" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-money-check-alt pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1">{{ __('Payout') }}</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-9 order-lg-1">
            <div id="guideline" class="tabs-card">
                <div class="card">
                    <div class="card-header">
                        <h5>{{ __('GuideLine') }}</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 col-md-12">
                                <div class = "border border-2 p-3">
                                    <h5>{{ __('Refer '. $company_name .' and earn ') . $currency . (isset($setting) ? $setting->minimum_threshold_amount : '') . __(' per paid signup!') }}</h5>
                                    {!! isset($setting) ? $setting->guideline : '' !!}
                                </div>
                            </div>
                            <div class="col-lg-12 col-sm-12 col-md-12 mt-3">
                                <div class = "border border-2 p-3">
                                    <h5 class="text-center">{{ __('Share Your Link') }}</h5>
                                    <div class="d-flex justify-content-between">
                                        <a href="#!" class="btn btn-sm btn-light-primary w-100 cp_link"
                                            data-link="{{ route('register', ['ref_id' => \Auth::user()->referral_code]) }}"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title=""
                                            data-bs-original-title="Click to copy link">
                                            {{ route('register', ['ref' => \Auth::user()->referral_code]) }}
                                            <span class="btn-inner--icon"><i class="fas fa-file"></i></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            @if(isset($setting) && $setting->is_enable == 0 || !isset($setting))
                                    <h6 class="text-right text-danger text-md mt-2">{{ __('Note : super admin has disabled the referral program.') }}</h6>
                                @endif
                        </div>
                    </div>
                </div>
            </div>

            <div id="referral-transaction" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5>{{ __('Referral Transaction') }}</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table datatable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>{{ __('Company Name') }}</th>
                                        <th>{{ __('Plan Name') }}</th>
                                        <th>{{ __('Plan Price') }}</th>
                                        <th>{{ __('Commission (%)') }}</th>
                                        <th>{{ __('Commission Amount') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($transactions as $key => $transaction)
                                        <tr>
                                            <td> {{ ++$key }} </td>
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

            <div id="payout" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                                <h5 class="">{{ __('PayOut') }}</h5>
                            </div>
                            <div class="col-6 text-right">
                                @if (\Auth::user()->commission_amount > $paidAmount)
                                    @if ($paymentRequest == null)
                                        <a href="#" class="btn btn-sm btn-primary btn-icon-only rounded-circle" data-url="{{ route('request.amount.sent', [\Illuminate\Support\Facades\Crypt::encrypt(\Auth::user()->id)]) }}" data-ajax-popup="true" data-size="lg" data-title="{{__('Send Request')}}">
                                            <span class="btn-inner--icon"><i class="fas fa-reply"></i></span>
                                        </a>
                                    @else
                                        <a  href="{{ route('request.amount.cancel', \Auth::user()->id) }}" class="btn btn-sm btn-danger btn-icon-only rounded-circle" data-title="{{__('Cancle Request')}}">
                                            <span class="btn-inner--icon"><i class="fas fa-times"></i></span>
                                        </a>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-md-12 dashboard-card">
                                <div class="border border-2 p-3">
                                    <div class="row align-items-center justify-content-between">
                                        <div class="col-auto mb-3 mb-sm-0">
                                            <div class="d-flex align-items-center">
                                                <div class="theme-avtar bg-primary">
                                                    <i class="ti ti-report-money"></i>
                                                </div>
                                                <div class="ms-3">
                                                    <small class="text-muted">{{ __('Total') }}</small>
                                                    <h6 class="m-0">{{ __('Commission Amount') }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto text-end">
                                            <h4 class="m-0">{{ $currency . \Auth::user()->commission_amount }}
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12 dashboard-card">
                                <div class="border border-2 p-3">
                                    <div class="row align-items-center justify-content-between">
                                        <div class="col-auto mb-3 mb-sm-0">
                                            <div class="d-flex align-items-center">
                                                <div class="theme-avtar bg-primary">
                                                    <i class="ti ti-report-money"></i>
                                                </div>
                                                <div class="ms-3">
                                                    <small class="text-muted">{{ __('Paid') }}</small>
                                                    <h6 class="m-0">{{ __('Commission Amount') }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto text-end">
                                            <h4 class="m-0">{{ $currency . $paidAmount }}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                                <h5 class="">{{ __('Payout History') }}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table datatable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>{{ __('Company Name') }}</th>
                                        <th>{{ __('Requested Date') }}</th>
                                        <th>{{ __('Status') }}</th>
                                        <th>{{ __('Requested Amount') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($transactionsOrder as $key => $transaction)
                                        <tr>
                                            <td>{{ ++$key }}</td>
                                            <td>{{ \Auth::user()->name }}</td>
                                            <td>{{ $transaction->date }}</td>
                                            <td>
                                                @if ($transaction->status == 0)
                                                    <span
                                                        class="status_badge badge bg-danger p-2 px-3 rounded">{{ __(\App\Models\TransactionOrder::$status[$transaction->status]) }}</span>
                                                @elseif($transaction->status == 1)
                                                    <span
                                                        class="status_badge badge bg-warning p-2 px-3 rounded">{{ __(\App\Models\TransactionOrder::$status[$transaction->status]) }}</span>
                                                @elseif($transaction->status == 2)
                                                    <span
                                                        class="status_badge badge bg-primary p-2 px-3 rounded">{{ __(\App\Models\TransactionOrder::$status[$transaction->status]) }}</span>
                                                @endif
                                            </td>
                                            <td>{{ $currency . $transaction->req_amount }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
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

        $('.cp_link').on('click', function() {
            var value = $(this).attr('data-link');
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val(value).select();
            document.execCommand("copy");
            $temp.remove();
            show_toastr('Success', '{{ __('Link Copy on Clipboard.') }}', 'success')
        });

    </script>
@endpush
