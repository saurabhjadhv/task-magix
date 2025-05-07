<?php $__env->startSection('title'); ?>
    <?php echo e($emailTemplate->name); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    
    <ul class="nav justify-content-center justify-content-md-end  ml-5">
        <li class="nav-item dropdown ">
            <a class="" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="h6 text-sm mb-0 text-white"><?php echo e(__('Template: ')); ?>

                    <?php echo e(ucfirst($emailTemplate->name)); ?></span>
                <i class="ti ti-chevron-down drp-arrow nocolor"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                <?php $__currentLoopData = $EmailTemplates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $EmailTemplate): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a href="<?php echo e(route('manage.email.language', [$EmailTemplate->id, \Auth::user()->lang])); ?>"
                        class="dropdown-item">
                        <span><?php echo e($EmailTemplate->name); ?></span>
                    </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </li>
    </ul>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('css'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/summernote/summernote-bs4.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startPush('theme-script'); ?>
    <script src="<?php echo e(asset('assets/libs/summernote/summernote-bs4.js')); ?>"></script>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="language-wrap">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 language-form-wrap">
                                <h6 class="">
                                    <i data-feather="credit-card" class="me-2"></i><?php echo e(__('Placeholders')); ?>

                                </h6>
                                <div class="col-12 col-md-12">
                                    <div class="text-right">

                                        <a href="#" class="btn btn-sm btn-primary rounded-pill m-3"
                                            data-url="<?php echo e(route('generate', ['email_template'])); ?>"
                                            data-ajax-popup-over="true" data-bs-placement="top" data-size="md"
                                            title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate with AI')); ?>">
                                            <span class="btn-inner--text text-white"> <span><i
                                                        class="fas fa-robot"></i></span>
                                                <?php echo e(__('Generate with AI')); ?></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <?php $__currentLoopData = explode(',', $emailTemplate->keyword); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $keyword): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php ($word = explode(':', $keyword)); ?>
                                                    <div class="col-6">
                                                        <?php echo e(__($word[0])); ?> : <span
                                                            class="pull-right text-primary"><?php echo e($word[1]); ?></span></p>
                                                    </div>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                <div class="col-6">
                                                    <p><?php echo e(__('App Name')); ?> : <span
                                                            class="pull-right text-primary">{app_name}</span>
                                                    </p>
                                                    </div>
                                                    <div class="col-6">
                                                    <p>
                                                        <?php echo e(__('App URL')); ?> : <span
                                                            class="pull-right text-primary">{app_url}</span>
                                                    </p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php echo e(Form::model($currEmailTempLang, ['route' => ['store.email.language', $currEmailTempLang->parent_id], 'method' => 'POST'])); ?>

                                <div class="row">

                                    <div class="form-group col-6">
                                        <?php echo e(Form::label('subject', __('Subject'))); ?>

                                        <?php echo e(Form::text('subject', null, ['class' => 'form-control font-style', 'required' => 'required'])); ?>

                                    </div>

                                    <div class="form-group col-6">
                                        <?php echo e(Form::label('from', __('From'))); ?>

                                        <?php echo e(Form::text('from', null, ['class' => 'form-control font-style', 'required' => 'required'])); ?>

                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <?php echo e(Form::label('content', __('Email Message'))); ?>

                                            <?php echo e(Form::textarea('content', $currEmailTempLang->content, ['class' => 'summernote-simple', 'required' => 'required', 'id' => 'summernote-simple'])); ?>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 text-right">
                                    <?php echo e(Form::hidden('lang', null)); ?>

                                    <?php echo e(Form::submit(__('Save changes'), ['class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                                </div>
                                <?php echo e(Form::close()); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/email_templates/show.blade.php ENDPATH**/ ?>