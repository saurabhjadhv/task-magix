<div class="row">
    <div class="col-md-12 col-12">
        <div class="alert alert-warning invite-warning" style="display: none;"></div>
    </div>
    <div class="col-md-12 col-12 add_user_div d-none">
        <div class="form-group">
            <?php echo e(Form::label('username', __('Name'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::text('username', null, ['class' => 'form-control', 'placeholder' => __('Please Enter Name'),
            'pattern' => '[A-Za-z\s]+',
            'title' => 'Only alphabetic characters are allowed'])); ?>

        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <?php echo e(Form::label('add_email', __('Email Address'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::email('add_email', null, ['class' => 'form-control', 'placeholder' => __('Enter Email Address')])); ?>

        </div>
    </div>
    <div class="col-md-12 col-12 add_user_div d-none">
        <div class="form-group">
            <?php echo e(Form::label('userpassword', __('Password'), ['class' => 'form-control-label'])); ?>

            <div class="input-group">
                <?php echo e(Form::password('userpassword', ['class' => 'form-control', 'id'=> 'userpassword', 'placeholder' => __('Please Enter Password')])); ?>

                <div class="input-group-append">
                    <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('userpassword', 'password-icon')">
                        <i id="password-icon" class="fas fa-eye-slash"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-12 col-12">
        <label class="form-control-label"><?php echo e(__('Role')); ?></label> <br>
        <div class="btn-group btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-primary btn-sm active">
                <input type="radio" name="user_type" id="radio_user" autocomplete="off" value="user" checked><?php echo e(__('User')); ?>

            </label>
            <label class="btn btn-primary btn-sm">
                <input type="radio" name="user_type" id="radio_client" autocomplete="off" value="client"><?php echo e(__('Client')); ?>

            </label>
        </div>
    </div>
</div>

<div class="text-right">
    <?php echo e(Form::button(__('Add'), ['type' => 'button','class' => 'btn btn-sm btn-primary rounded-pill check-add-user'])); ?>

</div>

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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /><?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/users/invite.blade.php ENDPATH**/ ?>