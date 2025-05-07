<?php echo e(Form::open(array('url' => 'invoices'))); ?>

<div class="row">
    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('project_id', __('Project'),['class' => 'form-control-label'])); ?>

            <select class="form-control" name="project_id" id="project_id" required>
                <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($project->id); ?>"><?php echo e($project->title); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            
            <p style="font-size: 14px; line-height: 21px;">You can make invoice on your own project.</p>
        </div>
    </div>
    <?php if(Auth::user()->type != 'client'): ?>
        <div class="col-12 col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('client_id', __('Client'),['class' => 'form-control-label'])); ?>

                <select class="form-control" name="client_id" id="client_id" required>
                </select>
            </div>
        </div>
    <?php else: ?>
        <input type="hidden" name="client_id" value="<?php echo e(\Auth::user()->id); ?>">
    <?php endif; ?>
    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('due_date', __('Due Date'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::date('due_date', date('Y-m-d'), ['class' => 'form-control','required'=>'required'])); ?>

        </div>
    </div>
    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('tax_id', __('Tax %'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::select('tax_id',$taxes, null, ['class' => 'form-control','required'=>'required'])); ?>

            <?php if($taxes->count() == 0): ?>
                <a href="<?php echo e(route('settings')); ?>" id="no_tax"><small><?php echo e(__('Click here to create Tax.')); ?></small></a>
            <?php endif; ?>
        </div>
    </div>
</div>

<div class="text-right">
    <?php echo e(Form::button(__('Create'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

    <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
</div>
<?php echo e(Form::close()); ?>


<script>
    $(document).ready(function () {
        $("select[name=project_id]").trigger('change');
    });
    $(document).on("change", "select[name=project_id]", function () {
        fillClient($(this).val());
    });
</script>
<?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/invoices/create.blade.php ENDPATH**/ ?>