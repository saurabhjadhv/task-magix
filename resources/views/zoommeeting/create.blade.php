@php
    $setting = \App\Models\Utility::settings();
@endphp

{{ Form::open(['route' => 'zoommeeting.store', 'id' => 'store-user', 'method' => 'post']) }}
<div class="row">
    @if (Utility::plancheck()['enable_chatgpt'] == 'on')
        <div class="col-12 col-md-12">
            <div class="text-right">
                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2"
                    data-url="{{ route('generate', ['zoom_meeting']) }}" data-ajax-popup-over="true" data-bs-placement="top"
                    data-size="md" title="{{ __('Generate') }}" data-title="{{ __('Generate with AI') }}">
                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span>
                        {{ __('Generate with AI') }}</span>
                </a>
            </div>
        </div>
    @endif
    <div class="form-group col-md-12">
        {{ Form::label('title', __('Topic')) }}
        {{ Form::text('title', null, ['class' => 'form-control', 'placeholder' => __('Enter Meeting Title'), 'required' => 'required']) }}
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('projects', __('Projects')) }}
        {{ Form::select('project_id', $project, null, ['class' => 'form-control project_select project_id', 'placeholder' => __('Select Project')]) }}
    </div>

    <div class="form-group col-md-6">
        {{ Form::label('employee', __('Employee')) }}
        {{ Form::select('employee[]', [], false, ['class' => 'form-control employee_select', 'data-toggle' => 'select2', 'multiple' => '', 'required' => 'required']) }}
    </div>

    <div class="form-group col-md-6">
        {{ Form::label('datetime', __('Start Date / Time')) }}
        {{ Form::text('start_date', null, ['class' => 'form-control datepicker datetime_class_start_date', 'placeholder' => __('Select Date/Time'), 'required' => 'required']) }}
    </div>

    <div class="form-group col-md-6">
        {{ Form::label('duration', __('Duration')) }}
        {{ Form::number('duration', null, ['class' => 'form-control', 'placeholder' => __('Enter Duration In Minutes'), 'required' => 'required','min'=>'0']) }}
    </div>

    <div class="form-group col-md-6">
        {{ Form::label('password', __('Password (Optional)')) }}
        <div class="input-group">
            {{ Form::password('password', ['class' => 'form-control','id'=> 'userpassword', 'placeholder' => __('Enter Password')]) }}
            <div class="input-group-append">
                <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('userpassword', 'password-icon')">
                    <i id="password-icon" class="fas fa-eye-slash"></i>
                </span>
            </div>
        </div>
    </div>
    
    <div class="form-group col-md-6">
        <div class="custom-control custom-checkbox pl-0">
            <input type="checkbox" name="client_id" id="client_id" class="client_view check_client">
            <label for="display">{{ __('Invite Client For Zoom Meeting') }}</label>
        </div>
        <div class="row">
            <div class="form-group col-md-12 client" style="display: none">
                {{ Form::label('client_id', __('Client')) }}
                {{ Form::select('client_id[]', [], false, ['class' => 'form-control client_select', 'data-toggle' => 'select2', 'multiple' => '']) }}
            </div>
        </div>
    </div>
    @if (isset($settings['is_enabled']) && $settings['is_enabled'] == 'on')
        <div class="form-group col-md-6">
            <label>{{ __('Synchroniz in Google Calendar ?') }}</label>
            <div class="form-group">
                <div class="switch__container custom-control custom-switch float-left">
                    <input id="is_enabled" class=" custom-control-input" value="google_calender" name="synchronize_type"
                        type="checkbox">
                    <label for="is_enabled" class="custom-control-label"></label>
                </div>
            </div>
        </div>
    @endif
</div>

<div class="modal-footer">
    <button class="btn btn-sm btn-primary rounded-pill" type="submit" style="margin-bottom: 10px;"
        id="create-client">{{ __('Create') }}<span class="spinner" style="display: none;"><i
                class="fa fa-spinner fa-spin"></i></span>
    </button>
</div>
{{ Form::close() }}

<script type="text/javascript">
    function ddatetime_range() {
        $('.datetime_class_start_date').daterangepicker({
            "singleDatePicker": true,
            "timePicker": true,
            "autoApply": false,
            "locale": {
                "format": 'YYYY-MM-DD H:mm'
            },
            "timePicker24Hour": true,
        }, function(start, end, label) {
            $('.start_date').val(start.format('YYYY-MM-DD H:mm'));
        });
    }
    $(document).on('change', '.project_select', function() {
        var project_id = $(this).val();
        getparent(project_id);
    });

    function getparent(bid) {

        $("#members-div").html('');
        $('#members-div').append('<select class="form-control" id="members" name="employee[]" multiple></select>');

        $.ajax({
            url: `{{ url('zoom/projects/select') }}/${bid}`,
            type: 'GET',
            success: function(data) {

                $('.employee_select').empty();
                $('.client_select').empty();
                $.each(data.users, function(i, item) {
                    $('.employee_select').append('<option value="' + item.id + '">' + item.name +
                        '</option>');
                });

                $.each(data.clients, function(i, item) {
                    $('.client_select').append('<option value="' + item.id + '">' + item.name +
                        '</option>');
                });
                if (data == '') {
                    $('.employee_select').empty();
                    $('.client_select').empty();
                }
            }
        });
    }
</script>

<script>
    $(document).on('change', '.check_client', function() {
        if ($('.client_view.check_client').is(':checked')) {
            $('.client').show();
        } else {
            $('.client').hide();
        }
    });
</script>

<script>
    function togglePasswordVisibility(passwordId, iconId) {
        var passwordInput = document.getElementById(passwordId);
        var icon = document.getElementById(iconId);

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        } else {
            passwordInput.type = "password";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        }
    }
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
