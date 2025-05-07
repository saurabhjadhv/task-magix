<form class="pl-3 pr-3" method="post" action="<?php echo e(route('test.email.send')); ?>" id="test_email">
    <?php echo csrf_field(); ?>
    <div class="form-group">
        <label for="email" class="form-control-label"><?php echo e(__('E-Mail Address')); ?></label>
        <input type="email" class="form-control" id="email" name="email" required/>
    </div>
    <div class="form-group">
        <input type="hidden" name="mail_driver" value="<?php echo e($data['mail_driver']); ?>"/>
        <input type="hidden" name="mail_host" value="<?php echo e($data['mail_host']); ?>"/>
        <input type="hidden" name="mail_port" value="<?php echo e($data['mail_port']); ?>"/>
        <input type="hidden" name="mail_username" value="<?php echo e($data['mail_username']); ?>"/>
        <input type="hidden" name="mail_password" value="<?php echo e($data['mail_password']); ?>"/>
        <input type="hidden" name="mail_encryption" value="<?php echo e($data['mail_encryption']); ?>"/>
        <input type="hidden" name="mail_from_address" value="<?php echo e($data['mail_from_address']); ?>"/>
        <input type="hidden" name="mail_from_name" value="<?php echo e($data['mail_from_name']); ?>"/>
        <div class="row">
            <div class="col-6">
                <button class="btn btn-sm btn-primary rounded-pill" type="submit"><?php echo e(__('Send Test Mail')); ?></button>
            </div>
            <div class="col-6 text-right pt-2">
                <label id="email_sanding" style="display: none"><i class="fas fa-clock"></i> <?php echo e(__('Sending ...')); ?> </label>
            </div>
        </div>
    </div>
</form>
<?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/users/test_email.blade.php ENDPATH**/ ?>