<?php echo $this->Html->css('fineuploader-3.6.0');?>
 <style>
/* Fine Uploader
-------------------------------------------------- */
.qq-upload-list {
text-align: left;
}
/* For the bootstrapped demos */
li.alert-success {
background-color: #DFF0D8;
}
li.alert-error {
background-color: #F2DEDE;
}
.alert-error .qq-upload-failed-text {
display: inline;
}
.medium_image_wrapper{
	margin-top: 50px;
}
</style>
<div id="push"></div>
<div class="brands form">
<?php echo $this->Form->create('Brand'); ?>
	<fieldset>
		<legend><?php echo __('Admin Add Brand'); ?></legend>
	<?php
		echo $this->Form->input('name');
		//echo $this->Form->input('logo');
	?>
	<div class="input text required span12">
		 <div class="medium_image_wrapper span4">
			<div id="bootstrapped-fine-uploader"></div>
			<div class="preview_wrapper"></div>
		</div>
	</div>
	<?php
		echo $this->Form->input('logo',array('type'=>'hidden'));
		echo $this->Form->input('type');
		echo $this->Form->input('Profile',array('type'=>'hidden'));
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Brands'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Profiles'), array('controller' => 'profiles', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Profile'), array('controller' => 'profiles', 'action' => 'add')); ?> </li>
	</ul>
</div>
<script type="text/javascript">
var baseUrl = '<?php echo $base_url;?>';
</script>
<?php echo $this->Html->script('jquery.fineuploader-3.6.0');?>
<script type="text/javascript">
	$().ready(function(){
		$('#bootstrapped-fine-uploader').fineUploader({
			request: {
				endpoint: baseUrl+'brands/upload'
			},
		 	failedUploadTextDisplay: {
				mode: 'custom',
				maxChars: 40,
				responseProperty: 'error',
				enableTooltip: true
			},
			text: {
				uploadButton: '<div><i class="icon-upload icon-white"></i>Upload</div>'
			},
			template: '<div class="qq-uploader span12">' + '<pre class="qq-upload-drop-area span12"><span>{dragZoneText}</span></pre>' + '<div class="qq-upload-button btn btn-success" style="width: auto;">{uploadButtonText}</div>' + '<span class="qq-drop-processing"><span>{dropProcessingText}</span><span class="qq-drop-processing-spinner"></span></span>' + '<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;"></ul>' + '</div>',
			classes: {
				success: 'alert alert-success',
				fail: 'alert alert-error'
			},
			showMessage: function(message) {
				// Using Bootstrap's classes
				$('#bootstrapped-fine-uploader').append('<div class="alert alert-error">' + message + '</div>');
			}
		}).on('complete', function(event, id, fileName, responseJSON) {
			if (responseJSON.success) {
				$('#BrandLogo').val(responseJSON.uploadName);
				$('.preview_wrapper').html('<img src="'+responseJSON.uploadName+'" alt="' + fileName + '">');
			} else{
				
			}
		});
	});
</script>
