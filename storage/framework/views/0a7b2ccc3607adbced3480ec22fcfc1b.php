<?php echo e(Form::model($timesheet, ['route' => ['timesheet.update',$timesheet->id], 'method' => 'POST'])); ?>


<input type="hidden" name="project_id" value="<?php echo e($parseArray['project_id']); ?>">
<input type="hidden" name="task_id" value="<?php echo e($parseArray['task_id']); ?>">
<input type="hidden" name="date" value="<?php echo e($timesheet->date); ?>">
<input type="hidden" id="totaltasktime" value="<?php echo e($parseArray['totaltaskhour'] . ':' . $parseArray['totaltaskminute']); ?>">

<div class="details mb-2">
    <div class="form-group text-center">
        <label for="descriptions" class="form-control-label"><?php echo e($parseArray['project_name'] . ' : ' . $parseArray['task_name']); ?></label>
        <small class="form-text text-muted mb-2 mt-0"><?php echo e(__('Total Time worked on this task')); ?> : <?php echo e($parseArray['totaltaskhour'] . ' ' . __('Hours') . ' ' . $parseArray['totaltaskminute'] . ' ' . __('Minutes')); ?></small>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="form-group mb-0">
            <label for="time"><?php echo e(__('Time')); ?></label>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <select class="form-control form-control-light" name="time_hour" id="time_hour" required="">
                <option value=""><?php echo e(__('Hours')); ?></option>

                <?php for ($i = 0; $i < 23; $i++) { $i = $i < 10 ? '0' . $i : $i; ?>

                <option value="<?php echo e($i); ?>" <?php echo e($parseArray['time_hour'] == $i ? 'selected="selected"' : ''); ?>><?php echo e($i); ?></option>

                <?php } ?>

            </select>
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <select class="form-control form-control-light" name="time_minute" id="time_minute" required>
                <option value=""><?php echo e(__('Minutes')); ?></option>

                <?php for ($i = 0; $i < 61; $i += 10) { $i = $i < 10 ? '0' . $i : $i; ?>

                <option value="<?php echo e($i); ?>" <?php echo e($parseArray['time_minute'] == $i ? 'selected="selected"' : ''); ?>><?php echo e($i); ?></option>

                <?php } ?>

            </select>
        </div>
    </div>
</div>

<div class="form-group">
    <label for="description"><?php echo e(__('Description')); ?></label>
    <textarea class="form-control form-control-light" id="description" rows="3" name="description"><?php echo e($timesheet->description); ?></textarea>
</div>

<div class="text-right">
    <button type="submit" class="btn btn-sm btn-primary rounded-pill"><?php echo e(__('Save')); ?></button>
    <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal">Cancel</button>
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/projects/timesheets/edit.blade.php ENDPATH**/ ?>