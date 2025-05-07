<?php echo e(Form::model($tax, array('route' => array('taxes.update', $tax->id), 'method' => 'PUT'))); ?>

<div class="row">
    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('name', __('Name'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::text('name', null, ['class' => 'form-control','required'=>'required'])); ?>

        </div>
    </div>
    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('rate', __('Rate %'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::number('rate', null, ['class' => 'form-control','required'=>'required','min'=>'0','max'=>'100','step'=>'0.01'])); ?>

        </div>
    </div>
</div>

<div class="text-right pt-3">
    <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

    <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/taxes/edit.blade.php ENDPATH**/ ?>