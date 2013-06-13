<div class="styles index">
	<h2><?php echo __('Styles'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id'); ?></th>
			<th><?php echo $this->Paginator->sort('style'); ?></th>
			<th><?php echo $this->Paginator->sort('created'); ?></th>
			<th><?php echo $this->Paginator->sort('modified'); ?></th>
			<th class="actions"><?php echo __('Actions'); ?></th>
	</tr>
	<?php
	foreach ($styles as $style): ?>
	<tr>
		<td><?php echo h($style['Style']['id']); ?>&nbsp;</td>
		<td><?php echo h($style['Style']['style']); ?>&nbsp;</td>
		<td><?php echo h($style['Style']['created']); ?>&nbsp;</td>
		<td><?php echo h($style['Style']['modified']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View'), array('action' => 'view', $style['Style']['id'])); ?>
			<?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $style['Style']['id'])); ?>
			<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $style['Style']['id']), null, __('Are you sure you want to delete # %s?', $style['Style']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
	));
	?>	</p>

	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('previous'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('next') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Style'), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Profiles'), array('controller' => 'profiles', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Profile'), array('controller' => 'profiles', 'action' => 'add')); ?> </li>
	</ul>
</div>
