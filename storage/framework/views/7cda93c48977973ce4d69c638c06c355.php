
<div class="modal-body">
    <div class="col-sm-12 col-md-10 col-xxl-12 col-md-12">
        <div class="tab-content" id="pills-tabContent">
            
            <?php
                $users = \App\Models\User::where('created_by', $id)->get();
                $logo_path=\App\Models\Utility::get_file('/');
            ?>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-4 text-center">
                            <p class="mb-0 font-weight-bold">
                                <?php echo e(__('Total User')); ?>

                            </p>
                            <p class="text-sm mb-0" data-toggle="tooltip"
                                data-bs-original-title="<?php echo e(__('Total Users')); ?>"><i
                                    class="fas fa-users text-warning card-icon-text-space fs-5 mx-1"></i><span
                                    class="total_users fs-5"><?php echo e($userData['total_users']); ?></span>
                            </p>
                        </div>
                        <div class="col-4 text-center">
                            <p class="mb-0 font-weight-bold">
                                <?php echo e(__('Active User')); ?>

                            </p>
                            <p class="text-sm mb-0" data-toggle="tooltip"
                                data-bs-original-title="<?php echo e(__('Active Users')); ?>"><i
                                    class="fas fa-users text-primary card-icon-text-space fs-5 mx-1"></i><span
                                    class="active_users fs-5"><?php echo e($userData['active_users']); ?></span>
                            </p>
                        </div>
                        <div class="col-4 text-center">
                            <p class="mb-0 font-weight-bold">
                                <?php echo e(__('Disable User')); ?>

                            </p>
                            <p class="text-sm mb-0" data-toggle="tooltip"
                                data-bs-original-title="<?php echo e(__('Disable Users')); ?>"><i
                                    class="fas fa-users text-danger card-icon-text-space fs-5 mx-1"></i><span
                                    class="disable_users fs-5"><?php echo e($userData['disable_users']); ?></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <?php if($userData['total_users'] != 0): ?>
            <div class="row my-2 ">
                <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-md-6 my-2 ">
                        <div class="d-flex align-items-center justify-content-between list_colume_notifi pb-2">
                            <div class="mb-3 mb-sm-0">
                                <?php if($user->avatar): ?>
                                    <img src="<?php echo e($logo_path.$user->avatar); ?>" class="avatar rounded-circle avatar-sm"  alt="<?php echo e($user->name); ?>" title="<?php echo e($user->name); ?>"  class="" />
                                    <label for="user" class="form-label"><?php echo e($user->name); ?></label>
                                <?php else: ?>
                                    <img <?php echo e($user->img_avatar); ?>  class="avatar rounded-circle avatar-sm" title="<?php echo e($user->name); ?>">
                                    <label for="user" class="form-label"><?php echo e($user->name); ?></label>
                                <?php endif; ?>
                            </div>
                            <div class="text-end">
                                <div class="custom-control custom-switch float-right">
                                    <input type="checkbox" name="user_disable_<?php echo e($user->id); ?>" id="user_disable_<?php echo e($user->id); ?>"
                                        class="custom-control-input is_disable" value="1"
                                        data-id='<?php echo e($user->id); ?>' data-company="<?php echo e($id); ?>"
                                        data-name="<?php echo e(__('user')); ?>"
                                        <?php echo e($user->is_disable == 1 ? 'checked' : ''); ?>>
                                    <label class="custom-control-label" for="user_disable_<?php echo e($user->id); ?>"></label>
                                </div>
                            </div>
                        </div>
                    </div>

                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <?php else: ?>
            <tr>
                <td colspan="10" class="text-center">
                    <div class="text-center">
                        <i class="fas fa-folder-open text-primary fs-40"></i>
                        <h2><?php echo e(__('Opps...')); ?></h2>
                        <h6> <?php echo __('User Not Found'); ?> </h6>
                    </div>
                </td>
            </tr>
            <?php endif; ?>
            
        </div>
    </div>
</div>
<script>
    $(document).on("click", ".is_disable", function() {
        var id = $(this).attr('data-id');
        var company_id = $(this).attr('data-company');
        var is_disable = ($(this).is(':checked')) ? $(this).val() : 0;

        $.ajax({
            url: '<?php echo e(route('user.unable')); ?>',
            type: 'POST',
            data: {
                "is_disable": is_disable,
                "id": id,
                "company_id": company_id,
                "_token": "<?php echo e(csrf_token()); ?>",
            },
            success: function(data) {
                console.log(data);
                if (data.success) {
                    $('.total_users').text(data.userData.total_users);
                    $('.active_users').text(data.userData.active_users);
                    $('.disable_users').text(data.userData.disable_users);
                    show_toastr('success', data.success,'success');
                } else {
                    show_toastr('error', data.error);

                }

            }
        });
    });
</script>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/users/companyinfo.blade.php ENDPATH**/ ?>