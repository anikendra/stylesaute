<div class="navbar-inner">
    <div class="container">
        <a class="btn btn-navbar" data-target=".nav-collapse" data-toggle="collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <a href="<?php echo $base_url;?>" title="<?php echo __('Youtube video seeding, video promotion, more Youtube views');?>"><img src="<?php echo $base_url;?>img/vidoofy.png" alt="<?php echo __('Youtube video seeding, video promotion, more Youtube views');?>"/></a>
        <div class="pull-right container nav-collapse" style="width:640px;">
            <ul class="nav">            	
            </ul>
            <ul class="nav pull-right">
            <?php if(!empty($logged_user)):?>
                <?php if(!isset($nonavlinks)):?>                
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-home"></i><?php echo $logged_user['username'];?> <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                            <li><a href="<?php echo $base_url;?>bookmarklet"><i class="icon-pencil"></i><?php echo __('bookmarklet');?></a></li>
                            <li><a href="<?php echo $base_url;?>users/edit"><i class="icon-user"></i><?php echo __('Profile');?></a></li>
                            <li><a href="<?php echo $base_url;?>howitworks"><i class="icon-tasks"></i><?php echo __('How it works');?></a></li>
                            <li><a href="<?php echo $base_url;?>sites"><i class="icon-tasks"></i><?php echo __('My Sites');?></a></li>
                            <li><a href="http://copublish.uservoice.com" target="_blank"><i class="icon-comment"></i><?php echo __('Submit an idea');?></a></li>
                            <li class="divider"></li>
                            <li><a href="<?php echo $base_url;?>users/logout"><i class="icon-off"></i><?php echo __('Sign out');?></a></li>
                        </ul>
                    </li>
                <?php else:?>
                    <li class="dropdown">
                        <a href="<?php echo $base_url;?>users/dashboard" title="<?php echo __('Dashboard');?>"><i class="icon-home"></i><?php echo $logged_user['username'];?> <b class="caret"></b></a>
                    </li>
                <?php endif;?>
            <?php else:?>
                <?php if(!isset($nonavlinks)):?>
                    <li><a href="<?php echo $base_url;?>#" title="<?php echo __('Vidoofy - Adwords for Youtube videos');?>"><?php echo __('For Advertisers');?></a></li>
                    <li><a href="<?php echo $base_url;?>#publishers" title="<?php echo __('Monetize your blog');?>"><?php echo __('For Bloggers');?></a></li>
                    <li><a target='_blank' href="http://blog.vidoofy.com/" title="<?php echo __('Vidoofy Blog');?>"><?php echo __('Blog');?></a></li>
                    <li><a target='_blank' href="http://blog.vidoofy.com/contact-us" title="<?php echo __('Contact Vidoofy team');?>"><?php echo __('Contact Us');?></a></li>
                    <!-- <li><a href="<?php //echo $base_url;?>howitworks" title="<?php //echo __('How does Copublish work');?>"><?php echo __('How it works');?></a></li> -->
                    <!-- <li><a class="btn btn-mini" href="<?php //echo $base_url;?>users/login" title="<?php //echo __('Login to Copublish');?>"><?php //echo __('Login');?></a></li> -->
                    <!-- <li><a class="btn btn-primary btn-mini" href="<?php //echo $base_url;?>users/register" title="<?php //echo __('Signup for free Copublish account');?>"><?php //echo __('Signup');?></a></li> -->
                <?php endif;?>
            <?php endif;?>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
