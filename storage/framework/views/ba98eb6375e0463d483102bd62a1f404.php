<?php $__env->startSection('title'); ?>
    <?php echo e(__('Choose Plan')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <?php echo $__env->make('plans.planlist',['size'=>'4','paymentSetting'=>\App\Models\Utility::getPaymentSetting()], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script>
        $(document).ready(function () {
            var tohref = '';

            <?php if(\Auth::user()->is_register_trial == 1): ?>
            var tohref = $('#trial_<?php echo e(Auth::user()->interested_plan_id); ?>').attr("href");
            <?php elseif(\Auth::user()->interested_plan_id != 0): ?>
            var tohref = $('#interested_plan_<?php echo e(Auth::user()->interested_plan_id); ?>').attr("href");
            <?php endif; ?>

            if (tohref != '') {
                window.location = tohref;
            }
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home3/taskmagix/public_html/in/app/resources/views/plans/subscription.blade.php ENDPATH**/ ?>