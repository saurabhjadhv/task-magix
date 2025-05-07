<?php $__env->startComponent('mail::message'); ?>
<p><?php echo e(__('Hello, '. $invoice->name)); ?></p>
<br>
<?php $__env->startComponent('mail::button', ['url' => $invoice->url]); ?>
<?php echo e(__('Click to Download Invoice')); ?>

<?php echo $__env->renderComponent(); ?>

<?php echo e(__('Thanks,')); ?><br>
<?php echo e(config('app.name')); ?>

<?php echo $__env->renderComponent(); ?>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/email/invoice_send.blade.php ENDPATH**/ ?>