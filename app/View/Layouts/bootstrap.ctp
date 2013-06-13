<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><?php echo $title_for_layout; ?></title>

		<!--[if lt IE 9]>
      		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
    	<![endif]-->
		<script type="text/javascript" src="<?php echo $base_url;?>js/jquery-1.7.2.min.js"></script>		
    	<?php
    		//Load Bootstrap:  
    		echo $this->Bootstrap->load(); 		

			echo $this->fetch('meta');
			echo $this->fetch('css');
			echo $this->fetch('script');
    	?>

	    <!-- HTML5 shim, for IE6-8 support of HTML5 elements --> 
	    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]--> 
	    <link href="<?php echo $base_url;?>css/style.css" rel="stylesheet"/>     
	    <?php echo $this->Html->css('twitter/bootstrap/docs');?>	    
	    <link rel="shortcut icon" href="<?php echo $base_url;?>favicon.ico" type="image/x-icon">
		<link rel="icon" href="<?php echo $base_url;?>favicon.ico" type="image/x-icon">
	</head>
	<body>
	   	<div id="wrap">
		    <div class="navbar navbar-fixed-top">
		    	<?php echo $this->element('header');?>
		    </div>

		    <div class="container-fluid">
		        <div class="row-fluid">
		            <?php echo $this->element('leftbar');?>

		           	<div id="main-content" class="span9">

						<?php echo $this->Session->flash(); ?>

						<?php echo $this->fetch('content'); ?>

		            </div><!--/span-->

		        </div><!--/row-->
		    </div> <!-- /container -->
		    <div id="push"></div>
		</div>
	    <div id="footer">
			<div class="container">
			<?php echo $this->element('footer');?>
			<?php echo $this->element('sql_dump'); ?>
			</div>
	    </div>
	</body>
</html>