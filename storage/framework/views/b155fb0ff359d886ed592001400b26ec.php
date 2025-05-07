<?php $__env->startSection('title'); ?>
    <?php echo e(__('Manage Languages')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('css'); ?>
<style>
    .form-control-label {
        font-size: 0.9em;  
        white-space: normal;  
        word-wrap: break-word; 
        display: block; 
        margin-bottom: 0.25rem;
    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="#" class="btn btn-sm btn-white btn-icon-only rounded-circle ml-2" data-url="<?php echo e(route('lang.create')); ?>"
        data-ajax-popup="true" data-size="md" data-title="<?php echo e(__('Create Language')); ?>" data-toggle="tooltip"
        data-bs-placement="left" title="<?php echo e(__('Create')); ?>">
        <span class="btn-inner--icon"><i class="fas fa-plus"></i></span>
        
    </a>

    <?php if($currantLang != (\Auth::user()->lang ?? 'en')): ?>
        <a href="#" class="btn btn-sm btn-white btn-icon-only rounded-circle" data-toggle="tooltip"
            data-original-title="<?php echo e(__('Delete this language')); ?>"
            data-confirm="<?php echo e(__('Are You Sure? | You want to delete this language?')); ?>"
            data-confirm-yes="document.getElementById('delete-form-<?php echo e($currantLang); ?>').submit();"><i
                class="fas fa-trash"></i></a>
        <?php echo Form::open([
            'method' => 'DELETE',
            'route' => ['lang.destroy', $currantLang],
            'id' => 'delete-form-' . $currantLang,
        ]); ?>

        <?php echo Form::close(); ?>

    <?php endif; ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-9">
            <div class="card">
                <div class="card-body">
                    <?php if($currantLang != (!empty($settings['default_language']) ? $settings['default_language'] : 'en')): ?>
                        <div class="custom-control custom-switch float-right">
                            <input type="hidden" name="disable_lang" value="off">
                            <input type="checkbox" class="custom-control-input" name="disable_lang" data-bs-placement="top"
                            title="<?php echo e(__('Enable/Disable')); ?>" id="disable_lang"
                            data-bs-toggle="tooltip" <?php echo e(!in_array($currantLang,$disabledLang) ? 'checked':''); ?> >
                            <label class="custom-control-label form-control-label" for="disable_lang"></label>
                        </div>
                    <?php endif; ?>
                    <ul class="nav nav-tabs nav-bordered mb-3">
                        <li class="nav-item">
                            <a href="#labels" data-toggle="tab" aria-expanded="false" class="nav-link active">
                                <i class="mdi mdi-home-variant mr-1"></i>
                                <span><?php echo e(__('Labels')); ?></span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#messages" data-toggle="tab" aria-expanded="true" class="nav-link">
                                <i class="mdi mdi-account-circle mr-1"></i> 
                                <span><?php echo e(__('Messages')); ?></span>
                            </a>
                        </li>
                    </ul>
                    <form method="post" action="<?php echo e(route('lang.store.data', $currantLang)); ?>">
                        <?php echo csrf_field(); ?>
                        <div class="tab-content">
                            <div class="tab-pane active" id="labels">
                                <div class="row">
                                    <?php $__currentLoopData = $arrLabel; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label class="form-control-label"><?php echo e($label); ?></label>
                                                <input type="text" class="form-control"
                                                    name="label[<?php echo e($label); ?>]" value="<?php echo e($value); ?>">
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </div>
                            <div class="tab-pane show" id="messages">
                                <?php $__currentLoopData = $arrMessage; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $fileName => $fileValue): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h3><?php echo e(ucfirst($fileName)); ?></h3>
                                        </div>
                                        <?php $__currentLoopData = $fileValue; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <?php if(is_array($value)): ?>
                                                <?php $__currentLoopData = $value; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label2 => $value2): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php if(is_array($value2)): ?>
                                                        <?php $__currentLoopData = $value2; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label3 => $value3): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <?php if(is_array($value3)): ?>
                                                                <?php $__currentLoopData = $value3; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label4 => $value4): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php if(is_array($value4)): ?>
                                                                        <?php $__currentLoopData = $value4; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label5 => $value5): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <div class="col-lg-6">
                                                                                <div class="form-group mb-3">
                                                                                    <label
                                                                                        class="form-control-label"><?php echo e($fileName); ?>.<?php echo e($label); ?>.<?php echo e($label2); ?>.<?php echo e($label3); ?>.<?php echo e($label4); ?>.<?php echo e($label5); ?></label>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        name="message[<?php echo e($fileName); ?>][<?php echo e($label); ?>][<?php echo e($label2); ?>][<?php echo e($label3); ?>][<?php echo e($label4); ?>][<?php echo e($label5); ?>]"
                                                                                        value="<?php echo e($value5); ?>">
                                                                                </div>
                                                                            </div>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php else: ?>
                                                                        <div class="col-lg-6">
                                                                            <div class="form-group mb-3">
                                                                                <label
                                                                                    class="form-control-label"><?php echo e($fileName); ?>.<?php echo e($label); ?>.<?php echo e($label2); ?>.<?php echo e($label3); ?>.<?php echo e($label4); ?></label>
                                                                                <input type="text" class="form-control"
                                                                                    name="message[<?php echo e($fileName); ?>][<?php echo e($label); ?>][<?php echo e($label2); ?>][<?php echo e($label3); ?>][<?php echo e($label4); ?>]"
                                                                                    value="<?php echo e($value4); ?>">
                                                                            </div>
                                                                        </div>
                                                                    <?php endif; ?>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            <?php else: ?>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group mb-3">
                                                                        <label
                                                                            class="form-control-label"><?php echo e($fileName); ?>.<?php echo e($label); ?>.<?php echo e($label2); ?>.<?php echo e($label3); ?></label>
                                                                        <input type="text" class="form-control"
                                                                            name="message[<?php echo e($fileName); ?>][<?php echo e($label); ?>][<?php echo e($label2); ?>][<?php echo e($label3); ?>]"
                                                                            value="<?php echo e($value3); ?>">
                                                                    </div>
                                                                </div>
                                                            <?php endif; ?>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php else: ?>
                                                        <div class="col-lg-6">
                                                            <div class="form-group mb-3">
                                                                <label
                                                                    class="form-control-label"><?php echo e($fileName); ?>.<?php echo e($label); ?>.<?php echo e($label2); ?></label>
                                                                <input type="text" class="form-control"
                                                                    name="message[<?php echo e($fileName); ?>][<?php echo e($label); ?>][<?php echo e($label2); ?>]"
                                                                    value="<?php echo e($value2); ?>">
                                                            </div>
                                                        </div>
                                                    <?php endif; ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php else: ?>
                                                <div class="col-lg-6">
                                                    <div class="form-group mb-3">
                                                        <label
                                                            class="form-control-label"><?php echo e($fileName); ?>.<?php echo e($label); ?></label>
                                                        <input type="text" class="form-control"
                                                            name="message[<?php echo e($fileName); ?>][<?php echo e($label); ?>]"
                                                            value="<?php echo e($value); ?>">
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                        <hr>
                        <div class="text-right">
                            <button class="btn btn-sm btn-primary rounded-pill" type="submit"><?php echo e(__('Save')); ?></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="card">
                <div class="card-body">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $code  => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a href="<?php echo e(route('lang', $code)); ?>"
                                class="nav-link <?php if($code == $currantLang): ?> active <?php endif; ?>">
                                <i class="mr-1"></i>
                                <span style="color: darkgray;"><?php echo e(ucFirst($lang)); ?></span>
                            </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>

                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script>
        $(document).on('change','#disable_lang',function(){
        var val = $(this).prop("checked");
        if(val == true){
                var langMode = 'on';
        }
        else{
            var langMode = 'off';
        }
        $.ajax({
                type:'POST',
                url: "<?php echo e(route('disablelanguage')); ?>",
                datType: 'json',
                data:{
                    "_token": "<?php echo e(csrf_token()); ?>",
                    "mode":langMode,
                    "lang":"<?php echo e($currantLang); ?>"
                },
                success : function(data){
                    show_toastr('Success',data.message, 'success')
                }
        });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home3/taskmagix/public_html/in/app/resources/views/lang/index.blade.php ENDPATH**/ ?>