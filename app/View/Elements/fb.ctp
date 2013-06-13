<div id="fb-root"></div>
<script src="//connect.facebook.net/en_US/all.js"></script>
<script>
  FB.init({
    appId      : '<?php echo $fbappid;?>',
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
  });
</script>

<script>
/*
	<?php if(!empty($logged_user)):?>
	var loggedIn = true;
	<?php else:?>
	var loggedIn = false;
	<?php endif;?>

	FB.Event.subscribe('auth.login', function(response) {
	if (response.authResponse) {          
            console.log("logged user "+response.authResponse.accessToken);
//	    FB.api('/me', function(response) {
		if(!loggedIn){
			window.location = '<?php echo $base_url;?>users/checkfbuser/'+response.authResponse.accessToken;
			loggedIn = true;
		}
//	    });
	  }
      });
	
FB.Event.subscribe('auth.statusChange',function(response) {
  if (response.status === 'connected') {
    // the user is logged in and connected to your
    // app, and response.authResponse supplies
    // the user's ID, a valid access token, a signed
    // request, and the time the access token 
    // and signed request each expire
    var uid = response.authResponse.userID;
    var accessToken = response.authResponse.accessToken;
    console.log("auth status change "+accessToken+' uid = '+uid);
	if(!loggedIn){
		window.location = '<?php echo $base_url;?>users/checkfbuser/'+accessToken;
	}
  } else if (response.status === 'not_authorized') {
    // the user is logged in to Facebook, 
    //but not connected to the app
  } else {
    // the user isn't even logged in to Facebook.
  }
 }
);
*/
</script>
