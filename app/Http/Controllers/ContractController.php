<?php

namespace App\Http\Controllers;
use App\Models\Contract;
use App\Models\ContractAttechment;
use App\Models\ContractComment;
use App\Models\ContractNote;
use App\Models\ContractType;
use App\Models\Project;
use App\Models\ProjectUser;
use App\Models\User;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;

class ContractController extends Controller
{

    public function __construct()
    {
        $this->middleware(
            [
                'auth',
            ]
        );
    }

    public function index()
     {

        if (Auth::user()->type == 'owner') {
            $contracts = Contract::where('created_by', '=', \Auth::user()->id)->get();
            $curr_month = Contract::where('created_by', '=', \Auth::user()->getCreatedBy())->whereMonth('start_date', '=', date('m'))->get();
            $curr_week = Contract::where('created_by', '=', \Auth::user()->getCreatedBy())->whereBetween(
                'start_date', [
                    \Carbon\Carbon::now()->startOfWeek(),
                    \Carbon\Carbon::now()->endOfWeek(),
                ])->get();
            $last_30days = Contract::where('created_by', '=',\Auth::user()->id)->whereDate('start_date', '>', \Carbon\Carbon::now()->subDays(30))->get();

            // Contracts Summary
            $cnt_contract = [];
            $cnt_contract['total'] = \App\Models\Contract::getContractSummary($contracts);
            $cnt_contract['this_month'] = \App\Models\Contract::getContractSummary($curr_month);
            $cnt_contract['this_week'] = \App\Models\Contract::getContractSummary($curr_week);
            $cnt_contract['last_30days'] = \App\Models\Contract::getContractSummary($last_30days);

            return view('contracts.index', compact('contracts', 'cnt_contract'));

        } elseif (Auth::user()->user_contacts->role == 'client') {

            $contracts = Contract::where('client', '=', \Auth::user()->id)->get();
            $curr_month = Contract::where('client', '=', \Auth::user()->id)->whereMonth('start_date', '=', date('m'))->get();
            $curr_week = Contract::where('client', '=', \Auth::user()->id)->whereBetween(
                'start_date', [
                    \Carbon\Carbon::now()->startOfWeek(),
                    \Carbon\Carbon::now()->endOfWeek(),
                ]
            )->get();
            $last_30days = Contract::where('client', '=', \Auth::user()->id)->whereDate('start_date', '>', \Carbon\Carbon::now()->subDays(30))->get();

            // Contracts Summary
            $cnt_contract = [];
            $cnt_contract['total'] = \App\Models\Contract::getContractSummary($contracts);
            $cnt_contract['this_month'] = \App\Models\Contract::getContractSummary($curr_month);
            $cnt_contract['this_week'] = \App\Models\Contract::getContractSummary($curr_week);
            $cnt_contract['last_30days'] = \App\Models\Contract::getContractSummary($last_30days);

            return view('contracts.index', compact('contracts', 'cnt_contract'));
        } else {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }

    }


