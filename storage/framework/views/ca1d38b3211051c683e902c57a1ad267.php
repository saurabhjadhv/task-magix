<?php $__env->startSection('title'); ?>
    <?php echo e($project->title); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('theme-script'); ?>
    <script src="<?php echo e(asset('assets/libs/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js')); ?>"></script>
<?php $__env->stopPush(); ?>

<?php
$logo_path = \App\Models\Utility::get_file('/');
$result = json_decode($project->copylinksetting);
$password = base64_decode($project->password);

?>

<?php $__env->startSection('action-button'); ?>
    <a href="<?php echo e(route('projects.show',$project->id)); ?>" class="btn btn-sm btn-white rounded-circle btn-icon-only ml-2">
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
                            <i class="fas fa-project-diagram pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Basic Setting')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('Likes name, description and dates.')); ?></p>
                            </div>
                        </div>
                    </div>

                    <div data-href="#tabs-2" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-coins pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Additional Setting')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('Likes budget, hours and currency.')); ?></p>
                            </div>
                        </div>
                    </div>
                    <div data-href="#tabs-3" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-tasks pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Task Stage')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('System will consider last stage as a completed / done task for get progress on project.')); ?></p>
                            </div>
                        </div>
                    </div>
                    <div data-href="#tabs-4" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-bell pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Email Notification Settings')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('Change Email Notification.')); ?></p>
                            </div>
                        </div>
                    </div>
                    <div data-href="#tabs-5" class="list-group-item">
                        <div class="media">
                            <i class="fas fa-copy pt-1"></i>
                            <div class="media-body ml-3">
                                <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Shared Project Settings')); ?></a>
                                <p class="mb-0 text-sm"><?php echo e(__('Shared Project Settings.')); ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="col-lg-8 order-lg-1">
            <div id="tabs-1" class="tabs-card">
                <div class="card">
                    <div class="card-header">
                        <h5 class=" h6 mb-0"><?php echo e(__('Basic Setting')); ?></h5>
                    </div>
                    <div class="card-body">
                    <?php if(Utility::plancheck()['enable_chatgpt'] == 'on'): ?>
                        <div class="col-12 col-md-12">
                            <div class="text-right">
                                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2" data-url="<?php echo e(route('generate',['project'])); ?>" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate contact with AI')); ?>">
                                    <span class="btn-inner--icon"> <i class="fas fa-robot"></i></span>
                                    <span class="btn-inner--text text-white"><?php echo e(__('Generate with AI')); ?></span>
                                </a>
                            </div>
                        </div>
                    <?php endif; ?>
                        <?php echo e(Form::model($project, ['route' => ['projects.update', $project->id], 'id' => 'edit_project', 'method' => 'PUT', 'enctype'=>'multipart/form-data'])); ?>

                        <div class="row">
                            <div class="col-12 col-md-12">
                                <div class="form-group">
                                    <?php echo e(Form::label('title', __('Project name'),['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::text('title', null, ['class' => 'form-control','required'=>'required', 'placeholder' => __('Enter project name')])); ?>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <?php echo e(Form::label('start_date', __('Start date'),['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::date('start_date', null, ['class' => 'form-control'])); ?>

                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <?php echo e(Form::label('end_date', __('End date'),['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::date('end_date', null, ['class' => 'form-control'])); ?>

                                </div>
                            </div>
                            <div class="col-12 col-md-12">
                                <div class="form-group">
                                    <?php echo e(Form::label('descriptions', __('Description'),['class' => 'form-control-label'])); ?>

                                    <small class="form-text text-muted mb-2 mt-0"><?php echo e(__('This textarea will autosize while you type.')); ?></small>
                                    <?php echo e(Form::textarea('descriptions', null, ['class' => 'form-control','rows' => '3','data-toggle' => 'autosize', 'placeholder' => __('Enter description')])); ?>

                                </div>
                            </div>
                            <div class="col-12 col-md-12">
                                <div class="form-group">
                                    <?php echo e(Form::label('status', __('Status'),['class' => 'form-control-label'])); ?>

                                    <select name="status" id="status" class="form-control">
                                        <?php $__currentLoopData = \App\Models\Project::$status; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $v): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($k); ?>" <?php echo e(($project->status == $k) ? 'selected' : ''); ?>><?php echo e(__($v)); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-md-12">
                                <?php echo e(Form::label('image', __('Project Image'),['class' => 'form-control-label'])); ?>

                                <input type="file" name="image" id="image" class="custom-input-file " accept="image/*" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])" />
                                <label for="image">
                                    <i class="fa fa-upload"></i>
                                    <span><?php echo e(__('Choose a file…')); ?></span>
                                </label> <br>

                                <a href='#' class="change_image">


                                    <?php if($project->image): ?>

                                    <img src="<?php echo e($logo_path.$project->image); ?>" alt="<?php echo e($project->title); ?>"  class="avatar avatar-xl fix_size_show_img" id="blah" />
                                    <?php else: ?>

                                    <img <?php echo e($project->img_image); ?> class="rounded-circle p-4 fix_size_show_img "/>
                                    <?php endif; ?>

                                </a>
                                <?php echo e(Form::hidden('from','basic')); ?>

                            </div>
                        </div>
                        <div class="text-right pt-3">
                            <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                        </div>
                        <?php echo e(Form::close()); ?>

                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h5 class=" h6 mb-0"><?php echo e(__('Project Progress Calculation')); ?></h5>
                    </div>
                    <div class="card-body">
                        <?php echo e(Form::model($project, ['route' => ['projects.update', $project->id], 'id' => 'edit_project', 'method' => 'PUT', 'enctype'=>'multipart/form-data'])); ?>

                        <div id="radio-result" class="tab-pane tab-example-result fade show active" role="tabpanel" aria-labelledby="radio-result-tab">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="progress_false" value="false" name="project_progress" class="custom-control-input" <?php echo e(($project->project_progress == 'false') ? 'checked' : ''); ?>>
                                <label class="custom-control-label" for="progress_false"><?php echo e(__('Calculate Progress through tasks')); ?></label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="progress_true" value="true" name="project_progress" class="custom-control-input" <?php echo e(($project->project_progress == 'true') ? 'checked' : ''); ?>>
                                <label class="custom-control-label" for="progress_true"><?php echo e(__('Manual Entry: ')); ?> <b id="p_percentage"><?php echo e($project->progress); ?></b>%</label>
                            </div>
                        </div>
                        <div id="range-result" class="tab-pane tab-example-result fade show active" role="tabpanel" aria-labelledby="range-result-tab">
                            <input type="range" class="project_progress custom-range" value="<?php echo e($project->progress); ?>" id="progress_bar" name="progress" <?php if($project->project_progress == 'false'): ?> disabled <?php endif; ?>>
                            <?php echo e(Form::hidden('from','project_progress')); ?>

                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="text-right pt-3">
                                    <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                                </div>
                            </div>
                        </div>
                        <?php echo e(Form::close()); ?>

                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h5 class=" h6 mb-0"><?php echo e(__('Task Progress Calculation')); ?></h5>
                    </div>
                    <div class="card-body">
                        <?php echo e(Form::model($project, ['route' => ['projects.update', $project->id], 'id' => 'edit_project', 'method' => 'PUT', 'enctype'=>'multipart/form-data'])); ?>

                        <div id="radio-result" class="tab-pane tab-example-result fade show active" role="tabpanel" aria-labelledby="radio-result-tab">
                            <div class="custom-control custom-radio">
                                <input type="radio" value="true" id="task_progress_false" name="task_progress" class="custom-control-input" <?php echo e(($project->task_progress == 'true') ? 'checked' : ''); ?>>
                                <label class="custom-control-label" for="task_progress_false"><?php echo e(__('Based on checklist')); ?></label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" value="false" id="task_progress_true" name="task_progress" class="custom-control-input" <?php echo e(($project->task_progress == 'false') ? 'checked' : ''); ?>>
                                <label class="custom-control-label" for="task_progress_true"><?php echo e(__('Manual Entry')); ?></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="text-right pt-3">
                                    <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                                </div>
                            </div>
                        </div>
                        <?php echo e(Form::hidden('from','task_progress_bar')); ?>

                        <?php echo e(Form::close()); ?>

                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h5 class=" h6 mb-0"><?php echo e(__('Danger zone')); ?></h5>
                    </div>
                    <div class="card-body">
                        <button type="button" class="btn btn-sm btn-danger rounded-pill" data-confirm="<?php echo e(__('Are You Sure?')); ?>|<?php echo e(__('This action can not be undone. Do you still want to delete it?')); ?>" data-confirm-yes="document.getElementById('delete-project-<?php echo e($project->id); ?>').submit();"><?php echo e(__('Delete Project')); ?></button>
                        <?php echo Form::open(['method' => 'DELETE', 'route' => ['projects.destroy',$project->id],'id'=>'delete-project-'.$project->id]); ?>

                        <?php echo Form::close(); ?>

                    </div>
                </div>
            </div>
            <div id="tabs-2" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0"><?php echo e(__('Additional Setting')); ?></h5>
                    </div>
                    <div class="card-body">
                        <?php echo e(Form::model($project, ['route' => ['projects.update', $project->id], 'id' => 'edit_project', 'method' => 'PUT', 'enctype'=>'multipart/form-data'])); ?>

                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <?php echo e(Form::label('budget', __('Budget'),['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::number('budget', null, ['class' => 'form-control','required' => 'required','step' =>'0.01','min'=>'0', 'placeholder' => __('Enter project budget')])); ?>

                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <?php echo e(Form::label('currency', __('Currency Symbol'), ['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::text('currency', null, [
                                        'class' => 'form-control', 
                                        'required' => 'required', 
                                        'pattern' => '^[\p{L}\p{Sc}]+$',
                                        'title' => 'Currency symbol invalid.',
                                        'placeholder' => __('Enter currency symbol')
                                    ])); ?>

                                </div>
                            </div>
                                                      
                            
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <?php echo e(Form::label('currency_code', __('Currency Code'),['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::text('currency_code', null, ['class' => 'form-control','required' => 'required', 'placeholder' => __('Enter currency code')])); ?>

                                    <small><?php echo e(__('Note : Add currency code as per three-letter ISO code.')); ?> <a href="https://stripe.com/docs/currencies" target="_blank"><?php echo e(__('you can find out here..')); ?></a></small>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <label class="currency-label form-control-label pb-2" for="currency_position"><?php echo e(__('Currency Symbol Position')); ?></label> <br>
                                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-primary btn-sm <?php echo e(($project->currency_position == 'pre') ? 'active' : ''); ?>">
                                        <input type="radio" name="currency_position" value="pre" <?php echo e(($project->currency_position == 'pre') ? 'checked' : ''); ?>><?php echo e(__('Pre')); ?>

                                    </label>
                                    <label class="btn btn-primary btn-sm <?php echo e(($project->currency_position == 'post') ? 'active' : ''); ?>">
                                        <input type="radio" name="currency_position" value="post" <?php echo e(($project->currency_position == 'post') ? 'checked' : ''); ?>><?php echo e(__('Post')); ?>

                                    </label>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <?php echo e(Form::label('estimated_hrs', __('Estimated Hours'),['class' => 'form-control-label'])); ?>

                                    <?php echo e(Form::number('estimated_hrs', null, ['class' => 'form-control','required' => 'required','min'=>'0','maxlength' => '8', 'placeholder' => __('Enter estimated hours')])); ?>

                                </div>
                                <?php echo e(Form::hidden('from','financial')); ?>

                            </div>
                            <div class="col-12 col-md-12">
                                <div class="form-group">
                                    <?php echo e(Form::label('tags', __('Tags'),['class' => 'form-control-label'])); ?>

                                    <small class="form-text text-muted mb-2 mt-0"><?php echo e(__('Seprated By Comma')); ?></small>
                                    <?php echo e(Form::text('tags', null, ['class' => 'form-control','data-toggle' => 'tags','placeholder'=>__('Type here..')])); ?>

                                </div>
                            </div>
                        </div>
                        <div class="text-right pt-3">
                            <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                        </div>
                        <?php echo e(Form::close()); ?>

                    </div>
                </div>
            </div>
            <div id="tabs-3" class="tabs-card d-none">
                <div class="card">
                    <div class="kanban-settings task-stage-repeater" data-value="<?php echo e(json_encode($project->taskstages)); ?>">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-6">
                                    <h5 class="h6 mb-0"><?php echo e(__('Task Stage')); ?></h5>
                                </div>
                                <div class="col-md-6 text-right">
                                    <div class="actions" data-repeater-create>
                                        <a href="#" class="action-item">
                                            <i class="fas fa-plus"></i>
                                            <span class="d-none d-sm-inline-block"><?php echo e(__('Add')); ?></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <?php echo e(Form::open(['route' => ['project.stages.store', $project->id, 'task']])); ?>

                            <table class="table align-items-center table-hover task-stages-list" width="100%" data-repeater-list="stages">
                                <tbody>
                                <tr data-repeater-item class="main-stage-tr">
                                    <td class="stage-input">
                                        <input type="hidden" name="id"/>
                                        <input type="text" name="name" class="form-control repeater-input" placeholder="Enter task stage" required/>
                                    </td>
                                    <td class="stage-move text-right"><i class="fas fa-arrows-alt task-sort-handler"></i></td>
                                    <td class="stage-remove text-right">
                                        <button type="button" class="btn close stage-remove-button" data-type="tasks">
                                            <span aria-hidden="true"><i class="fas fa-trash-alt text-danger text-sm"></i></span>
                                        </button>
                                        <button data-repeater-delete type="button" class="btn close trigger-close-button d-none" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="stage-save-button text-right mb-4 mr-4">
                                <button type="submit" class="btn btn-sm btn-primary rounded-pill"><?php echo e(__('Update')); ?></button>
                            </div>
                            <?php echo e(Form::close()); ?>

                        </div>
                    </div>
                </div>
            </div>
            <div id="tabs-4" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0"><?php echo e(__('Email Notification Settings')); ?></h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <?php echo e(Form::open(['route' => ['status.email.language'],'method' => 'POST'])); ?>

                            <table class="table mb-0">
                                <thead class="thead-light">
                                <tr>
                                    <th> <?php echo e(__('Name')); ?></th>
                                    <th class="text-right"> <?php echo e(__('On/Off')); ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <input type="hidden" name="project_id" value="<?php echo e($project->id); ?>">
                                    <?php $__currentLoopData = $EmailTemplates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $EmailTemplate): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php ($template = $EmailTemplate->template($project->id)); ?>

                                        <?php if($EmailTemplate->name != 'User Invite'): ?>
                                            <tr>
                                                <td><?php echo e($EmailTemplate->name); ?></td>

                                                <td class="action text-right">
                                                    <div class="custom-control custom-switch">
                                                        <input type="hidden" name="<?php echo e($template->id); ?>" value="0">
                                                        <input type="checkbox" name="<?php echo e($template->id); ?>" value="1" class="custom-control-input email-template-checkbox" id="email_tempalte_<?php echo e($template->id); ?>" <?php if(isset($template->is_active) && $template->is_active == 1): ?> checked="checked" <?php endif; ?> />

                                                        <label class="custom-control-label" for="email_tempalte_<?php echo e($template->id); ?>"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                            </table>
                            <div class="text-right pt-3">
                                <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                            </div>
                            <?php echo e(Form::close()); ?>

                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-5" class="tabs-card d-none">
                <div class="card">

                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                        <h5 class="h6 mb-0"><?php echo e(__('Shared Project Settings')); ?></h5>
                    </div>

                        <div class="col-md-6 text-right">
                            <a href="#" class="btn btn-sm btn-white btn-icon-only rounded-circle ml-0 cp_link"
                            data-link="<?php echo e(route('projects.link', \Illuminate\Support\Facades\Crypt::encrypt($project->id))); ?>"
                            data-toggle="tooltip" data-original-title="<?php echo e(__('Click to copy link')); ?>">
                            <span class="btn-inner--icon"><i class="fas fa-file"></i></span>
                            </a>
                        </div>

                    </div>

                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <?php echo e(Form::open(['route' => ['projects.copy.link', $project->id],'method' => 'POST'])); ?>

                           <table class="table mb-0">
                              <thead class="thead-light">
                                 <tr>
                                    <th> <?php echo e(__('Name')); ?></th>
                                    <th class="text-right"> <?php echo e(__('On/Off')); ?></th>
                                 </tr>
                              </thead>
                              <tbody>
                                    <tr>
                                        <td><?php echo e(__('Basic details')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="basic_details" class="custom-control-input" <?php if(isset($result->basic_details) && $result->basic_details == 'on'): ?> checked="checked" <?php endif; ?>  id="copy_link_1" value="on">
                                                    <label class="custom-control-label" for="copy_link_1"></label>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td><?php echo e(__('Member')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="member" class="custom-control-input" <?php if(isset($result->member) && $result->member == 'on'): ?> checked="checked" <?php endif; ?> id="copy_link_2" value="on">
                                                    <label class="custom-control-label" for="copy_link_2"></label>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td><?php echo e(__('Milestone')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="milestone" class="custom-control-input" <?php if(isset($result->milestone) && $result->milestone == 'on'): ?> checked="checked" <?php endif; ?> id="copy_link_3" value="on">
                                                    <label class="custom-control-label" for="copy_link_3"></label>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td><?php echo e(__('Activity')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="activity" class="custom-control-input" <?php if(isset($result->activity) && $result->activity == 'on'): ?> checked="checked" <?php endif; ?> id="copy_link_4" value="on">
                                                    <label class="custom-control-label" for="copy_link_4"></label>
                                                </div>
                                            </td>
                                    </tr>

                                    <tr>
                                    <td><?php echo e(__('Attachment')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="attachment" class="custom-control-input" <?php if(isset($result->attachment) && $result->attachment == 'on'): ?> checked="checked" <?php endif; ?> id="copy_link_5" value="on">
                                                    <label class="custom-control-label" for="copy_link_5"></label>
                                                </div>
                                            </td>
                                    </tr>

                                    <tr>
                                    <td><?php echo e(__('Task')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="task" class="custom-control-input" id="copy_link_7" <?php if(isset($result->task) && $result->task == 'on'): ?> checked="checked" <?php endif; ?>  value="on">
                                                    <label class="custom-control-label" for="copy_link_7"></label>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td><?php echo e(__('Tracker details')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="tracker_details" class="custom-control-input" <?php if(isset($result->tracker_details) && $result->tracker_details == 'on'): ?> checked="checked" <?php endif; ?> id="copy_link_8"  value="on">
                                                    <label class="custom-control-label" for="copy_link_8"></label>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td><?php echo e(__('Timesheet')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="timesheet" class="custom-control-input" <?php if(isset($result->timesheet) && $result->timesheet == 'on'): ?> checked="checked" <?php endif; ?> id="copy_link_9"  value="on">
                                                    <label class="custom-control-label" for="copy_link_9"></label>
                                                </div>
                                            </td>
                                    </tr>

                                    <tr>
                                    <td><?php echo e(__('Password Protected')); ?></td>
                                            <td class="action text-right">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="password_protected" class="custom-control-input password_protect" id="password_protected" <?php if(isset($result->password_protected) && $result->password_protected == 'on'): ?> checked="checked" <?php endif; ?>  value="on">
                                                    <label class="custom-control-label" for="password_protected"></label>
                                                </div>
                                            </td>
                                            <tr >
                                                <td>
                                                    <div class="action text-left passwords ">
                                                        <?php echo e(Form::label('password', __('Password'),['class' => 'form-control-label'])); ?>

                                                        <div class="input-group input-group-merge">

                                                            <input id="password" type="password" class="form-control passwords " name="password" placeholder="Enter your password" value ="<?php echo e(($password != null) ? $password : null); ?>">
                                                            <div class="input-group-append">
													 	<span class="btn btn-light" style="cursor: pointer;" onclick="togglePasswordVisibility()">
															<i id="password-icon" class="fas fa-eye-slash"></i>
														</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                    </tr>

                              </tbody>
                            </table>
                            <div class="text-right pt-3">
                                <?php echo e(Form::button(__('Update'), ['type' => 'submit','class' => 'btn btn-sm btn-primary rounded-pill'])); ?>

                            </div>
                            <?php echo e(Form::close()); ?>

                        </div>
                     </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script type="text/javascript" src="<?php echo e(asset('assets/js/jquery-ui.min.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset('assets/js/repeater.js')); ?>"></script>
    <script>

        $( "#image" ).change(function() {
            var image_val = $('#blah').attr('src');
            $('.change_image').attr('href',image_val);
        });

        $('.list-group-item').on('click', function () {
            var href = $(this).attr('data-href');
            $('.tabs-card').addClass('d-none');
            $(href).removeClass('d-none');
            $('#tabs .list-group-item').removeClass('text-primary');
            $(this).addClass('text-primary');
        });

        // Remove task stage
        $(document).on('click', '.stage-remove-button', function (e) {
            e.preventDefault();

            var ele = $(this);
            var stage_id = ele.parents('.main-stage-tr').children('.stage-input').find('input')[0].value;

            if (!stage_id) {
                ele.next('button').trigger('click');
            } else {
                var stages = ele.attr('data-type');
                var url = '<?php echo e(route('stage.tasks', '__stage_id')); ?>'.replace('__stage_id', stage_id);

                $.ajax({
                    url: url,
                    success: function (data) {
                        if (data == 0) {
                            if (confirm('<?php echo e(__("Are you sure you want to delete this stage?")); ?>')) {
                                ele.next('button').trigger('click');
                            }
                        } else {
                            alert('<?php echo e(__("There is some tasks in this stage. Please move tasks from this stage.")); ?>');
                        }
                    }
                });
            }

        });

        // Task Stage move
        var $taskDragAndDrop = $("body .task-stage-repeater tbody").sortable({
            handle: '.task-sort-handler'
        });

        var $taskRepeater = $('.task-stage-repeater').repeater({
            initEmpty: true,
            defaultValues: {},
            show: function () {
                $(this).slideDown();
            },
            hide: function (deleteElement) {
                $(this).slideUp(deleteElement);
            },
            ready: function (setIndexes) {
                $taskDragAndDrop.on('drop', setIndexes);
            },
            isFirstItemUndeletable: true
        });

        var value = JSON.parse($(".task-stage-repeater").attr('data-value'));

        if (typeof value != 'undefined' && value.length > 0) {
            $taskRepeater.setList(value);
        }

        $(document).ready(function () {

            var image_val = $('#blah').attr('src');
            // alert(image_val);
            // console.log(image_val);
            $('.change_image').attr('href',image_val);
            // alert(image_val);

            $('#progress_bar').change(function () {
                $('#p_percentage').html($(this).val());

            });

            $('input[type=radio][name=project_progress]').change(function () {
                if (this.value == 'true') {
                    $('#progress_bar').removeAttr('disabled');
                } else {
                    $('#progress_bar').attr('disabled', true);
                }
            });
        })

        // change email notification

    </script>

    <script>

        $(document).ready(function() {
            if ($('.password_protect').is(':checked')) {

                $('.passwords').show();
            } else {
                $('.passwords').hide();
            }

            $('#password_protected').on('change', function() {
                if ($('.password_protect').is(':checked')) {

                    $('.passwords').show();
                } else {
                    $('.passwords').hide();

                }
            });
        });

        $(document).on('change', '#password_protected', function() {
        if($(this).is(':checked'))
        {
            $('.passwords').removeClass('password_protect');
            $('.passwords').attr("required",true);

        } else {
            $('.passwords').addClass('password_protect');
            $('.passwords').val(null);
            $('.passwords').removeAttr("required");
        }
        });

        $('.cp_link').on('click', function() {
            var value = $(this).attr('data-link');
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val(value).select();
            document.execCommand("copy");
            $temp.remove();
            show_toastr('Success', '<?php echo e(__('Link Copy on Clipboard.')); ?>', 'success')
        });
		
		function togglePasswordVisibility() {
			const passwordField = document.getElementById('password');
			const icon = document.getElementById('password-icon');

			if (passwordField && icon) {
				if (passwordField.type === 'password') {
					passwordField.type = 'text';
					icon.classList.remove('fa-eye-slash');
					icon.classList.add('fa-eye');
				} else {
					passwordField.type = 'password';
					icon.classList.remove('fa-eye');
					icon.classList.add('fa-eye-slash');
				}
			} else {
				console.error('Password field or icon not found.');
			}
		}

    </script>

<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/projects/edit.blade.php ENDPATH**/ ?>