Welcome <?php echo $user['username']; ?>,<br/>
In order to get started please click on the following link to activate your account:<br/>
<?php echo Router::url(array('action' => 'activate', 'activation_code' => $user['activation_code']), true); ?>
<br>
If the above link does not work, please enter <b><?php echo $user['activation_code'];?></b> in the text field provided in the page.
<br>
Reply to this email if it still doesn't work.<br>
We look forward to seeing you!<br/><br/>
Regards,<br>
Anikendra at Copublish.in
