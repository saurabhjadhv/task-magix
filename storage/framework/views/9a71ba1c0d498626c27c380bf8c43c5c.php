<?php
$logo = \App\Models\Utility::get_file('/');
?>

<div class="modal-header pb-2 pt-2">
    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e($tracker->tasks->title); ?> - <small><?php echo e($tracker->tasks->description); ?></small> <small>( <?php echo e($tracker->total); ?>, <?php echo e(date('d M',strtotime($tracker->start_time))); ?> )</small></h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body p-1">
      <div class="row ">
        <div class="col-lg-12 product-left mb-5 mb-lg-0">
            <?php if( $images->count() > 0): ?>
            <div class="swiper-container product-slider mb-2 pb-2" style="border-bottom:solid 2px #f2f3f5">
                <div class="swiper-wrapper">
                    <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="swiper-slide" id="slide-<?php echo e($image->id); ?>">
                            <img src="<?php echo e($logo.$image->img_path); ?>" alt="..."  class="img-fluid">
                            <div class="time_in_slider"><?php echo e(date('H:i:s, d M ',strtotime($image->time))); ?> | 
                                <a href="#" class="delete-icon"  data-confirm-delete="<?php echo e(__('Are You Sure?').'|'.__('This action can not be undone. Do you want to continue?')); ?>" data-confirm-yes="removeImage(<?php echo e($image->id); ?>)">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>            
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            
            <div class="swiper-container product-thumbs">
                <div class="swiper-wrapper">
                    <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="swiper-slide" id="slide-thum-<?php echo e($image->id); ?>">
                        <img src="<?php echo e($logo.$image->img_path); ?>" alt="..." class="img-fluid">
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
                
                </div>
            </div>
            <?php else: ?>
            <div class="no-image">
                <h5 class="text-muted">Images Not Available .</h5>
            </div>
            <?php endif; ?>
        </div>
      </div>
  </div>
  <script type="text/javascript">
    $('[data-confirm-delete]').each(function () {
    var me = $(this),
        me_data = me.data('confirm-delete');
        me_data = me_data.split('-');
        me.fireModal({
        title: me_data[0],
        body: me_data[1],
        buttons: [
            {
                text: me.data('confirm-text-yes') || 'Yes',
                class: 'btn btn-sm btn-danger rounded-pill',
                handler: function (modal) {
                    eval(me.data('confirm-yes'));
                    $.destroyModal(modal);
                }
            },
            {
                text: me.data('confirm-text-cancel') || 'Cancel',
                class: 'btn btn-sm btn-secondary rounded-pill',
                handler: function (modal) {
                    $.destroyModal(modal);
                    eval(me.data('confirm-no'));
                }
            }
        ]
    })
});
</script><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/time_trackers/images.blade.php ENDPATH**/ ?>