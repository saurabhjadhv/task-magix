<?php
    $payment_detail = Utility::getPaymentSetting(Auth::user()->id);
?>
<div class="row">
    <div class="col-12">
        <table class="table">
            <tr>
                <th><?php echo e(__('Order Id')); ?></th>
                <td>
                    <?php echo e($payment->order_id); ?>

                </td>
            </tr>
            <tr>
                <th><?php echo e(__('Price')); ?></th>
                <td>
                    <?php echo e($payment->amount); ?>

                </td>
            </tr>
            <tr>
                <th><?php echo e(__('Payment Type')); ?></th>
                <td>
                    <?php echo e('bank Transfer'); ?>

                </td>
            </tr>
            <tr>
                <th><?php echo e(__('Payment status')); ?></th>
                <td>
                    <?php echo e($payment->status); ?>

                </td>
            </tr>
            <?php if(isset($payment_detail['bank_details'])): ?>
            <tr>
                <th><?php echo e(__('Bank Details')); ?></th>
                <td class="col-md-8"><span class="text-md"><?php echo $payment_detail['bank_details']; ?></span></td>
            </tr>
            <?php endif; ?>
            <tr>
                <th><?php echo e(__('Payment Receipt')); ?></th>
                <td>
                    <div class="action-btn btn px-2 bg-primary p-0 w-auto ">
                        <?php if($plan->storage_limit <= $total_storage != -1): ?>
                        <a href="<?php echo e(\App\Models\Utility::get_file($payment->receipt)); ?>"  title="Invoice" download=""
                            class="text-center">
                            <i class="fas fa-download"></i>
                        </a>
                        <?php else: ?>
                            <?php echo e('-'); ?>

                        <?php endif; ?>
                    </div>
                </td>

            </tr>

        </table>

            <?php echo e(Form::model($payment, ['route' => ['invoice.status', $payment->id], 'method' => 'POST'])); ?>

                <div class="text-right">
                    <input type="submit" value="<?php echo e(__('Approved')); ?>" class="btn btn-sm btn-success rounded-pill" name="status">
                    <input type="submit" value="<?php echo e(__('Reject')); ?>" class="btn btn-sm btn-danger rounded-pill" name="status">
                </div>
            <?php echo e(Form::close()); ?>


    </div>
</div>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/invoices/view.blade.php ENDPATH**/ ?>