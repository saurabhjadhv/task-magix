<?php $__env->startSection('title'); ?>
    <?php echo e(__('Timesheet List')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6 weekly-dates-div pt-1">
                            <a href="#" class="action-item previous"><i class="fas fa-arrow-left"></i></a>
                            <span class="weekly-dates"></span>
                            <input type="hidden" id="weeknumber" value="0">
                            <input type="hidden" id="selected_dates">
                            <a href="#" class="action-item next"><i class="fas fa-arrow-right"></i></a>
                        </div>
                        <div class="col text-right pt-1">
                            <div class="custom-control custom-checkbox timesheet-owner">
                                
                                <input type="checkbox" class="custom-control-input" checked>
                                <label class="custom-control-label" for="owner-check"><?php echo e(__('See as Owner')); ?></label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-wrapper project-timesheet overflow-auto"></div>
                <div class="text-center notfound-timesheet">
                    <div class="empty-project-text text-center p-3 min-h-300">
                        <h5 class="pt-5"><?php echo e(__("We couldn't find any data")); ?></h5>
                        <p class="m-0"><?php echo e(__("Sorry we can't find any timesheet records on this week.")); ?></p>
                        <p class="m-0"><?php echo e(__("To add timesheet record go to ")); ?><a href="<?php echo e(route('projects.index')); ?>"><?php echo e(__('projects')); ?></a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script>

        function ajaxFilterTimesheetTableView() {
            var mainEle = $('.project-timesheet');
            var notfound = $('.notfound-timesheet');
            var week = parseInt($('#weeknumber').val());
            var project_id = '0';
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

        $(document).ready(function() {
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


        $(document).on('change', '#time_hour, #time_minute', function () {

            var hour = $('#time_hour').children("option:selected").val();
            var minute = $('#time_minute').children("option:selected").val();
            var total = $('#totaltasktime').val().split(':');

            if (hour == '00' && minute == '00') {
                $(this).val('');
                return;
            }

            hour = hour != '' ? hour : 0;
            hour = parseInt(hour) + parseInt(total[0]);

            minute = minute != '' ? minute : 0;
            minute = parseInt(minute) + parseInt(total[1]);

            if (minute > 50) {
                minute = minute - 60;
                hour++;
            }

            hour = hour < 10 ? '0' + hour : hour;
            minute = minute < 10 ? '0' + minute : minute;

            $('.display-total-time small').text('<?php echo e(__("Total Time worked on this task")); ?> : ' + hour + ' <?php echo e(__("Hours")); ?> ' + minute + ' <?php echo e(__("Minutes")); ?>');
        });


        $(document).on('click', '.timesheet-owner .owner-timesheet-status', function (e) {
            ajaxFilterTimesheetTableView();
        });

        $(document).on('click', '[data-ajax-timesheet-popup="true"]', function (e) {
            e.preventDefault();

            var data = {};
            var url = $(this).data('url');
            var type = $(this).data('type');
            var date = $(this).data('date');
            var task_id = $(this).data('task-id');
            var user_id = $(this).data('user-id');
            var p_id = $(this).data('project-id');

            data.date = date;
            data.task_id = task_id;

            if (user_id != undefined) {
                data.user_id = user_id;
            }

            if (type == 'create') {
                var title = 'Create Timesheet';
                data.p_id = '-1';
                data.project_id = data.p_id != '-1' ? data.p_id : p_id;

            } else if (type == 'edit') {
                var title = 'Edit Timesheet';
            }

            $("#commonModal .modal-title").html(title + ` <small>(` + moment(date).format("ddd, Do MMM YYYY") + `)</small>`);

            $.ajax({
                url: url,
                data: data,
                dataType: 'html',
                success: function (data) {
                    // $('#commonModal .body').html(data);
                    $('#commonModal .modal-body').html(data);
                    $("#commonModal").modal('show');
                    commonLoader();
                    loadConfirm();
                }
            });
        });


       
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home3/taskmagix/public_html/in/app/resources/views/projects/timesheet_list.blade.php ENDPATH**/ ?>