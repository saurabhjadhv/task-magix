@extends('layouts.admin')

@section('title')
    {{__('Manage Plans')}}
@endsection

@section('action-button')
    <a href="#" class="btn btn-sm btn-white btn-icon-only rounded-circle ml-2" data-url="{{ route('plans.create') }}" data-ajax-popup="true" data-size="lg" data-title="{{__('Create Plan')}}" data-toggle="tooltip" data-bs-placement="left" title="{{__('Create')}}">
        <span class="btn-inner--icon"><i class="fas fa-plus"></i></span>
    </a>
@endsection

@section('content')
    <div class="row">
        @foreach ($plans as $key => $plan)
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mt-4">
                <div class="card card-pricing popular text-center px-3 mb-5 mb-lg-0">
                    <span class="h6 w-60 mx-auto px-4 py-1 rounded-bottom bg-primary text-white">{{ $plan->name }}</span>
                    {{-- <a href="#" class="dropdown-item" data-ajax-popup="true" data-size="lg" data-title="{{__('Edit Plan')}}" data-url="{{route('plans.edit',$plan->id)}}"><i class="mdi mdi-pencil mr-1"></i>{{__('Edit')}}</a> --}}
                    <div class="card-body delimiter-top">
                        <ul class="list-unstyled mb-4">
                            @if($plan->id != 1)
                                <li>{{ __('Trial') }}: {{$plan->trial_days}} {{ __('Days') }}</li>
                                <li>{{ __('Monthly Price') }}: {{(isset($payment_setting['currency']) ? $payment_setting['currency'] : '$')}}{{$plan->monthly_price}}</li>
                                <li>{{ __('Annual Price') }}: {{(isset($payment_setting['currency']) ? $payment_setting['currency'] : '$')}}{{$plan->annual_price}}</li>
                            @endif
                            <li>{{ ($plan->max_users < 0)?__('Unlimited'):$plan->max_users }} {{__('Users')}}</li>
                            <li>{{ ($plan->max_projects < 0)?__('Unlimited'):$plan->max_projects }} {{__('Projects')}}</li>
                            <li>{{ ($plan->storage_limit .'MB' < 0 )?__('Unlimited'):$plan->storage_limit  .'MB' }} {{__('Storage Limit')}}</li>
                            <li>
                                @if ($plan->enable_chatgpt == 'on')
                                    <span class="theme-avtar">
                                        <i class="text-primary fas fa-plus-circle"></i></span>
                                    {{ __('Chat GPT') }}
                                @else
                                    <span class="theme-avtar">
                                        <i class="text-danger fas fa-plus-circle"></i></span>
                                    {{ __('Chat GPT') }}
                                @endif
                            </li>
                            @if($plan->description)
                                <li>
                                    <small>{{$plan->description}}</small>
                                </li>
                            @endif
                            <div class="row">
                                <div class="actions justify-content-between px-4 ml-7">
                                    <a href="#" class="action-item" data-ajax-popup="true" data-size="lg" data-toggle="tooltip" data-title="{{__('Edit Plan')}}" data-url="{{route('plans.edit',$plan->id)}}"   >
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    @if($plan->id != 1)
                                        <a href="#" class="action-item text-danger" data-toggle="tooltip" data-original-title="{{__('Delete')}}" data-confirm="{{__('Are You Sure?')}}|{{__('This action can not be undone. Do you still want to delete it?')}}" data-confirm-yes="document.getElementById('delete-plans-{{$plan->id}}').submit();">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    @endif
                                </div>
                            </div>
                            {!! Form::open(['method' => 'DELETE', 'route' => ['plans.destroy',$plan->id],'id'=>'delete-plans-'.$plan->id]) !!}
                            {!! Form::close() !!}
                        </ul>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection

@push('script')
    <script>
        $(document).ready(function () {
            $(document).on('click', '#prevent_plan', function () {
                show_toastr('Error', '{{__('Please Enter Stripe or PayPal Payment Details.')}}', 'error');
            });
        });
    </script>
@endpush
