

<?php
$profile=\App\Models\Utility::get_file('/'.config('chatify.user_avatar.folder'));  
?>

<?php if(!empty($user->avatar)): ?>
<div class="avatar av-l "style="background-image: url('<?php echo e($profile.'/'. $user->avatar); ?>'); justify-content: center;
    display: flex;" ></div>
<?php else: ?>
<div class="avatar av-l" style="background-image: url('<?php echo e($profile.'/avatars/avatar.png'); ?>'); justify-content: center;
display: flex;">
</div>
<?php endif; ?>


<p class="info-name"><?php echo e(config('chatify.name')); ?></p>
<div class="messenger-infoView-btns">
    
    <a href="#" class="danger delete-conversation"><i class="fas fa-trash-alt"></i> Delete Conversation</a>
</div>

<div class="messenger-infoView-shared">
    <p class="messenger-title">shared photos</p>
    <div class="shared-photos-list"></div>
</div>
<?php /**PATH /home3/taskmagix/public_html/in/app/resources/views/vendor/Chatify/layouts/info.blade.php ENDPATH**/ ?>