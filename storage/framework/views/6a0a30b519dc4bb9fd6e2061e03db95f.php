<?php echo e(Form::model($coupon, array('route' => array('coupons.update', $coupon->id), 'method' => 'PUT'))); ?>

<div class="row">
        <div class="col-12 col-md-12">
            
            <div class="text-right">
                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2" data-url="<?php echo e(route('generate',['coupon'])); ?>" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate with AI')); ?>">
                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span> <?php echo e(__('Generate with AI')); ?></span>
                </a>
            </div>
        </div>
    <div class="form-group col-md-12">
        <?php echo e(Form::label('name',__('Name'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::text('name',null,array('class'=>'form-control font-style','required'=>'required'))); ?>

    </div>
    <div class="form-group col-md-6">
        <?php echo e(Form::label('discount',__('Discount (%)'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::number('discount',null,array('class'=>'form-control','required'=>'required','min'=>'1','max'=>'100','step'=>'0.01'))); ?>

        <span class="small"><?php echo e(__('Note: Discount in Percentage')); ?></span>
    </div>
    <div class="form-group col-md-6">
        <?php echo e(Form::label('limit',__('Limit'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::number('limit',null,array('class'=>'form-control','min'=>'1','required'=>'required'))); ?>

    </div>
    <div class="form-group col-md-12">
        <?php echo e(Form::label('code',__('Code'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::text('code',null,array('class'=>'form-control','required'=>'required'))); ?>

    </div>
    <div class="form-group col-md-12 text-right">
        <?php echo e(Form::submit(__('Update'),array('class'=>'btn btn-sm btn-primary rounded-pill'))); ?>

    </div>
</div>
<?php echo e(Form::close()); ?>


<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/coupon/edit.blade.php ENDPATH**/ ?>