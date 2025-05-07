<?php echo e(Form::open(array('route' => array('invoice.custom.mail',$invoice)))); ?>

<div class="row">
    <div class="form-group col-md-12">
        <?php echo e(Form::label('email', __('Email'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::text('email', '', array('class' => 'form-control','required'=>'required'))); ?>

    </div>
</div>
<div class="modal-footer">
    <?php echo e(Form::submit(__('Send'),array('class'=>'btn btn-primary btn-sm rounded-pill'))); ?>

    <button type="button" class="btn btn-secondary btn-sm rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/invoices/invoice_send.blade.php ENDPATH**/ ?>