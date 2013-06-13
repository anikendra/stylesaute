<div class="span11 offset1">
	<?php echo $this->Form->create('Presignup',array('class'=>'form-inline','action'=>'request'));?>
	<?php echo $this->Form->input('type',array('type'=>'hidden','value'=>'publisher'));?>
	<div class="margin-top-5">
		<?php echo $this->Form->input('blog_url',array('class' =>'span12 h40', 'label'=>false,'placeholder'=>__('Enter your Site, Blog or App Url')));?>	
	</div>
	<div class="hidden mt20">
		<span class="label label-success"><?php echo __('Request an early Invite');?></span>
		<div class="clearfix mt20"></div>
		<div class="form-inline">
			<?php echo $this->Form->input('email',array('div' => false, 'class' =>'input-large pull-left h40', 'label'=>false,'placeholder'=>__('Email')));?>
			<span class="span2">&nbsp;</span>
			<button type="submit" data-disable-with="Submitting form..." class="btn btn-primary btn-large span4 pull-left h40"><?php echo __(ucwords('start making money'));?></button>
		</div>		
	</div>
	<?php echo $this->Form->end();?>
</div>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
    var validator = $("#PresignupRequestForm").validate({	
		errorPlacement: function(error, element) {			
			error.appendTo( element.parent("div") );
		}
	});	
    $("#PresignupEmail").rules('add',{
        required: true,				
        email: true,            
        messages: {
            required: "<?php __('Please enter your email');?>",									                
            email: "<?php __('Invalid email address');?>"
        }
    });
    $('#PresignupBlogUrl').click(function(){
    	$('div.hidden').show('slow');
    })
});
</script>