<?php
class myTwitterAPI {
	private $ck;
	private $cs;
	protected $urlSearch = 'http://search.twitter.com/';
	
	public function __construct($consumer_key,$consumer_secret)
	{
		// global $consumer_key,$consumer_secret;
		$this->ck = $consumer_key;
		$this->cs = $consumer_secret;
	}
	 
	public function updateTwitterStatus($consumer_key, $consumer_secret, $ut, $uts,$statusmessagearr)
	{
		$twitterObjforSend = new EpiTwitter($consumer_key, $consumer_secret, $ut, $uts);
		$userInfo = $twitterObjforSend->post_statusesUpdate($statusmessagearr);
		$statusresponse = $userInfo->response;
		return $statusresponse;
	}

	public function retweetTwitterStatus($consumer_key, $consumer_secret, $ut, $uts,$statusmessagearr)
	{
		$twitterObjforSend = new EpiTwitter($consumer_key, $consumer_secret, $ut, $uts);
		//$userInfo = $twitterObjforSend->post_statusesRetweet($statusmessagearr);
		//$userInfo = $twitterObjforSend->post_statusesRetweet($statusmessagearr);
		$call = "/statuses/retweet/" . $statusmessagearr['id']. ".json";
		//echo "<p>Call is $call</p>";

		$retweet = $twitterObjforSend->post($call);
//		$statusresponse = $userInfo->response;
		return $retweet;
	}
	/**********************************************************************/
	/*****			Friendship Functions			  *****/
	/**********************************************************************/

