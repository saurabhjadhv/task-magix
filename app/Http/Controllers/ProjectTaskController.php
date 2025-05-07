<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use App\Models\Project;
use App\Models\ProjectTask;
use App\Models\ProjectTaskTimer;
use App\Models\TaskChecklist;
use App\Models\TaskComment;
use App\Models\TaskFile;
use App\Models\TaskStage;
use App\Models\Timesheet;
use App\Models\Utility;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Spatie\GoogleCalendar\Event;
use Illuminate\Support\Facades\Log;

class ProjectTaskController extends Controller
{
    public function index($project_id)
    {
        $usr = \Auth::user();

        if ($usr->type != 'admin') {
            $project = Project::find($project_id);
            $stages = TaskStage::where('project_id', '=', $project_id)->orderBy('order')->get();
            if ($project) {
                foreach ($stages as &$status)
                {
                    $stageClass[] = 'task-list-' . $status->id;
                    $task = ProjectTask::where('project_id', '=', $project_id);

                    // check project is shared or owner
                    if ($usr->checkProject($project_id) == 'Shared') {
                        $task->whereRaw(
                            "find_in_set('" . $usr->id . "',assign_to)"
                        );
                    }
                    //end

                    $task->orderBy('order');
                    $status['tasks'] = $task->where('stage_id', '=', $status->id) ->get();
                }
                return view(
                    'tasks.index', compact('stages', 'stageClass', 'project')
                );
            } else {
                return redirect()->back()->with('error', __('Project Not Found.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($project_id, $stage_id)
    {
        $project = Project::find($project_id);
        $hrs = Project::projectHrs($project_id);
        $settings = Utility::settingsById();
        return view(
            'tasks.create', compact('project_id', 'stage_id', 'project', 'hrs','settings')
        );
    }

    public function store(Request $request, $project_id, $stage_id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'estimated_hrs' => 'required',
            'priority' => 'required',
            'start_date' => 'required',
            'end_date' => 'required|after_or_equal:start_date',
            'assign_to' => 'required',
         ], [
            'assign_to.required' => 'Task member required.',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->errors()->first());
        }

        $usr = Auth::user();
        $project = Project::find($project_id);
        $last_stage = $project->taskstages()->orderBy('order', 'DESC')->first()->id;

        $post = $request->all();
        $post['project_id'] = $project->id;
        $post['stage_id'] = $stage_id;
        $post['assign_to'] = $request->assign_to;


        if ($stage_id == $last_stage) {
            $post['is_complete'] = 1;
            $post['marked_at'] = date('Y-m-d');
        }
        $task = ProjectTask::create($post);

        // Make entry in activity log
        ActivityLog::create([
            'user_id' => $usr->id,
            'project_id' => $project_id,
            'task_id' => $task->id,
            'log_type' => 'Create Task',
            'remark' => json_encode(['title' => $task->title]),
        ]);

        // Send Mail
        $arrTaskUser = $task->users()->pluck('email', 'id')->toArray();

        $tArr = [
            'task_name' => $task->title,
            'task_priority' => ProjectTask::$priority[$task->priority],
            'task_project' => $task->project->title,
            'task_stage' => $task->stage->name,

        ];
        $resp = Utility::sendEmailTemplate(
            'Task Assigned',
            $arrTaskUser,
            $tArr,
            $project_id
        );
        $settings = Utility::settingsById(Auth::user()->id);
        $user = Auth::user();

        $uArr = [
            'task_name' => $task->title,
            'project_name' => $project->title,
            'task_priority'  => ProjectTask::$priority[$task->priority],
            'task_project' => $task->project->title,
            'task_stage' => $task->stage->name,
            'owner_name' => Auth::user()->name,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
        ];
        if (isset($settings['task_notification']) && $settings['task_notification'] == 1 ) {
            Utility::send_slack_msg('new_task',$uArr, $user->id);
        }
        if (isset($settings['telegram_task_notification']) &&$settings['telegram_task_notification'] == 1) {
            Utility::send_telegram_msg('new_task',$uArr, $user->id);
        }


        //webhook
        $module ='New Task';

        $webhook=  Utility::webhookSetting($module);
        if($webhook)
        {
            $parameter = json_encode($task);
            // 1 parameter is  URL , 2 parameter is data , 3 parameter is method
            $status = Utility::WebhookCall($webhook['url'],$parameter,$webhook['method']);
            if($status != true)
            {
                $msg= "Webhook call failed.";
            }
        }

        // if($request->get('synchronize_type')=='google_calender'){

        //     $type ='task';
        //     $request1 = new ProjectTask();
        //     $request1->title=$request->title;
        //     $request1->start_date=$request->start_date;
        //     $request1->end_date=$request->end_date;

        //     Utility::addCalendarData($request1, $type);
        // }
        
        // Log incoming request data for Calendar synchronization if the option is selected
    if ($request->get('synchronize_type') === 'google_calender') {
        Log::info('Preparing to synchronize task with Google Calendar', [
            'project_id' => $project_id,
            'title' => $request->title,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
        ]);

        try {
            $type = 'task';
            $request1 = new ProjectTask();
            $request1->title = $request->title;
            $request1->start_date = $request->start_date;
            $request1->end_date = $request->end_date;

            // Log the attempt to add calendar data
            Utility::addCalendarData($request1, $type);
            Log::info('Task successfully synchronized with Google Calendar', [
                'task_title' => $request1->title
            ]);
        } catch (\Exception $e) {
            // Log the exception for calendar synchronization
            Log::error('Error while synchronizing task with Google Calendar', [
                'task_title' => $request1->title,
                'exception_message' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return redirect()->back()->with('error', 'An error occurred while synchronizing with Google Calendar.');
        }
    }

        return redirect() ->back() ->with('success', __('Task Added Successfully.'). ((isset($msg) ? '<br> <span class="text-danger">' . $msg . '</span>' : '')));
    }

    public function show($project_id, $task_id)
    {
        $task = ProjectTask::find($task_id);
        $allow_progress = Project::find($project_id);

        if ($allow_progress && $task) {
            $allow_progress = $allow_progress->task_progress;

            return view('tasks.show', compact('task', 'allow_progress'));

        } else {
            return redirect() ->back() ->with('error', __('Task Not Found.'));
        }
    }


    public function edit($project_id, $task_id)
    {
        $project = Project::find($project_id);
        $task = ProjectTask::find($task_id);
        $hrs = Project::projectHrs($project_id);

        if ($project && $task) {
            return view('tasks.edit', compact('project', 'task', 'hrs'));
        } else {
            return redirect()->back()->with('error', __('Task Not Found.'));
        }
    }

    public function update(Request $request, $project_id, $task_id)
    {

        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'estimated_hrs' => 'required',
            'priority' => 'required',
            'start_date' => 'required',
            'end_date' => 'required|after_or_equal:start_date',
            'assign_to' => 'required',
         ], [
            'assign_to.required' => 'Task member required.',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->errors()->first());
        }

        $post = $request->all();
        $task = ProjectTask::find($task_id);
        $task->update($post);

        return redirect()->back()->with('success', __('Task Updated Successfully.'));
    }

    public function destroy($project_id, $task_id)
    {
        ProjectTask::deleteTask([$task_id]);

        echo json_encode(['task_id' => $task_id]);
    }

    // Check Task When delete
    public function getStageTasks(Request $request, $stage_id)
    {
        $count = ProjectTask::where('stage_id', $stage_id)->count();

        echo json_encode($count);
    }

    // When Task Move or change task order
    public function taskOrderUpdate(Request $request, $project_id)
    {
        $user = \Auth::user();

        $project = Project::find($project_id);

        // Save data as per order
        if (isset($request->sort)) {
            foreach ($request->sort as $index => $taskID) {
                if (!empty($taskID)) {
                    echo $index . '-' . $taskID;
                    $task = ProjectTask::find($taskID);
                    $task->order = $index;
                    $task->save();
                }
            }
        }

        // Update Task Stage
        if ($request->new_stage != $request->old_stage) {
            $new_stage = TaskStage::find($request->new_stage);
            $old_stage = TaskStage::find($request->old_stage);
            $last_stage = $project->taskstages()->orderBy('order', 'DESC')->first()->id;

            $task = ProjectTask::find($request->id);
            if ($task) {
                $task->stage_id = $request->new_stage;
                if ($request->new_stage == $last_stage) {
                    $task->is_complete = 1;
                    $task->marked_at = date('Y-m-d');
                } else {
                    $task->is_complete = 0;
                    $task->marked_at = null;
                }
                $task->save();

                $settings = Utility::settingsById(Auth::user()->id);
                $user = Auth::user();

                $uArr = [
                    'task_name' => $task->title,
                    'new_stage' => $request->new_stage,
                    'old_stage' => $request->old_stage,
                    'task_priority'  => ProjectTask::$priority[$task->priority],
                    'task_project' => $task->project->title,

                ];
                if (isset($settings['task_move_notificaation']) && $settings['task_move_notificaation'] == 1) {
                    Utility::send_slack_msg('task_stage_updated',$uArr, $user->id);

                }

                if (isset($settings['telegram_task_move_notificaation']) && $settings['telegram_task_move_notificaation'] == 1) {
                    Utility::send_telegram_msg('task_stage_updated',$uArr, $user->id);
                }

                //webhook
                $module ='Task Stage Updated';

                $webhook=  Utility::webhookSetting($module);
                if($webhook)
                {
                    $parameter = json_encode($task);
                    // 1 parameter is  URL , 2 parameter is data , 3 parameter is method
                    $status = Utility::WebhookCall($webhook['url'],$parameter,$webhook['method']);
                }


                // Make Entry in activity log
                ActivityLog::create([
                    'user_id' => $user->id,
                    'project_id' => $project_id,
                    'task_id' => $request->id,
                    'log_type' => 'Move Task',
                    'remark' => json_encode([
                        'title' => $task->title,
                        'old_stage' => $old_stage->name,
                        'new_stage' => $new_stage->name,
                    ]),
                ]);

                return $task->toJson();
            }
        }
    }

    // Task Comments
    public function commentStore(Request $request, $projectID, $taskID)
    {
        $post = [];
        $post['task_id'] = $taskID;
        $post['comment'] = $request->comment;
        $post['created_by'] = \Auth::user()->id;
        $post['user_type'] = 'User';

        $comment = TaskComment::create($post);
        $user = $comment->user;

        $comment->deleteUrl = route('comment.destroy', [
            $projectID, $taskID,$comment->id,
        ]);

        return $comment->toJson();
    }

    public function commentDestroy(
        Request $request, $projectID, $taskID, $commentID ) {
        $comment = TaskComment::find($commentID);
        $comment->delete();

        return 'true';
    }

    // Task files
    public function commentStoreFile(Request $request, $projectID, $taskID)
    {
        $imageSize = round($request->file->getSize() / 1024, 2) . ' MB';
        $request->validate(['file' => 'required']);
        $fileName =
            $taskID . time() . '_' . $request->file->getClientOriginalName();
        $dir = 'tasks/';

        $image_size = $request->file('file')->getSize();
        $result = Utility::updateStorageLimit(\Auth::user()->creatorId(), $image_size);
        if($result==1)
        {
            $path = Utility::upload_file($request, 'file', $fileName, $dir, []);

            if ($path['flag'] == 1) {
                $file = $path['url'];
            } else {
                return $TaskFile->toJson();
                return redirect() ->back()->with('error', __($path['msg']));
            }
        }

        //$request->file->storeAs('tasks', $fileName);
        $post['task_id'] = $taskID;
        $post['file'] = $fileName;
        $post['name'] = $request->file->getClientOriginalName();
        $post['extension'] = $request->file->getClientOriginalExtension();
        $post['file_size'] = $imageSize;
        $post['created_by'] = \Auth::user()->id;
        $post['user_type'] = 'User';
        $TaskFile = TaskFile::create($post);
        $user = $TaskFile->user;
        $TaskFile->deleteUrl = '';
        $TaskFile->deleteUrl = route('comment.destroy.file', [
            $projectID, $taskID, $TaskFile->id,
        ]);

        if($result != 1){
            $TaskFile->delete();
        }
        return $TaskFile->toJson();

    }

    public function commentDestroyFile(
        Request $request,
        $projectID, $taskID, $fileID
    ) {
        $commentFile = TaskFile::find($fileID);

        $logo = Utility::get_file('tasks/');
        $path = $logo . $commentFile->file;
        $file_path = 'tasks/'.$commentFile->file;
        $result = Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);
        // $path        = storage_path('tasks/' . $commentFile->file);
        // if (file_exists($path)) {
        //     \File::delete($path);
        // }
        $commentFile->delete();

        return 'true';
    }

    // Task Checklist
    public function checklistStore(Request $request, $projectID, $taskID)
    {
        $request->validate(['name' => 'required']);

        $post = [];
        $post['name'] = $request->name;
        $post['task_id'] = $taskID;
        $post['user_type'] = 'User';
        $post['created_by'] = \Auth::user()->id;
        $post['status'] = 0;

        $checkList = TaskChecklist::create($post);
        $user = $checkList->user;
        $checkList->updateUrl = route('checklist.update', [
            $projectID,
            $checkList->id,
        ]);
        $checkList->deleteUrl = route('checklist.destroy', [
            $projectID,
            $checkList->id,
        ]);

        return $checkList->toJson();
    }

    public function checklistUpdate($projectID, $checklistID)
    {
        $checkList = TaskChecklist::find($checklistID);
        if ($checkList->status == 0) {
            $checkList->status = 1;
        } else {
            $checkList->status = 0;
        }
        $checkList->save();

        return $checkList->toJson();
    }

    public function checklistDestroy($projectID, $checklistID)
    {
        $checkList = TaskChecklist::find($checklistID);
        $checkList->delete();

        return 'true';
    }

    // For Favorite
    public function changeFav($projectID, $taskId)
    {
        $task = ProjectTask::find($taskId);
        if ($task->is_favourite == 0) {
            $task->is_favourite = 1;
        } else {
            $task->is_favourite = 0;
        }

        $task->save();

        return [
            'fav' => $task->is_favourite,
        ];
    }

    // For Complete
    public function changeCom($projectID, $taskId)
    {
        $project = Project::find($projectID);
        $task = ProjectTask::find($taskId);
        if ($task->is_complete == 0) {
            $last_stage = $project->taskstages()->orderBy('order', 'DESC')->first();
            $task->is_complete = 1;
            $task->marked_at = date('Y-m-d');
            $task->stage_id = $last_stage->id;
        } else {
            $first_stage = $project ->taskstages()->orderBy('order', 'ASC')->first();
            $task->is_complete = 0;
            $task->marked_at = null;
            $task->stage_id = $first_stage->id;
        }

        $task->save();

        return [
            'com'   => $task->is_complete,
            'task'  => $task->id,
            'stage' => $task->stage_id,
        ];
    }

    // For Change Progress
    public function changeProg(Request $request, $projectID, $taskId)
    {
        $task = ProjectTask::find($taskId);
        $task->progress = $request->progress;
        $task->save();

        return ['task_id' => $taskId];
    }

    // For Realod Task Section
    public function taskGet($task_id)
    {
        $task = ProjectTask::find($task_id);
        $permissions = Auth::user()->getPermission($task->project_id);

        $html = '';
        $html .='<div class="card-body"><div class="row align-items-center mb-2">';
        $html .= '<div class="col-6">';
        $html .='<span class="badge badge-pill badge-xs badge-' . ProjectTask::$priority_color[$task->priority] . '">' .
            ProjectTask::$priority[$task->priority] .'</span>';
        $html .= '</div>';
        $html .= '<div class="col-6 text-right">';
        if (str_replace('%', '', $task->taskProgress()['percentage']) > 0) {
            $html .='<span class="text-sm">' .$task->taskProgress()['percentage'] .'</span>';
        }
        if (
            isset($permissions) &&
            (in_array('show task', $permissions) ||
                in_array('edit task', $permissions) ||
                in_array('delete task', $permissions))
        ) {
            $html .= '<div class="dropdown action-item">
                                                        <a href="#" class="action-item" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">';
            if (isset($permissions) && in_array('show task', $permissions)) {
                $html .=
                    '<a href="#" data-url="' .route('projects.tasks.show', [
                        $task->project_id,$task->id,
                    ]) .
                    '" data-ajax-popup-right="true" class="dropdown-item">' .__('View') .'</a>';
            }
            if (isset($permissions) && in_array('edit task', $permissions)) {
                $html .=
                    '<a href="#" data-url="' .
                    route('projects.tasks.edit', [
                        $task->project_id,$task->id,
                    ]) .
                    '" data-ajax-popup="true" data-size="lg" data-title="' .__('Edit ') .$task->name .'" class="dropdown-item">' .__('Edit') .'</a>';
            }
            if (isset($permissions) && in_array('delete task', $permissions)) {
                $html .=
                    '<a href="#" class="dropdown-item del_task" data-url="' .route('projects.tasks.destroy', [$task->project_id,$task->id,]) .'">' .__('Delete') .'</a>';
            }
            $html .= '                                 </div>
                                                    </div>
                                                </div>';
            $html .= '</div>';
        }
        $html .= '<a class="h6" href="#" data-url="' .
            route('projects.tasks.show', [$task->project_id, $task->id]) . '" data-ajax-popup-right="true">' .
            $task->name . '</a>';
        $html .= '<div class="row align-items-center">';
        $html .= '<div class="col-12">';
        $html .= '<div class="actions d-inline-block">';
        if (count($task->taskFiles) > 0) {
            $html .= '<div class="action-item mr-2"><i class="fas fa-paperclip mr-2"></i>' .
                count($task->taskFiles) .
                '</div>';
        }
        if (count($task->comments) > 0) {
            $html .= '<div class="action-item mr-2"><i class="fas fa-comment-alt mr-2"></i>' .
                count($task->comments) .
                '</div>';
        }
        if ($task->checklist->count() > 0) {
            $html .= '<div class="action-item mr-2"><i class="fas fa-tasks mr-2"></i>' .
                $task->countTaskChecklist() .
                '</div>';
        }
        $html .= '</div>';
        $html .= '</div>';
        $html .= '<div class="col-5">';
        if (!empty($task->end_date) && $task->end_date != '0000-00-00') {
            $clr = strtotime($task->end_date) < time() ? 'text-danger' : '';
            $html .= '<small class="' .  $clr . '">' . date('d M Y', strtotime($task->end_date)) . '</small>';
        }
        $html .= '</div>';
        $html .= '<div class="col-7 text-right">';
        $images_path = Utility::get_file('/');
        if ($users = $task->users()) {
            $html .= '<div class="avatar-group">';
            foreach ($users as $key => $user) {
                $path = $images_path . $user->avatar;
                $avatar = $user->avatar? 'src="' . $path . '"' : 'avatar="' . $user->img_avatar . '"';

                if ($key < 3) {
                    $html .= ' <a href="#" class="avatar rounded-circle avatar-sm">';
                    $html .= '<img ' . $avatar . ' title="' . $user->name . '">';
                    $html .= '</a>';
                }
            }

            if (count($users) > 3) {
                $html .= '<a href="#" class="avatar rounded-circle avatar-sm"><img avatar="';
                $html .= count($users) - 3;
                $html .= '"></a>';
            }
            $html .= '</div>';
        }
        $html .= '</div></div></div>';

        print_r($html);
    }

    // For Priority Color
    public function updateTaskPriorityColor(Request $request)
    {
        $task_id = $request->input('task_id');
        $color = $request->input('color');

        $task = ProjectTask::find($task_id);

        if ($task && $color) {
            $task->priority_color = $color;
            $task->save();
        }
        echo json_encode(true);
    }

    public function getDefaultTaskInfo(Request $request, $task_id)
    {
        $response = [];
        $task = ProjectTask::find($task_id);
        if ($task) {
            $response['task_name'] = $task->title;
            $response['task_due_date'] = $task->due_date;
        }

        return json_encode($response);
    }

    // For Taskboard View
    public function taskBoard($view = 'list')
    {
        if (Auth::user()->type != 'admin') {
            return view('tasks.taskboard', compact('view'));
        } else {
            return redirect()
                ->back()
                ->with('error', __('Permission Denied.'));
        }
    }

    // For Load Task using ajax
    public function taskboardView(Request $request)
    {
        $usr = Auth::user();
        $user_projects = $usr->projects()->pluck('project_id')->toArray();
        if (
            $request->ajax() &&  $request->has('view') && $request->has('sort')
        ) {
            $sort = explode('-', $request->sort);
            $tasks = ProjectTask::whereIn('project_id', $user_projects)->orderBy($sort[0], $sort[1]);

            if (!empty($request->keyword)) {
                $tasks->where('title', 'LIKE', $request->keyword . '%');
            }

            if (!empty($request->status)) {
                $todaydate = date('Y-m-d');

                // For Optimization
                $status = $request->status;

                foreach ($status as $k => $v) {
                    if (
                        $v == 'due_today' ||
                        $v == 'over_due' ||
                        $v == 'starred' ||
                        $v == 'see_my_tasks'
                    ) {
                        unset($status[$k]);
                    }
                }
                // end

                if (count($status) > 0) {
                    $tasks->whereIn('priority', $status);
                }
                if (in_array('see_my_tasks', $request->status)) {
                    $tasks->whereRaw(
                        "find_in_set('" . $usr->id . "',assign_to)"
                    );
                }

                if (in_array('due_today', $request->status)) {
                    $tasks->where('end_date', $todaydate);
                }

                if (in_array('over_due', $request->status)) {
                    $tasks->where('end_date', '<', $todaydate);
                }

                if (in_array('starred', $request->status)) {
                    $tasks->where('is_favourite', '=', 1);
                }
            }

            $tasks = $tasks->get();

            $returnHTML = view(
                'tasks.' . $request->view,
                compact('tasks')
            )->render();

            return response()->json([
                'success' => true,
                'html' => $returnHTML,
            ]);
        }
    }

    // Calendar View
    public function calendarView(Request $request,$task_by, $project_id = NULL)
    {
        if (($request->get('calender_type') == 'google_calender') && ($request->get('project_id') == null)) {
        $arrMeeting = [];


            $type ='task';
            $arrMeeting = Utility::getCalendarData($type);
            // $data = Event::get();

            return $arrMeeting;
        }elseif(($request->get('calender_type') == 'local_calender') || ($request->get('calender_type') == 'google_calender') && ($request->get('project_id') !== null) )

            {

        $usr = Auth::user();
        if($usr->type != 'admin')
        {
            $project_id = $request->get('project_id');
            $user_projects = $usr->projects()->pluck('project_id')->toArray();
            $user_projects = (!empty($project_id) && $project_id > 0) ? [$project_id] : $user_projects;

            $tasks = ProjectTask::whereIn('project_id', $user_projects);

            if($task_by == 'my')
            {
                $tasks->whereRaw("find_in_set('" . $usr->id . "',assign_to)");
            }

            // if ($project_id) {
                //     $tasks->where('tasks.project_id', '=', $project_id);
                //     // $events->where('tasks.project_id', '=', $project_id);
                // }
            $tasks    = $tasks->get();
            $arrTasks = [];

            foreach($tasks as $task)
            {
                $arTasks = [];
                if((!empty($task->start_date) && $task->start_date != '0000-00-00') || !empty($task->end_date) && $task->end_date != '0000-00-00')
                {
                    $arTasks['id']    = $task->id;
                    $arTasks['title'] = $task->title;

                    if(!empty($task->start_date) && $task->start_date != '0000-00-00')
                    {
                        $arTasks['start'] = $task->start_date;
                    }
                    elseif(!empty($task->end_date) && $task->end_date != '0000-00-00')
                    {
                        $arTasks['start'] = $task->end_date;
                    }

                    if(!empty($task->end_date) && $task->end_date != '0000-00-00')
                    {
                        $arTasks['end'] = $task->end_date;
                    }
                    elseif(!empty($task->start_date) && $task->start_date != '0000-00-00')
                    {
                        $arTasks['end'] = $task->start_date;
                    }

                    $arTasks['allDay']      = !0;
                    $arTasks['className']   = 'bg-' . ProjectTask::$priority_color[$task->priority];
                    $arTasks['description'] = $task->description;
                    $arTasks['url']         = route('task.calendar.show', $task->id);
                    $arTasks['resize_url']  = route('task.calendar.drag', $task->id);
                    $arrTasks[] = $arTasks;
                }
            }

            return $arrTasks;
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
        }
        else{
        $usr = Auth::user();
        if($usr->type != 'admin')
        {
            $user_projects = $usr->projects()->pluck('project_id')->toArray();
            $user_projects = (!empty($project_id) && $project_id > 0) ? [$project_id] : $user_projects;

            $tasks = ProjectTask::whereIn('project_id', $user_projects);
            if($task_by == 'my')
            {
                $tasks->whereRaw("find_in_set('" . $usr->id . "',assign_to)");
            }
            $tasks    = $tasks->get();
            $arrTasks = [];

            foreach($tasks as $task)
            {
                $arTasks = [];
                if((!empty($task->start_date) && $task->start_date != '0000-00-00') || !empty($task->end_date) && $task->end_date != '0000-00-00')
                {
                    $arTasks['id']    = $task->id;
                    $arTasks['title'] = $task->name;

                        if(!empty($task->start_date) && $task->start_date != '0000-00-00')
                        {
                            $arTasks['start'] = $task->start_date;
                        }
                        elseif(!empty($task->end_date) && $task->end_date != '0000-00-00')
                        {
                            $arTasks['start'] = $task->end_date;
                        }

                        if(!empty($task->end_date) && $task->end_date != '0000-00-00')
                        {
                            $arTasks['end'] = $task->end_date;
                        }
                        elseif(!empty($task->start_date) && $task->start_date != '0000-00-00')
                        {
                            $arTasks['end'] = $task->start_date;
                        }

                    $arTasks['allDay']      = !0;
                    $arTasks['className']   = 'bg-' . ProjectTask::$priority_color[$task->priority];
                    $arTasks['description'] = $task->description;
                    $arTasks['url']         = route('task.calendar.show', $task->id);
                    $arTasks['resize_url']  = route('task.calendar.drag', $task->id);

                    $arrTasks[] = $arTasks;
                }
            }

            return view('tasks.calendar', compact('arrTasks', 'project_id', 'task_by'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }


    }
    }

    // Calendar Show
    public function calendarShow($id)
    {
        $task = ProjectTask::find($id);

        return view('tasks.calendar_show', compact('task'));
    }

    // Calendar Drag
    public function calendarDrag(Request $request, $id)
    {
        $task = ProjectTask::find($id);
        $task->start_date = $request->start;
        $task->end_date = $request->end;
        $task->save();
    }

  
    public function taskStart(Request $request)
    {
        $usr = Auth::user();
        $type = $request->type;
        $id = $request->id;
        $task = ProjectTask::find($id);
    
        // Get the timezone dynamically
        $timezone = Utility::getValByName('timezone') ?: 'UTC';
        date_default_timezone_set($timezone);
    
        if ($type == 'start') {
            if ($task->time_tracking == 1) {
                return response()->json([
                    'status' => 'error',
                    'msg'    => __('You cannot start multiple trackers.'),
                    'class'  => 'Error',
                ]);
            }
    
            $taskTimer = new ProjectTaskTimer();
            $taskTimer->task_id = $id;
            $taskTimer->start_time = Carbon::now()->toDateTimeString();
            $task->time_tracking = 1;
            $msg = __('Now your task timer has started');
    
            $taskTimer->save();
            $response['start_time'] = $taskTimer->start_time;
        } elseif ($type == 'stop') {
            $taskTimer = ProjectTaskTimer::where('task_id', $id)
                ->whereNotNull('start_time')
                ->whereNull('end_time')
                ->first();
    
            if (!$taskTimer) {
                return response()->json([
                    'status' => 'error',
                    'msg'    => __('No active timer found for this task.'),
                    'class'  => 'Error',
                ]);
            }
    
            $taskTimer->end_time = Carbon::now()->toDateTimeString();
            $task->time_tracking = 0;
            $msg = __('Now your task timer has stopped');
    
            $taskTimer->save();
    
            // Calculate duration
            $startTime = Carbon::parse($taskTimer->start_time);
            $endTime = Carbon::parse($taskTimer->end_time);
            $totalDuration = $startTime->diff($endTime)->format('%H:%I:%S');
    
            // Save to timesheet
            $timesheet = new Timesheet();
            $timesheet->project_id = $task->project_id;
            $timesheet->task_id = $task->id;
            $timesheet->date = $taskTimer->start_time;
            $timesheet->time = $totalDuration;
            $timesheet->created_by = $usr->id;
            $timesheet->save();
        }
    
        $task->save();
    
        return response()->json([
            'status' => 'success',
            'msg'    => $msg,
            'class'  => 'Success',
        ]);
    }
    

}
