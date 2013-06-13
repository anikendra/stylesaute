<?php

$config['SignMeUp'] = array(
        'sendAs' => 'html',//html
        'activation_field' => 'activation_code',
        'useractive_field' => 'active',
        'login_after_activation' => false,
        'welcome_subject' => 'Welcome',
        'activation_subject' => 'Please Activate Your Account',
        'password_reset_field' => 'password_reset',
        'username_field' => 'username',
        'email_field' => 'email',
        'email_layout' => 'default',
        'password_field' => 'password',
        'activation_template' => 'activate',
        'welcome_template' => 'welcome',
        'password_reset_template' => 'forgotten_password',
        'password_reset_subject' => 'Password Reset Request',
        'new_password_template' => 'recovered_password',
        'new_password_subject' => 'Your new Password',
        'transport' => 'Smtp',
        'from' => array('anikendra@copublish.in' => 'Anikendra at Copublish'),
        'host' => 'smtp.sendgrid.net',
        'port' => 587,
        'timeout' => 30,
        'username' => 'copublish',
        'password' => 'dihing232',
);
?>
