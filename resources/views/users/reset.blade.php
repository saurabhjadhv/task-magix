{{ Form::model($user, array('route' => array('user.password.update', $user->id), 'method' => 'post')) }}
<div class="row">
    <div class="form-group col-md-6">
        {{ Form::label('password', __('Password')) }}
        <div class="input-group">
            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Enter Password">
            <div class="input-group-append">
                <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('password', 'password-icon')">
                    <i id="password-icon" class="fas fa-eye-slash"></i>
                </span>
            </div>
        </div>
        @error('password')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('password_confirmation', __('Confirm Password')) }}
        <div class="input-group">
            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Enter Confirm Password">
            <div class="input-group-append">
                <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('password-confirm', 'password-confirm-icon')">
                    <i id="password-confirm-icon" class="fas fa-eye-slash"></i>
                </span>
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    {{ Form::submit(__('Update'), array('class' => 'btn btn-sm btn-primary rounded-pill')) }}
</div>
{{ Form::close() }}

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
