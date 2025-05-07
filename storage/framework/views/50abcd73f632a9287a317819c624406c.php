<div class="card card-pricing popular text-center px-3 mb-5 mb-lg-0">
    <span class="h6 w-60 mx-auto px-4 py-1 rounded-bottom bg-primary text-white"><?php echo e($plan->name); ?></span>
    <div class="card-body delimiter-top">
        <ul class="list-unstyled mb-4">
            <li><?php echo e(__('Monthly Price')); ?>: <?php echo e((isset($payment_setting['currency']) ? $payment_setting['currency'] : '$')); ?><?php echo e($plan->monthly_price); ?></li>
            <li><?php echo e(__('Annual Price')); ?>: <?php echo e(( isset($payment_setting['currency']) ? $payment_setting['currency'] : '$')); ?><?php echo e($plan->annual_price); ?></li>
            <?php if($plan->max_users != 0): ?>
                <li><?php echo e(($plan->max_users < 0)?__('Unlimited'):$plan->max_users); ?> <?php echo e(__('Users')); ?></li>
            <?php endif; ?>
            <?php if($plan->max_projects != 0): ?>
                <li><?php echo e(($plan->max_projects < 0)?__('Unlimited'):$plan->max_projects); ?> <?php echo e(__('Projects')); ?></li>
            <?php endif; ?>
            <?php if($plan->description): ?>
                <li>
                    <small><?php echo e($plan->description); ?></small>
                </li>
            <?php endif; ?>
        </ul>
    </div>
    <div class="card-footer delimiter-top">
        <div class="row justify-content-center">
            <div class="col-auto mb-2">
                <a href="<?php echo e(route('send.request',[\Illuminate\Support\Facades\Crypt::encrypt($plan->id),'monthly'])); ?>" class="btn btn-xs btn-primary btn-icon rounded-pill">
                    <span class="btn-inner--icon"><i class="fas fa-share"></i></span>
                    <span class="btn-inner--text"><?php echo e(__('Monthly Update Request')); ?></span>
                </a>
            </div>
            <div class="col-auto mb-2">
                <a href="<?php echo e(route('send.request',[\Illuminate\Support\Facades\Crypt::encrypt($plan->id),'annual'])); ?>" class="btn btn-xs btn-primary btn-icon rounded-pill">
                    <span class="btn-inner--icon"><i class="fas fa-share"></i></span>
                    <span class="btn-inner--text"><?php echo e(__('Annually Update Request')); ?></span>
                </a>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/plan_request/show.blade.php ENDPATH**/ ?>