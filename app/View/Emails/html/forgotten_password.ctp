Hi <?php echo $user['username']; ?>,<br>
Someone (hopefully you) has requested a password reset on your account. In order to reset your password please click on the link below:<br>
<?php echo $this->Html->link('Reset your password', Router::url(array('action' => 'forgotten_password', 'password_reset' => $user['password_reset']), true)); ?>
<br/><br/>
Regards,<br/>
Anikendra at Copublisha.in
