    @php
        $logo_path = \App\Models\Utility::get_file('/');
    @endphp

    <div class="col-12">
        <div class="card">
            <div class="table-responsive">
                <table class="table align-items-center">
                    <thead>
                        <tr>
                            <th scope="col">{{ __('Name') }}</th>
                            <th scope="col">{{ __('Stage') }}</th>
                            <th scope="col">{{ __('Priority') }}</th>
                            <th scope="col">{{ __('End Date') }}</th>
                            <th scope="col">{{ __('Assigned To') }}</th>
                            <th scope="col">{{ __('Completion') }}</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody class="list">
                        @if (count($tasks) > 0)
                            @foreach ($tasks as $task)
                                <tr>
                                    <td>
                                        <span class="h6 text-sm font-weight-bold mb-0"><a
                                                href="{{ route('projects.tasks.index', $task->project->id) }}">{{ $task->title }}</a></span>
                                        <span class="d-block text-sm text-muted">{{ $task->project->title }}
                                            <span
                                                class="badge badge-xs badge-success">{{ __(\Auth::user()->checkProject($task->project_id)) }}</span>
                                        </span>
                                    </td>
                                    <td>{{ $task->stage->name }}</td>
                                    <td>
                                        <span
                                            class="badge badge-pill badge-sm badge-{{ __(\App\Models\ProjectTask::$priority_color[$task->priority]) }}">{{ __(\App\Models\ProjectTask::$priority[$task->priority]) }}</span>
                                    </td>
                                    <td class="{{ strtotime($task->end_date) < time() ? 'text-danger' : '' }}">
                                        {{ \App\Models\Utility::getDateFormated($task->end_date) }}</td>
                                    <td>
                                        <div class="avatar-group">
                                            @if ($task->users()->count() > 0)
                                                @if ($users = $task->users())
                                                    @foreach ($users as $key => $user)
                                                        @if ($key < 3)
                                                            <a href="#" class="avatar rounded-circle avatar-sm">
                                                                @if ($user->avatar)
                                                                    <img src="{{ $logo_path . $user->avatar }}"
                                                                        title="{{ $user->name }}">
                                                                @else
                                                                    <img {{ $user->img_avatar }}
                                                                        title="{{ $user->name }}">
                                                                @endif
                                                            </a>
                                                        @else
                                                        @break
                                                    @endif
                                                @endforeach
                                            @endif
                                            @if (count($users) > 3)
                                                <a href="#" class="avatar rounded-circle avatar-sm">
                                                    <img avatar="+ {{ count($users) - 3 }}">
                                                </a>
                                            @endif
                                        @else
                                            {{ __('-') }}
                                        @endif
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <span
                                            class="completion mr-2">{{ $task->taskProgress()['percentage'] }}</span>
                                    </div>
                                </td>
                                <td class="text-right w-15">
                                    <div class="actions">
                                        <a class="action-item px-1" data-toggle="tooltip"
                                            data-original-title="{{ __('Attachment') }}">
                                            <i class="fas fa-paperclip mr-2"></i>{{ count($task->taskFiles) }}
                                        </a>
                                        <a class="action-item px-1" data-toggle="tooltip"
                                            data-original-title="{{ __('Comment') }}">
                                            <i class="fas fa-comment-alt mr-2"></i>{{ count($task->comments) }}
                                        </a>
                                        <a class="action-item px-1" data-toggle="tooltip"
                                            data-original-title="{{ __('Checklist') }}">
                                            <i class="fas fa-tasks mr-2"></i>{{ $task->countTaskChecklist() }}
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <th scope="col" colspan="7">
                                <h6 class="text-center">{{ __('No tasks found') }}</h6>
                            </th>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
