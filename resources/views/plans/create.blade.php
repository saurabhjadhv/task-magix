<form class="pl-3 pr-3" method="post" action="{{ route('plans.store') }}">
    @csrf
    <div class="row">
        <div class="col-12 col-md-12">
            <div class="text-right">
                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2" data-url="{{ route('generate',['plan']) }}" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="{{ __('Generate') }}" data-title="{{__('Generate with AI')}}">
                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span> {{__('Generate with AI')}}</span>
                </a>
            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="name">{{ __('Name') }}</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="{{ __('Enter Plan Name') }}" required/>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
            <div class="form-group">
                <div class="custom-control custom-switch mt-5 ml-5">
                    <input type="checkbox" class="custom-control-input" name="status" id="status">
                    <label class="custom-control-label form-control-label" for="status">{{__('Status')}}</label>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="form-group">
                <div class="custom-control custom-switch mt-5 ml-5">
                    <input type="checkbox" class="custom-control-input" name="enable_chatgpt" id="enable_chatgpt"  >
                    <label class="custom-control-label form-control-label" for="enable_chatgpt">{{__('Enable ChatGPT')}}</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="monthly_price">{{ __('Monthly Price') }}</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">{{(isset($payment_setting['currency']) ? $payment_setting['currency'] : '$')}}</span>
                    </div>
                    <input type="number" min="0" class="form-control" id="monthly_price" name="monthly_price" placeholder="{{ __('Enter Monthly Price') }}" required/>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="annual_price">{{ __('Annual Price') }}</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">{{(isset($payment_setting['currency'])? $payment_setting['currency'] : '$')}}</span>
                    </div>
                    <input type="number" min="0" class="form-control" id="annual_price" name="annual_price" placeholder="{{ __('Enter Annual Price') }}" required/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="trial_days">{{ __('Trial Days') }}</label>
                <input type="number" min="-1" class="form-control" id="trial_days" name="trial_days" placeholder="{{ __('Enter Trial Days') }}" required/>
                <span><small>{{__('Note: "-1" for Unlimited')}}</small></span>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="max_users">{{ __('Maximum Users') }}</label>
                <input type="number" class="form-control" id="max_users" name="max_users" min="-1" placeholder="{{ __('Enter Maximum Users') }}" required/>
                <span><small>{{__('Note: "-1" for Unlimited')}}</small></span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="max_projects">{{ __('Maximum Projects') }}</label>
                <input type="number" class="form-control" id="max_projects" name="max_projects" min="-1" placeholder="{{ __('Enter Maximum Projects') }}" required/>
                <span><small>{{__('Note: "-1" for Unlimited')}}</small></span>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="storage_limit">{{ __('Storage Limit') }}</label>
                <div class="input-group">
                    <input type="number" min="100" class="form-control" id="storage_limit" name="storage_limit" placeholder="{{ __('Enter Storage Limit') }}" required/>
                    <div class="input-group-prepend">
                        <span class="input-group-text">{{__('MB')}}</span>
                    </div>
                </div>
                <span><small>{{__('Note: Upload size (In MB)')}}</small></span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="form-group">
                <label class="form-control-label" for="description">{{ __('Description') }}</label>
                <textarea class="form-control" data-toggle="autosize" rows="3" id="description" name="description" placeholder="{{ __('Enter Description') }}"></textarea>
            </div>
        </div>
    </div>
    <div class="text-right">
        <button class="btn btn-sm btn-primary rounded-pill" type="submit">{{ __('Create Plan') }}</button>
    </div>
</form>
