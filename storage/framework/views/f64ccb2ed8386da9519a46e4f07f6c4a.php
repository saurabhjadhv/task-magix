<?php $__env->startSection('title'); ?>
    <?php echo e(__('Orders')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th><?php echo e(__('Order Id')); ?></th>
                                <th><?php echo e(__('Name')); ?></th>
                                <th><?php echo e(__('Plan Name')); ?></th>
                                <th><?php echo e(__('Price')); ?></th>
                                <th><?php echo e(__('Status')); ?></th>
                                <th><?php echo e(__('Type')); ?></th>
                                <th><?php echo e(__('Date')); ?></th>
                                <th><?php echo e(__('Coupon')); ?></th>
                                <th class="text-right"><?php echo e(__('Invoice')); ?></th>
                                <th><?php echo e(__('Action')); ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <?php if($orders->count() > 0): ?>
                                <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>

                                        <td><?php echo e($order->order_id); ?></td>
                                        <td><?php echo e($order->user_name); ?></td>
                                        <td><?php echo e($order->plan_name); ?></td>
                                        <td><?php echo e((isset($payment_setting['currency']) ? $payment_setting['currency'] : '$')); ?> <?php echo e(number_format($order->price)); ?></td>
                                        <td>
                                            <?php if($order->payment_status == 'succeeded' || $order->payment_status == 'Approved' || $order->payment_status == 'success'): ?>
                                                <span class="badge badge-success"><?php echo e(ucfirst($order->payment_status)); ?></span>
                                            <?php else: ?>
                                                <span class="badge badge-danger"><?php echo e(ucfirst($order->payment_status)); ?></span>
                                            <?php endif; ?>
                                        </td>

                                        <td><?php echo e($order->payment_type); ?></td>
                                        <td><?php echo e($order->created_at->format('d M Y')); ?></td>
                                        <td><?php echo e(!empty($order->use_coupon)?$order->use_coupon->coupon_detail->code:'-'); ?></td>
                                        <td class="text-right">
                                            <?php if($order->receipt =='free coupon'): ?>
                                                <p><?php echo e(__('Used 100 % discount coupon code.')); ?></p>
                                            <?php elseif($order->payment_type == 'Bank Transfer'): ?>
                                            <a href="<?php echo e(\App\Models\Utility::get_file($order->receipt)); ?>"  title="Invoice" target="_blank"
                                                class="text-center">
                                                <i class="fas fa-file-invoice"></i>
                                            </a>
                                            <?php else: ?>
                                                <?php echo e('-'); ?>

                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <div class="actions">
                                                <?php if(($order->payment_type == 'Bank Transfer' && $order->payment_status == 'pending')): ?>
                                                    <a href="#" class="action-item px-2"
                                                        data-url="<?php echo e(route('bank_transfer.show', $order->id)); ?>"
                                                        data-ajax-popup="true" data-size="lg"
                                                        data-title="<?php echo e(__('Payment Status')); ?>" data-toggle="tooltip"
                                                        data-original-title="<?php echo e(__('Payment Status')); ?>">
                                                        <i class="fas fa-caret-square-right"></i>
                                                    </a>
                                                <?php endif; ?>
                                                    <a href="#" class="action-item text-danger px-2"
                                                        data-toggle="tooltip"
                                                        data-original-title="<?php echo e(__('Delete')); ?>"
                                                        data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                        data-confirm-yes="document.getElementById('delete-order-<?php echo e($order->id); ?>').submit();">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </a>

                                                    <?php if($order->payment_status == 'success' || $order->payment_status == 'Approved'|| $order->payment_status == 'succeeded'): ?>
                                                        <?php $__currentLoopData = $userOrders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $userOrder): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <?php if($order->order_id == $userOrder->order_id && $order->is_refund == 0): ?>
                                                                <div class="action-item">
                                                                    <a href="<?php echo e(route('order.refund', [$order->id, $order->user_id])); ?>"
                                                                        class="mx-3 align-items-center" data-toggle="tooltip"
                                                                        title="<?php echo e(__('Refund')); ?>"
                                                                        data-original-title="<?php echo e(__('Refund')); ?>">
                                                                        <i class="fas fa-exchange-alt"></i> <i class="fas fa-exchange-alt"></i>
                                                                    </a>
                                                                </div>
                                                            <?php endif; ?>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>

                                                    <?php echo Form::open(['method' => 'GET', 'route' => ['order.destory', $order->id], 'id' => 'delete-order-' . $order->id]); ?>

                                                    <?php echo Form::close(); ?>

                                            </div>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php else: ?>
                                <tr>
                                    <th scope="col" colspan="8"><h6 class="text-center"><?php echo e(__('No Orders Found.')); ?></h6></th>
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

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/plans/orderlist.blade.php ENDPATH**/ ?>