<?php $__env->startSection('title'); ?>
    <?php echo e(__('Invoice Print Setting')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="<?php echo e(route('settings')); ?>" class="btn btn-sm btn-white rounded-circle btn-icon-only ml-0">
        <span class="btn-inner--icon"><i class="fas fa-arrow-left"></i></span>
    </a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="card card-body p-md-5">
        <div class="row">
            <div class="col-md-12 pb-5">
                <form id="setting-form" method="post" action="<?php echo e(route('invoice.template.store')); ?>" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <div class="row">
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <label for="address" class="form-control-label"><?php echo e(__('Invoice Template')); ?></label>
                                <select class="form-control" name="invoice_template">
                                    <?php $__currentLoopData = Utility::templateData()['templates']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $template): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php echo e((isset($decoded['invoice_template']) && $decoded['invoice_template'] == $key) ? 'selected' : ''); ?>><?php echo e($template); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="invoice_logo" class="form-control-label"><?php echo e(__('Invoice Logo')); ?></label>
                                <input type="file" name="invoice_logo" id="invoice_logo" class="custom-input-file" accept="image/*">
                                <label for="invoice_logo">
                                    <i class="fa fa-upload"></i>
                                    <span><?php echo e(__('Choose a file…')); ?></span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <label class="form-control-label"><?php echo e(__('Color Input')); ?></label>
                                <div class="row gutters-xs">
                                    <?php $__currentLoopData = Utility::templateData()['colors']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $color): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="col-auto">
                                            <label class="colorinput">
                                                <input name="invoice_color" type="radio" value="<?php echo e($color); ?>" class="colorinput-input" <?php echo e((isset($decoded['invoice_color']) && $decoded['invoice_color'] == $color) ? 'checked' : ''); ?>>
                                                <span class="colorinput-color" style="background: #<?php echo e($color); ?>"></span>
                                            </label>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-right">
                            <button class="btn btn-sm btn-primary rounded-pill">
                                <?php echo e(__('Save')); ?>

                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-12">
                <?php if(isset($decoded['invoice_template']) && isset($decoded['invoice_color'])): ?>
                    <iframe id="invoice_frame" class="w-100 h-1050" frameborder="0" src="<?php echo e(route('invoice.preview',[$decoded['invoice_template'],$decoded['invoice_color']])); ?>"></iframe>
                <?php else: ?>
                    <iframe id="invoice_frame" class="w-100 h-1050" frameborder="0" src="<?php echo e(route('invoice.preview',['template1','ffffff'])); ?>"></iframe>
                <?php endif; ?>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>


<?php $__env->startPush('script'); ?>
    <script>
        $(document).on("change", "select[name='invoice_template'], input[name='invoice_color']", function () {
            var template = $("select[name='invoice_template']").val();
            var color = $("input[name='invoice_color']:checked").val();
            $('#invoice_frame').attr('src', '<?php echo e(url('/invoices/preview')); ?>/' + template + '/' + color);
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/invoices/template_setting.blade.php ENDPATH**/ ?>