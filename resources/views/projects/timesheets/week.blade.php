<table class="table">
<thead>
    <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th colspan="2">
            <div class="timelogged">
                <span>{{ __('Time Logged: ') }}</span>

                {{ $calculatedtotaltaskdatetime . __('Hours') }}
            </div>
        </th>
    </tr>
    <tr>
        <th></th>
        @foreach ($days['datePeriod'] as $key => $perioddate)
            <th scope="col" class="heading">
                <span>{{ $perioddate->format('D') }}</span><span>{{ $perioddate->format('d M') }}</span></th>
        @endforeach
        <th class="text-center">{{ __('Total') }}</th>
    </tr>
</thead>
<tbody>
    @if (isset($seeAsOwner) && $seeAsOwner == true)
        @if (isset($allProjects) && $allProjects == true)
            @foreach ($timesheetArray as $key => $timesheet)
                <tr>
                    <td colspan="9"><span
                            class="project-name font-weight-700">{{ $timesheet['project_name'] }}</span></td>
                </tr>
                @foreach ($timesheet['taskArray'] as $key => $taskTimesheet)
                    <tr>
                        <td colspan="9"><span class="task-name pl-3">{{ $taskTimesheet['task_name'] }}</span></td>
                    </tr>
                    @foreach ($taskTimesheet['dateArray'] as $dateTimeArray)
                        <tr class="timesheet-user">
                            <td><span class="user-name pl-5">{{ $dateTimeArray['user_name'] }}</span></td> 

                            @foreach ($dateTimeArray['week'] as $dateSubArray)
                                <td><span class="task-time" data-type="{{ $dateSubArray['type'] }}"data-user-id="{{ $dateTimeArray['user_id'] }}"data-project-id="{{ $timesheet['project_id'] }}"data-task-id="{{ $taskTimesheet['task_id'] }}"data-date="{{ $dateSubArray['date'] }}" data-ajax-timesheet-popup="true"data-url="{{ $dateSubArray['url'] }}">{{ $dateSubArray['time'] != '00:00' ? $dateSubArray['time'] : '-' }}</span>
                                </td>
                            @endforeach
                            <td><span class="total-task-time">{{ $dateTimeArray['task_name'] }}</span></td>
                        </tr>
                    @endforeach
                @endforeach
            @endforeach
        @else
            @foreach ($timesheetArray as $key => $timesheet)
                <tr>
                    <td colspan="9"><span class="task-name font-weight-700">{{ $timesheet['task_name'] }}</span>
                    </td>
                </tr>
                @if ($timesheet['dateArray'])
                    @foreach ($timesheet['dateArray'] as $dateTimeArray)
                        <tr class="timesheet-user text-center">
                            <td><span class="user-name">{{ $dateTimeArray['user_name'] }}</span></td>
                            @foreach ($dateTimeArray['week'] as $dateSubArray)

                                <td><span class="task-time" data-type="{{ $dateSubArray['type'] }}"
                                        data-user-id="{{ $dateTimeArray['user_id'] }}"
                                        data-task-id="{{ $timesheet['task_id'] }}"
                                        data-date="{{ $dateSubArray['date'] }}"
                                        @if (isset($permissions) && in_array('create timesheet', $permissions)) data-ajax-timesheet-popup="true" data-url="{{ $dateSubArray['url'] }}" @endif>{{ $dateSubArray['time'] != '00:00' ? $dateSubArray['time'] : '-' }}</span>
                                </td>
                            @endforeach
                            <td><span class="total-task-time">{{ $dateTimeArray['totaltime'] }}</span></td>
                        </tr>
                    @endforeach
                @endif
            @endforeach
        @endif
    @else
        @if (isset($allProjects) && $allProjects == true)
            @foreach ($timesheetArray as $key => $timesheet)

            <tr>
                <td colspan="9"><span class="project-name font-weight-700">{{ $timesheet['project_name'] }}</span></td>
            </tr>

                @foreach ($timesheet['taskArray'] as $key => $taskTimesheet)

                    @foreach ($taskTimesheet['dateArray'] as $dateTimeArray)
                        <tr class="timesheet-user">
                            <td><span class="task-name pl-3">{{ $taskTimesheet['task_name'] }}</span></td>
                            @foreach ($dateTimeArray['week'] as $dateSubArray)

                                <td><span class="task-time" data-type="{{ $dateSubArray['type'] }}"data-user-id="{{ $dateTimeArray['user_id'] }}"data-project-id="{{ $timesheet['project_id'] }}"data-task-id="{{ $taskTimesheet['task_id'] }}"data-date="{{ $dateSubArray['date'] }}" data-ajax-timesheet-popup="true"data-url="{{ $dateSubArray['url'] }}">{{ $dateSubArray['time'] != '00:00' ? $dateSubArray['time'] : '-' }}</span>
                                </td>
                            @endforeach
                            <td><span class="total-task-time">{{ $dateTimeArray['totaltime'] }}</span></td>
                        </tr>
                    @endforeach
                @endforeach
            @endforeach
        @else
            @foreach ($timesheetArray as $key => $timesheet)

                <tr class="text-center">
                    <td><span class="task-name">{{ $timesheet['task_name'] }}</span></td>
                    
                    @foreach ($timesheet['dateArray'] as $day => $datetime)
                        <td><span class="task-time" data-type="{{ $datetime['type'] }}"data-task-id="{{ $timesheet['task_id'] }}" data-date="{{ $datetime['date'] }}"
                                @if (isset($permissions) && is_array($permissions) && in_array('create timesheet', $permissions)) data-ajax-timesheet-popup="true" data-url="{{ $datetime['url'] }}" @endif>{{ $datetime['time'] != '00:00' ? $datetime['time'] : '-' }}</span>
                        </td>
                    @endforeach
                    <td><span class="total-task-time">{{ $timesheet['totaltime'] }}</span></td>
                </tr>
            @endforeach
        @endif
    @endif
</tbody>
<tfoot>
    <tr class="text-center">
        <td class="font-weight-700">{{ __('Total') }}</td>
        @foreach ($totalDateTimes as $key => $totaldatetime)
            <td class="total-date-time">{{ $totaldatetime != '00:00' ? $totaldatetime : '-' }}</td>
        @endforeach
        <td>{{ $calculatedtotaltaskdatetime }}</td>
    </tr>
</tfoot>
</table>