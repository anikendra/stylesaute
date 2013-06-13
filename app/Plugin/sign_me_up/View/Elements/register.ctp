<div id="push"></div>
<?php
echo $this->Form->create('User',array('class'=>'form-signin'));
// echo $this->Form->input('username');
echo $this->Form->input('email',array('placeholder'=>'Email Address','class'=>"input-block-level"));
echo $this->Form->input('password1', array('label' => 'Password', 'type' => 'password','placeholder'=>'Password','class'=>"input-block-level"));
echo $this->Form->input('password2', array('label' => 'Confirm password', 'type' => 'password','placeholder'=>'Confirm Password','class'=>"input-block-level"));
echo $this->Form->input('group_id', array('label' => false, 'type' => 'hidden', 'class'=>"input-block-level", 'value' => $group_id));
?>
<button class="btn btn-large btn-primary" type="submit">Register</button>         
<?php echo $this->Form->end();?>