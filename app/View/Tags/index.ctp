<?php //debug($tags);?>
<?php
if(!empty($tags)){
	$json = array();
	foreach ($tags as $key => $tag) {
		$json['tags'][] = array('tag'=>$tag);
	}
	echo json_encode($json);
}
?>