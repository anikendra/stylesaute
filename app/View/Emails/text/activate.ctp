Welcome <?php echo $user['username']; ?>,

In order to get started please click on the following link to activate your account:

<?php echo Router::url(array('action' => 'activate', 'activation_code' => $user['activation_code']), true)."\n"; ?>

If the above link does not work, please enter <?php echo $user['activation_code'];?> in the text field provided in the page.

Reply to this email if it still doesn't work.

We look forward to seeing you!

Regards,

Anikendra at Copublish.com
