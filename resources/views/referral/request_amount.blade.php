{{ Form::open(['route' => ['request.amount.store',$id],'enctype' => 'multipart/form-data']) }}
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('request_amount', __('Request Amount'), ['class' => 'form-control-label']) }}
                {{ Form::number('request_amount', $netAmount, ['class' => 'form-control', 'placeholder' => __('Enter Request Amount'), 'required' => 'required']) }}
            </div>
        </div>
    </div>
    <div class="text-right">
        {{ Form::button(__('Send'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill']) }}
        <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal">{{__('Cancel')}}</button>
    </div>

{{ Form::close() }}
