<?php if(sizeof($cities)):?>
<?php //debug($cities);?>
<?php foreach($cities AS $city):?>
<?php echo "<div class='suggest_suggestion suggest_selected'><span>".$city['Country']['country']."</span></div>|"
		.$city['Country']['country']."|".$city['Country']['id']."|".$city['Country']['FIPS104']."\n";?>
<?php endforeach;?>
<?php endif;?>