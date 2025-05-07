<?php echo e(Form::open(array('url' => 'coupons','method' =>'post'))); ?>

<div class="row">
        <div class="col-12 col-md-12">

            <div class="text-right">
                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2" data-size="lg" data-url="<?php echo e(route('generate',['coupon'])); ?>" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate with AI')); ?>">
                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span> <?php echo e(__('Generate with AI')); ?></span>
                </a>
            </div>
        </div>
    <div class="form-group col-md-12">
        <?php echo e(Form::label('name',__('Coupon Name'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::text('name',null,array('class'=>'form-control font-style','required'=>'required','placeholder'=>__('Enter coupon name')))); ?>

    </div>

    <div class="form-group col-md-6">
        <?php echo e(Form::label('discount',__('Discount (%)'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::number('discount',null,array('class'=>'form-control','required'=>'required','min'=>'1','max'=>'100','step'=>'0.01','placeholder'=>__('Enter discount(%)')))); ?>

        <span class="small"><?php echo e(__('Note: Discount in Percentage.')); ?></span>
    </div>
    <div class="form-group col-md-6">
        <?php echo e(Form::label('limit',__('Limit'),['class'=>'form-control-label'])); ?>

        <?php echo e(Form::number('limit',null,array('class'=>'form-control','min'=>'1','required'=>'required','placeholder'=>__('Enter usage limit')))); ?>

    </div>

    <div class="form-group col-md-12">
        <?php echo e(Form::label('code',__('Coupon Code'),['class'=>'form-control-label'])); ?>

        <div class="selectgroup selectgroup-pills">
            <label class="selectgroup-item form-control-label">
                <input type="radio" name="icon-input" id="manual_code" value="manual" class="selectgroup-input code" checked="checked">
                <span class="selectgroup-button selectgroup-button-icon" for="manual_code"><?php echo e(__('Manual')); ?></span>
            </label>
            <label class="selectgroup-item form-control-label">
                <input type="radio" name="icon-input" value="auto" class="selectgroup-input code" id="auto_code">
                <span class="selectgroup-button selectgroup-button-icon" for="auto_code"><?php echo e(__('Auto Generate')); ?></span>
            </label>
        </div>
    </div>
    <div class="form-group col-md-12 d-block" id="manual">
        <input class="form-control font-uppercase" name="manualCode" type="text" id="manual-code" placeholder="<?php echo e(__('Enter coupon code manually')); ?>">
    </div>
    <div class="form-group col-md-12 d-none" id="auto">
        <div class="row">
            <div class="col-md-10">
                <input class="form-control" name="autoCode" type="text" id="auto-code" placeholder="<?php echo e(__('Auto generated code will appear here')); ?>">
            </div>
            <div class="col-md-2">
                <a href="#" class="btn btn-primary" id="code-generate"><i class="fas fa-history"></i></a>
            </div>
        </div>
    </div>

    <div class="form-group col-md-12 text-right">
        <?php echo e(Form::submit(__('Create'),array('class'=>'btn btn-sm btn-primary rounded-pill'))); ?>

    </div>
</div>
<?php echo e(Form::close()); ?>


<?php /**PATH /home3/taskmagix/public_html/in/app/resources/views/coupon/create.blade.php ENDPATH**/ ?>