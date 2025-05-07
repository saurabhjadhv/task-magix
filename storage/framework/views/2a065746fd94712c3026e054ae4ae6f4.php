<?php $__env->startSection('title'); ?>
    <?php echo e(__('Manually Plan Request')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table" width="100%">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('Name')); ?> </th>
                                    <th><?php echo e(__('Plan Name')); ?> </th>
                                    <th><?php echo e(__('Users')); ?> </th>
                                    <th><?php echo e(__('Projects')); ?> </th>
                                    <th><?php echo e(__('Duration')); ?> </th>
                                    <th><?php echo e(__('Date and Time')); ?> </th>
                                    <th><?php echo e(__('Action')); ?> </th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php if($plan_requests->count() > 0): ?>
                                    <?php $__currentLoopData = $plan_requests; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prequest): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td>
                                                <div class="font-style font-weight-bold">
                                                    <?php echo e($prequest->user?->name ?? __('No User')); ?>

                                                </div>
                                            </td>
                                            <td>
                                                <div class="font-style font-weight-bold">
                                                    <?php echo e($prequest->plan?->name ?? __('No Plan')); ?>

                                                </div>
                                            </td>
                                            <td>
                                                <div class="font-weight-bold">
                                                    <?php echo e($prequest->plan?->max_users <= 0 ? 'Unlimited' : $prequest->plan?->max_users ?? __('N/A')); ?>

                                                </div>
                                                <div><?php echo e(__('Users')); ?></div>
                                            </td>
                                            <td>
                                                <div class="font-weight-bold">
                                                    <?php echo e($prequest->plan?->max_projects <= 0 ? 'Unlimited' : $prequest->plan?->max_projects ?? __('N/A')); ?>

                                                </div>
                                                <div><?php echo e(__('Projects')); ?></div>
                                            </td>
                                            <td>
                                                <div class="font-style font-weight-bold">
                                                    <?php echo e(($prequest->duration == 'monthly') ? __('One Month') : __('One Year')); ?>

                                                </div>
                                            </td>
                                            <td><?php echo e(\App\Models\Utility::getDateFormated($prequest->created_at,true)); ?></td>
                                            <td>
                                                <div>
                                                    <a href="<?php echo e(route('response.request',[$prequest->id,1])); ?>" class="btn btn-success btn-xs">
                                                        <i class="fas fa-check"></i>
                                                    </a>
                                                    <a href="<?php echo e(route('response.request',[$prequest->id,0])); ?>" class="btn btn-danger btn-xs">
                                                        <i class="fas fa-times"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php else: ?>
                                    <tr>
                                        <th scope="col" colspan="7">
                                            <h6 class="text-center"><?php echo e(__('No Manually Plan Request Found.')); ?></h6>
                                        </th>
                                    </tr>
                                <?php endif; ?>
                                </tbody>
                                
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/plan_request/index.blade.php ENDPATH**/ ?>