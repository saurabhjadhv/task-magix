<?php $__env->startSection('title'); ?>
    <?php echo e($contract->subject); ?>

<?php $__env->stopSection(); ?>

<?php
    $avatar = \App\Models\Utility::get_file('avatars/');
    $attachments = \App\Models\Utility::get_file('contract_attechment/');
    $logo_path = \App\Models\Utility::get_file('/');
?>

<?php $__env->startPush('css'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/summernote/summernote-bs4.css')); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startPush('theme-script'); ?>
    <script src="<?php echo e(asset('assets/libs/summernote/summernote-bs4.js')); ?>"></script>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('action-button'); ?>
    <div class="float-end">
        <?php
            $editstatus = App\Models\Contract::editstatus();
        ?>
        <?php if(\Auth::user()->type == 'client'): ?>
            <li class="nav-item dropdown test_12">
                <a class="nav-link  " href="#" role="button" data-toggle="dropdown">
                    <div class="media media-pill">
                        <div class="pl-2 ">
                            <span class="mb-0 text-sm  font-weight-bold text-white"><?php echo e(ucfirst($contract->status)); ?></span>
                        </div>
                    </div>
                </a>
                <div class="dropdown-menu  dropdown-menu-arrow ">
                    <?php $__currentLoopData = $editstatus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <a class="dropdown-item status" data-id="<?php echo e($k); ?>"
                            data-url="<?php echo e(route('contract.status', $contract->id)); ?>" href="#"><?php echo e(ucfirst($status)); ?>

                        </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </li>
        <?php endif; ?>
    </div>
    <?php if(Auth::user()->type == 'owner'): ?>
        <a href="<?php echo e(route('send.mail.contract', $contract->id)); ?>" data-url=""
            class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0" data-toggle="tooltip"
            data-original-title="<?php echo e(__('Email')); ?>">
            <span class="btn-inner--icon"><i class="fas fa-envelope-square"></i></span>
        </a>
    <?php endif; ?>

    <?php if(\Auth::user()->type == 'owner' && $contract->owner_signature == null): ?>
        <a href="#" data-url="<?php echo e(route('contracts.copy', $contract->id)); ?>"
            class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0" data-ajax-popup="true" data-size="lg"
            data-title="<?php echo e(__('Duplicate')); ?>" data-toggle="tooltip" data-original-title="<?php echo e(__('Duplicate')); ?>">
            <span class="btn-inner--icon"><i class="fas fa-copy"></i></span>
        </a>
    <?php endif; ?>

    <?php if(\Auth::user()->type == 'owner' || $contract->client == Auth::user()->id): ?>
        <a href="<?php echo e(route('contract.download.pdf', \Crypt::encrypt($contract->id))); ?>"
            class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0 cp_link" data-toggle="tooltip"
            data-original-title="<?php echo e(__('Download')); ?>">
            <span class="btn-inner--icon"><i class="fas fa-download"></i></span>
        </a>
        <a href="<?php echo e(route('get.contract', $contract->id)); ?>" class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0"
            data-url="" target="_blank" data-toggle="tooltip" data-original-title="<?php echo e(__('Preview')); ?>">
            <span class="btn-inner--icon"><i class="fas fa-eye"></i></span>
        </a>
    <?php endif; ?>


    <?php if(\Auth::user()->type == 'owner' && $contract->owner_signature == null): ?>
        <a href="" class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0 "
            data-url="<?php echo e(route('signature', $contract->id)); ?>" data-ajax-popup="true" data-title="<?php echo e(__('Signature')); ?>"
            data-toggle="tooltip" data-size="md" data-original-title="<?php echo e(__('Signature')); ?>">
            <span class="btn-inner--icon"><i class="fas fa-pen-alt"></i></span>
        </a>
    <?php endif; ?>

    <?php if(\Auth::user()->type == 'client' && $contract->status == 'accept'): ?>
        <a href="" class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0 "
            data-url="<?php echo e(route('signature', $contract->id)); ?>" data-ajax-popup="true" data-title="<?php echo e(__('Signature')); ?>"
            data-toggle="tooltip" data-size="md" data-original-title="<?php echo e(__('Signature')); ?>">
            <span class="btn-inner--icon"><i class="fas fa-pen-alt"></i></span>
        </a>
    <?php endif; ?>

    <a href="<?php echo e(route('contractclient.index', $contract->id)); ?>"
        class="btn btn-sm btn-white rounded-circle btn-icon-only ml-0">
        <span class="btn-inner--icon"><i class="fas fa-arrow-left"></i></span>
    </a>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-4 order-lg-2">
            <div class="card">
                <div class="list-group list-group-flush" id="tabs">
                    <div data-href="#tabs-1" class="list-group-item text-primary">
                        <div class="media">
                            <i class="fas fa-cog pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('General')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('Detail of your Contract.')); ?></p>
                            </div>
                        </div>
                    </div>
                    <div data-href="#tabs-2" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-money-check-alt pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Attachment')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('You can manage your attachment here.')); ?></p>
                            </div>
                        </div>
                    </div>

                    <div data-href="#tabs-3" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-file pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Comment')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('You can manage your comment here.')); ?></p>
                            </div>
                        </div>
                    </div>
                    <div data-href="#tabs-4" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-percent pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Notes')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('You can manage your notes rate here.')); ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-8 order-lg-1">
            <div id="tabs-1" class="tabs-card">
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card card-stats">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h6 class="text-muted mb-1"><?php echo e(__('Total Attachment')); ?></h6>
                                        <span class="h3 font-weight-bold mb-0 "><?php echo e(count($contract->taskFiles)); ?></span>
                                        <br>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card card-stats">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h6 class="text-muted mb-1"><?php echo e(__('Total Comment')); ?></h6>
                                        <span class="h3 font-weight-bold mb-0 "><?php echo e(count($contract->comment)); ?></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card card-stats">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h6 class="text-muted mb-1"><?php echo e(__('Total Notes')); ?></h6>
                                        <span class="h3 font-weight-bold mb-0 "><?php echo e(count($contract->note)); ?></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card report_card total_amount_card">

                            <div class="card-body pt-0">
                                <address class="mb-0 text-sm ml-5">
                                    <dl class="row mt-4 align-items-center">
                                        <dt class="col-sm-6 h6 text-sm"><?php echo e(__('Client Name')); ?></dt>
                                        <dd class="col-sm-6 text-sm">
                                            <?php echo e(!empty($contract->clientdetail) ? $contract->clientdetail->name : ''); ?>

                                        </dd>

                                        <dt class="col-sm-6 h6 text-sm"><?php echo e(__('Project Name')); ?></dt>
                                        <dd class="col-sm-6 text-sm">
                                            <?php echo e(!empty($contract->getprojectname) ? $contract->getprojectname->title : '-'); ?>

                                        </dd>

                                        <dt class="col-sm-6 h6 text-sm"><?php echo e(__('Value')); ?></dt>
                                        <dd class="col-sm-6 text-sm">
                                            <?php echo e(Auth::user()->priceFormat($contract->value)); ?></dd>

                                        <dt class="col-sm-6 h6 text-sm"><?php echo e(__('Contract Type')); ?></dt>
                                        <dd class="col-sm-6 text-sm">
                                            <?php echo e(!empty($contract->ContractType) ? $contract->ContractType->name : '-'); ?>

                                        </dd>

                                        <dt class="col-sm-6 h6 text-sm"><?php echo e(__('Start Date')); ?></dt>
                                        <dd class="col-sm-6 text-sm">
                                            <?php echo e(Auth::user()->dateFormat($contract->start_date)); ?></dd>

                                        <dt class="col-sm-6 h6 text-sm"><?php echo e(__('End Date')); ?></dt>
                                        <dd class="col-sm-6 text-sm">
                                            <?php echo e(Auth::user()->dateFormat($contract->end_date)); ?></dd>
                                    </dl>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0"><?php echo e(__('Description ')); ?></h5>
                    </div>
                    <div class="card-body p-3">
                        <div class="col-12 col-md-12">
                            <div class="text-right">

                                <a href="#" class="btn btn-sm btn-primary rounded-pill"
                                    data-url="<?php echo e(route('generate', ['contracts'])); ?>" data-ajax-popup-over="true"
                                    data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>"
                                    data-title="<?php echo e(__('Generate with AI')); ?>">
                                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span>
                                        <?php echo e(__('Generate with AI')); ?></span>
                                </a>
                            </div>
                        </div>
                        <?php echo e(Form::open(['route' => ['contract.contract_description.store', $contract->id]])); ?>

                        <div class="col-md-12">
                            <div class="form-group mt-3">
                                <textarea class="tox-target summernote-simple" id="summernote-simple" name="contract_description" rows="8"><?php echo $contract->contract_description; ?></textarea>
                            </div>
                        </div>
                        <?php if($contract->status == 'accept'): ?>
                            <div class="col-md-12 text-end">
                                <div class="form-group mt-3 me-3 text-right">
                                    <?php echo e(Form::submit(__('Save Changes'), ['class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                                </div>
                            </div>
                        <?php endif; ?>
                        <?php echo e(Form::close()); ?>

                    </div>
                </div>
            </div>

            <div id="tabs-2" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5><?php echo e(__('Upload File')); ?></h5>
                    </div>
                    <div class="card-body">
                        <div class=" height-450">
                            <?php if($contract->status == 'accept'): ?>
                                <div class="row mb-4 align-items-center">
                                    <div class="col-6">
                                        <label class="form-control-label mb-0"><?php echo e(__('Attachments')); ?></label>
                                    </div>
                                    <div class="col-6 text-right">
                                        <a href="#" class="btn btn-xs btn-secondary btn-icon rounded-pill"
                                            data-toggle="collapse" data-target="#add_file">
                                            <span class="btn-inner--icon"><i class="fas fa-plus"></i></span>
                                            <span class="btn-inner--text"><?php echo e(__('Add item')); ?></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="card mb-3 border shadow-none collapse" id="add_file">
                                    <div class="card border-0 shadow-none mb-0">
                                        <div class="px-3 py-2 row align-items-center">
                                            <div class="col-10">
                                                <input type="file" name="task_attachment" id="task_attachment"
                                                    required class="custom-input-file" />
                                                <label for="task_attachment">
                                                    <i class="fa fa-upload"></i>
                                                    <span class="attachment_text"><?php echo e(__('Choose a file…')); ?></span>
                                                </label>
                                            </div>
                                            <div class="col-2 card-meta d-inline-flex align-items-center">
                                                <button class="btn btn-primary btn-xs" type="submit" id="file_submit"
                                                    data-action="<?php echo e(route('contracts.file.upload', [$contract->id])); ?>">
                                                    <i class="fas fa-plus "></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; ?>

                            <div id="comments-file">
                                <?php $__currentLoopData = $contract->taskFiles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $file): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="card mb-3 border shadow-none task-file">
                                        <div class="px-3 py-3">
                                            <div class="row align-items-center">
                                                <div class="col-auto">
                                                    <img src="<?php echo e(asset('assets/img/icons/files/' . $file->extension . '.png')); ?>"
                                                        class="img-fluid" style="width: 40px;">
                                                </div>
                                                <div class="col ml-n2">
                                                    <h6 class="text-sm mb-0">
                                                        <a href="#" target=""><?php echo e($file->name); ?> </a>
                                                    </h6>
                                                    <p class="card-text small text-muted"><?php echo e($file->file_size); ?>

                                                    </p>
                                                </div>
                                                <div class="col-auto actions">

                                                    <a href="<?php echo e($attachments . $file->files); ?>" target="_blank"
                                                        role="button">
                                                        <i class="fas fa-eye "></i>
                                                    </a>

                                                    <a href="<?php echo e($attachments . $file->files); ?>" download
                                                        class="action-item" role="button">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                    <?php if($contract->status == 'accept'): ?>
                                                        <?php if($contract->client == Auth::user()->id): ?>
                                                            <?php if(Auth::user()->id == $file->created_by): ?>
                                                                <?php if(auth()->guard('web')->check()): ?>
                                                                    <a href="#" class="action-item text-danger px-2"
                                                                        data-toggle="tooltip"
                                                                        data-original-title="<?php echo e(__('Delete')); ?>"
                                                                        data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                                        data-confirm-yes="document.getElementById('delete-Attachments-<?php echo e($file->id); ?>').submit();">
                                                                        <i class="fas fa-trash-alt"></i>
                                                                    </a>

                                                                    <?php echo Form::open([
                                                                        'method' => 'GET',
                                                                        'route' => ['contracts.file.delete', $file->id],
                                                                        'id' => 'delete-Attachments-' . $file->id,
                                                                    ]); ?>

                                                                    <?php echo Form::close(); ?>

                                                                <?php endif; ?>
                                                            <?php else: ?>
                                                            <?php endif; ?>
                                                        <?php else: ?>
                                                            <?php if(auth()->guard('web')->check()): ?>
                                                                <a href="#" class="action-item text-danger px-2"
                                                                    data-toggle="tooltip"
                                                                    data-original-title="<?php echo e(__('Delete')); ?>"
                                                                    data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                                    data-confirm-yes="document.getElementById('delete-Attachments-<?php echo e($file->id); ?>').submit();">
                                                                    <i class="fas fa-trash-alt"></i>
                                                                </a>

                                                                <?php echo Form::open([
                                                                    'method' => 'GET',
                                                                    'route' => ['contracts.file.delete', $file->id],
                                                                    'id' => 'delete-Attachments-' . $file->id,
                                                                ]); ?>

                                                                <?php echo Form::close(); ?>

                                                            <?php endif; ?>
                                                        <?php endif; ?>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-3" class="tabs-card d-none">
                <div class="row pt-2">
                    <div class="col-12">
                        <div id="comment">
                            <div class="card">
                                <div class="card-header">
                                    <h5><?php echo e(__('Comments')); ?></h5>
                                </div>
                                <div class="card-body">
                                    <?php if(Utility::plancheck()['enable_chatgpt'] == 'on'): ?>
                                    <div class="col-12 col-md-12">
                                        <div class="text-right">
                                            <a href="#" data-size="md" class="btn btn-sm btn-primary rounded-pill mb-4" data-ajax-popup-over="true" id="grammarCheck" data-url="<?php echo e(route('grammar',['grammar'])); ?>" data-bs-placement="top" data-title="<?php echo e(__('Grammar check with AI')); ?>">
                                                <i class="fab fa-rev"></i> <span><?php echo e(__('Grammar check with AI')); ?></span>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary rounded-pill mb-4" data-url="<?php echo e(route('generate',['contract_comments'])); ?>" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate with AI')); ?>">
                                                <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span> <?php echo e(__('Generate with AI')); ?></span>
                                            </a>
                                        </div>
                                    </div>
                                <?php endif; ?>
                                    <div class="col-12">
                                            <?php if($contract->status == 'accept'): ?>
                                                <div class="form-group mb-0 form-send w-100 text-right ">
                                                    <form method="POST" class=" pills-comments-form comment-box"
                                                        id="form-comment"
                                                        action="<?php echo e(route('comment_store.store', [$contract->id])); ?>">
                                                        <?php echo csrf_field(); ?>

                                                        <button type="submit" id="comment_submit"
                                                            class="btn btn-send btn btn-primary mr-0 commanent-buttion"><i
                                                                class="fas fa-plus"></i>
                                                        </button>


                                                        <textarea rows="3" class="form-control comments-shadow grammer_textarea" name="comment" data-toggle="autosize"
                                                            placeholder="Add a comment..." spellcheck="false"></textarea>

                                                        <grammarly-extension data-grammarly-shadow-root="true"
                                                            style="position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: 1;"
                                                            class="cGcvT"></grammarly-extension>

                                                        <grammarly-extension data-grammarly-shadow-root="true"
                                                            style="mix-blend-mode: darken; position: absolute; top: 0px; left: 0px; pointer-events: none; z-index: 1;"
                                                            class="cGcvT"></grammarly-extension>
                                                     </form>
                                                 </div>
                                                <?php endif; ?>
                                          </div>
                                    <div class="">
                                        <div class="list-group list-group-flush mt-3" id="comments">
                                            <?php $__currentLoopData = $contract->comment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $comment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="list-group-item px-0">
                                                    <div class="row align-items-center">
                                                        <div class="col-auto">
                                                            <?php
                                                                $user = App\Models\user::find($comment->user_id);
                                                            ?>
                                                            <a href="#"
                                                                class="img-fluid rounded-circle card-avatar">
                                                                <a href="<?php echo e($logo_path.$user->avatar); ?>"
                                                                    target="_blank"
                                                                    class="avatar avatar-sm rounded-circle">
                                                                     <?php if($user->avatar): ?>
                                                                        <img src="<?php echo e($logo_path.$user->avatar); ?>"  alt="<?php echo e($user->name); ?>" title="<?php echo e($user->name); ?>"  class="" />
                                                                        <?php else: ?>
                                                                        <img <?php echo e($user->img_avatar); ?>  title="<?php echo e($user->name); ?>">
                                                                        <?php endif; ?>
                                                                   </a>
                                                                </a>
                                                            </div>
                                                        <div class="col ml-n2">
                                                            <p
                                                                class="d-block h6 text-sm font-weight-light mb-0 text-break">
                                                                <?php echo e($comment->comment); ?></p>
                                                        </div>
                                                         <?php if($contract->status == 'accept'): ?>
                                                        <?php if($contract->client == Auth::user()->id): ?>
                                                            <?php if(Auth::user()->id == $comment->created_by): ?>
                                                                <div class="col-auto">
                                                                    <a href="#" class="action-item text-danger px-2"
                                                                        data-toggle="tooltip"
                                                                        data-original-title="<?php echo e(__('Delete')); ?>"
                                                                        data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                                        data-confirm-yes="document.getElementById('delete-comment-<?php echo e($comment->id); ?>').submit();">
                                                                        <i class="fas fa-trash-alt"></i>
                                                                    </a>


                                                                    <?php echo Form::open([
                                                                        'method' => 'GET',
                                                                        'route' => ['comment_store.destroy', $comment->id],
                                                                        'id' => 'delete-comment-' . $comment->id,
                                                                    ]); ?>

                                                                    <?php echo Form::close(); ?>

                                                                </div>
                                                            <?php else: ?>
                                                            <?php endif; ?>
                                                        <?php else: ?>
                                                            <div class="col-auto">
                                                                <a href="#" class="action-item text-danger px-2"
                                                                    data-toggle="tooltip"
                                                                    data-original-title="<?php echo e(__('Delete')); ?>"
                                                                    data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                                    data-confirm-yes="document.getElementById('delete-comment-<?php echo e($comment->id); ?>').submit();">
                                                                    <i class="fas fa-trash-alt"></i>
                                                                </a>

                                                                <?php echo Form::open([
                                                                    'method' => 'GET',
                                                                    'route' => ['comment_store.destroy', $comment->id],
                                                                    'id' => 'delete-comment-' . $comment->id,
                                                                ]); ?>

                                                                <?php echo Form::close(); ?>

                                                            </div>
                                                        <?php endif; ?>
                                                        <?php endif; ?>
                                                    </div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-4" class="tabs-card d-none">
                <div class="row pt-2">
                    <div class="col-12">
                        <div id="notes">
                            <div class="card">
                                <div class="card-header">
                                    <h5><?php echo e(__('Notes')); ?></h5>
                                </div>
                                <div class="card-body">

                                    <?php if($contract->status == 'accept'): ?>
                                        <?php if(Utility::plancheck()['enable_chatgpt'] == 'on'): ?>
                                            <div class="col-12 col-md-12">
                                                <div class="text-right">
                                                    <a href="#" class="btn btn-sm btn-primary rounded-pill mb-4"
                                                        data-url="<?php echo e(route('generate', ['contract_note'])); ?>"
                                                        data-ajax-popup-over="true" data-bs-placement="top"
                                                        data-size="md" title="<?php echo e(__('Generate')); ?>"
                                                        data-title="<?php echo e(__('Generate with AI')); ?>">
                                                        <span class="btn-inner--text text-white"> <span><i
                                                                    class="fas fa-robot"></i></span>
                                                            <?php echo e(__('Generate with AI')); ?></span>
                                                    </a>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        <?php echo e(Form::open(['route' => ['note_store.store', $contract->id]])); ?>

                                        <div class="form-group mb-1">
                                            <textarea class="tox-target form-control " placeholder="Add a notes..." style="width:100%; height:114px;"
                                                name="note" id="summernote"></textarea>
                                        </div>

                                        <div class="row d-flex ">
                                            <div class="col-md-12 notes text-right mt-3">
                                                <?php echo e(Form::submit(__('Add'), ['class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                                            </div>
                                        </div>
                                        <?php echo e(Form::close()); ?>

                                    <?php endif; ?>
                                    <div class="">
                                        <div class="list-group list-group-flush mt-3" id="comments">
                                            <?php $__currentLoopData = $contract->note; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $note): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="list-group-item ">
                                                    <div class="row align-items-center">
                                                        <?php
                                                            $user = App\Models\user::find($note->user_id);
                                                        ?>
                                                        <div class="col-auto">
                                                            <a href="<?php echo e($logo_path . $user->avatar); ?>" target="_blank"
                                                                class="avatar avatar-sm rounded-circle">
                                                                <?php if($user->avatar): ?>
                                                                    <img src="<?php echo e($logo_path . $user->avatar); ?>"
                                                                        alt="<?php echo e($user->name); ?>"
                                                                        title="<?php echo e($user->name); ?>" class="" />
                                                                <?php else: ?>
                                                                    <img <?php echo e($user->img_avatar); ?>

                                                                        title="<?php echo e($user->name); ?>">
                                                                <?php endif; ?>
                                                            </a>
                                                        </div>
                                                        <div class="col ml-n2">
                                                            <p
                                                                class="d-block h6 text-sm font-weight-light mb-0 text-break">
                                                                <?php echo e($note->note); ?></p>
                                                            <small
                                                                class="d-block"><?php echo e($note->created_at->diffForHumans()); ?></small>
                                                        </div>
                                                        <?php if($contract->status == 'accept'): ?>
                                                            <?php if($contract->client == Auth::user()->id): ?>
                                                                <?php if(Auth::user()->id == $note->created_by): ?>
                                                                    <a href="#" class="action-item text-danger px-2"
                                                                        data-toggle="tooltip"
                                                                        data-original-title="<?php echo e(__('Delete')); ?>"
                                                                        data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                                        data-confirm-yes="document.getElementById('delete-note-<?php echo e($note->id); ?>').submit();">
                                                                        <i class="fas fa-trash-alt"></i>
                                                                    </a>

                                                                    <?php echo Form::open([
                                                                        'method' => 'GET',
                                                                        'route' => ['note_store.destroy', $note->id],
                                                                        'id' => 'delete-note-' . $note->id,
                                                                    ]); ?>

                                                                    <?php echo Form::close(); ?>

                                                                <?php endif; ?>
                                                            <?php else: ?>
                                                                <a href="#" class="action-item text-danger px-2"
                                                                    data-toggle="tooltip"
                                                                    data-original-title="<?php echo e(__('Delete')); ?>"
                                                                    data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                                    data-confirm-yes="document.getElementById('delete-note-<?php echo e($note->id); ?>').submit();">
                                                                    <i class="fas fa-trash-alt"></i>
                                                                </a>

                                                                <?php echo Form::open([
                                                                    'method' => 'GET',
                                                                    'route' => ['note_store.destroy', $note->id],
                                                                    'id' => 'delete-note-' . $note->id,
                                                                ]); ?>

                                                                <?php echo Form::close(); ?>

                                                            <?php endif; ?>
                                                        <?php endif; ?>


                                                    </div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<?php $__env->stopSection(); ?>


<?php $__env->startPush('script'); ?>

    <script src="<?php echo e(asset('assets/libs/summernote/summernote-bs4.js')); ?>"></script>


    <script>
        /*For Task Attachment*/
        $(document).on('click', '#file_submit', function() {

            var file_data = $("#task_attachment").prop("files")[0];
            console.log(file_data);
            if (file_data != '' && file_data != undefined) {
                var formData = new FormData();
                formData.append('file', file_data);
                // console.log(formData);

                $.ajax({
                    url: $("#file_submit").data('action'),
                    type: 'POST',
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        $('#task_attachment').val('');
                        $('.attachment_text').html('<?php echo e(__('Choose a file…')); ?>');

                        // console.log(data);
                        if (data.status == 'success') {
                            show_toastr('Success', data.msg, 'success');
                            setTimeout(() => {
                                location.reload();
                            }, 1000);
                        }

                    },
                    error: function(data) {
                        show_toastr('<?php echo e(__('Error')); ?>',
                            '<?php echo e(__('File type and size must be match with Storage setting.')); ?>',
                            'error');
                        data = data.responseJSON;
                        if (data.message) {
                            show_toastr('<?php echo e(__('Error')); ?>', data.errors.file[0], 'error');
                            $('#file-error').text(data.errors.file[0]).show();
                        } else {
                            show_toastr('<?php echo e(__('Error')); ?>', '<?php echo e(__('Some Thing Is Wrong!')); ?>',
                                'error');
                        }
                    }
                });
            } else {
                show_toastr('<?php echo e(__('Error')); ?>', '<?php echo e(__('Please Select File!')); ?>', 'error');
            }
        });

        $(document).on("click", ".delete-comment", function() {
            var btn = $(this);
            $.ajax({
                url: $(this).attr('data-url'),
                type: 'DELETE',
                dataType: 'JSON',
                data: {
                    comment: comment,
                    "_token": "<?php echo e(csrf_token()); ?>",
                },
                success: function(data) {
                    load_task(btn.closest('.task-id').attr('id'));
                    show_toastr('success', 'Comment Deleted Successfully!');
                    btn.closest('.list-group-item').remove();
                },
                error: function(data) {
                    data = data.responseJSON;
                    if (data.message) {
                        show_toastr('error', data.message);
                    } else {
                        show_toastr('error', 'Some Thing Is Wrong!');
                    }
                }
            });
        });
    </script>

    


    <script>
        // For Sidebar Tabs
        $(document).ready(function() {
            $('#tabs .list-group-item').on('click', function() {
                var href = $(this).attr('data-href');
                $('.tabs-card').addClass('d-none');
                $(href).removeClass('d-none');
                $('#tabs .list-group-item').removeClass('text-primary');
                $(this).addClass('text-primary');
            });
        });

        $(document).on('click', '.custom-control-input', function() {
            var pp = $(this).parents('.tabs-card').removeClass('d-none');
        });


        $(document).on("click", ".status", function() {

            var edit_status = $(this).attr('data-id');
            var url = $(this).attr('data-url');
            $.ajax({
                url: url,
                type: 'POST',
                data: {

                    "edit_status": edit_status,
                    "_token": "<?php echo e(csrf_token()); ?>",
                },
                success: function(data) {
                    show_toastr('<?php echo e(__('Success')); ?>', 'Status Update Successfully!', 'success');
                    location.reload();
                }

            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/contracts/show.blade.php ENDPATH**/ ?>