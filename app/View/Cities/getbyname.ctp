<?php if(sizeof($cities)):?>
<?php //debug($cities);?>
<?php foreach($cities AS $city):?>
<?php echo "<div class='suggest_suggestion suggest_selected'><span>".$city['City']['city']."</span><br><span class='region'>".$city['Region']['region'].",".$city['Country']['country']."</span></div>|"
		.$city['City']['city']."|".$city['City']['id']."|".$city['Region']['region']."|".$city['Region']['id']."|".$city['Country']['country']."|".$city['Country']['id']."|".$city['Country']['FIPS104']."\n";?>
<?php endforeach;?>
<?php endif;?>