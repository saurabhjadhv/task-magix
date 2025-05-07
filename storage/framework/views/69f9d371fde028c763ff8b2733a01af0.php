<form class="pl-3 pr-3" method="POST" action="<?php echo e(route('lang.store')); ?>">
    <?php echo csrf_field(); ?>
    <div class="form-group">
        <label for="code"><?php echo e(__('Language Code')); ?></label>
        <input class="form-control" type="text" id="code" name="code" required="" placeholder="<?php echo e(__('Language Code')); ?>">
    </div>
    <div class="form-group">
        <label for="fullname"><?php echo e(__('Language Name')); ?></label>
        <input class="form-control" type="text" id="fullname" name="fullname" required="" placeholder="<?php echo e(__('Language Name')); ?>">
    </div>
    <div class="form-group">
        <button class="btn btn-sm btn-primary rounded-pill" type="submit"><?php echo e(__('Create')); ?></button>
    </div>
</form>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/lang/create.blade.php ENDPATH**/ ?>