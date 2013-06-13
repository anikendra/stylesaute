<div class="row-fluid show-grid" style="width: 100%;float: left;text-align: left">
	<div class="span9" style="width: 74.359%">
		<p>Hi there,</p><br/>
		<p><?php echo $fromName;?> wants to add you in their social media management team of <?php if(isset($profileUrl)):?> their <?php echo ucfirst($invite['Profile']['type']);?> account <a style="color: #08C;text-decoration: none" href="<?php echo $profileUrl;?>" target="_blank"><?php echo ucfirst($invite['Profile']['social_username']);?></a><?php else:?>one of their social media accounts<?php endif;?> on <a style="color: #08C;text-decoration: none" href="http://copublish.in" target="_blank">Copublish</a>!</p><br/>
		<a style="background-color: #F5F5F5;background-image: linear-gradient(to bottom, #FFF, #E6E6E6);background-repeat: repeat-x;border-color: #BBB #BBB #A2A2A2;color: #333;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);-moz-border-bottom-colors: none;-moz-border-left-colors: none;-moz-border-right-colors: none;-moz-border-top-colors: none;border-image: none;border-radius: 4px 4px 4px 4px;border-style: solid;border-width: 1px;box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2) inset, 0 1px 2px rgba(0, 0, 0, 0.05);cursor: pointer;display: inline-block;font-size: 14px;line-height: 20px;margin-bottom: 0;padding: 4px 14px;text-align: center;vertical-align: middle;text-decoration: none" href="<?php echo 'http://copublish.in/invites/accept/'.$invite['Invite']['id'];?>">Start managing</a><br/>
		<?php if(isset($invite['Invite']['pm'])):?>
		<blockquote style="padding: 0 0 0 15px;margin: 0 0 20px;border-left: 0;float: right;padding-right: 15px;padding-left: 0;border-right: 5px solid #eee" class="small pull-right"><p style="margin-bottom: 0;font-size: 16px;font-weight: 300;line-height: 25px;text-align: right"><?php echo $invite['Invite']['pm'];?></p></blockquote><br/>
		<?php endif;?>
		<br/><p><small style="font-size: 85%">Copubish is the <em>Hootsuite for Pinterest</em>. With Copublish, you can let your entire team manage your Pinterest business account. You can manage multiple Pinterest accounts, schedule pins and get insights about your Pinterest marketing campaigns.</small></p><br/>
		<center><a style="border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);-moz-border-bottom-colors: none;-moz-border-left-colors: none;-moz-border-right-colors: none;-moz-border-top-colors: none;background-color: #363636;background-image: linear-gradient(to bottom, #444, #222);background-repeat: repeat-x;border-image: none;border-radius: 4px 4px 4px 4px;border-style: solid;border-width: 1px;box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2) inset, 0 1px 2px rgba(0, 0, 0, 0.05);color: #FFF;cursor: pointer;display: inline-block;font-size: 14px;line-height: 20px;margin-bottom: 0;padding: 4px 14px;text-align: center;text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);vertical-align: middle;text-decoration: none" class="btn btn-inverse" href="<?php echo 'http://copublish.in/invites/accept/'.$invite['Invite']['id'];?>">Join Now!</a></center>
		<br/>
		<p>Thanks,<br/>
		Anikendra at Copublish.in
		</p>
	</div>
</div>
