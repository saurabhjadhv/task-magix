<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use App\Models\EmailTemplateLang;
use App\Models\Order;
use App\Models\Plan;
use App\Models\Project;
use App\Models\ProjectTask;
use App\Models\ProjectUser;
use App\Models\TaskFile;
use App\Models\Timesheet;
use App\Models\User;
use App\Models\UserContact;
use App\Models\UserToDo;
use App\Models\Utility;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\UserExport;
use App\Imports\UserImport;
use App\Models\Languages;
use Lab404\Impersonate\Impersonate;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($view = 'grid')
    {

        $authuser = Auth::user();

        if($authuser->type != 'admin')
        {
            $allow = false;
            $plan  = $authuser->getPlan();
            if($plan)
            {
                $countUsers = $authuser->contacts->count();
                if($countUsers < $plan->max_users || $plan->max_users == -1)
                {
                    $allow = true;
                }
            }

            //dd($countUsers);

            return view('users.index', compact('view', 'allow'));
        }
        else
        {

            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        return view('users.edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validatorArray = [
            'name' => 'required|max:120|regex:/^[a-zA-Z\s]+$/',
            'email' => 'required'
        ];

        $validator = Validator::make(
            $request->all(), $validatorArray
        );
        if($validator->fails())
        {
            return redirect()->back()->with('error', $validator->errors()->first());
        }

        $user = User::find($id);
        if(!empty($user))
        {
            $user->name         = $request->name;
            $user->email        = $request->email;
            $user->save();

            return redirect()->back()->with('success', __('User Successfully Updated.'));
        }
        return redirect()->back()->with('error', __('Something Is Wrong.'));
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);

        if($user && $user->is_active == 1)
        {
            // Delete From Project Task Table
            ProjectTask::removeAssigned($user->id);

            // Delete From Project User Table
            ProjectUser::where('user_id', '=', $id)->delete();

            User::where('created_by','=',$user->id)->delete();

            // Delete From Timesheet Table
            Timesheet::where('created_by', '=', $id)->delete();
            $user_contact = UserContact::where('parent_id', '=', Auth::user()->id)->where('user_id', '=', $user->id)->delete();

            $user->delete();

            return redirect()->back()->with('success', __('User Deleted Successfully.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Something Went Wrong.'));
        }
    }

    // User Filter
    // public function filterUserView(Request $request)
    // {
    //     $usr = Auth::user();

    //     if($request->ajax() && $request->has('view') && $request->has('role'))
    //     {
    //         $usr_contact = $usr->contacts();
    //         if($request->role == 'user')
    //         {
    //             $usr_contact->where('role', 'user');
    //         }
    //         elseif($request->role == 'client')
    //         {
    //             $usr_contact->where('role', 'client');
    //         }
    //         $usr_contact = $usr_contact->pluck('user_id')->toArray();
    //         $users       = User::whereIn('id', $usr_contact);

    //         if(!empty($request->keyword))
    //         {
    //             $users->where('name', 'LIKE', $request->keyword . '%')->orWhereRaw('FIND_IN_SET("' . $request->keyword . '",skills)');
    //         }

    //         $users      = $users->where('id', '!=', $usr->id)->get();
    //         $returnHTML = view('users.' . $request->view, compact('users'))->render();


    //         return response()->json([
    //                                     'success' => true,
    //                                     'html' => $returnHTML,
    //                                 ]);
    //     }
    // }

    public function filterUserView(Request $request)
{
    $usr = Auth::user();

    if($request->ajax() && $request->has('view') && $request->has('role'))
    {
        $usr_contact = $usr->contacts();
        if($request->role == 'user')
        {
            $usr_contact->where('role', 'user');
        }
        elseif($request->role == 'client')
        {
            $usr_contact->where('role', 'client');
        }
        $usr_contact = $usr_contact->pluck('user_id')->toArray();
        $users       = User::whereIn('id', $usr_contact);

        if(!empty($request->keyword))
        {
            $users->where('name', 'LIKE', $request->keyword . '%')->orWhereRaw('FIND_IN_SET("' . $request->keyword . '",skills)');
        }

        $users      = $users->where('id', '!=', $usr->id)->get();

        // Eager load the created_by users
        $createdByUserIds = User::where('created_by', $usr->id)->pluck('id')->toArray();

        // Get open task count for each user
        foreach ($users as $user) {
            $open_task_query = ProjectTask::where('is_complete', '=', 0);
            $raw_where = '';
            $bindings = [];

            $raw_where .= "find_in_set(?, assign_to)";
            $bindings[] = $user->id;

            $open_task_query->whereRaw('('.$raw_where.')', $bindings);

            $user->open_task_count = $open_task_query->count();
        }

        $returnHTML = view('users.' . $request->view, compact('users'))->render();

        return response()->json([
            'success' => true,
            'html' => $returnHTML,
        ]);
    }
}

    public function checkUserExists(Request $request)
    {
        $authuser   = Auth::user();
        $project_id = $request->project_id;
        $role       = $request->role;

        if(isset($request->email) && !empty($request->email))
        {
            $user = User::where('email', '=', $request->email)->first(); //->where('is_active', '=', 1)
        }
        else
        {
            $user = User::find($request->id);
        }

        $response = [
            'code' => 404,
            'status' => 'Error',
            'error' => __('This User is not connected with our system. Please fill out the below details to invite.'),
        ];

        if(!empty($user))
        {
            if(ProjectUser::where('project_id', $project_id)->where('user_id', $user->id)->exists())
            {
                $response['code']    = 202;
                $response['status']  = 'Success';
                $response['success'] = __('This User is already invited.');
            }
            else
            {
                $user->is_invited = 1;
                $user->save();

                // make entry in project_user tbl
                ProjectUser::create([
                                        'project_id' => $project_id,
                                        'user_id' => $user->id,
                                        'permission' => $role,
                                        'user_permission' => json_encode($authuser->getAllPermission()),
                                        'invited_by' => $authuser->id,
                                    ]);

                // make entry in user_contact tbl if not record is not exist
                $user_contact = UserContact::where('parent_id', '=', $authuser->id)->where('user_id', '=', $user->id)->count();
                if($user_contact == 0)
                {
                    UserContact::create([
                                            'parent_id' => $authuser->id,
                                            'user_id' => $user->id,
                                            'role' => $role,
                                        ]);
                }


                // make entry in activity_log tbl
                ActivityLog::create([
                                        'user_id' => $authuser->id,
                                        'project_id' => $project_id,
                                        'log_type' => 'Invite User',
                                        'remark' => json_encode(['title' => $user->name]),
                                    ]);

                // send mail
                $project = Project::find($project_id);
                $pArr    = [
                    'project_name' => $project->title,
                    'project_status' => Project::$status[$project->status],
                    'project_budget' => Utility::projectCurrencyFormat($project->id, $project->budget),
                    'project_hours' => number_format($project->estimated_hrs),
                ];

                $resp = Utility::sendEmailTemplate('Project Assigned', [$user->id => $user->email], $pArr, $project_id);
                $msg = ($role == 'user') ? __('User Invited Successfully.') : __('Client Invited Successfully.');

                $response = [
                    'code' => 200,
                    'status' => 'Success',
                    'success' => $msg . (($resp['is_success'] == false && !empty($resp['error'])) ? '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''),
                ];
            }
        }

        return json_encode($response);
    }

    public function profile()
    {
        $user   = Auth::user();
        $plans  = Plan::all();
        $orders = Order::select([
                            'orders.*',
                            'users.name as user_name',
                        ])->join('users', 'orders.user_id', '=', 'users.id')->orderBy('orders.created_at', 'DESC')->where('users.id', '=', $user->id)->get();
        $payment_setting = Utility::getAdminPaymentSetting();

        return view('users.profile', compact('user', 'plans', 'orders','payment_setting'));
    }

    public function updateProfile(Request $request)
    {
		
        $objUser = Auth::user();

         $validate = [];
    	 $messages = [];

        if($request->from == 'profile')
        {
            $validate = [
                'name' => 'required|max:60|regex:/^[a-zA-Z\s]+$/',
                'email' => 'required|email|unique:users,email,' . $objUser->id,
                'dob' => 'required|date|before:' . now()->format('Y-m-d'),
                'gender' => 'required',
                'phone' => 'required|numeric|digits:10',
            ];
			$messages = [
                'name.regex' => 'Name must be characters.',
                'dob.before' => 'The date of birth must be a date before today.',
            ];
        } elseif ($request->from == 'password') {
            $validate = [
                'old_password' => 'required',
                'password' => [
                    'required',
                    'min:8',
                    'regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/',
                    'different:old_password',
                    'confirmed', 
                ],
            ];
            $messages = [
                'password.regex' => 'The password must be 8-16 characters long and include at least one uppercase letter, one lowercase letter, one digit and one special character.',
                'password.different' => 'The new password must be different from the old password.',
                'password.confirmed' => 'The confirm password does not match.',
            ];
        }

        if(isset($request->avatar) && !empty($request->avatar))
        {
            $validate = [
                'avatar' => 'required|image',
            ];
			$messages = [
                'avatar.image' => 'Avatar must be image.',
            ];
        }

        if(isset($request->whatsapp) && !empty($request->whatsapp))
        {
			$validate = [
				'whatsapp' => 'nullable|numeric|digits_between:10,15',
			];
			$messages = [
				'whatsapp.numeric' => 'Whatsapp must be number.',
			];
        }
		
		if (isset($request->facebook) && !empty($request->facebook)) {
            $validate['facebook'] = ['required', 'regex:/^(https?:\/\/)?(www\.)?facebook\.com\/[a-zA-Z0-9(\.\?)?]/'];
            $messages = [
                'facebook.regex' => 'Please enter a valid Facebook profile URL.',
            ];
        }

        if (isset($request->instagram) && !empty($request->instagram)) {
            $validate['instagram'] = ['required', 'regex:/^(https?:\/\/)?(www\.)?instagram\.com\/[a-zA-Z0-9_.-]+$/'];
            $messages = [
                'instagram.regex' => 'Please enter a valid Instagram profile URL.',
            ];
        }

        if (isset($request->linkedin) && !empty($request->linkedin)) {
            $validate['linkedin'] = ['required', 'regex:/^(https?:\/\/)?(www\.)?linkedin\.com\/in\/[a-zA-Z0-9_-]+$/'];
            $messages = [
                'linkedin.regex' => 'Please enter a valid LinkedIn profile URL.',
            ];
        }

        $validator = Validator::make(
            $request->all(), $validate, $messages
        );


        if($validator->fails())
        {
            return redirect()->back()->with('error', $validator->errors()->first());
        }

        $post = $request->all();

        // Image Uploading
        if($request->avatar)
        {
            if(\Auth::user()->type == 'admin'){

                $file_path = $objUser->avatar;

                $dir = 'avatars/';
                $avatarName = $objUser->id . '_avatar' . time() . '.' . $request->avatar->getClientOriginalExtension();

                $path = Utility::upload_file($request,'avatar',$avatarName,$dir,[]);
                    if($path['flag'] == 1)
                    {
                        $post['avatar'] = 'avatars/' . $avatarName;
                        $avatar = $path['url'];
                    }
                    else{

                        return redirect()->back()->with('error', __($path['msg']));
                    }

            }
            else    {
                $file_path = $objUser->avatar;
                $image_size = $request->file('avatar')->getSize();
                $result = Utility::updateStorageLimit(\Auth::user()->creatorId(), $image_size);
                if($result == 1)
                {
                    Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);
                    $dir = 'avatars/';
                    $avatarName = $objUser->id . '_avatar' . time() . '.' . $request->avatar->getClientOriginalExtension();

                    $path = Utility::upload_file($request,'avatar',$avatarName,$dir,[]);
                        if($path['flag'] == 1)
                        {
                            $post['avatar'] = 'avatars/' . $avatarName;
                            $avatar = $path['url'];
                        }
                        else{

                            return redirect()->back()->with('error', __($path['msg']));
                        }
                }
            }
        }

        // Password Confirmation
        if($request->from == 'password')
        {
            $current_password = $objUser->password;
            if(!Hash::check($post['old_password'], $current_password))
            {
                return redirect()->back()->with('error', __('Please Enter Correct Current Password!'));
            }
            else
            {
                $post['password'] = Hash::make($request->password);
            }
        }

        $objUser->update($post);
        if($request->avatar)
        {
            return redirect()->back()->with('success', __('Avatar Updated Successfully.').((isset($result) && $result!= 1) ? '</br> <span class="text-danger">' . $result . '</span>' : ''));
        }
        elseif($request->from == 'profile')
        {
            return redirect()->back()->with('success', __('Profile Updated Successfully.'));
        }
        elseif($request->from == 'password')
        {
            return redirect()->back()->with('success', __('Password Updated Successfully.'));
        }
    }

    public function userInfo($id)
    {
        $user = User::find($id);

        if(Auth::user()->type != 'admin' && !empty($user))
        {
            $role = $user->usrRole();

            $usr_contacts = Auth::user()->contacts()->pluck('user_id')->toArray();

            // add logged user id
            array_unshift($usr_contacts, $id);

            if(in_array($id, $usr_contacts) && $user->is_active == 1)
            {
                $user_projects = $user->projects()->pluck('project_id')->toArray();
                $project_tasks = ProjectTask::whereIn('project_id', $user_projects)->whereRaw("find_in_set('" . $user->id . "',assign_to)")->get()->pluck('id')->toArray();
                $user_data     = [];

                // Users
                $auth_projects         = Auth::user()->projects()->pluck('project_id')->toArray();
                $user_data['projects'] = $user->projects()->whereIn('project_id', $auth_projects)->get();
                // End Users

                // Time Logged on Timesheet
                $arrTimesheet                   = Timesheet::where('created_by', '=', $user->id)->pluck('time')->toArray();
                $user_data['timesheet_timelog'] = Utility::calculateTimesheetHours($arrTimesheet);
                // end

                // Total Complete Task
                $total_task                 = count($project_tasks);
                $completed_task             = ProjectTask::whereIn('project_id', $user_projects)->where('is_complete', '=', 1)->whereRaw("find_in_set('" . $user->id . "',assign_to)")->count();
                $user_data['complete_task'] = number_format($completed_task) . '/' . number_format($total_task);
                // end

                // Total Open Task
                $open_task              = $user->usrCommonData()['open_task'];
                $user_data['open_task'] = number_format($open_task) . '/' . number_format($total_task);
                // end

                // Top 5 Due Tasks
                $user_data['due_task'] = ProjectTask::where('is_complete', '=', 0)->whereIn('project_id', $user_projects)->orderBy('end_date', 'DESC')->with('project')->limit(5)->get();
                // end

                // Attachments
                $all_tasks               = $project_tasks;
                $task_files              = TaskFile::whereIn('task_id', $all_tasks)->orderBy('id', 'DESC')->limit(5)->get();
                $user_data['task_files'] = $task_files;
                // end

                // Total Task Report
                $user_data['task_report'] = [
                    'done' => $completed_task,
                    'open' => $open_task,
                    'percentage' => Utility::getPercentage($completed_task, $total_task),
                ];
                // end

                // Timesheet Log Chart
                $user_data['timesheet_chart'] = $user->usrCommonData()['timesheet'];

                // end

                return view('users.info', compact('user', 'user_data', 'role'));
            }
            else
            {
                return redirect()->back()->with('error', __('Permission Denied.'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    // User To do module
    public function todo_store(Request $request)
    {
        $request->validate(['title' => 'required|max:120']);

        $post            = $request->all();
        $post['user_id'] = Auth::user()->id;
        $todo            = UserToDo::create($post);
        $todo->updateUrl = route('todo.update', [
            $todo->id,
        ]);
        $todo->deleteUrl = route('todo.destroy', [
            $todo->id,
        ]);

        return $todo->toJson();
    }

    public function todo_update($todo_id)
    {
        $user_todo              = UserToDo::find($todo_id);
        $user_todo->is_complete = $user_todo->is_complete == 0 ? 1 : 0;
        $user_todo->save();

        return $user_todo->toJson();
    }

    public function ExitCompany(Request $request)
    {
        \Auth::user()->leaveImpersonation($request->user());
        return redirect('/home');
    }

    public function CompanyInfo($id)
    {
        $userData = User::where('created_by',$id)->selectRaw('COUNT(*) as total_users, SUM(CASE WHEN is_disable = 0 THEN 1 ELSE 0 END) as disable_users, SUM(CASE WHEN is_disable = 1 THEN 1 ELSE 0 END) as active_users')->first();
        return view('users.companyinfo',compact('userData','id'));
    }

    public function UserUnable(Request $request)
    {
        User::where('id', $request->id)->update(['is_disable' => $request->is_disable]);
        $userData = User::where('created_by',$request->company_id)->selectRaw('COUNT(*) as total_users, SUM(CASE WHEN is_disable = 0 THEN 1 ELSE 0 END) as disable_users, SUM(CASE WHEN is_disable = 1 THEN 1 ELSE 0 END) as active_users, id')->first();
        if($request->is_disable == 1)
        {
            return response()->json(['success' => __('Successfully Unable.'),'userData' => $userData]);
        }else
        {
            return response()->json(['success' => __('Successfully Disable.'),'userData' => $userData]);
        }
    }

    public function LoginWithCompany(Request $request, User $user,  $id)
    {
        $user = User::find($id);
        if ($user && auth()->check()) {
            Impersonate::take($request->user(), $user);
            return redirect('/home');
        }
    }

    public function todo_destroy($id)
    {
        $todo = UserToDo::find($id);
        $todo->delete();

        return true;
    }

    // change mode 'dark or light'
    public function changeMode()
    {
        $usr            = Auth::user();
        $usr->mode      = $usr->mode == 'light' ? 'dark' : 'light';
        $usr->dark_mode = $usr->dark_mode == 'light' ? 1 : 0;
        $usr->save();

        return redirect()->back();
    }

    // Main Search
    public function search(Request $request)
    {
        $html          = '';

        if(!is_null(Auth::user()->projects()))
        {
            $user_projects = Auth::user()->projects()->pluck('project_id')->toArray();
            if(!is_null($user_projects))
            {
                if(!empty($request->keyword))
                {
                    $tasks = ProjectTask::whereIn('project_id', $user_projects)->where('title', 'LIKE', $request->keyword . '%')->with('project')->get();
                }
                else
                {
                    $tasks = ProjectTask::whereIn('project_id', $user_projects)->orderBy('end_date', 'DESC')->with('project')->limit(5)->get();
                }
                if($tasks->count() > 0)
                {
                    foreach($tasks as $task)
                    {
                        $html .= '<li>
                                    <a class="list-link" href="' . route('projects.tasks.index', $task->project_id) . '">
                                        <i class="fas fa-search"></i>
                                        <span>' . $task->name . '</span> ' . __('in ') . $task->project->title . '
                                    </a>
                                </li>';
                    }
                }
                else
                {
                    $html = '<li>
                                <a class="list-link" href="#">
                                    <i class="fas fa-search"></i>
                                    <span>' . __('No Tasks Found') . '</span> ' . __('in Project.!') . '
                                </a>
                            </li>';
                }
            }
        }
        else
        {
                $html = '<li>
                                <a class="list-link" href="#">
                                    <i class="fas fa-search"></i>
                                    <span>' . __('No Tasks Found') . '</span> ' . __('in Project.!') . '
                                </a>
                            </li>';
        }
        print_r($html);
    }

    // Get User Projects and Due Task in Modal
    public function getProjectTask($user_id, $type)
    {
        $user          = User::find($user_id);
        $user_projects = $user->projects()->pluck('project_id')->toArray();

        $user_data = [];

        // Log::debug('The value of myVariable is: ' . $type);

        if($type == 'project')
        {
            $auth_projects         = Auth::user()->projects()->pluck('project_id')->toArray();
            $user_data['projects'] = $user->projects()->whereIn('project_id', $auth_projects)->get();

            return view('users.project', compact('user', 'user_data'));
        }

        if($type == 'due_task')
        {

            $user_data['due_task'] = ProjectTask::where('is_complete', '=', 0)->whereIn('project_id', $user_projects)->orderBy('end_date', 'DESC')->limit(5)->get();

            return view('users.due_tasks', compact('user', 'user_data'));
        }
    }

    // Language Module
    public function lang($currantLang)
    {

        if(\Auth::user()->type == 'admin')
        {
            $languages = Languages::pluck('fullname','code');
            $settings = \App\Models\Utility::settings();
            if(!empty($settings['disable_lang']))
            {
                $disabledLang = explode(',',$settings['disable_lang']);
            }
            else
            {
                $disabledLang = [];
            }

            $dir = base_path() . '/resources/lang/' . $currantLang;
            if(!is_dir($dir))
            {
                $dir = base_path() . '/resources/lang/en';
            }
            $arrLabel   = json_decode(file_get_contents($dir . '.json'));
            $arrFiles   = array_diff(
                scandir($dir), array(
                                 '..',
                                 '.',
                             )
            );
            $arrMessage = [];

            foreach($arrFiles as $file)
            {
                $fileName = basename($file, ".php");
                $fileData = $myArray = include $dir . "/" . $file;
                if(is_array($fileData))
                {
                    $arrMessage[$fileName] = $fileData;
                }
            }
            $default_lang = Utility::getValByName('default_language');
            return view('lang.index', compact('languages', 'currantLang', 'arrLabel', 'arrMessage','disabledLang','settings','default_lang'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function createLang()
    {
        if(Auth::user()->type == 'admin')
        {
            return view('lang.create');
        }
        else
        {
            return response()->json(['error' => __('Permission Denied.')], 401);
        }
    }

    public function storeLang(Request $request)
    {
        if(Auth::user()->type == 'admin')
        {
            $languageExist = Languages::where('code',$request->code)->orWhere('fullname',$request->fullname)->first();
            if(empty($languageExist)){
                $language = new Languages();
                $language->code = strtolower($request->code);
                $language->fullname = ucfirst($request->fullname);
                $language->save();
            }

            $Filesystem = new Filesystem();
            $langCode   = strtolower($request->code);
            $langDir    = base_path() . '/resources/lang/';
            $dir        = $langDir;
            if(!is_dir($dir))
            {
                mkdir($dir);
                chmod($dir, 0777);
            }
            $dir      = $dir . '/' . $langCode;
            $jsonFile = $dir . ".json";
            \File::copy($langDir . 'en.json', $jsonFile);

            if(!is_dir($dir))
            {
                mkdir($dir);
                chmod($dir, 0777);
            }
            $Filesystem->copyDirectory($langDir . "en", $dir . "/");
            // make entry in email_tempalte_lang table for email template content
            Utility::newLanguage($langCode);
            Utility::makeEmailLang($langCode);

            return redirect()->route('lang', $langCode)->with('success', __('Language Created Successfully.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function storeLangData($currantLang, Request $request)
    {
        if(Auth::user()->type == 'admin')
        {
            $Filesystem = new Filesystem();
            $dir = base_path() . '/resources/lang';
            if(!is_dir($dir))
            {
                mkdir($dir);
                chmod($dir, 0777);
            }
            $jsonFile = $dir . "/" . $currantLang . ".json";

            if (isset($request->label) && !empty($request->label)){
                file_put_contents($jsonFile, json_encode($request->label));
            }

            $langFolder = $dir . "/" . $currantLang;

            if(!is_dir($langFolder))
            {
                mkdir($langFolder);
                chmod($langFolder, 0777);
            }

            if(!empty($request->message))
            {
                foreach($request->message as $fileName => $fileData)
                {
                    $content = "<?php return [";
                    $content .= $this->buildArray($fileData);
                    $content .= "];";
                    file_put_contents($langFolder . "/" . $fileName . '.php', $content);
                }
            }

            return redirect()->route('lang', $currantLang)->with('success', __('Language Save Successfully.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function buildArray($fileData)
    {
        $content = "";
        foreach($fileData as $lable => $data)
        {
            if(is_array($data))
            {
                $content .= "'$lable'=>[" . $this->buildArray($data) . "],";
            }
            else
            {
                $content .= "'$lable'=>'" . addslashes($data) . "',";
            }
        }

        return $content;
    }

    public function changeLang($lang)
    {
        $user       = Auth::user();
        $user->lang = $lang;
        $user->save();

        if($lang == 'ar' || $lang =='he'){
            $value = 'on';
        }
        else{
            $value = 'off';
        }
        if($user->type == 'admin'){
            \DB::insert(
                'insert into settings (`value`, `name`,`created_by`) values (?, ?, ?) ON DUPLICATE KEY UPDATE `value` = VALUES(`value`) ', [
                    $value,
                    'enable_rtl',
                    $user->creatorId(),
                ]
            );
        }
        else{
            \DB::insert(
                'insert into settings (`value`, `name`,`created_by`) values (?, ?, ?) ON DUPLICATE KEY UPDATE `value` = VALUES(`value`) ', [
                    $value,
                    'enable_rtl',
                    $user->creatorId(),
                ]
            );
        }

        return redirect()->back()->with('success', __('Language Change Successfully.'));
    }

    public function destroyLang($lang)
    {
        $usr = Auth::user();
        $settings = \App\Models\Utility::settings();
        if($usr->type == 'admin')
        {
            $default_lang = $usr->lang;

            // Remove Email Template Language
            EmailTemplateLang::where('lang', 'LIKE', $lang)->delete();

            $langDir = base_path() . '/resources/lang/';

            if(is_dir($langDir))
            {
                // remove directory and file
                Utility::delete_directory($langDir . $lang);
                unlink($langDir . $lang . '.json');

                // update user that has assign deleted language.
                User::where('lang', 'LIKE', $lang)->update(['lang' => $default_lang]);
            }

            Languages::where('code',$lang)->first()->delete();

            return redirect()->route('lang', $default_lang)->with('success', __('Language Deleted Successfully.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    // End Language Module

    // User Add
    public function addUser()
    {
        return view('users.invite');
    }

    public function addUserExists(Request $request)
    {
        $authuser = Auth::user();
        $user     = User::where('email', 'LIKE', $request->email)->first();

        $response = [
            'code' => 404,
            'status' => 'Error',
            'error' => __('This User is not connected with our system. Please fill out the below details to add.'),
        ];

        if(!empty($user))
        {
            // make entry in user_contact tbl if not record is not exist
            $user_contact = UserContact::where('parent_id', '=', $authuser->id)->where('user_id', '=', $user->id)->count();

            if($user_contact > 0)
            {
                $response = [
                    'code' => 202,
                    'status' => 'Success',
                    'success' => __('User already added.'),
                ];
            }
            else
            {
                UserContact::create([
                                        'parent_id' => $authuser->id,
                                        'user_id' => $user->id,
                                        'role' => $request->userrole,
                                    ]);

                $response = [
                    'code' => 200,
                    'status' => 'Success',
                    'success' => __('Member Added Successfully.'),
                ];
            }
        }

        return json_encode($response);
    }

    public function addUserMember(Request $request)
    {        
        $setting  = Utility::settingsById(\Auth::user()->id);

		$validator = Validator::make(
			$request->all(),
				[
					'username' => 'regex:/^[a-zA-Z\s]+$/',
				],
				[
					'username.regex' => 'The username must contain only alphabetic characters and spaces.',
				]
    		);

		if ($validator->fails()) {
			$errors = $validator->errors()->all(); 
			 return json_encode([
                                       'code' => 404,
                                       'status' => 'Error',
                                       'error' => $errors,
                                   ]);
		}

		
        $authuser = Auth::user();
        $name     = $request->username;
        $email    = $request->useremail;
        $password = $request->userpassword;
        $userrole = $request->userrole;
        $plan     = $authuser->getPlan();
        if($plan)
        {
            $countUsers = $authuser->contacts->count();
            if($countUsers < $plan->max_users || $plan->max_users == -1)
            {
                // make new user
                $user = User::create([
                    'name' => $name,
                    'email' => $email,
                    'password' => Hash::make($password),
                    'email_verified_at' => date("H:i:s"),
                    'type' => !empty($request->userrole) ? $request->userrole : 'user',
                    'created_by' => $authuser->id,
                    'lang' => (\Auth::user()->type == 'admin' ) ? Utility::getValByName('default_language') : $setting['default_owner_language'],
                    'is_active' => 1,
                ]);

                    $user->assignPlan(1);

                $uArr = [
                    'email' => $email,
                    'password' => $password,
                ];

                // send email
                $resp = Utility::sendEmailTemplate('User Invited', [$user->id => $user->email], $uArr);

                // make entry in user_contact tbl
                UserContact::create([
                                        'parent_id' => $authuser->id,
                                        'user_id' => $user->id,
                                        'role' => $userrole,
                                    ]);

                return json_encode([
                                       'code' => 200,
                                       'status' => 'Success',
                                       'success' => __('Member Added Successfully.') . (($resp['is_success'] == false && !empty($resp['error'])) ? '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''),
                                   ]);
            }
            else
            {
                return json_encode([
                                       'code' => 404,
                                       'status' => 'Error',
                                       'error' => __('Your user limit is over, Please upgrade plan.'),
                                   ]);
            }
        }
        else
        {
            return json_encode([
                                   'code' => 404,
                                   'status' => 'Error',
                                   'error' => __('Default plan is deleted.'),
                               ]);
        }
    }

    // For Upgrade plane by admin/owner currently not added
    public function upgradePlan($user_id)
    {
        $user  = User::find($user_id);
        $plans = Plan::get();

        return view('users.plan', compact('user', 'plans'));
    }

    public function activePlan(Request $request, $user_id, $plan_id)
    {
        $user       = User::find($user_id);
        $user->plan = $plan_id;
        $user->save();

        $plan = Plan::find($plan_id);
        if($plan_id != 1)
        {
            $assignPlan = $user->assignPlan($plan_id, $request->duration);
        }
        else
        {
            $assignPlan = $user->assignPlan($plan_id, $request->duration);
        }

        $price = $plan->{$request->duration . '_price'};

        if($assignPlan['is_success'] == true && !empty($plan))
        {
            if(!empty($user->payment_subscription_id) && $user->payment_subscription_id != '')
            {
                try
                {
                    $user->cancel_subscription($user_id);
                }
                catch(\Exception $exception)
                {
                    \Log::debug($exception->getMessage());
                }
            }
            $payment_setting = Utility::getAdminPaymentSetting();
            $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
            Order::create([
                              'order_id' => $orderID,
                              'name' => null,
                              'email' => null,
                              'card_number' => null,
                              'card_exp_month' => null,
                              'card_exp_year' => null,
                              'plan_name' => $plan->name,
                              'plan_id' => $plan->id,
                              'price' => $price,
                              'price_currency' => isset($payment_setting['currency_code']) ? $payment_setting['currency_code'] : 'usd',
                              'txn_id' => '',
                              'payment_type' => __('Manually Upgrade By Super Admin'),
                              'payment_status' => 'succeeded',
                              'receipt' => null,
                              'user_id' => $user->id,
                          ]);

            return redirect()->back()->with('success', __('Plan Successfully Upgraded.'));
        }
        else
        {
            return redirect()->back()->with('error', __('Plan Fail To Upgrade.'));
        }
    }

    public function export()
    {

        if(\Auth::check())
        {
            $name = 'Members' . date('Y-m-d i:h:s');
            $data = Excel::download(new UserExport(), $name . '.xlsx'); 
            //ob_end_clean();

        return $data;
        }
        else
        {
            return redirect()->route('login');
        }
    }


    public function importFile()
    {
        return view('users.import');
    }

    public function import(Request $request)
    {
        $user = Auth::user();
        $rules = [
            'file' => 'required|mimes:csv,txt',
        ];

        $validator = \Validator::make($request->all(), $rules);

        if($validator->fails())
        {
            $messages = $validator->getMessageBag();

            return redirect()->back()->with('error', $messages->first());
        }

        $projects = (new UserImport())->toArray(request()->file('file'))[0];

        $totalitem = count($projects) - 1;
        $errorArray    = [];
        for($i = 1; $i <= count($projects) - 1; $i++)
        {
            $members = $projects[$i];

            $projectByEmail = User::where('email', $members[1])->first();
            if(!empty($projectByEmail))
            {
                $userData = $projectByEmail;
            }
            else
            {
                $userData = new User();
            }
            $userData->name                = $members[0];
            $userData->email               = $members[1];
            $userData->password            = Hash::make($members[2]);
            $userData->type	               = 'user';
            $userData->created_by          = \Auth::user()->creatorId();
            if(empty($userData))
            {
                $errorArray[]      = $userData;
            }
            else
            {
                $userData->save();
            }
            // make entry in user_contact tbl
            UserContact::create([
                'parent_id' => $user->id,
                'user_id' =>  $userData->id,
                'role' => $userData->type,
            ]);
        }

        $errorRecord = [];
        if(empty($errorArray))
        {
            $data['status'] = 'success';
            $data['msg']    = __('Record Successfully Imported.');
        }
        else
        {
            $data['status'] = 'error';
            $data['msg']    = count($errorArray) . ' ' . __('Record imported fail out of' . ' ' . $totalitem . ' ' . 'record');


            foreach($errorArray as $errorData)
            {

                $errorRecord[] = implode(',', $errorData);

            }

            \Session::put('errorArray', $errorRecord);
        }

        return redirect()->back()->with($data['status'], $data['msg']);
    }

    public function userPassword($id)
    {
        $eId        = \Crypt::decrypt($id);
        $user = User::find($eId);
        return view('users.reset', compact('user'));
    }

    public function userPasswordReset(Request $request, $id)
    {

        $validator = \Validator::make(
            $request->all(), [
                               'password' => 'required|confirmed|same:password_confirmation',
                           ]
        );

        if($validator->fails())
        {
            $messages = $validator->getMessageBag();

            return redirect()->back()->with('error', $messages->first());
        }


        $user = User::where('id', $id)->first();

        $user->forceFill([
            'password' => Hash::make($request->password),
        ])->save();

        return redirect()->back()->with('success', __('Password Successfully Updated.'));

    }

    public function disableLang(Request $request)
    {
        if(\Auth::user()->type == 'admin'){
            $settings = Utility::settings();
            $disablelang  = '';
            if($request->mode == 'off'){
                if(!empty($settings['disable_lang'])){
                    $disablelang = $settings['disable_lang'];
                    $disablelang=$disablelang.','. $request->lang;
                }
                else{
                    $disablelang = $request->lang;
                }
                \DB::insert(
                    'insert into settings (`value`, `name`,`created_by`) values (?, ?, ?) ON DUPLICATE KEY UPDATE `value` = VALUES(`value`) ', [
                        $disablelang,
                        'disable_lang',
                        \Auth::user()->creatorId(),
                    ]
                );
                $data['message'] = __('Language Disabled Successfully.');
                $data['status'] = 200;
                return $data;
           }else{
            $disablelang = $settings['disable_lang'];
            $parts = explode(',', $disablelang);
            while(($i = array_search($request->lang,$parts)) !== false) {
                unset($parts[$i]);
            }
            \DB::insert(
                'insert into settings (`value`, `name`,`created_by`) values (?, ?, ?) ON DUPLICATE KEY UPDATE `value` = VALUES(`value`) ', [
                    implode(',', $parts),
                    'disable_lang',
                    \Auth::user()->creatorId(),
                ]
            );
            $data['message'] = __('Language Enabled Successfully.');
            $data['status'] = 200;
            return $data;
           }

        }
    }



}