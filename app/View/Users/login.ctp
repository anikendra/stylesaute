<!--<div class="fb-button-container-centered">
    <fb:login-button scope="publish_stream,email,user_birthday,user_location">Login with Facebook</fb:login-button>		                
</div>-->
<!--
<h3 class="or-separator signpainter">or</h3>
-->        
<?php echo $this->Form->create('User',array('class'=>'form-signin'));?>
<h2 class="form-signin-heading">Log In</h2>
<div style="margin: 0pt; padding: 0pt; display: inline;">                
	<a title="<?php //echo __('Authorize with Facebook');?>" href="<?php echo $dialog_url;?>" class="btn btn-primary btn-large " id="fblogin">
		<i class="icon-facebook icon-large"></i>
		<span class="fb-connect-text"><?php echo __('Log in with Facebook');?></span>
	</a>
	<div class="clearfix mt20"></div>
	<a title="<?php //echo __('Authorize with Twitter');?>" class="btn btn-large " href="<?php echo $twitterObj->getAuthorizationUrl();?>">
		<i class="icon-twitter icon-large"></i>
		<span class="fb-connect-text"><?php echo __('Sign in with Twitter');?></span>
	</a>
	<div class="clearfix mt20"></div>
	<div id="UserUsername" class="textInput">  
	    <label for="UserUsername">Email</label>              
	    <?php echo $this->Form->input('username',array('label'=>false,'placeholder'=>'myself@example.com','class'=>"input-block-level"));?>
	</div>
	<div id="inputPassword" class="textInput">
	    <?php echo $this->Form->input('password', array('type' => 'password','placeholder'=>'Password','class'=>"input-block-level"));?> 
	</div>                    
	<div class="clear"></div>
	<div class="formActions clearfix">    
	    <button class="btn btn-large btn-primary" type="submit">Sign in</button>         
	    <div class="extra-actions clearfix">
		<a class="forgotPassword" href="<?php echo $base_url;?>users/forgotten_password">Forgot password?</a> <span class="dot">·</span>
		<a href="<?php echo $base_url;?>users/register">Need an account?</a>
	    </div>
	</div>
<?php echo $this->Form->end();?>					
<?php echo $this->element('fb');?>