	public function followUser($whom, $from)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$fromUserArr		= array("screen_name" => $whom); 
		$return			= $twitterObjforSend->post_friendshipsCreate($fromUserArr);
		$response		= $return->response;
		return $response;
	}


	public function unFollowUser($whom, $from)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$fromUserArr		= array("user_id" => $whom); 
		$return			= $twitterObjforSend->post_friendshipsDestroy($fromUserArr);
		$response		= $return->response;
		return $response;
	}

	public function areFriends($whom, $from)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$userArr		= array("source_id" => $whom, "target_id" => $whom); 
		$return			= $twitterObjforSend->get_friendshipsShow($userArr);
		$response		= $return->response;
		return $response;
	}

	/**********************************************************************/
	/*****			Follower Functions			  *****/
	/**********************************************************************/

	public function getFriends($user_id,$screen_name,$cursor=-1)
	{
	 	/*$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($user_id), $this->getSecretById($user_id));
		$userArr		= array("user_id" => $user_id, "cursor" => -1); 
		$return			= $twitterObjforSend->get_friendsIds($userArr);
		$response		= $return->response;
		return $response;*/
		$url = "http://api.twitter.com/1/friends/ids.json?cursor=-1&screen_name=$screen_name";
		$ch = curl_init(); 

		// set url 
		curl_setopt($ch, CURLOPT_URL, $url);

		//return the transfer as a string 
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 

		// $output contains the output string 
		$output = curl_exec($ch); 

		// close curl resource to free up system resources 
		curl_close($ch); 
		$result = json_decode($output,true);
		$output = $result['ids'];
		return $output;
	}
	
	public function getFollowers($user_id,$screen_name,$cursor=-1)
	{
	 	/*$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($user_id), $this->getSecretById($user_id));
		$userArr		= array("screen_name" => $screen_name, "cursor" => $cursor); 
		$return			= $twitterObjforSend->get_followersIds($userArr);
		$response		= $return->response;*/
		// create curl resource 
		$url = "http://api.twitter.com/1/followers/ids.json?cursor=-1&screen_name=$screen_name";
		$ch = curl_init(); 

		// set url 
		curl_setopt($ch, CURLOPT_URL, $url);

		//return the transfer as a string 
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 

		// $output contains the output string 
		$output = curl_exec($ch); 

		// close curl resource to free up system resources 
		curl_close($ch); 
		$result = json_decode($output,true);
		$output = $result['ids'];
		return $output;
	}

	/**********************************************************************/
	/*****			Direct Messages				  *****/
	/**********************************************************************/

	public function getDirectMessages($user_id)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($user_id), $this->getSecretById($user_id));
		$userArr		= array("count" => 20); 
		$return			= $twitterObjforSend->get_direct_messages($userArr);
		$response		= $return->response;
		return $response;
	}
	
	public function getSentMessages($user_id)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($user_id), $this->getSecretById($user_id));
		$userArr		= array("count" => 20); 
		$return			= $twitterObjforSend->get_direct_messagesSent($userArr);
		$response		= $return->response;
		return $response;
	}
	
	public function sendDirectMessage($from, $whom,  $text)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$userArr		= array("user" => $whom, "text" => $text ); 
		$return			= $twitterObjforSend->post_direct_messagesNew($userArr);
		$response		= $return->response;
		return $response;
	}

	/**********************************************************************/
	/*****			Timeline Functions			  *****/
	/**********************************************************************/
	
	public function getPublicTimeline()
	{
		$url = "http://twitter.com/statuses/public_timeline.json";
		$request = $this->requestToTwitter($url);
		return json_decode($request);
	}

	public function getFriendsTimeline($from)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$return			= $twitterObjforSend->get_statusesFriends_timeline();
		$response		= $return->response;
		return $response;
	}	

	public function getHomeTimeline($from)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$userArr		= array("count" => 50); 
		$return			= $twitterObjforSend->get_statusesHome_timeline($userArr);
		$response		= $return->response;
		return $response;
	}	
	
	public function getMentions($from)
	{
	 	$twitterObjforSend 	= new EpiTwitter($this->ck, $this->cs, $this->getTokenById($from), $this->getSecretById($from));
		$return			= $twitterObjforSend->get_statusesMentions();
		$response		= $return->response;
		return $response;
	}	
	/**********************************************************************/
	/*****			Search Functions			  *****/
	/**********************************************************************/
	
	public function searchTwitter($searchterm, $lang = '')
	{
		if(!empty($searchterm) && strlen($searchterm) )
		{
			$url = $this->urlSearch;
			$url .= 'search.json?q='. urlencode(stripslashes(urldecode($searchterm)));
			if($lang != '')
			{
				$url .= '&lang='.$lang.'&rpp=50';
			}
			$request = $this->requestToTwitter($url);
	/*		$searchobj = new Search();
			$searchobj->saveSearch(json_decode($request,true));*/
			return $request;
			
		}else
		{
			$this->Error(3);
		}
		$statuses = $this->requestToTwitter($url);
		return $statuses;
	}

	public function searchUser($consumer_key, $consumer_secret, $ut, $uts, $searchterm){
		if(!empty($searchterm) && strlen($searchterm)){
			$twitterObjforSend = new EpiTwitter($consumer_key, $consumer_secret, $ut, $uts);
			$userArr		= array("q" => urlencode(stripslashes(urldecode($searchterm)))); 
			//$return			= $twitterObjforSend->get_usersSearch($userArr);
			$cred = $twitterObjforSend->get('/account/verify_credentials.json');
			if(!empty($cred)){
				$return			= $twitterObjforSend->get('/users/search.json',$userArr);
				return $return;
			}
/*			$url = "https://api.twitter.com/1.1/users/";
			$url .= 'search.json?q='. urlencode(stripslashes(urldecode($searchterm)));
			echo $url;
			$request = $this->requestToTwitter($url);*/
			
		}
		return null;
	}

	public function twitterUserStream($consumer_key,$consumer_secret,$ut,$uts,$screenName){
//		$url = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=SrBachchan";
		if(!empty($screenName) && strlen($screenName)){
			$twitterObjforSend = new EpiTwitter($consumer_key, $consumer_secret, $ut, $uts);
			$userArr		= array("screen_name" => urlencode(stripslashes(urldecode($screenName)))); 
			$cred = $twitterObjforSend->get('/account/verify_credentials.json');
			if(!empty($cred)){
				$return			= $twitterObjforSend->get('/statuses/user_timeline.json',$userArr);
				return $return;
			}
		}
	}

	private function requestToTwitter ( $url='')
	{
		if(function_exists('curl_init'))
		{	
			$ch = curl_init();	
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			//curl_setopt($ch, CURLOPT_USERPWD, "$this->Username:$this->Password");
			// curl_setopt($ch, CURLOPT_GET, true);
					
			$return = curl_exec($ch);

			$Headers = curl_getinfo($ch);
			curl_close($ch);
						
			if($Headers['http_code'] == 200)
			{
				return $return;
			} else
			{
				if($Headers['http_code'] == 401)
				{
					$this->Error(4);
				} elseif($Headers['http_code'] == 404)
				{
					$this->Error(5);
				}
			}//Check Response
		} else
		{
				$this->Error(2);
		}//CURL Library installed	
	}		

	//Function to be called if error occurs
	private function Error($Error){
		//List of Errors
		$e[1] = 'Username and/or password not set';
		$e[2] = 'CURL library not installed';
		$e[3] = 'Post value too long/not set';
		$e[4] = 'Invalid username/password';
		$e[5] = 'Invalud URL for CURL request';
		$e[6] = 'Invalid ID value entered';
		$e[7] = 'You are not authorized to view this page';
		$e[8] = 'All variables for requested function not set';
		$e[9] = 'For and/or Message not set';
		//Display Error
		if(array_key_exists($Error, $e)){
			echo $e[$Error];
		} else{
			echo 'Invalid Error Code';
		}
	}//End Error()
}
?>
