<?php $__env->startSection('title'); ?>
<?php echo e(__('Copy Link')); ?>

<?php $__env->stopSection(); ?>
<?php
    $result = json_decode($project->copylinksetting);
    $logo_path = \App\Models\Utility::get_file('/');
    $logo = \App\Models\Utility::get_file('tasks/');
?>

<style>
    .application .container-application {
        display: flow-root !important;
    }
</style>

<?php $__env->startSection('action-button'); ?>
    
<?php $__env->stopSection(); ?>


<section class="application-section">
<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-9">
            <div id="tabs-1" class="tabs-card">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0"><?php echo e(__('Basic details')); ?></h5>
                    </div>
                    <div class="row application-row">
                        <div class="col-md-6 col-12">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card ">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col">
                                                    <h6 class="text-muted mb-1"><?php echo e(__('Task Done')); ?></h6>
                                                    <span class="h4 font-weight-bold mb-0 "><?php echo e($project_data['task']['done']); ?></span>
                                                </div>
                                                <div class="col-auto">
                                                    <div class="progress-circle progress-sm"
                                                        data-progress="<?php echo e($project_data['task']['percentage']); ?>"
                                                        data-text="<?php echo e($project_data['task']['percentage']); ?>%" data-color="primary">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <span
                                                        class="text-sm text-muted"><?php echo e(__('Total Task') . ' : ' . $project_data['task']['total']); ?></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h6 class="mb-0"><?php echo e($project_data['task_chart']['total']); ?></h6>
                                                        <span class="text-sm text-muted"><?php echo e(__('Last 7 days task done')); ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="w-100 pt-4 pb-5">
                                                <div class="spark-chart" data-toggle="spark-chart" data-color="info"
                                                    data-dataset="<?php echo e(json_encode($project_data['task_chart']['chart'])); ?>"></div>
                                            </div>
                                            <div class="progress-wrapper mb-3">
                                                <small class="progress-label"><?php echo e(__('Day Left')); ?> <span
                                                        class="text-muted"><?php echo e($project_data['day_left']['day']); ?></span></small>
                                                <div class="progress mt-0 height-3">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        aria-valuenow="<?php echo e($project_data['day_left']['percentage']); ?>" aria-valuemin="0"
                                                        aria-valuemax="100" style="width: <?php echo e($project_data['day_left']['percentage']); ?>%;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="progress-wrapper">
                                                <small class="progress-label"><?php echo e(__('Open Task')); ?> <span
                                                        class="text-muted"><?php echo e($project_data['open_task']['tasks']); ?></span></small>
                                                <div class="progress mt-0 height-3">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        aria-valuenow="<?php echo e($project_data['open_task']['percentage']); ?>" aria-valuemin="0"
                                                        aria-valuemax="100" style="width: <?php echo e($project_data['open_task']['percentage']); ?>%;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="progress-wrapper">
                                                <small class="progress-label"><?php echo e(__('Completed Milestone')); ?> <span
                                                        class="text-muted"><?php echo e($project_data['milestone']['total']); ?></span></small>
                                                <div class="progress mt-0" style="height: 3px;">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        aria-valuenow="<?php echo e($project_data['milestone']['percentage']); ?>" aria-valuemin="0"
                                                        aria-valuemax="100" style="width: <?php echo e($project_data['milestone']['percentage']); ?>%;">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <h6 class="mb-0"><?php echo e($project_data['timesheet_chart']['total']); ?></h6>
                                                    <span class="text-sm text-muted"><?php echo e(__('Last 7 days hours spent')); ?></span>
                                                </div>
                                            </div>
                                            <div class="w-100 pt-4 pb-5">
                                                <div class="spark-chart" data-toggle="spark-chart" data-color="warning"
                                                    data-dataset="<?php echo e(json_encode($project_data['timesheet_chart']['chart'])); ?>"></div>
                                            </div>
                                            <div class="progress-wrapper mb-3">
                                                <small class="progress-label"><?php echo e(__('Total project time spent')); ?> <span
                                                        class="text-muted"><?php echo e($project_data['time_spent']['total']); ?></span></small>
                                                <div class="progress mt-0 height-3">
                                                    <div class="progress-bar bg-warning" role="progressbar"
                                                        aria-valuenow="<?php echo e($project_data['time_spent']['percentage']); ?>" aria-valuemin="0"
                                                        aria-valuemax="100" style="width: <?php echo e($project_data['time_spent']['percentage']); ?>%;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="progress-wrapper">
                                                <small class="progress-label"><?php echo e(__('Allocated hours on task')); ?> <span
                                                        class="text-muted"><?php echo e($project_data['task_allocated_hrs']['hrs']); ?></span></small>
                                                <div class="progress mt-0 height-3">
                                                    <div class="progress-bar bg-warning" role="progressbar"
                                                        aria-valuenow="<?php echo e($project_data['task_allocated_hrs']['percentage']); ?>"
                                                        aria-valuemin="0" aria-valuemax="100"
                                                        style="width: <?php echo e($project_data['task_allocated_hrs']['percentage']); ?>%;"></div>
                                                </div>
                                            </div>
                                            <div class="progress-wrapper">
                                                <small class="progress-label"><?php echo e(__('User Assigned')); ?> <span
                                                        class="text-muted"><?php echo e($project_data['user_assigned']['total']); ?></span></small>
                                                <div class="progress mt-0 height-3">
                                                    <div class="progress-bar bg-warning" role="progressbar"
                                                        aria-valuenow="<?php echo e($project_data['user_assigned']['percentage']); ?>" aria-valuemin="0"
                                                        aria-valuemax="100"
                                                        style="width: <?php echo e($project_data['user_assigned']['percentage']); ?>%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="card card-fluid">
                                <div class="card-header">
                                    <h6 class="mb-0"><?php echo e(__('Project overview')); ?></h6>
                                </div>
                                <div class="card-body flex-grow-1">
                                    <div class="pb-3 mb-3 border-bottom">
                                        <div class="row align-items-center">
                                            <div class="">
                                                <?php if($project->image): ?>
                                                    <img src="<?php echo e($logo_path . $project->image); ?>"
                                                        alt="<?php echo e($project->title); ?>" class="avatar rounded-circle"
                                                        id="blah" title="<?php echo e($project->title); ?>" />
                                                <?php else: ?>
                                                    <img <?php echo e($project->img_image); ?> class="avatar rounded-circle"
                                                        title="<?php echo e($project->title); ?>">
                                                <?php endif; ?>
                                            </div>
                                            <div class="col ml-n2">
                                                <div class="progress-wrapper">
                                                    <span class="progress-percentage"><small
                                                            class="font-weight-bold"><?php echo e(__('Completed:')); ?>

                                                        </small><?php echo e($project->project_progress()['percentage']); ?></span>
                                                    <div class="progress progress-xs mt-2">
                                                        <div class="progress-bar bg-<?php echo e($project->project_progress()['color']); ?>"
                                                            role="progressbar"
                                                            aria-valuenow="<?php echo e($project->project_progress()['percentage']); ?>"
                                                            aria-valuemin="0" aria-valuemax="100"
                                                            style="width: <?php echo e($project->project_progress()['percentage']); ?>;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-sm mb-0">
                                        <?php echo e($project->descriptions); ?>

                                    </p>
                                </div>
                                <div class="card-footer py-0 px-0">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <div class="row align-items-center">
                                                <div class="col-6">
                                                    <small><?php echo e(__('Start date')); ?>:</small>
                                                    <div class="h6 mb-0">
                                                        <?php echo e(\App\Models\Utility::getDateFormated($project->start_date)); ?></div>
                                                </div>
                                                <div class="col-6">
                                                    <small><?php echo e(__('End date')); ?>:</small>
                                                    <div
                                                        class="h6 mb-0 <?php echo e(strtotime($project->end_date) < time() ? 'text-danger' : ''); ?>">
                                                        <?php echo e(\App\Models\Utility::getDateFormated($project->end_date)); ?></div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-2" class="tabs-card d-none">
                <div class="card">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card mb-0">
                                <div class="card-header border-0">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h6 class="mb-0"><?php echo e(__('Member')); ?></h6>
                                        </div>
                                    </div>
                                </div>
                                 <div class="table-responsive">
                                    <table class="table table-striped data-table">
                                    <thead>
                                        <tr>
                                            <th> <?php echo e(__('Avatar')); ?></th>
                                            <th> <?php echo e(__('Name')); ?></th>
                                            <th> <?php echo e(__('Type')); ?></th>
                                            <th> <?php echo e(__('Email')); ?></th>
                                            <th></th>
                                        </tr>
                                        </thead>

                                        <?php if($project->users || $project->users != '' || $project->users != null): ?>
                                        <tr>
                                            <?php $__currentLoopData = $project->users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <td>
                                                <?php if($user->avatar): ?>
                                                    <img src="<?php echo e($logo_path . $user->avatar); ?>" class="avatar rounded-circle avatar-sm"
                                                        title="<?php echo e($user->name); ?>">
                                                <?php else: ?>
                                                    <img <?php echo e($user->img_avatar); ?> class="avatar rounded-circle avatar-sm">
                                                <?php endif; ?>
                                            </td>
                                                    <td><?php echo e($user->name); ?></td>
                                                    <td><?php echo e(__(ucfirst($user->pivot->permission))); ?></td>
                                                    <td><?php echo e($user->email); ?></td>
                                                    <td></td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-3" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="mb-0"><?php echo e(__('Milestone')); ?> (<?php echo e(count($project->milestones)); ?>)</h6>
                            </div>
                        </div>
                        <div class="card-wrapper  p-3   table_scroll" style="overflow: auto; ">
                            <div class="list-group list-group-flush">
                                <table class="table table-striped data-table">
                                    <thead>
                                        <tr>
                                            <th> <?php echo e(__('Title')); ?></th>
                                            <th> <?php echo e(__('Status')); ?></th>
                                            <th> <?php echo e(__('Tasks')); ?></th>
                                            <th> <?php echo e(__('Progress')); ?></th>
                                            <th></th>
                                        </tr>
                                        <tr>
                                    <?php if($project->milestones->count() > 0): ?>
                                    <?php $__currentLoopData = $project->milestones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $milestone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                    <td><?php echo e($milestone->title); ?></td>
                                    <td> <?php echo e(__(\App\Models\Project::$status[$milestone->status])); ?></td>
                                    <td><?php echo e($milestone->tasks->count() . ' ' . __('Tasks')); ?></td>
                                    <td>
                                        <div class="progress_wrapper">
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar"
                                                    style="width:<?php echo e($milestone->progress); ?>px;"
                                                    aria-valuenow="55" aria-valuemin="0"
                                                    aria-valuemax="100">
                                                </div>
                                            </div>
                                            <div class="progress_labels">
                                                <div class="total_progress">
                                                    <strong> <?php echo e($milestone->progress); ?>%</strong>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                <?php endif; ?>
                            </table>
                            </thead>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-4" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="mb-0"><?php echo e(__('Activity Log')); ?></h6>
                                  <small><?php echo e(__('Activity Log of this project')); ?></small>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        
                        <div class="mh-500 min-h-500 card-wrapper  p-3   table_scroll" style="overflow: auto; ">
                            <div class="timeline timeline-one-side" data-timeline-content="axis"
                                data-timeline-axis-style="dashed">
                                <?php $__currentLoopData = $project->activities; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $activity): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="timeline-block">
                                        <span class="timeline-step timeline-step-sm bg-dark border-dark text-white">
                                            <i class="fas <?php echo e($activity->logIcon($activity->log_type)); ?>"></i>
                                        </span>
                                        <div class="timeline-content">
                                            <span class="text-dark text-sm"><?php echo e(__($activity->log_type)); ?></span>
                                            <a class="d-block h6 text-sm mb-0"><?php echo $activity->getRemark(); ?></a>
                                            <small><i
                                                    class="fas fa-clock mr-1"></i><?php echo e($activity->created_at->diffForHumans()); ?></small>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

            <div id="tabs-5" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="mb-0"><?php echo e(__('Attachments')); ?></h6>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="mh-500 min-h-500 card-wrapper  p-3   table_scroll" style="overflow: auto; ">
                            <?php if($project->projectAttachments()->count() > 0): ?>
                                <?php $__currentLoopData = $project->projectAttachments(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $attachment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="card mb-3 border shadow-none">
                                        <div class="px-3 py-3">
                                            <div class="row align-items-center">
                                                <div class="col-auto">
                                                    <img src="<?php echo e(asset('assets/img/icons/files/' . $attachment->extension . '.png')); ?>"
                                                        class="img-fluid" style="width: 40px;">
                                                </div>
                                                <div class="col ml-n2">
                                                    <h6 class="text-sm mb-0">
                                                        <a href="#"><?php echo e($attachment->name); ?></a>

                                                    </h6>
                                                    <p class="card-text small text-muted"><?php echo e($attachment->file_size); ?></p>
                                                </div>
                                                <div class="col-auto actions">

                                                    <a href="<?php echo e($logo . $attachment->file); ?>" target="_blank"
                                                        class="action-item" role="button">
                                                        <i class="fas fa-eye"></i>
                                                    </a>

                                                    <a href="<?php echo e($logo . $attachment->file); ?>" download
                                                        class="action-item" role="button">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php else: ?>
                                <div class="py-5">
                                    <h6 class="h6 text-center"><?php echo e(__('No Attachments Found.')); ?></h6>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabs-6" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0"><?php echo e(__('Task')); ?></h5>
                    </div>
                    <div class="card-body">
                        <div class="mh-500 min-h-500 card-wrapper  p-3   table_scroll row" style="overflow: auto; ">
                            <?php $__currentLoopData = $stages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $stage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="card-list card-list-flush col-3">
                                    <div class="card-list-title row align-items-center mb-3">
                                        <div class="col">
                                            <h6 class="mb-0"><?php echo e($stage->name); ?></h6>

                                        </div>
                                    </div>
                                    <div class="card-list-body task-list-items" id="task-list-<?php echo e($stage->id); ?>" data-status="<?php echo e($stage->id); ?>">
                                        <?php $__currentLoopData = $stage->tasks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $taskDetail): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                            <div class="card card-progress  border shadow-none" id="<?php echo e($taskDetail->id); ?>">
                                                <div class="card-body">
                                                    <div class="row align-items-center mb-2">
                                                        <div class="col-6">
                                                            <span class="badge badge-pill badge-xs badge-<?php echo e(\App\Models\ProjectTask::$priority_color[$taskDetail->priority]); ?>"><?php echo e(__(\App\Models\ProjectTask::$priority[$taskDetail->priority])); ?></span>
                                                        </div>

                                                        <div class="col-6 text-right">
                                                            <?php if(str_replace('%','',$taskDetail->taskProgress()['percentage']) > 0): ?><span class="text-sm"><?php echo e($taskDetail->taskProgress()['percentage']); ?></span><?php endif; ?>

                                                        </div>
                                                    </div>

                                                        <span class="h6 task-name-break" data-url="<?php echo e(route('projects.task.show',[$project->id,$taskDetail->id])); ?>"><?php echo e($taskDetail->title); ?></span>

                                                    <div class="row align-items-center">
                                                        <div class="col-12">
                                                            <div class="actions d-inline-block">
                                                                <?php if(count($taskDetail->taskFiles) > 0): ?>
                                                                    <div class="action-item mr-2"><i class="fas fa-paperclip mr-2"></i><?php echo e(count($taskDetail->taskFiles)); ?></div><?php endif; ?>
                                                                <?php if(count($taskDetail->comments) > 0): ?>
                                                                    <div class="action-item mr-2"><i class="fas fa-comment-alt mr-2"></i><?php echo e(count($taskDetail->comments)); ?></div><?php endif; ?>
                                                                <?php if($taskDetail->checklist->count() > 0): ?>
                                                                    <div class="action-item mr-2"><i class="fas fa-tasks mr-2"></i><?php echo e($taskDetail->countTaskChecklist()); ?></div><?php endif; ?>
                                                            </div>
                                                        </div>
                                                        <div class="col-5"><?php if(!empty($taskDetail->end_date) && $taskDetail->end_date != '0000-00-00'): ?><small <?php if(strtotime($taskDetail->end_date) < time()): ?>class="text-danger"<?php endif; ?>><?php echo e(\App\Models\Utility::getDateFormated($taskDetail->end_date)); ?></small><?php endif; ?></div>
                                                        <div class="col-7 text-right">
                                                            <?php if($users = $taskDetail->users()): ?>
                                                                <div class="avatar-group">
                                                                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <?php if($key<3): ?>
                                                                            <a href="" class="avatar rounded-circle avatar-sm">
                                                                                    <?php if($user->avatar): ?>
                                                                                    <img  src="<?php echo e($logo_path.$user->avatar); ?>" title="<?php echo e($user->name); ?>"  >
                                                                                    <?php else: ?>
                                                                                    <img <?php echo e($user->img_avatar); ?> title="<?php echo e($user->name); ?>">
                                                                                    <?php endif; ?>
                                                                            </a>
                                                                        <?php else: ?>
                                                                            <?php break; ?>
                                                                        <?php endif; ?>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php if(count($users) > 3): ?>
                                                                        <a href="#" class="avatar rounded-circle avatar-sm">
                                                                            <img avatar="+ <?php echo e(count($users)-3); ?>">
                                                                        </a>
                                                                    <?php endif; ?>
                                                                </div>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <span class="empty-container" data-placeholder="<?php echo e(__('Empty')); ?>"></span>
                                    </div>
                                </div>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>

                    </div>
                </div>
            </div>

            <div id="tabs-7" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0"><?php echo e(__('Tracker details')); ?></h5>
                    </div>
                    <div class="card-body">
                        
                            
                                
                                    
                                        <div class="table-responsive">
                                            <table class="table table-striped data-table">
                                                <thead>
                                                <tr>
                                                    <th> <?php echo e(__('Description')); ?></th>
                                                    <th> <?php echo e(__('Task')); ?></th>
                                                    <th> <?php echo e(__('Start Time')); ?></th>
                                                    <th> <?php echo e(__('End Time')); ?></th>
                                                    <th><?php echo e(__('Total Time')); ?></th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php $__empty_1 = true; $__currentLoopData = $treckers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $trecker): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                                    <?php
                                                        $total_name = Utility::second_to_time($trecker->total_time);

                                                    ?>
                                                    <tr>
                                                        <td><?php echo e(isset($trecker->name)?$trecker->name:' - '); ?></td>
                                                        <td><?php echo e(isset($trecker->tasks->name)?$trecker->tasks->name:' - '); ?></td>
                                                        <td><?php echo e(date("H:i:s",strtotime($trecker->start_time))); ?></td>
                                                        <td><?php echo e(date("H:i:s",strtotime($trecker->end_time))); ?></td>
                                                        <td><?php echo e($total_name); ?></td>
                                                        <td>
                                                            <img alt="Image placeholder" src="<?php echo e(asset('assets/img/gallery.png')); ?>" class="avatar view-images rounded-circle avatar-sm" data-toggle="tooltip" data-original-title="<?php echo e(__('View Screenshot images')); ?>" style="height: 25px;width:24px;margin-right:10px;cursor: pointer;" data-id="<?php echo e($trecker->id); ?>" id="track-images-<?php echo e($trecker->id); ?>" >

                                                        </td>
                                                    </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                                    <tr>
                                                        <td colspan="5" class="text-center"> <?php echo e(__("No Record")); ?></td>
                                                    </tr>
                                                <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    
                                
                            
                        
                    </div>
                </div>
            </div>

            <div id="tabs-8" class="tabs-card d-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="h6 mb-0"><?php echo e(__('Timesheet')); ?></h5>
                    </div>
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-6 weekly-dates-div pt-1">
                                <a href="#" class="action-item previous"><i class="fas fa-arrow-left"></i></a>
                                <span class="weekly-dates"></span>
                                <input type="hidden" id="weeknumber" value="0">
                                <input type="hidden" id="selected_dates">
                                <a href="#" class="action-item next"><i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card-wrapper project-timesheet overflow-auto "></div>
                    <div class="text-center notfound-timesheet">
                        <div class="empty-project-text text-center p-3 min-h-300">
                            <h5 class="pt-5"><?php echo e(__("We couldn't find any data")); ?></h5>
                            <p class="m-0"><?php echo e(__("Sorry we can't find any timesheet records on this week.")); ?></p>
                            <p class="m-0"><?php echo e(__("To add timesheet record go to Add Task on Timesheet")); ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="card">
                <div class="list-group list-group-flush" id="tabs">

                    <?php if(isset($result->basic_details) && $result->basic_details == 'on'): ?>
                        <div data-href="#tabs-1" class="list-group-item group_list text-primary">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Basic details')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->member) && $result->member == 'on'): ?>
                        <div data-href="#tabs-2" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Member')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->milestone) && $result->milestone == 'on'): ?>
                        <div data-href="#tabs-3" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Milestone')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->activity) && $result->activity == 'on'): ?>
                        <div data-href="#tabs-4" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Activity')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->attachment) && $result->attachment == 'on'): ?>
                        <div data-href="#tabs-5" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Attachment')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->task) && $result->task == 'on'): ?>
                        <div data-href="#tabs-6" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Task')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->tracker_details) && $result->tracker_details == 'on'): ?>
                        <div data-href="#tabs-7" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Tracker details')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(isset($result->timesheet) && $result->timesheet == 'on'): ?>
                        <div data-href="#tabs-8" class="list-group-item group_list">
                            <div class="media">
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Timesheet')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                </div>
            </div>
        </div>

    </div>
