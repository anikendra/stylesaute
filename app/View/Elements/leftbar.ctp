<div class="span3 bs-docs-sidebar">
    <ul class="nav nav-list bs-docs-sidenav affix">      
      	<li><?php //echo $this->Html->link($logged_user['email'], '/users/dashboard'); ?>
			    <a href="<?php echo $base_url;?>users/dashboard" title="My Dashboard"><i class="icon-chevron-right"></i>Home</a>
      	</li>
      	<li><?php //echo $this->Html->link('Add Account', '/profiles/add'); ?>
      		<a href="#myModal" role="button" data-toggle="modal"><i class="icon-chevron-right"></i>Add Account</a>
      	</li>
      	<li><?php //echo $this->Html->link('Post Update', '/posts/add'); ?>
			    <a id="inviteButton" href="<?php echo $base_url;?>invites/add" data-toggle="modal" role="button"><i class="icon-chevron-right"></i>Invite Copublisher</a>
      	</li>  	
    </ul>  
</div><!--/span-->