<?php
    $logo_path = \App\Models\Utility::get_file('/');
?>
<?php if(isset($users) && !empty($users) && count($users) > 0): ?>
    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="col-lg-3 col-sm-6">
            <div class="card hover-shadow-lg">
                <div class="card card-header border-0 pb-0">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="mb-0"><?php echo e($user->getPlan() ? $user->getPlan()->name : '-'); ?></h6>
                        <div class="text-right">
                            <div class="btn-group card-option">
                                <?php if($user->is_disable == 0): ?>
                                    <i class="fas fa-lock"></i>
                                <?php else: ?>
                                    <div class="dropdown btn btn-sm btn-white btn-icon-only ml-2 m-0 mb-1">
                                        <a href="#" class="action-item text-dark" role="button" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-angle-down"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-steady" id="user_sort">
                                            <a href="#" class="dropdown-item" data-ajax-popup="true" data-size="lg"
                                                data-title="<?php echo e(__('Edit User')); ?>"
                                                data-url="<?php echo e(route('users.edit', $user->id)); ?>"><?php echo e(__('Edit User')); ?></a>

                                            <a href="#" class="dropdown-item" data-ajax-popup="true" data-size="lg"
                                                data-title="<?php echo e(__('Reset Password')); ?>"
                                                data-url="<?php echo e(route('user.reset', \Crypt::encrypt($user->id))); ?>"><?php echo e(__('Reset Password')); ?></a>

                                            <a href="<?php echo e(route('login.with.company', $user->id)); ?>" class="dropdown-item"
                                                data-bs-original-title="<?php echo e(__('Login As Company')); ?>"><?php echo e(__('Login As Company')); ?></a>

                                            <a href="#" class="action-item px-2 ml-2" data-toggle="tooltip"
                                                data-bs-original-title="<?php echo e(__('Delete')); ?>"
                                                data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                data-confirm-yes="document.getElementById('delete-user-<?php echo e($user->id); ?>').submit();"><?php echo e(__('Delete')); ?>

                                            </a>
                                            <?php echo Form::open([
                                                'method' => 'DELETE',
                                                'route' => ['user.destroy', $user->id],
                                                'id' => 'delete-user-' . $user->id,
                                            ]); ?>

                                            <?php echo Form::close(); ?>


                                        </div>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row g-2 justify-content-between">
                            <div class="col-12">
                                <div class="text-center client-box">
                                    <div class="avatar-parent-child">
                                        <?php if($user->avatar): ?>
                                            <img src="<?php echo e($logo_path . $user->avatar); ?>"
                                                class="avatar rounded-circle avatar-lg" alt="<?php echo e($user->name); ?>"
                                                title="<?php echo e($user->name); ?>" class="" />
                                        <?php else: ?>
                                            <img <?php echo e($user->img_avatar); ?> class="avatar rounded-circle avatar-lg"
                                                title="<?php echo e($user->name); ?>">
                                        <?php endif; ?>
                                    </div>
                                    <h5 class="h6 mt-4 mb-0">
                                        <p class="mb-1"><?php echo e($user->name); ?></p>
                                    </h5>
                                    <p class="d-block text-sm text-muted mb-1"><?php echo e($user->email); ?></p>
                                    <small data-toggle="tooltip" data-placement="bottom"
                                        data-original-title="<?php echo e(__('Last Login')); ?>"><?php echo e(!empty($user->last_login_at) ? Utility::getDateFormated($user->last_login_at, true) : '-'); ?></small>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body border-top">
                    <div class="row justify-content-between align-items-center" style="margin-left: -20px;">

                        <div class="col-6 text-center">
                            <a href="#" class="btn rounded btn-xs btn-primary"
                                data-url="<?php echo e(route('plan.upgrade', $user->id)); ?>" data-size="lg" data-ajax-popup="true"
                                data-title="<?php echo e(__('Upgrade Plan')); ?>"><?php echo e(__('Upgrade')); ?></a>
                        </div>

                        <div class="col-6 text-center Id ">
                            <a href="#" data-url="<?php echo e(route('company.info', $user->id)); ?>" data-size="lg"
                                data-ajax-popup="true" class="btn btn-xs btn-outline-primary"
                                data-title="<?php echo e(__('Company Info')); ?>"><?php echo e(__('AdminHub')); ?></a>
                        </div>

                        <div class="col-12">
                            <hr class="my-3">
                        </div>
                        <div class="col-6 text-center">
                            <span class="d-block h4 mb-0"><?php echo e(count($user->contacts)); ?></span>
                            <span class="d-block text-sm text-muted"><?php echo e(__('Users')); ?></span>
                        </div>
                        <div class="col-6 text-center">
                            <span class="d-block h4 mb-0"><?php echo e($user->projects->count()); ?></span>
                            <span class="d-block text-sm text-muted"><?php echo e(__('Projects')); ?></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php else: ?>
    <div class="col-xl-12 col-lg-12 col-sm-12">
        <div class="card">
            <div class="card-body">
                <h6 class="text-center mb-0"><?php echo e(__('No User Found.')); ?></h6>
            </div>
        </div>
    </div>
