<?php echo e(Form::model($invoice, array('route' => array('invoices.payments.store', $invoice->id), 'method' => 'POST'))); ?>

<div class="row">
    <?php if(Utility::plancheck()['enable_chatgpt'] == 'on'): ?>
        <div class="col-12 col-md-12">
            <div class="text-right">
                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2" data-url="<?php echo e(route('generate',['invoices'])); ?>" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate with AI')); ?>">
                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span> <?php echo e(__('Generate with AI')); ?></span>
                </a>
            </div>
        </div>
    <?php endif; ?>

    <div class="col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('amount', __('Amount'),['class'=>'form-control-label'])); ?>

            <?php echo e(Form::number('amount', $invoice->getDue(), array('class' => 'form-control','required'=>'required','min'=>'0',"step"=>"0.01"))); ?>

        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('date', __('Payment Date'),['class'=>'form-control-label'])); ?>

            <?php echo e(Form::date('date', date('Y-m-d'), array('class' => 'form-control','required'=>'required'))); ?>

        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <?php echo e(Form::label('notes', __('Notes'),['class'=>'form-control-label'])); ?>

            <?php echo e(Form::textarea('notes', null, array('class' => 'form-control','rows'=>'3'))); ?>

        </div>
    </div>
    <div class="col-md-12 text-right">
        <?php echo e(Form::submit(__('Create'),array('class'=>'btn btn-sm btn-primary rounded-pill'))); ?>

        <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
    </div>
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/invoices/payment.blade.php ENDPATH**/ ?>