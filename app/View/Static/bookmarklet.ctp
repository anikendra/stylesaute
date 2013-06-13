<div id="push"></div>
<div class="container-fluid">
	<h2><?php echo __('Copublish Bookmarklet');?></h2>

	<div class="well">

		<h4><?php echo __('Drag the "Copublish" link to your bookmarks bar to post pins or schedule them');?>!</h4>
		<div class="clearfix mt50"></div>
		<center><a title="Copublish" class="btn btn-danger" onclick="return false;" href="javascript:void((function(){var e=document.createElement('script');e.setAttribute('type','text/javascript');e.setAttribute('charset','UTF-8');e.setAttribute('src','<?php echo $base_url;?>js/bookmarklet.js?'+new Date().getTime());document.body.appendChild(e)})());">Copublish</a></center>
		<div class="clearfix mt5"></div>
		<div style="padding-left: 20px;"><b><?php echo __('To install the "Copublish" button in Firefox');?>:</b></div>
		<ol class="bookmarklet">
			<li><?php echo __('Display your Bookmarks Bar by clicking');?> <b>View &gt; Toolbars &gt; Bookmarks Toolbar</b></li>
			<li><?php echo __('Drag the "Copublish" button to your Bookmarks Toolbar');?></li>
			<li><?php echo __('When you are browsing the web, click the "Copublish" button to pin an image');?></li>
		</ol>
	</div>		
</div>