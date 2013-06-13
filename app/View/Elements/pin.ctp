<ul class="thumbnails">
	<li class="span12">
		<div class="thumbnail">
			<center><a href="<?php echo $post['Post']['url'];?>" target="_blank"><img src="<?php echo $post['Post']['photo_url'];?>" alt="<?php echo $post['Post']['message'];?>"/></a></center>
			<p class="small"><?php echo $post['Post']['message'];?></p>			
			<div class="row-fluid" id="pinstats">
				<?php if(isset($post['Pinstat']['likes']) && $post['Pinstat']['likes']>0):?>
				<div class="span3">
					<?php echo $post['Pinstat']['likes'];?> <i class="icon-thumbs-up" id="tip" data-toggle="tooltip" title="Likes"></i>
				</div>
				<?php endif;?>
				<?php if(isset($post['Pinstat']['repins']) && $post['Pinstat']['repins']>0):?>
				<div class="span3">
					<?php echo $post['Pinstat']['repins'];?> <i class="icon-retweet" id="tip" data-toggle="tooltip" title="Repins"></i>
				</div>
				<?php endif;?>
				<?php if(isset($post['Pinstat']['comments']) && $post['Pinstat']['comments']>0):?>
				<div class="span3">
					<?php echo $post['Pinstat']['comments'];?> <i class="icon-comment" id="tip" data-toggle="tooltip" title="Comments"></i>
				</div>
				<?php endif;?>
				<?php if(isset($post['Pinstat']['reach']) && $post['Pinstat']['reach']>0):?>
				<div class="span3">
					<?php echo $post['Pinstat']['reach'];?> <i class="icon-signal" id="tip" data-toggle="tooltip" title="Reach"></i>
				</div>
				<?php endif;?>
				<?php if(isset($post['Pinstat']['clicks']) && $post['Pinstat']['clicks']>0):?>
				<div class="span3">
					<a target="_blank" href="<?php echo $base_url;?>posts/clickstats/<?php echo basename($post['Post']['url']);?>" id="clickstats" title="Click Details"><?php echo $post['Pinstat']['clicks'];?> <i class="icon-hand-down" id="tip" data-toggle="tooltip" title="Clicks"></i></a>
				</div>
				<?php endif;?>
			</div>
		</div>		
	</li>
</ul>