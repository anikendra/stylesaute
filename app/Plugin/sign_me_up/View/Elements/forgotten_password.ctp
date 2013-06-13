<div id="push"></div>
<?php echo $this->Form->create('User',array('class'=>'form-signin'));?>
<h2 class="form-signin-heading"><?php echo __('Forgot Password');?>?</h2>
<p class="text-info">Please enter your email address below:</p>
<?php echo $this->Form->input('email',array('label'=>false,'placeholder'=>'john@example.com'));?>
<button class="btn btn-large btn-primary" type="submit"><?php echo __('Reset Password');?></button>         
<?php echo $this->Form->end();?>