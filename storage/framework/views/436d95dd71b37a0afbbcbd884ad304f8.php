<!doctype html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>"
    dir=<?php echo e(\App\Models\Utility::getValByName('enable_rtl') == 'on' ? 'rtl' : 'ltr'); ?>>

<head>
    <?php
        $logo = \App\Models\Utility::get_file('logo/');
        $meta_logo = \App\Models\Utility::get_file('uploads/logo/');
        // if(isset($user_id))
        // {
        //     $owner_settings = \App\Models\Utility::settingsById($user_id);
        // }
        $settings = \App\Models\Utility::settings();

    ?>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
        <?php echo e(\App\Models\Utility::getValByName('header_text') ? \App\Models\Utility::getValByName('header_text') : config('app.name')); ?> &dash; <?php echo $__env->yieldContent('title'); ?></title>

    <meta name="title" content="<?php echo e($settings['meta_keywords']); ?>">
    <meta name="description" content="<?php echo e($settings['meta_description']); ?>">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="<?php echo e(env('APP_URL')); ?>">
    <meta property="og:title" content="<?php echo e($settings['meta_keywords']); ?>">
    <meta property="og:description" content="<?php echo e($settings['meta_description']); ?>">
    <meta property="og:image" content="<?php echo e($meta_logo.$settings['meta_image']); ?>">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="<?php echo e(env('APP_URL')); ?>">
    <meta property="twitter:title" content="<?php echo e($settings['meta_keywords']); ?>">
    <meta property="twitter:description" content="<?php echo e($settings['meta_description']); ?>">
    <meta property="twitter:image" content="<?php echo e($meta_logo.$settings['meta_image']); ?>">

    <link rel="icon" href="<?php echo e($logo.'favicon.png'.'?'.time()); ?>" type="image/png">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/@fortawesome/fontawesome-free/css/all.min.css')); ?>">
    
    

    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/animate.css/animate.min.css')); ?>">

    <?php if(Auth::user()->mode == 'light'): ?>
    <?php echo $__env->make('layouts.lightthemecolor', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/site-light.css')); ?>">
<?php else: ?>
    <?php echo $__env->make('layouts.darkthemecolor', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/site-dark.css')); ?>">
<?php endif; ?>


    <link rel="stylesheet" href="<?php echo e(asset('assets/css/custom.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/daterangepicker.css')); ?>">

    <?php if(\App\Models\Utility::getValByName('enable_rtl') == 'on'): ?>

        <link rel="stylesheet" href="<?php echo e(asset('assets/css/bootstrap-rtl.css')); ?>">
    <?php endif; ?>

    
    <title><?php echo e(__('Messages')); ?> &dash;
        <?php echo e(\App\Models\Utility::getValByName('header_text') ? \App\Models\Utility::getValByName('header_text') : config('app.name')); ?>

    </title>
    <link rel="icon" href="<?php echo e($logo.'favicon.png'.'?'.time()); ?>" type="image/png">

    
    <script src="<?php echo e(asset('js/chatify/font.awesome.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/chatify/autosize.js')); ?>"></script>
    <script src='https://unpkg.com/nprogress@0.2.0/nprogress.js'></script>

    
    <link rel='stylesheet' href='https://unpkg.com/nprogress@0.2.0/nprogress.css' />
   <link href="<?php echo e(asset('css/chatify/style.css')); ?>" rel="stylesheet" />


    <?php echo $__env->yieldPushContent('css'); ?>
</head>

<body class="application application-offset">
    <div class="container-fluid container-application">
        <div class="main-content position-relative">
            <div class="page-content">
                <?php if(trim($__env->yieldContent('title')) != 'Task Calendar'): ?>
                    <div class="page-title">
                        <div class="row justify-content-between align-items-center">
                            <div
                                class="col-xs-12 col-sm-12 col-md-4 d-flex align-items-center justify-content-between justify-content-md-start mb-3 mb-md-0">
                                <div class="d-inline-block">
                                    <h5 class="h4 d-inline-block font-weight-400 mb-0 text-white"><?php echo $__env->yieldContent('title'); ?>
                                        <?php if(trim($__env->yieldContent('role'))): ?>
                                            <span class="text text-sm text-white m-0 ml-2">(<?php echo $__env->yieldContent('role'); ?>)</span>
                                        <?php endif; ?>
                                    </h5>
                                </div>
                            </div>
                            <div
                                class="col-xs-12 col-sm-12 col-md-8 d-md-flex d-block align-items-center justify-content-between justify-content-md-end rounded_icon">
                                <?php echo $__env->yieldContent('action-button'); ?>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>

                <?php echo $__env->yieldContent('content'); ?>
            </div>
        </div>
    </div>





</body>

<!-- Scripts -->
<script src="<?php echo e(asset('assets/js/site.core.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/moment/min/moment.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/progressbar.js/dist/progressbar.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/bootstrap-notify/bootstrap-notify.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/autosize/dist/autosize.min.js')); ?>"></script>

<script src="<?php echo e(asset('assets/js/daterangepicker.js')); ?>"></script>
<script src="<?php echo e(asset('assets/js/choices.min.js')); ?>"></script>

<?php echo $__env->yieldPushContent('theme-script'); ?>
<script src="<?php echo e(asset('assets/js/site.js')); ?>"></script>
<script src="<?php echo e(asset('assets/js/letter.avatar.js')); ?>"></script>
<script src="<?php echo e(asset('assets/js/custom.js')); ?>"></script>

<?php if($settings['enable_cookie'] == 'on'): ?>
    <?php echo $__env->make('layouts.cookie_consent', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php endif; ?>

<?php echo $__env->yieldPushContent('script'); ?>

<?php if(Session::has('success')): ?>
    <script>
        show_toastr('<?php echo e(__('Success')); ?>', '<?php echo session('success'); ?>', 'success');
    </script>
    <?php echo e(Session::forget('success')); ?>

<?php endif; ?>
<?php if(Session::has('error')): ?>
    <script>
        show_toastr('<?php echo e(__('Error')); ?>', '<?php echo session('error'); ?>', 'error');
    </script>
    <?php echo e(Session::forget('error')); ?>

<?php endif; ?>

</html>
<?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/layouts/invoicepayheader.blade.php ENDPATH**/ ?>