<?php endif; ?>
<script>
        // Delete to open modal
    (function($, window, i) {
        // Bootstrap 4 Modal
        $.fn.fireModal = function(options) {
            var options = $.extend({
                size: 'modal-md',
                center: false,
                animation: true,
                title: 'Modal Title',
                closeButton: true,
                header: true,
                bodyClass: '',
                footerClass: '',
                body: '',
                buttons: [],
                autoFocus: true,
                created: function() {},
                appended: function() {},
                onFormSubmit: function() {},
                modal: {}
            }, options);

            this.each(function() {
                i++;
                var id = 'fire-modal-' + i,
                    trigger_class = 'trigger--' + id,
                    trigger_button = $('.' + trigger_class);

                $(this).addClass(trigger_class);

                // Get modal body
                let body = options.body;

                if (typeof body == 'object') {
                    if (body.length) {
                        let part = body;
                        body = body.removeAttr('id').clone().removeClass('modal-part');
                        part.remove();
                    } else {
                        body = '<div class="text-danger">Modal part element not found!</div>';
                    }
                }

                // Modal base template
                var modal_template = '   <div class="modal' + (options.animation == true ? ' fade' : '') + '" tabindex="-1" role="dialog" id="' + id + '">  ' +
                    '     <div class="modal-dialog ' + options.size + (options.center ? ' modal-dialog-centered' : '') + '" role="document">  ' +
                    '       <div class="modal-content">  ' +
                    ((options.header == true) ?
                        '         <div class="modal-header">  ' +
                        '           <h5 class="modal-title">' + options.title + '</h5>  ' +
                        ((options.closeButton == true) ?
                            '           <button type="button" class="close" data-dismiss="modal" aria-label="Close">  ' +
                            '             <span aria-hidden="true">&times;</span>  ' +
                            '           </button>  ' :
                            '') +
                        '         </div>  ' :
                        '') +
                    '         <div class="modal-body">  ' +
                    '         </div>  ' +
                    (options.buttons.length > 0 ?
                        '         <div class="modal-footer">  ' +
                        '         </div>  ' :
                        '') +
                    '       </div>  ' +
                    '     </div>  ' +
                    '  </div>  ';

                // Convert modal to object
                var modal_template = $(modal_template);

                // Start creating buttons from 'buttons' option
                var this_button;
                options.buttons.forEach(function(item) {
                    // get option 'id'
                    let id = "id" in item ? item.id : '';

                    // Button template
                    this_button = '<button type="' + ("submit" in item && item.submit == true ? 'submit' : 'button') + '" class="' + item.class + '" id="' + id + '">' + item.text + '</button>';

                    // add click event to the button
                    this_button = $(this_button).off('click').on("click", function() {
                        // execute function from 'handler' option
                        item.handler.call(this, modal_template);
                    });
                    // append generated buttons to the modal footer
                    $(modal_template).find('.modal-footer').append(this_button);
                });

                // append a given body to the modal
                $(modal_template).find('.modal-body').append(body);

                // add additional body class
                if (options.bodyClass) $(modal_template).find('.modal-body').addClass(options.bodyClass);

                // add footer body class
                if (options.footerClass) $(modal_template).find('.modal-footer').addClass(options.footerClass);

                // execute 'created' callback
                options.created.call(this, modal_template, options);

                // modal form and submit form button
                let modal_form = $(modal_template).find('.modal-body form'),
                    form_submit_btn = modal_template.find('button[type=submit]');

                // append generated modal to the body
                $("body").append(modal_template);

                // execute 'appended' callback
                options.appended.call(this, $('#' + id), modal_form, options);

                // if modal contains form elements
                if (modal_form.length) {
                    // if `autoFocus` option is true
                    if (options.autoFocus) {
                        // when modal is shown
                        $(modal_template).on('shown.bs.modal', function() {
                            // if type of `autoFocus` option is `boolean`
                            if (typeof options.autoFocus == 'boolean')
                                modal_form.find('input:eq(0)').focus(); // the first input element will be focused
                            // if type of `autoFocus` option is `string` and `autoFocus` option is an HTML element
                            else if (typeof options.autoFocus == 'string' && modal_form.find(options.autoFocus).length)
                                modal_form.find(options.autoFocus).focus(); // find elements and focus on that
                        });
                    }

                    // form object
                    let form_object = {
                        startProgress: function() {
                            modal_template.addClass('modal-progress');
                        },
                        stopProgress: function() {
                            modal_template.removeClass('modal-progress');
                        }
                    };

                    // if form is not contains button element
                    if (!modal_form.find('button').length) $(modal_form).append('<button class="d-none" id="' + id + '-submit"></button>');

                    // add click event
                    form_submit_btn.click(function() {
                        modal_form.submit();
                    });

                    // add submit event
                    modal_form.submit(function(e) {
                        // start form progress
                        form_object.startProgress();

                        // execute `onFormSubmit` callback
                        options.onFormSubmit.call(this, modal_template, e, form_object);
                    });
                }

                $(document).on("click", '.' + trigger_class, function() {
                    $('#' + id).modal(options.modal);

                    return false;
                });
            });
        }

        // Bootstrap Modal Destroyer
        $.destroyModal = function(modal) {
            modal.modal('hide');
            modal.on('hidden.bs.modal', function() {});
        }
    })(jQuery, this, 0);

    // Basic confirm box
    loadConfirm();

    function loadConfirm() {
        $('[data-confirm]').each(function() {
            var me = $(this),
                me_data = me.data('confirm');

            me_data = me_data.split("|");
            me.fireModal({
                title: me_data[0],
                body: me_data[1],
                buttons: [{
                        text: me.data('confirm-text-yes') || 'Yes',
                        class: 'btn btn-sm btn-danger rounded-pill',
                        handler: function() {
                            eval(me.data('confirm-yes'));
                        }
                    },
                    {
                        text: me.data('confirm-text-cancel') || 'Cancel',
                        class: 'btn btn-sm btn-secondary rounded-pill',
                        handler: function(modal) {
                            $.destroyModal(modal);
                            eval(me.data('confirm-no'));
                        }
                    }
                ]
            })
        });
    }
</script>
<?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/admin/view.blade.php ENDPATH**/ ?>