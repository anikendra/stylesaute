<div id="registration">
	<h3><?php echo __('Signup for a free account now');?>!</h3>
<?php
echo $this->Form->create('User',array('class'=>'form-signin form-horizontal','action'=>'register'));
echo $this->Form->input('email',array('placeholder'=>'Email Address','class'=>"input-block-level"));
echo $this->Form->input('password1', array('label' => 'Password', 'type' => 'password','placeholder'=>'Password','class'=>"input-block-level"));
echo $this->Form->input('password2', array('label' => 'Confirm password', 'type' => 'password','placeholder'=>'Confirm Password','class'=>"input-block-level"));
?>
<button class="btn btn-large btn-primary" type="submit"><?php echo __('Register');?></button>         
<?php echo $this->Form->end();?>
</div>