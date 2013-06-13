<link href='<?php echo STATIC_URL;?>css/homepage.css' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>

<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide">
  <div class="carousel-inner">
    <div class="item active">
      <img src="<?php echo STATIC_URL;?>img/slider/for-musicians.jpg" alt="<?php echo __('Promote your music video on Youtube. Become the next Youtube sensation.');?>">
      <div class="container">
        <div class="hero-inner">
          <div class="carousel-caption">
            <h1><?php echo __('Vidoofy for musicians');?>.</h1>
            <p><?php echo __('From indie bands to top music labels');?>.<br/><?php echo __('Trusted by the biggest labels, affordable for everyone');?>.</p>
            <a class="btn btn-large btn-primary" href="<?php echo $base_url;?>presignups/request/advertiser"><?php echo __('Sign up as a musician');?></a>
          </div>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="<?php echo STATIC_URL;?>img/slider/for-movies.jpg" alt="<?php echo __('Promote your movie trailer on Youtube. Get word of mouth publicity.');?>">
      <div class="container">
        <div class="hero-inner">
          <div class="carousel-caption">
            <h1><?php echo __('Vidoofy for movies');?>.</h1>
            <p><?php echo __('Top-5 movie studios and indie producers.');?><br/><?php echo __('Promote your trailer now!');?></p>
            <a class="btn btn-large btn-primary" href="<?php echo $base_url;?>presignups/request/advertiser"><?php echo __('Sign up as a movie studio');?></a>
          </div>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="<?php echo STATIC_URL;?>img/slider/for-bloggers.jpg" alt="<?php echo __('Monetize your blog by using Vidoofy sponsored videos.');?>">
      <div class="container">
        <div class="hero-inner">
          <div class="carousel-caption">
            <h1><?php echo __('Vidoofy for bloggers');?>.</h1>
            <p><?php echo __('Authority niche authors and hobby bloggers.');?><br/><?php echo __('Promote relevant videos!');?></p>
            <a class="btn btn-large btn-primary" href="<?php echo $base_url;?>presignups/request/publisher"><?php echo __('Sign up as a blogger');?></a>
          </div>
        </div>
      </div>
    </div>
    <div class="item">
      <img src="<?php echo STATIC_URL;?>img/slider/for-gamers.png" alt="<?php echo __('Monetize your Facebook or mobile games with virtual currency.');?>">
      <div class="container">
        <div class="hero-inner">
          <div class="carousel-caption">
            <h1><?php echo __('Vidoofy for indie game developers');?>.</h1>
            <p><?php echo __('Top game publisher or indie developers?');?><br/><?php echo __('Vidoofy works for all!');?></p>
            <a class="btn btn-large btn-primary" href="<?php echo $base_url;?>presignups/request/publisher"><?php echo __('Sign up as a game developer');?></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div><!-- /.carousel -->



<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
<a class="next" name="publishers"></a>
<div class="container marketing">
  <div class="page-header text-center">
    <h1><?php echo __('Do you own a blog, facebook or mobile app');?>?</h1>
  </div>
  <!-- Three columns of text below the carousel -->
  <div class="row">
    <div class="span4">
      <img class="img-circle" data-src="holder.js/140x140" src="<?php echo STATIC_URL;?>img/publisher-step-1.png">
      <!-- <h2><?php //echo __('Multiple Publishers');?></h2> -->
      <p><?php echo __('Add your website or app to our directory');?></p>
      <!-- <p><a class="btn" href="<?php //echo $base_url;?>pinterest-management-team"><?php //echo __('View details');?> &raquo;</a></p> -->
    </div><!-- /.span4 -->
    <div class="span4">
      <img class="img-circle" data-src="holder.js/140x140" src="<?php echo STATIC_URL;?>img/publisher-step-2.png">
      <!-- <h2><?php //echo __('Pinterest Scheduler');?></h2> -->
      <p><?php echo __('Pick sponsored videos or integrate with our API');?></p>
      <!-- <p><a class="btn" href="<?php //echo $base_url;?>pinterest-scheduler-tool"><?php //echo __('Know more');?> &raquo;</a></p> -->
    </div><!-- /.span4 -->
    <div class="span4">
      <img class="img-circle" data-src="holder.js/140x140" src="<?php echo STATIC_URL;?>img/publisher-step-3.png">
      <!-- <h2><?php //echo __('Campaign Metrics');?></h2> -->
      <p><?php echo __('Start earning money');?></p>
      <!-- <p><a class="btn" href="<?php //echo $base_url;?>pinterest-analytics"><?php //echo __('More details');?> &raquo;</a></p> -->
    </div><!-- /.span4 -->
  </div><!-- /.row -->

</div>

<div class="container marketing darkpurple">
  <div class="row">
    <?php echo $this->Element('publisher_presignup');?>
  </div>
</div>

<?php echo $this->element('modal');?>
  <!-- /END THE FEATURETTES -->
<script src="<?php echo STATIC_URL;?>js/bootstrap-carousel.js"></script>
<script src="<?php echo STATIC_URL;?>js/bootstrap-transition.js"></script>
<script>
$(document).ready(function(){
   $('.carousel').carousel('cycle');
});
</script>
