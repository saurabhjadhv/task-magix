
<?php
$logo_path = \App\Models\Utility::get_file('/');
?>

<ul class="nav nav-tabs nav-overflow" role="tablist">
    <li class="nav-item">
        <a href="#role_users" id="user-tab" class="user_role nav-link active" data-val="user" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">
            <?php echo e(__('Users')); ?>

        </a>
    </li>
    <li class="nav-item">
        <a href="#role_clients" id="client-tab" class="user_role nav-link" data-val="client" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">
            <?php echo e(__('Clients')); ?>

        </a>
    </li>
</ul>
<div class="row">
    <div class="col-md-12 col-12 pt-3">
        <div class="alert alert-warning invite-warning" style="display: none;"></div>
    </div>
    <div class="col-md-12 col-12 invite_user_div d-none">
        <div class="form-group">
            <?php echo e(Form::label('username', __('Name'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::text('username', null, ['class' => 'form-control', 'placeholder' => __('Please enter name')])); ?>

        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <?php echo e(Form::hidden('project_id', $project_id)); ?>

            <?php echo e(Form::label('invite_email', __('Email Address'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::email('invite_email', null, ['class' => 'form-control', 'placeholder' => __('Enter email address')])); ?>

            <input type="hidden" id="usr_role" name="usr_role" value="user"/>
        </div>
    </div>
    <div class="col-md-12 col-12 invite_user_div d-none">
        <div class="form-group">
            <?php echo e(Form::label('userpassword', __('Password'),['class' => 'form-control-label'])); ?>

            <div class="input-group">
                <?php echo e(Form::password('userpassword', ['class' => 'form-control','id'=> 'userpassword', 'placeholder' => __('Please enter password')])); ?>

                <div class="input-group-append">
                    <span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility('userpassword', 'password-icon')">
                        <i id="password-icon" class="fas fa-eye-slash"></i>
                    </span>
                </div>
            </div>
            
        </div>
    </div>
</div>
<div class="text-right">
    <?php echo e(Form::button(__('Invite'), ['type' => 'button','class' => 'btn btn-sm btn-primary rounded-pill check-invite-members'])); ?>

</div>

<div class="tab-content">
    <div class="tab-pane fade show active" id="role_users" role="tabpanel" aria-labelledby="user-tab">
        <?php if(count($users) > 0): ?>
            <div class="invite_usr">
                <hr class="mb-2">
                <div class="row pb-1">
                    <div class="col-12 text-center">
                        <label class="form-control-label"><?php echo e(__('Invite User From Your Contact')); ?></label>
                    </div>
                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $usr): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="col-6 col-md-3">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar-parent-child">
                                        <a href="#" class="avatar avatar-lg rounded-circle">
                                        
                                            <?php if($usr->avatar): ?>
                                                <img  src="<?php echo e($logo_path.$usr->avatar); ?>"  title="<?php echo e($usr->name); ?>"  >
                                          
                                              <?php else: ?>
                                               <img <?php echo e($usr->img_avatar); ?>  title="<?php echo e($usr->name); ?>" >
                                              <?php endif; ?> 

                                        </a>
                                    </div>
                                    <h6 class="text-sm my-3"><?php echo e($usr->name); ?></h6>
                                    <button type="button" class="btn btn-xs btn-secondary invite-btn" data-id="<?php echo e($usr->id); ?>"><?php echo e(__('Invite')); ?></button>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endif; ?>
    </div>
    <div class="tab-pane fade show" id="role_clients" role="tabpanel" aria-labelledby="client-tab">
        <?php if(count($clients) > 0): ?>
            <div class="invite_usr">
                <hr class="mb-2">
                <div class="row pb-1">
                    <div class="col-12 text-center">
                        <label class="form-control-label"><?php echo e(__('Invite Client From Your Contact')); ?></label>
                    </div>
                    <?php $__currentLoopData = $clients; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $client): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="col-6 col-md-3">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="avatar-parent-child">
                                        <a href="#" class="avatar avatar-lg rounded-circle">
                                            <?php if($client->avatar): ?>
                                                <img  src="<?php echo e($logo_path.$client->avatar); ?>"  title="<?php echo e($client->name); ?>"  >
                                          
                                              <?php else: ?>
                                               <img <?php echo e($client->img_avatar); ?>  title="<?php echo e($client->name); ?>" >
                                              <?php endif; ?>
                                        </a>
                                    </div>
                                    <h6 class="text-sm my-3"><?php echo e($client->name); ?></h6>
                                    <button type="button" class="btn btn-xs btn-secondary invite-btn" data-id="<?php echo e($client->id); ?>"><?php echo e(__('Invite')); ?></button>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endif; ?>
    </div>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<?php /**PATH /home3/taskmagix/public_html/in/app/resources/views/projects/invite.blade.php ENDPATH**/ ?>