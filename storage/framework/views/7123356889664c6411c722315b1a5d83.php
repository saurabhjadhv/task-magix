<?php
$logo = \App\Models\Utility::get_file('uploads/sample/');
?>

<div class="card bg-none card-box">
    <?php echo e(Form::open(array('route' => array('invoice.import'),'method'=>'post', 'enctype' => "multipart/form-data"))); ?>

    <div class="row"  style="padding: 15px 15px;">
        <div class="col-md-12 mb-2">
        <div class="d-flex align-items-center justify-content-between">
            <?php echo e(Form::label('file',__('Download sample customer CSV file'),['class'=>'form-control-label w-auto m-0'])); ?>

            <div>
                <a href="<?php echo e($logo.'sample-invoice.csv'); ?>" class="btn btn-sm btn-primary">
                    <i class="fa fa-download"></i> <?php echo e(__('Download')); ?>

                </a>
            </div> 
        </div>
        </div>
        <div class="col-md-12">
            <?php echo e(Form::label('file',__('Select CSV File'),['class'=>'form-control-label'])); ?>

            <div class="choose-file form-group">
                <label for="file" class="form-control-label">
                    <div><?php echo e(__('Choose file here')); ?></div>
                    <input type="file" class="form-control" name="file" id="file" data-filename="upload_file" required>
                </label>
                <p class="upload_file"></p>
            </div>
        </div>
        <div class="col-md-12 mt-6 text-right">
            <input type="submit" value="<?php echo e(__('Upload')); ?>" class="btn btn-sm btn-primary rounded-pill">
            <input type="button" value="<?php echo e(__('Cancel')); ?>" class="btn btn-sm btn-primary rounded-pill" data-dismiss="modal">
        </div>
    </div>
    <?php echo e(Form::close()); ?>

</div><?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/invoices/import.blade.php ENDPATH**/ ?>