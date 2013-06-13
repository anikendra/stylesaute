<div class="items view">
<h2><?php  echo __('Item'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($item['Item']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($item['Item']['name']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Min Price'); ?></dt>
		<dd>
			<?php echo h($item['Item']['min_price']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Created'); ?></dt>
		<dd>
			<?php echo h($item['Item']['created']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Modified'); ?></dt>
		<dd>
			<?php echo h($item['Item']['modified']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Item'), array('action' => 'edit', $item['Item']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Item'), array('action' => 'delete', $item['Item']['id']), null, __('Are you sure you want to delete # %s?', $item['Item']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Items'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Item'), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Budgets'), array('controller' => 'budgets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Budget'), array('controller' => 'budgets', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php echo __('Related Budgets'); ?></h3>
	<?php if (!empty($item['Budget'])): ?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Name'); ?></th>
		<th><?php echo __('Item Limit'); ?></th>
		<th><?php echo __('Tag Line'); ?></th>
		<th><?php echo __('Description'); ?></th>
		<th><?php echo __('Icons'); ?></th>
		<th><?php echo __('Created'); ?></th>
		<th><?php echo __('Modified'); ?></th>
		<th class="actions"><?php echo __('Actions'); ?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($item['Budget'] as $budget): ?>
		<tr>
			<td><?php echo $budget['id']; ?></td>
			<td><?php echo $budget['name']; ?></td>
			<td><?php echo $budget['item_limit']; ?></td>
			<td><?php echo $budget['tag_line']; ?></td>
			<td><?php echo $budget['description']; ?></td>
			<td><?php echo $budget['icons']; ?></td>
			<td><?php echo $budget['created']; ?></td>
			<td><?php echo $budget['modified']; ?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'budgets', 'action' => 'view', $budget['id'])); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'budgets', 'action' => 'edit', $budget['id'])); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'budgets', 'action' => 'delete', $budget['id']), null, __('Are you sure you want to delete # %s?', $budget['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Budget'), array('controller' => 'budgets', 'action' => 'add')); ?> </li>
		</ul>
	</div>
</div>
