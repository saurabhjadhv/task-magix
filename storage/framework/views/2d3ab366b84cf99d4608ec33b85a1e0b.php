<?php echo e(Form::open(array('url' => 'contractclient','method' =>'post'))); ?>

<div class="row">
    <?php if(Utility::plancheck()['enable_chatgpt'] == 'on'): ?>
        <div class="col-12 col-md-12">
            <div class="text-right">
                <a href="#" class="btn btn-sm btn-primary rounded-pill ml-2" data-url="<?php echo e(route('generate',['contract'])); ?>" data-ajax-popup-over="true" data-bs-placement="top" data-size="md" title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate with AI')); ?>">
                    <span class="btn-inner--text text-white"> <span><i class="fas fa-robot"></i></span> <?php echo e(__('Generate with AI')); ?></span>
                </a>
            </div>
        </div>
    <?php endif; ?>

    <div class="col-md-6 form-group">
        <?php echo e(Form::label('client_name', __('Client Name'), ['class' => 'col-form-label'])); ?>

        <?php echo e(Form::select('client_name', $client, null, ['class' => 'form-control client_id','id' => 'client_id', 'placeholder' => 'Select client' ,'required' => 'required'])); ?>

    </div>

    <div class="col-md-6 form-group">
        <?php echo e(Form::label('project', __('Project'), ['class' => 'col-form-label'])); ?>

        <?php echo e(Form::select('project', $projects, null, ['class' => 'form-control select2', 'required' => 'required'])); ?>

    </div>

    <div class="col-md-6 form-group">
        <?php echo e(Form::label('value', __('Value'), ['class' => 'col-form-label'])); ?>

        <?php echo e(Form::number('value', '', ['class' => 'form-control', 'required' => 'required', 'min' => '1'])); ?>

    </div>

    <div class="col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('subject', __('Subject'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('subject', null, ['class' => 'form-control', 'required' => 'required', 'onkeyup' => "this.value = this.value.replace(/\s+/g, ' ')", 'onblur' => "this.value = this.value.trim()"])); ?>

        </div>
    </div>

    <div class="col-md-12">
        <div class="form-group">
            <?php echo e(Form::label('type', __('Type'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('type', $contractType, null, ['class' => 'form-control select2', 'required' => 'required'])); ?>

        </div>
    </div>

    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('start_date', __('Start date'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::date('start_date', date('Y-m-d'), ['class' => 'form-control'])); ?>

        </div>
    </div>
    <div class="col-12 col-md-6">
        <div class="form-group">
            <?php echo e(Form::label('end_date', __('End date'),['class' => 'form-control-label'])); ?>

            <?php echo e(Form::date('end_date', date('Y-m-d'), ['class' => 'form-control'])); ?>

        </div>
    </div>
    <div class="col-12 col-md-12">
        <div class="form-group">
            <?php echo e(Form::label('descriptions', __('Description'),['class' => 'form-control-label'])); ?>

            <small class="form-text text-muted mb-2 mt-0"><?php echo e(__('This textarea will autosize while you type.')); ?></small>
            <?php echo e(Form::textarea('descriptions', null, ['class' => 'form-control grammer_textarea','rows' => '3','data-toggle' => 'autosize'])); ?>

        </div>
    </div>

    <div class="form-group col-md-12 text-right">
        <?php echo e(Form::submit(__('Create'),array('class'=>'btn btn-sm btn-primary rounded-pill'))); ?>

        <button type="button" class="btn btn-sm btn-secondary rounded-pill" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
    </div>
</div>
<?php echo e(Form::close()); ?>


<?php /**PATH /home1/taskmagix/public_html/in/app/resources/views/contracts/create.blade.php ENDPATH**/ ?>