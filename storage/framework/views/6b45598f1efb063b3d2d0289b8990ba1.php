<?php $__env->startComponent('mail::message'); ?>
<p><?php echo e(__('Hello, '. $invoice->name)); ?></p>
<br>
<span><?php echo e(__('It remind to you, amount ')); ?> <b><?php echo e($invoice->getDue); ?></b> <?php echo e(__('is pending for invoice ')); ?> <b><?php echo e($invoice->invoice); ?></b></span>
<br>

<?php $__env->startComponent('mail::button', ['url' => route('get.invoice', ['id' => \Illuminate\Support\Facades\Crypt::encrypt($invoice->id)])]); ?>
    <?php echo e(__('Click to Download Invoice')); ?>

<?php echo $__env->renderComponent(); ?>

<?php echo e(__('Thanks,')); ?><br>
<?php echo e(config('app.name')); ?>

<?php echo $__env->renderComponent(); ?>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/email/payment_reminder.blade.php ENDPATH**/ ?>