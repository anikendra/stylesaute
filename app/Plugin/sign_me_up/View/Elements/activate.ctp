<div id="push"></div>
<?php echo $this->Form->create('User',array('class'=>'form-signin'));?>
<h2>Activate Account</h2>
<p>Please paste your activation code below:</p>
<?php echo $this->Form->input('activation_code',array('placeholder'=>'Activation Code','class'=>"input-block-level"));?>
<button class="btn btn-large btn-primary" type="submit">Activate</button>         
<?php echo $this->Form->end();?>
