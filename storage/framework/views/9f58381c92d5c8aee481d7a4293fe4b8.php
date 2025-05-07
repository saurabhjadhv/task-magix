<form class="pl-3 pr-3" method="post" action="<?php echo e(route('users.update',$user->id)); ?>">
    <?php echo csrf_field(); ?>
    <?php echo method_field('put'); ?>
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="form-control-label" for="name"><?php echo e(__('Name')); ?></label>
                    <input type="text" class="form-control" id="name" name="name" value="<?php echo e($user->name); ?>" required/>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="form-control-label" for="email"><?php echo e(__('Email')); ?></label>
                    <input type="text" class="form-control" id="email" name="email" value="<?php echo e($user->email); ?>" required/>
                </div>
            </div>
        </div>

    <div class="text-right">
        <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

        <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
    </div>
</form>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/users/edit.blade.php ENDPATH**/ ?>