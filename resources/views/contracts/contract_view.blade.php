@extends('layouts.invoicepayheader')
@section('content')
@push('css')
<style>
    .signature-img {
    max-height: 100px; 
    max-width: 100%; 
    height: auto; 
    width: auto; 
}
.application-offset .container-application:before {
    background-color: #449fc6 !important;
}
</style>
@endpush

    <div class="row">
        <div class="col-lg-12">
            <div class="container">
                <div>
                    <div class="download-btn" style="max-width: 1000px !important; min-width: 1000px !important;">
                        <a href="{{ route('contract.download.pdf', \Crypt::encrypt($contract->id)) }}"
                            class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0 " data-toggle="tooltip"
                            data-original-title="{{ __('Download') }}">
                            <span class="btn-inner--icon"><i class="fas fa-download"></i></span>
                        </a>
                    </div>

                    <div class="card mt-3" id="printTable"
                        style="max-width: 1000px !important; min-width: 1000px !important;">

                        <div class="img-view p-4">

                            <div class="col-8">
                                <img src="{{ $img }}" class="contract_logos"
                                    style="width: 170px; filter: drop-shadow(2px 4px 6px black)">
                            </div>

                            <div class="col-lg-12 col-md-4 mt-3">
                                <h6 class="d-inline-block m-0 d-print-none">{{ __('Contract:') }}
                                </h6>
                                <span class="col-4">
                                    <h6 class="text-md d-inline-block m-0 d-print-none">
                                        {{ App\Models\Utility::contractNumberFormat($contract->id) }}
                                </span></span>
                            </div>
                        </div>


                        <div class="card-body view p-4" style="height: auto !important;">
                            <div class="row align-items-center mb-4">

                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <div class="row  mt-3">
                                        <div class="col-8">
                                            <div class="col-lg-12 col-md-8">
                                                <h6 class="d-inline-block m-0 d-print-none">{{ __('Type:') }}
                                                </h6>
                                                <span class="col-md-8"><span
                                                        class="text-md">{{ $contract->ContractType->name }}</span></span>
                                            </div>

                                            <div class="col-lg-12 col-md-8">
                                                <h6 class="d-inline-block m-0 d-print-none">{{ __('Value:') }}
                                                </h6>
                                                <span class="col-md-8"><span
                                                        class="text-md">{{ Auth::user()->priceFormat($contract->value) }}</span></span>
                                            </div>
                                        </div>


                                        <div class="col-4">
                                            <div class="col-12 text-right">
                                                <h6 class="d-inline-block m-0 d-print-none">{{ __('Start Date:') }}</h6>
                                                <span class="col-md-8"><span
                                                        class="text-md">{{ Auth::user()->dateFormat($contract->start_date) }}</span></span>
                                            </div>
                                            <div class="col-12 text-right">
                                                <h6 class="d-inline-block m-0 d-print-none">{{ __('End Date:') }}</h6>
                                                <span class="col-md-8"><span
                                                        class="text-md">{{ Auth::user()->dateFormat($contract->end_date) }}</span></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 mt-4">

                                        <div>{!! $contract->notes !!}</div>
                                        <br>
                                        <div>{!! $contract->contract_description !!}</div>
                                    </div>


                                    <div class="col-12 row d-flex mt-4">
                                        <div class="col-9 text-center">
                                            <div style="height: 100px; display: flex; align-items: center; justify-content: center;">
                                                <img src="{!! $contract->owner_signature !!}" class="signature-img" alt="{{ __('Owner Signature') }}">
                                            </div>
                                            <h5>{{ __('Owner Signature') }}</h5>
                                        </div>
                                        <div class="col-3 text-end">
                                            <div style="height: 100px; display: flex; align-items: center; justify-content: center;">
                                                <img src="{!! $contract->client_signature !!}" class="signature-img" alt="{{ __('Client Signature') }}">
                                            </div>
                                            <h5>{{ __('Client Signature') }}</h5>
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
