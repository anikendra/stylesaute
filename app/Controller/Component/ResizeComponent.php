<?php
class ResizeComponent extends Component
{
	   var $image;
	   var $image_type;
	 
	   function load($filename) {
	 
		  $image_info = getimagesize($filename);
		  $this->image_type = $image_info[2];
		  if( $this->image_type == IMAGETYPE_JPEG ) {
	 
			 $this->image = imagecreatefromjpeg($filename);
		  } elseif( $this->image_type == IMAGETYPE_GIF ) {
	 
			 $this->image = imagecreatefromgif($filename);
		  } elseif( $this->image_type == IMAGETYPE_PNG ) {
	 
			 $this->image = imagecreatefrompng($filename);
		  }
	   }
	   function save($filename, $compression=100, $permissions=null) {
		    
		  if( $this->image_type == IMAGETYPE_JPEG ) {
			 imagejpeg($this->image,$filename,$compression);
		  } elseif( $this->image_type == IMAGETYPE_GIF ) {
	 
			 imagegif($this->image,$filename);
		  } elseif( $this->image_type == IMAGETYPE_PNG ) {
	 
			 imagepng($this->image,$filename);
		  }
		  
		  imagedestroy($this->image);
		  
		  if( $permissions != null) {
	 
			 chmod($filename,$permissions);
		  }
	   }
	   function output($image_type=IMAGETYPE_JPEG) {
	 
		  if( $image_type == IMAGETYPE_JPEG ) {
			 imagejpeg($this->image);
		  } elseif( $image_type == IMAGETYPE_GIF ) {
	 
			 imagegif($this->image);
		  } elseif( $image_type == IMAGETYPE_PNG ) {
	 
			 imagepng($this->image);
		  }
	   }
	   function getWidth() {	 	 
		  return imagesx($this->image);
	   }
	   function getHeight() {	 	
		  return imagesy($this->image);
	   }
	   function resizeToHeight($height) {
	 
		  $ratio = $height / $this->getHeight();
		  $width = $this->getWidth() * $ratio;
		  $this->resize($width,$height);
	   }
	 
	   function resizeToWidth($width) {
		  $ratio = $width / $this->getWidth();
		  $height = $this->getheight() * $ratio;
		  $this->resize($width,$height);
	   }
	 
	   function scale($scale) {
		  $width = $this->getWidth() * $scale/100;
		  $height = $this->getheight() * $scale/100;
		  $this->resize($width,$height);
	   }
	 
	   function resize($width,$height) {		
		  $new_image = imagecreatetruecolor($width, $height);
		  
		  if( ($this->image_type == IMAGETYPE_GIF) || ($this->image_type == IMAGETYPE_PNG)){
			   $transparency = imagecolortransparent($this->image);		   		 
			 if ($transparency >= 0) {
				$transparent_color  = imagecolorsforindex($this->image, $trnprt_indx);
				$transparency       = imagecolorallocate($new_image, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);
				imagefill($new_image, 0, 0, $transparency);
				imagecolortransparent($new_image, $transparency);
			  }
			  elseif ($this->image_type == IMAGETYPE_PNG) {
				imagealphablending($new_image, false);
				$color = imagecolorallocatealpha($new_image, 0, 0, 0, 127);
				imagefill($new_image, 0, 0, $color);
				imagesavealpha($new_image, true);
			  }
		  }
			imagecopyresampled($new_image, $this->image, 0, 0, 0, 0, $width, $height, $this->getWidth(), $this->getHeight());
			$this->image = $new_image;		  
	   } 
	   
	   function resizeAuto() {
		  $width = $this->getWidth();
		  $height = $this->getheight();
		  
		  if($width > $height)
		  {			  	    
			  $this->resizeToWidth(320);
			  /*$ratio=$height/$width;
			  if($ratio>0.75)
			  {				
				 $this->resizeToHeight(320);
			  }
			  else
			  {
				$this->resizeToWidth(480);
			  }*/
		  }
		  elseif($height >= $width)
		  {			 
			 $this->resizeToHeight(480);
			 /*$ratio=$width/$height;
			  if($ratio>0.75)
			  {
				$this->resizeToWidth(320);
			  }
			  else
			  {
				$this->resizeToHeight(480);
			  }*/
		  }		  
	   }
	   
	   function crop($thumb_width, $thumb_height){	
			$width = $this->getWidth();
			$height = $this->getheight();
			
			$original_aspect = $width / $height;
			$thumb_aspect = $thumb_width / $thumb_height;
			
			if ( $original_aspect >= $thumb_aspect )
			{
			   // If image is wider than thumbnail (in aspect ratio sense)
			   $new_height = $thumb_height;
			   $new_width = $width / ($height / $thumb_height);
			}
			else
			{
			   // If the thumbnail is wider than the image
			   $new_width = $thumb_width;
			   $new_height = $height / ($width / $thumb_width);
			}
			
			$thumb = imagecreatetruecolor( $thumb_width, $thumb_height );
			if( ($this->image_type == IMAGETYPE_GIF) || ($this->image_type == IMAGETYPE_PNG)){
				   $transparency = imagecolortransparent($this->image);		   		 
				 if ($transparency >= 0) {
					$transparent_color  = imagecolorsforindex($this->image, $trnprt_indx);
					$transparency       = imagecolorallocate($thumb, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);
					imagefill($thumb, 0, 0, $transparency);
					imagecolortransparent($thumb, $transparency);
				  }
				  elseif ($this->image_type == IMAGETYPE_PNG) {
					imagealphablending($thumb, false);
					$color = imagecolorallocatealpha($thumb, 0, 0, 0, 127);
					imagefill($thumb, 0, 0, $color);
					imagesavealpha($thumb, true);
				  }
			  }
			
			imagecopyresampled($thumb,
							   $this->image,
							   0 - ($new_width - $thumb_width) / 2, // Center the image horizontally
							   0 - ($new_height - $thumb_height) / 2, // Center the image vertically
							   0, 0,
							   $new_width, $new_height,
							   $width, $height);
			 $this->image = $thumb;
		}
}
?>
