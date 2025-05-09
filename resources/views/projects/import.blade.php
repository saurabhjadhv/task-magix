 @php
$logo = \App\Models\Utility::get_file('uploads/sample/');
@endphp

<div class="card bg-none card-box">
    {{ Form::open(array('route' => array('project.import'),'method'=>'post', 'enctype' => "multipart/form-data")) }}
    <div class="row" style="padding: 15px 15px;">
        <div class="col-md-12 mb-2">
            <div class="d-flex align-items-center justify-content-between">
                {{Form::label('file',__('Download sample project csv file'),['class'=>'form-control-label w-auto m-0'])}}
                <div>
                    <a href="{{$logo.'sample-project.csv'}}" class="btn btn-sm btn-primary">
                        <i class="fa fa-download"></i> {{__('Download')}}
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            {{Form::label('file',__('Select CSV File'),['class'=>'form-control-label'])}}
            <div class="choose-file form-group">
                <label for="file" class="form-control-label">
                    <div>{{__('Choose file here')}}</div>
                    <input type="file" class="form-control" name="file" id="file" data-filename="upload_file" required>
                </label>
                <p class="upload_file"></p>
            </div>
        </div>
        <div class="col-md-12 mt-2 text-right">
            <input type="submit" value="{{__('Upload')}}" class="btn btn-sm btn-primary">
            <input type="button" value="{{__('Cancel')}}" class="btn btn-sm btn-secondary" data-dismiss="modal">
        </div>
    </div>
    {{ Form::close() }}
</div>
