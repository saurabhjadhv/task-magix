<div class="form-body">
    <div class="row">
        <div class="col-md-6 ">
            <div class="form-group">
                <label><b><?php echo e(__('Zoom Meeting Title')); ?></b></label>
                <p> <?php echo e($meeting->title); ?> </p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label><b><?php echo e(__('Zoom Meeting ID')); ?></b></label>
                <p> <?php echo e($meeting->meeting_id); ?> </p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label><b><?php echo e(__('Project Name')); ?></b></label>
                <p> <?php echo e(!empty($meeting->projectName) ? $meeting->projectName->title : ''); ?></p>

            </div>
        </div>
        <div class="col-md-6 ">
            <div class="form-group">
                <label><b><?php echo e(__('User Name')); ?></b></label>
                <p>
                    <?php $__currentLoopData = $meeting->users($meeting->user_id); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $projectUser): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php echo e($projectUser->name); ?><br>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 ">
            <div class="form-group">
                <label><b><?php echo e(__('Client Name')); ?></b></label>
                <p>
                    <?php if($meeting->client_id != '0'): ?>
                        <?php $__currentLoopData = $meeting->clients($meeting->client_id); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $projectClient): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php echo e($projectClient->name); ?> <br>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </p>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label><b><?php echo e(__('Date')); ?></b></label>
                <p><?php echo e(\Auth::user()->dateFormat($meeting->start_date)); ?></p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label><b><?php echo e(__('Time')); ?></b></label>
                <p><?php echo e(\Auth::user()->timeFormat($meeting->start_date)); ?></p>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label><b><?php echo e(__('Duration')); ?></b></label>
                <p> <?php echo e($meeting->duration); ?> <?php echo e(__('Minutes')); ?></p>
            </div>
        </div>
    </div>
</div>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/zoommeeting/show.blade.php ENDPATH**/ ?>