    public function create()
    {
        // if (Auth::user()->type == 'owner') {

        //     $clients_data = User::where('type', '=', 'client')->where('created_by', \Auth::user()->id)->get();

        //     $client = [];
        //     foreach ($clients_data as $clients) {
        //         // $role = $clients->usrRole()['role'];
        //         // if ($role == 'Client') {
        //             $client[$clients->id] = $clients->name;
        //         // }
        //     }
        //     $contractType = ContractType::where('created_by', '=', Auth::user()->id)->get()->pluck('name', 'id');

        //     $projectUser = ProjectUser::where('user_id',$clients->id)->get()->pluck('project_id','id')->toArray();
        //     $projects = Project::where('created_by', Auth::user()->id)->whereIn('id',$projectUser)->pluck('title', 'id');

        //     return view('contracts.create', compact('contractType', 'client', 'projects'));
        // } else {

        //     return redirect()->back()->with('error', __('Permission Denied.'));
        // }

        if (Auth::user()->type == 'owner') {

            $clients_data = User::where('type', '=', 'client')->where('created_by', \Auth::user()->id)->get();

            $client = [];
            $projects = [];  
            foreach ($clients_data as $clients) {
                // $role = $clients->usrRole()['role'];
                // if ($role == 'Client') {
                $client[$clients->id] = $clients->name;
                // }
                $projectUser = ProjectUser::where('user_id',$clients->id)->get()->pluck('project_id','id')->toArray();
                $projects += Project::where('created_by', Auth::user()->id)->whereIn('id',$projectUser)->pluck('title', 'id')->toArray();
            }

            $contractType = ContractType::where('created_by', '=', Auth::user()->id)->get()->pluck('name', 'id');

            return view('contracts.create', compact('contractType', 'client', 'projects'));
        } else {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function store(Request $request)
    {

        $validator = Validator::make(
            $request->all(), [
                'client_name' => 'required',
                'value' => 'required',
                'type' => 'required',
                'start_date' => 'required',
                'end_date' => 'required|after_or_equal:start_date',
            ]
        );

        if ($validator->fails())
        {
            $messages = $validator->getMessageBag();
			return redirect()->back()->with('error', $messages->first());
        }

        $contract               = new Contract();
        // $contract->id           = $this->contractNumber();
        $contract->client       = $request->client_name;
        $contract->project      = $request->project;
        $contract->subject      = $request->subject;
        $contract->value        = $request->value;
        $contract->type         = $request->type;
        $contract->start_date   = $request->start_date;
        $contract->end_date     = $request->end_date;
        $contract->notes        = $request->descriptions;
        $contract->created_by   = \Auth::user()->id;
        $contract->status       = 'pending';
        $contract->save();

        return redirect()->back()->with('success', __('Contract Successfully Created!'));

    }
    public function show($id)
    {
        $contract = Contract::find($id);
        if(isset($contract) && $contract != null)
        {
            $client = $contract->client;
            return view('contracts.show', compact('contract', 'client'));
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function edit($id)
    {
        if (Auth::user()->type == 'owner')
        {
            $contract = Contract::find($id);
            $clients_data = User::where('type', '=', 'client')->where('created_by', \Auth::user()->id)->get();

            $client = [];
            foreach ($clients_data as $clients)
            {
                $role = $clients->usrRole()['role'];
                if ($role == 'Client')
                {
                    $client[$clients->id] = $clients->name;
                }
            }
            $contractType = ContractType::where('created_by', '=', \Auth::user()->id)->get()->pluck('name', 'id');
            $project = Project::pluck('title', 'id');

            return view('contracts.edit', compact('contract', 'contractType', 'client', 'project'));
        } else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

    public function update(Request $request, $id)
    {
        $validator = \Validator::make(
            $request->all(), [
                'client_name' => 'required',
                'value' => 'required',
                'type' => 'required',
                'start_date' => 'required',
                'end_date' => 'required|after_or_equal:start_date',
            ]
        );

        if ($validator->fails())
        {
            $messages = $validator->getMessageBag();
			return redirect()->back()->with('error', $messages->first());
        }

        $contract = Contract::find($id);
        $contract->client     = $request->client_name;
        $contract->project    = $request->project;
        $contract->subject    = $request->subject;
        $contract->value      = $request->value;
        $contract->type       = $request->type;
        $contract->start_date = $request->start_date;
        $contract->end_date   = $request->end_date;
        $contract->notes      = $request->notes;
        $contract->created_by = \Auth::user()->id;
        $contract->save();

        return redirect()->back()->with('success', __('Contract Successfully Updated!'));
        // return redirect()->route('contract.index')->with('success', __('Contract successfully updated!'));
    }


    public function destroy(Contract $contract, $id)
    {
        if (Auth::user()->type == 'owner') {
            $contract = Contract::find($id);
            $contract->delete();

            return redirect()->back()->with('success', __('Contract Successfully Deleted!!'));
        }
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }

    }

    public function descriptionStore($id, Request $request)
    {
        $validator = \Validator::make(
            $request->all(), [
                'contract_description' => 'required',
            ]
        );
        if ($validator->fails()) {
            $messages = $validator->getMessageBag();
            return redirect()->route('contract.index')->with('error', $messages->first());
        }
        $contract = Contract::find($id);
        $contract->contract_description  = $request->contract_description;
        $contract->save();
        return redirect()->back()->with('success', __('Contract Successfully Saved.'));
    }

    public function fileUpload($id, Request $request)
    {
        $request->validate(
            ['file' => 'required']
        );

        $image_size = $request->file('file')->getSize();
        $result = Utility::updateStorageLimit(\Auth::user()->creatorId(), $image_size);
        if($result == 1)
        {
            $fileName = $id . time() . "_" . $request->file->getClientOriginalName();
            $dir = 'contract_attechment/';
            $path = Utility::upload_file($request,'file',$fileName,$dir,[]);
            if($path['flag'] == 1)
            {
                $file = $path['url'];
            }
            else
            {
                return $result;
                return redirect()->back()->with('error', __($path['msg']));
            }

        }
        //$request->file->storeAs('contract_attechment', $fileName);
        $post['contract_id'] = $id;

        $post['files'] = $fileName;
        $post['name'] = time() . $request->file->getClientOriginalName();
        $post['extension'] = $request->file->getClientOriginalExtension();
        $post['user_id'] = \Auth::user()->id;
        $post['created_by'] = \Auth::user()->id;

        $TaskFile = ContractAttechment::create($post);

        $TaskFile->deleteUrl = '';

        $TaskFile->deleteUrl = route(
            'contracts.file.delete', [$id]
        );
        $return['status'] = "success";
        $return['msg'] = __("Atttachment Added Successfully").((isset($result) && $result != 1) ? '</br> <span class="text-danger">' . $result . '</span>' : '');
        return $return;

    }

    public function fileDelete($id)
    {
        $dir = 'contract_attechment/';
        $contract_file = ContractAttechment::find($id);
        $file_path = $dir.$contract_file->files;
        $result = Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);

        $contract_file->delete();

        return redirect()->back()->with('success', __('Attachments Successfully Deleted!'));
    }

    public function fileDownload($id, $file_id)
    {
        $contract = Contract::find($id);
        if ($contract->created_by == \Auth::user()->id) {
            $file = ContractAttechment::find($file_id);
            if ($file) {
                 $logo = Utility::get_file('contract_attechment/');
                 $file_path = $logo.$file->files;
                return \Response::download(
                    $file_path, $file->files, [
                        'Content-Length: ' . filesize($file_path),
                    ]
                );
            } else {
                return redirect()->back()->with('error', __('File Is Not Exist.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }

    }

    public function commentStore(Request $request, $id)
    {
        $validator = \Validator::make(
            $request->all(), [
                'comment' => 'required',
            ]
        );

        if ($validator->fails()) {
            $messages = $validator->getMessageBag();

            return redirect()->back()->with('error', __('Please Add Commments'));
        }

        $contract = new ContractComment();
        $contract->comment = $request->comment;
        $contract->contract_id = $id;
        $contract->user_id = \Auth::user()->id;
        $contract->created_by = \Auth::user()->id;
        $contract->save();


        return redirect()->back()->with('success', __('Comments Successfully Created!') . ((isset($smtp_error)) ? '<br> <span class="text-danger">' . $smtp_error . '</span>' : ''))->with('status', 'comments');

    }

    public function commentDestroy($id)
    {
        if (Auth::user()->type == 'owner') {
            $contract = ContractComment::find($id);
            $contract->delete();
            return redirect()->back()->with('success', __('Comment Successfully Deleted!'));
        } else {
            $contract = ContractComment::where('created_by', \Auth::user()->id)->where('id', $id)->delete();
            return redirect()->back()->with('success', __('Comment Successfully Deleted!'));
        }
    }

    public function noteStore($id, Request $request)
    {

        $validator = \Validator::make(
            $request->all(), [
                'note' => 'required',
            ]
        );

        if ($validator->fails()) {
            $messages = $validator->getMessageBag();

            return redirect()->back()->with('error', __('Please Add Notes'));
        }

        $contract = Contract::find($id);
        $notes = new ContractNote();
        $notes->contract_id = $contract->id;
        $notes->note = $request->note;
        $notes->user_id = \Auth::user()->id;
        $notes->created_by = \Auth::user()->id;

        $notes->save();

        return redirect()->back()->with('success', __('Note Successfully Saved.'));

    }

    public function noteDestroy($id)
    {
        if (Auth::user()->type == 'owner') {
            $contract = ContractNote::find($id);

            $contract->delete();
            return redirect()->back()->with('success', __('Note Successfully Deleted!'));
        } else {
            $contract = ContractNote::where('created_by', \Auth::user()->id)->where('id', $id)->delete();
            return redirect()->back()->with('success', __('Note Successfully Deleted!'));
        }
    }

    public function clientByProject(Request $request)
    {

        $project_data = [];
        $projects = ProjectUser::where('user_id', $request->client_id)->pluck('project_id', 'id');
        foreach ($projects as $key => $value) {
            $projectname = Project::where('id', $value)->first();
            $project_data[$projectname->id] = $projectname->name;

        }

        return \Response::json($project_data);

    }

    public function contractNumber()
    {
        $latest = Contract::where('created_by', '=', \Auth::user()->id)->latest()->first();
        if (!$latest) {
            return 1;
        }

        return $latest->id + 1;
    }

    public function copycontract($id)
    {
        $contract = Contract::find($id);
        $clients_data = User::where('type', '=', 'client')->where('created_by', \Auth::user()->id)->get();

        $client = [];
        foreach ($clients_data as $clients) {
            $role = $clients->usrRole()['role'];
            if ($role == 'Client') {
                $client[$clients->id] = $clients->name;
            }
        }
        $contractType = ContractType::where('created_by', '=', \Auth::user()->id)->get()->pluck('name', 'id');
        $project = Project::pluck('title', 'id');

        return view('contracts.copy', compact('contract', 'contractType', 'client', 'project'));

    }

    public function copycontractstore(Request $request, $id)
    {
        $validator = Validator::make(
            $request->all(), [
                'client_name' => 'required',
                'value' => 'required',
                'type' => 'required',
                'start_date' => 'required',
                'end_date' => 'required|after_or_equal:start_date',
            ]
        );

        if ($validator->fails()) {
            $messages = $validator->getMessageBag();

            return redirect()->route('contract.index')->with('error', $messages->first());
        }

        $contract = new Contract();
        $contract->id = $this->contractNumber();
        $contract->client = $request->client_name;
        $contract->project = $request->project;
        $contract->subject = $request->subject;
        $contract->value = $request->value;
        $contract->type = $request->type;
        $contract->start_date = $request->start_date;
        $contract->end_date = $request->end_date;
        $contract->notes = $request->notes;
        $contract->created_by = \Auth::user()->id;
        $contract->status = 'pending';

        $contract->save();

        return redirect()->back()->with('success', __('Contract Successfully Created.'));

    }

    public function pdffromcontract($contract_id)
    {
        $id = Crypt::decrypt($contract_id);
        $contract  = Contract::findOrFail($id);
        //$logo = asset(\Storage::url('logo/'));
        $logo      = Utility::get_file('logo/');
        $path_imgs = Utility::get_file('/');
        $details   = Auth::user()->decodeDetails();

        if (Auth::user()->mode == 'light')
        {
            $dark_logo = $path_imgs.$details['dark_logo'];
        }
        else
        {
            $dark_logo = $path_imgs.$details['light_logo'];
        }

        $img = isset($dark_logo) && !empty($dark_logo) ? $dark_logo : $logo.'logo.png'.'?'.time();

        return view('contracts.template', compact('contract','img'));
    }

    public function printContract($id)
    {
        $contract = Contract::findOrFail($id);
        $usr = Auth::user();

        $client = $contract->client_name;


         $logo=Utility::get_file('logo/');

          $path_imgs = Utility::get_file('/');
          $details        = Auth::user()->decodeDetails();

        if (Auth::user()->mode == 'light')
              {
                $dark_logo = $path_imgs.$details['dark_logo'];
              }
             else
             {
                $dark_logo = $path_imgs.$details['light_logo'];

             }


        //$dark_logo = Utility::getValByName('dark_logo');
        $img = isset($dark_logo) && !empty($dark_logo) ? $dark_logo : $logo.'logo.png'.'?'.time();

        return view('contracts.contract_view', compact('contract', 'client', 'img', 'usr'));

    }

    public function signature($id)
    {
        $contract = Contract::find($id);

        return view('contracts.signature', compact('contract'));

    }

    public function signatureStore(Request $request)
    {

        if (Auth::user()->type == 'owner') {
            $contract = Contract::find($request->contract_id);
            $contract->owner_signature = $request->owner_signature;

            $contract->save();

            $return['status'] = "success";
            $return['msg'] = __("Owner Signature Added Successfully");
            return $return;
        } else {
            $contract = Contract::find($request->contract_id);
            $contract->client_signature = $request->client_signature;

            $contract->save();

            $return['status'] = "success";
            $return['msg'] = __("Client Signature Added Successfully");
            return $return;
        }

    }

    public function sendmailContract($id, Request $request)
    {

        if (Auth::user()->type == 'owner') {

            $contract = Contract::find($id);

            $client = User::where('id', $contract->client)->first();

            $project = Project::where('id', $contract->project)->first();

            $project_type = ContractType::where('id', $contract->type)->first();

            try {
                $resp = [
                    'client_name' => $client->name,
                    'contract_name' => $project->title,
                    'contract_type' => $project_type->name,
                    'contract_value' => $contract->value,
                    'start_date' => $contract->start_date,
                    'end_date' => $contract->end_date,
                ];

                $resp = Utility::sendEmailTemplate('Contract Shared', [$client->id => $client->email], $resp);

            } catch (\Exception $e) {
                $smtp_error = "<br><span class='text-danger'>" . __('E-Mail Has Been Not Sent Due To SMTP Configuration') . '</span>';
            }

            return redirect()->back()->with('success', __('E-Mail Send Successfully!'));
            // return redirect()->route('contract.show', $contract->id)->with('success', __('Send successfully!') . (($resp['is_success'] == false && !empty($resp['error'])) ? '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''));
        } else {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }



    public function contract_status_edit(Request $request,$id)
    {
        if (Auth::user()->type == 'client')
        {
            $contract = Contract::where('id',$id)->first();
            $contract->status   = $request->edit_status;
            $contract->save();
        }
        else
        {
            return redirect()->back()->with('error', __('Permission Denied.'));
        }
    }

}
