<?php
class EmailConfig{
    public $signMeUp = array(
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
        'from' => "admin@exampledomain.com",
        'layout' => 'default',
        'welcome_subject' => 'Welcome to MyDomain.com %username%!',
        'activation_subject' => 'Activate Your MyDomain.com Account %username%!',
        'sendAs' => 'html',//html
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

    public $smtp = array(
        'transport' => 'Smtp',
        'from' => array('anikendra@copublish.in' => 'Anikendra at Copublish'),
        'host' => 'smtp.sendgrid.net',
        'port' => 587,
        'timeout' => 30,
        'username' => 'copublish',
        'password' => 'dihing232',
        'client' => null,
        'log' => false,
        'tls' => false
        //'charset' => 'utf-8',
        //'headerCharset' => 'utf-8',
    );
}
?>
