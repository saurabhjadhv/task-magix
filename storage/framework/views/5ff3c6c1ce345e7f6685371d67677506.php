<?php echo e(Form::open(array('url' => 'webhook','enctype' => 'multipart/form-data'))); ?>

<div class="row">
    <div class="col-12 col-md-12">
        <div class="form-group">
            <?php echo e(Form::label('module', __('Module'),['class' => 'form-control-label'])); ?>

            <select name="module" id="module" class="form-control">
                <?php $__currentLoopData = $module; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($key); ?>" ><?php echo e($value); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>
    </div>
    <div class="col-12 col-md-12">
        <div class="form-group">
            <?php echo e(Form::label('url', __('URL'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::text('url', null, ['class' => 'form-control','required'=>'required', 'placeholder' => __('Enter Webhook URL'),])); ?>

        </div>
    </div>
    <div class="col-12 col-md-12">
        <div class="form-group">

            <?php echo e(Form::label('method',__('Method'),['class'=>'form-control-label'])); ?>

                <select name="method" id="method" class="form-control">
                   <?php $__currentLoopData = $method; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                   <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
        </div>
    </div>
</div>

<div class="text-right pt-3">
    <?php echo e(Form::button(__('Create'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

    <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/webhook/create.blade.php ENDPATH**/ ?>