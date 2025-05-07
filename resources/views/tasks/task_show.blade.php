@php
    $logo = \App\Models\Utility::get_file('tasks/');
    $logo_path = \App\Models\Utility::get_file('/');
@endphp

<div class="modal-dialog modal-vertical modal-lg side-modal" role="document" id="{{ $task->id }}">
    <div class="modal-content">
        <div class="modal-header">
            <div class="col d-flex align-items-center">
                <div class="custom-control custom-checkbox mt-n1">
                    <input type="checkbox" class="custom-control-input" id="complete_task"
                        @if ($task->is_complete == 1) checked @endif
                        data-url="{{ route('change.complete', [$task->project_id, $task->id]) }}">
                    <label class="custom-control-label" for="complete_task"></label>
                </div>

                <h6 class="mb-0">{{ $task->title }}</h6>
            </div>

        </div>

        <div class="modal-body">

            <hr class="my-3" />
            <div class="row mb-4 align-items-center">
                <div class="col-6">
                    <label class="form-control-label mb-0">
                        {{ __('See Detail') }}
                    </label>
                </div>
                <div class="col-6 text-right">
                    <a href="#" class="btn btn-xs btn-secondary btn-icon rounded-pill" data-toggle="collapse"
                        data-target="#overview">
                        <span class="btn-inner--icon"><i class="fas fa-plus"></i></span>
                    </a>
                </div>
            </div>
            <div id="overview" class="collapse">
                <b>{{ __('Estimated Hours') }}</b>:
                <span>{{ !empty($task->estimated_hrs) ? number_format($task->estimated_hrs) : '-' }}</span> <br>
                <b>{{ __('Milestone') }}</b>:
                <span>{{ !empty($task->milestone) ? $task->milestone->title : '-' }}</span> <br>
                <b>{{ __('Description') }}</b> <br>
                <span>{{ !empty($task->description) ? $task->description : '-' }}</span>
            </div>
            <hr />
            @if ($allow_progress == 'false')
                <div class="row align-items-center">
                    <div class="col-12 pb-2">
                        <label class="form-control-label mb-0">
                            {{ __('Task Progress') }} : <b id="t_percentage">{{ $task->progress }}</b>%
                        </label>
                    </div>
                    <div class="col-12">
                        <div id="progress-result" class="tab-pane tab-example-result fade show active" role="tabpanel"
                            aria-labelledby="progress-result-tab">
                            <input type="range" class="task_progress custom-range" value="{{ $task->progress }}"
                                id="task_progress" name="progress"
                                data-url="{{ route('change.progress', [$task->project_id, $task->id]) }}">
                        </div>
                    </div>
                </div>
                <hr />
            @endif
            <div class="row mb-4 align-items-center">
                <div class="col-6">
                    <label class="form-control-label mb-0">
                        {{ __('Checklist') }}
                    </label>
                </div>

            </div>
            <div class="checklist" id="checklist">
                <form method="post" id="form-checklist" class="collapse pb-2"
                    data-action="{{ route('checklist.store', [$task->project_id, $task->id]) }}">
                    @csrf
                    <div class="card border shadow-none">
                        <div class="px-3 py-2 row align-items-center">
                            <div class="col-10">
                                <input type="text" name="name" required class="form-control"
                                    placeholder="{{ __('Checklist Name') }}" />
                            </div>
                            <div class="col-2 card-meta d-inline-flex align-items-center">
                                <button class="btn btn-primary btn-xs" type="submit" id="checklist_submit">
                                    <i class="fas fa-plus "></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                @foreach ($task->checklist as $checklist)
                    <div class="card border shadow-none checklist-member">
                        <div class="px-3 py-2 row align-items-center">
                            <div class="col-10">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input"
                                        id="check-item-{{ $checklist->id }}"
                                        @if ($checklist->status) checked @endif
                                        data-url="{{ route('checklist.update', [$task->project_id, $checklist->id]) }}">
                                    <label class="custom-control-label h6 text-sm"
                                        for="check-item-{{ $checklist->id }}">{{ $checklist->name }}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <hr />
            <div class="row mb-4 align-items-center">
                <div class="col-6">
                    <label class="form-control-label mb-0">{{ __('Attachments') }}</label>
                </div>
            </div>
            <div class="card mb-3 border shadow-none collapse" id="add_file">
                <div class="card border-0 shadow-none mb-0">
                    <div class="px-3 py-2 row align-items-center">
                        <div class="col-10">
                            <input type="file" name="task_attachment" id="task_attachment" required
                                class="custom-input-file" />
                        </div>
                    </div>
                </div>
            </div>

            <div id="comments-file">
                @foreach ($task->taskFiles as $file)
                    <div class="card mb-3 border shadow-none task-file">
                        <div class="px-3 py-3">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <img src="{{ asset('assets/img/icons/files/' . $file->extension . '.png') }}"
                                        class="img-fluid" style="width: 40px;">
                                </div>
                                <div class="col ml-n2">
                                    <h6 class="text-sm mb-0">
                                        <a href="#" target="">{{ $file->name }} </a>
                                    </h6>
                                    <p class="card-text small text-muted">{{ $file->file_size }}</p>
                                </div>
                                <div class="col-auto actions">

                                    <a href="{{ $logo . $file->file }}" target="_blank" role="button">
                                        <i class="fas fa-eye "></i>
                                    </a>

                                    <a href="{{ $logo . $file->file }}" download class="action-item" role="button">
                                        <i class="fas fa-download"></i>
                                    </a>


                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <hr />
            <label class="form-control-label mb-4">{{ __('Activity') }}</label>
            <div class="list-group list-group-flush mb-0">

                @foreach ($task->activity_log() as $activity)
                    <div class="list-group-item px-0">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <a href="#" class="avatar avatar-sm">


                                    @if ($activity->user->avatar)
                                        <img src="{{ $logo_path . $activity->user->avatar }}"
                                            class="avatar avatar-sm rounded-circle">
                                    @else
                                        <img {{ $activity->user->img_avatar }}
                                            class="avatar avatar-sm rounded-circle">
                                    @endif
                                </a>
                            </div>
                            <div class="col ml-n2">
                                <span class="text-dark text-sm">{{ __($activity->log_type) }}</span>
                                <a class="d-block h6 text-sm font-weight-light mb-0">{!! $activity->getRemark() !!}</a>
                                <small class="d-block">{{ $activity->created_at->diffForHumans() }}</small>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <hr />
            <label class="form-control-label mb-4">{{ __('Tracking Activity') }}</label>
            <div class="list-group list-group-flush mb-0">
                @if ($task->trackingRec->count())
                    @foreach ($task->trackingRec as $track)
                        <div class="list-group-item px-0">

                            <span
                                class="text-dark text-sm">{{ __($track->taskTime($track->start_time, $track->end_time)) }}</span>
                            <span
                                class="text-sm">({{ \App\Models\Utility::getDateFormated($track->start_time, true) . ' ' . __('to') . ' ' . \App\Models\Utility::getDateFormated($track->end_time, true) }})</span>
                        </div>
                    @endforeach
                @else
                    <div class="list-group-item px-0 text-center">
                        <span class="text-dark text-sm">{{ __('No data found.!') }}</span>
                    </div>
                @endif
            </div>
            <hr />
            <label class="form-control-label mb-4">{{ __('Comments') }}</label>
            <div class="list-group list-group-flush mb-0" id="comments">
                @foreach ($task->comments as $comment)
                    <div class="list-group-item px-0">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <a href="#" class="avatar avatar-sm rounded-circle">
                                    @if ($comment->user->avatar)
                                        <img src="{{ $logo_path . $comment->user->avatar }}"
                                            class="avatar avatar-sm rounded-circle">
                                    @else
                                        <img {{ $comment->user->img_avatar }} title="{{ $comment->user->name }}"
                                            class="avatar avatar-sm rounded-circle">
                                    @endif
                                </a>
                            </div>
                            <div class="col ml-n2">
                                <p class="d-block h6 text-sm font-weight-light mb-0 text-break">
                                    {{ $comment->comment }}</p>
                                <small class="d-block">{{ $comment->created_at->diffForHumans() }}</small>
                            </div>

                        </div>
                    </div>
                @endforeach
            </div>

        </div>
        {{-- </div> --}}
    </div>
</div>