<?php $__env->stopSection(); ?>
</section>
<?php $__env->startPush('script'); ?>
    <script src="<?php echo e(asset('assets/js/letter.avatar.js')); ?>"></script>

    <script>
        LetterAvatar.transform();
    </script>
    <script>
        // For Sidebar Tabs
        $(document).ready(function() {
            $('.group_list').on('click', function() {
                var href = $(this).attr('data-href');
                $('.tabs-card').addClass('d-none');
                $(href).removeClass('d-none');
                $('#tabs .group_list').removeClass('text-primary');
                $(this).addClass('text-primary');
            });
        });



        $(document).on('click', '.custom-control-input', function() {
            var pp = $(this).parents('.tabs-card').removeClass('d-none');
        });


    </script>

    
    <script>

            function ajaxFilterTimesheetTableView() {
            var mainEle = $('.project-timesheet');
            var notfound = $('.notfound-timesheet');
            var week = parseInt($('#weeknumber').val());
            var project_id = '<?php echo e($project->id); ?>'   ;
            var isowner = $('.owner-timesheet-status').prop('checked');
            var data = {
                week: week,
                project_id: project_id,
            }
            data.isowner = isowner;

            $.ajax({
                url: '<?php echo e(route('filter.timesheet.table.view')); ?>',
                data: data,
                success: function (data) {
                    $('.weekly-dates-div .weekly-dates').text(data.onewWeekDate);
                    $('.weekly-dates-div #selected_dates').val(data.selectedDate);

                    $.each(data.sectiontasks, function (i, item) {

                        var optionhtml = '';

                        if (item.section_id != 0 && item.section_name != '' && item.tasks.length > 0) {
                            optionhtml += `<a href="#" class="dropdown-item select-sub-heading" data-tasks-count="` + item.tasks.length + `">` + item.section_name + `</a>`;
                        }
                        $.each(item.tasks, function (ji, jitem) {
                            optionhtml += `<a href="#" class="dropdown-item select-task" data-task-id="` + jitem.task_id + `">` + jitem.task_name + `</a>`;
                        });
                    });

                    if (data.totalrecords == 0) {
                        mainEle.hide();
                        notfound.css('display', 'block');
                    } else {
                        notfound.hide();
                        mainEle.show();
                    }

                    mainEle.html(data.html);
                }
            });
        }

        $(function () {
            ajaxFilterTimesheetTableView();
        });

        $(document).on('click', '.weekly-dates-div .action-item', function () {
            var weeknumber = parseInt($('#weeknumber').val());
            if ($(this).hasClass('previous')) {
                weeknumber--;
                $('#weeknumber').val(weeknumber);
            } else if ($(this).hasClass('next')) {
                weeknumber++;
                $('#weeknumber').val(weeknumber);
            }
            ajaxFilterTimesheetTableView();
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.invoicepayheader', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/projects/copylink.blade.php ENDPATH**/ ?>