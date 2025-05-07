<?php
    if(\Auth::user()->type == "admin")
    {
        $rtl = \App\Models\Utility::settings()['enable_rtl'];
    }
    elseif(\Auth::user()->type != "admin" && Auth::check())
    {
        $rtl = \App\Models\Utility::settingsById(\Auth::user()->creatorId())['enable_rtl'];

    }else
    {
        $rtl = \App\Models\Utility::getValByName('enable_rtl');
    }
?>

<!doctype html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>"
    dir=<?php echo e($rtl == 'on' ? 'rtl' : 'ltr'); ?>>
<head>

<?php
    $logo = \App\Models\Utility::get_file('logo/');
    $meta_logo = \App\Models\Utility::get_file('uploads/logo/');
    $settings = \App\Models\Utility::settings();
?>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
        <?php echo e(\App\Models\Utility::getValByName('header_text') ? \App\Models\Utility::getValByName('header_text') : config('app.name')); ?>&dash;<?php echo $__env->yieldContent('title'); ?></title>

    <meta name="title" content="<?php echo e($settings['meta_keywords']); ?>">
    <meta name="description" content="<?php echo e($settings['meta_description']); ?>">
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
    <meta http-equiv="Cache-Control" content="post-check=0, pre-check=0" />
    <meta http-equiv="Pragma" content="no-cache">
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

    <?php if( $rtl == 'on'): ?>
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/bootstrap-rtl.css')); ?>">
    <?php endif; ?>

    <meta name="url" content="<?php echo e(url('') . '/' . config('chatify.routes.prefix')); ?>"
        data-user="<?php echo e(Auth::user()->id); ?>">
    <title><?php echo e(__('Messages')); ?> &dash;
        <?php echo e(\App\Models\Utility::getValByName('header_text') ? \App\Models\Utility::getValByName('header_text') : config('app.name')); ?>

    </title>
    <link rel="icon" href="<?php echo e($logo.'favicon.png'.'?'.time()); ?>" type="image/png">

    
    <script src="<?php echo e(asset('js/chatify/font.awesome.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/chatify/autosize.js')); ?>"></script>
    <script src='https://unpkg.com/nprogress@0.2.0/nprogress.js'></script>

    
    <link rel='stylesheet' href='https://unpkg.com/nprogress@0.2.0/nprogress.css' />
   <link href="<?php echo e(asset('css/chatify/style.css')); ?>" rel="stylesheet" />
    <?php
        $unseenCounter = App\Models\ChMessage::where('to_id', Auth::user()->id)
            ->where('seen', 0)
            ->count();
    ?>
<style>
    .company-text:hover{color: #000}
</style>
    <?php echo $__env->yieldPushContent('css'); ?>
</head>

    <body class="application application-offset ">

    <?php if(\Auth::user()->type != 'admin'): ?>
        <?php
            $trackerdata = \App\Models\ProjectTaskTimer::get();
            if(!empty($trackerdata)){
                $trackerdata = \App\Models\ProjectTask::lastTime();
            }
        ?>
    <?php endif; ?>

    <div class="container-fluid container-application">
        <div class="sidenav pb-2" id="sidenav-main">
            <?php echo $__env->make('partials.admin.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        </div>
        <div class="main-content position-relative">
            <?php echo $__env->make('partials.admin.navbar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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

    <input type="hidden" id="path_admin" value="<?php echo e(url('/')); ?>">
    
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="footer pt-5 pb-4 footer-light" id="footer-main">
                    <div class="row text-center align-items-sm-center">
                      <div class="col-sm-12">
                        <p class="text-colr">&copy; 2024 - <?php echo e(date('Y')); ?>

                            TaskMagix.com – A Product of <a class="company-text" href="https://1xl.com/">ONE XL INFO LLP</a>. All Rights Reserved.</p>
                            
                            
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="modal fade" tabindex="-1" role="dialog" id="commonModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
    

    
    <div class="modal fade fixed-right" id="commonModal-right" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="scrollbar-inner">
            <div class="min-h-300 mh-300">
            </div>
        </div>
    </div>
    


    
    <div class="modal fade" tabindex="-1" role="dialog" id="commonModalOver">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body1"></div>
            </div>
        </div>
    </div>
    


    <!-- Omnisearch -->
    <div id="omnisearch" class="omnisearch">
        <div class="container">
            <div class="omnisearch-form">
                <div class="form-group">
                    <div class="input-group input-group-merge input-group-flush">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                        <input type="text" class="form-control search_keyword"
                            placeholder="<?php echo e(__('Search by Task Name..')); ?>">
                    </div>
                </div>
            </div>
            <div class="omnisearch-suggestions">
                <h6 class="heading"><?php echo e(__('Search Suggestions')); ?></h6>
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="list-unstyled mb-0 search_output">
                        </ul>
                    </div>
                </div>
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

<script>
    <?php if(\Auth::user()->type != 'admin'): ?>
        $(document).ready(function() {
            search_data();
            $(document).on('keyup', '.search_keyword', function() {
                search_data($(this).val());
            });
        });

        // Common main search
        function search_data(keyword = '') {
            $.ajax({
                url: '<?php echo e(route('search.json')); ?>',
                data: {
                    keyword: keyword
                },
                success: function(data) {
                    $('.search_output').html(data);
                }
            });
        }

        // Common TimeTracker
        var timer = '';
        var timzone = '<?php echo e(env('TIMEZONE')); ?>';

        function TrackerTimer(start_time) {
            timer = setInterval(function() {
                var start = new Date(start_time);

                var here = new Date();
                var end = changeTimezone(here, timzone);

                var hrs = end.getHours() - start.getHours();
                var min = end.getMinutes() - start.getMinutes();
                var sec = end.getSeconds() - start.getSeconds();
                var hour_carry = 0;
                var Timer = $(".timer-counter");
                var minutes_carry = 0;
                if (min < 0) {
                    min += 60;
                    hour_carry += 1;
                }
                hrs = hrs - hour_carry;
                if (sec < 0) {
                    sec += 60;
                    minutes_carry += 1;
                }
                min = min - minutes_carry;
                Timer.text(minTwoDigits(hrs) + ':' + minTwoDigits(min) + ':' + minTwoDigits(sec));
            }, 1000);
        }

        function changeTimezone(date, ianatz) {
            var invdate = new Date(date.toLocaleString('en-US', {
                timeZone: ianatz
            }));
            var diff = date.getTime() - invdate.getTime();
            return new Date(date.getTime() - diff);
        }

        function minTwoDigits(n) {
            return (n < 10 ? '0' : '') + n;
        }
    <?php endif; ?>

    // var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
    //     removeItemButton: true,
    // });
    // var scrollSpy = new bootstrap.ScrollSpy(document.body, {
    //     target: '#useradd-sidenav',
    //     offset: 300
    // })
</script>
<?php if(\Auth::user()->type != 'admin'): ?>
    <?php if(count($trackerdata) > 0): ?>
        <script>
            TrackerTimer("<?php echo e($trackerdata['start_time']); ?>");
            $('.start-task').html("<?php echo e($trackerdata['title']); ?>");
        </script>
    <?php endif; ?>
<?php endif; ?>


</html>
<?php /**PATH D:\Main Projects\TaskMagix\indian\resources\views/layouts/admin.blade.php ENDPATH**/ ?>