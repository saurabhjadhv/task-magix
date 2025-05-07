<form class="pl-3 pr-3" method="post" action="{{ route('users.update',$user->id) }}">
    @csrf
    @method('put')
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="form-control-label" for="name">{{ __('Name') }}</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{$user->name}}" required/>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="form-control-label" for="email">{{ __('Email') }}</label>
                    <input type="text" class="form-control" id="email" name="email" value="{{$user->email}}" required/>
                </div>
            </div>
        </div>

    <div class="text-right">
        {{ Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill']) }}
        <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal">{{__('Cancel')}}</button>
    </div>
</form>
