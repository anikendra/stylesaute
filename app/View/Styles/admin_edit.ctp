<div class="styles form">
<?php echo $this->Form->create('Style'); ?>
	<fieldset>
		<legend><?php echo __('Admin Edit Style'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('style');
		echo $this->Form->input('Profile');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Style.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Style.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Styles'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Profiles'), array('controller' => 'profiles', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Profile'), array('controller' => 'profiles', 'action' => 'add')); ?> </li>
	</ul>
</div>
