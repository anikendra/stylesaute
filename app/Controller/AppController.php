<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package       app.Controller
 * @link http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
	public $components = array(
		'Session','Resize',
		'Auth' => array(
//			'authorize' => array('Controller'),
			'loginAction' => array('controller' => 'users', 'action' => 'login'),
			'allowedActions' => array('index', 'view', 'display')
		)			
	);
	var $helpers = array('Session', 'Form', 'Html','BootstrapCake.Bootstrap');

	public function beforeFilter() {
		// For CakePHP 2.1 and up
		$this->Auth->allow();
        $this->Auth->autoRedirect = false;
        $this->set('logged_user', $this->Auth->user());
        App::import('Vendor','NewEpiCurl',array('file' =>'NewEpiCurl.php'));
		App::import('Vendor','NewEpiOAuth',array('file' =>'NewEpiOAuth.php'));
		App::import('Vendor','NewEpiTwitter',array('file' =>'NewEpiTwitter.php'));
		//Set api keys according to domain
		// get host name from URL
		preg_match('@^(?:http://)?([^/]+)@i',$_SERVER['HTTP_HOST'], $matches);
		$host = $matches[1];
		switch($host){			
			case 'www.beta.copublish.in':
			case 'beta.copublish.in':
				Configure::load('beta');
				break;
			default:
			case 'www.copublish.in':
			case 'copublish.in':
				Configure::load('live');
				break;
		}
		//Twitter configuration
		$twitterConfig = Configure::read("Twitter");
		$this->set('consumer_key', $twitterConfig['consumer_key']);
		$this->set('consumer_secret', $twitterConfig['consumer_secret']);
		$this->twitterObj = new EpiTwitter($twitterConfig['consumer_key'], $twitterConfig['consumer_secret']);
		$this->twitterObj->useApiVersion('1.1');
		$this->set('twitterObj',$this->twitterObj);		
		//Facebook configuration
		$facebookConfig = Configure::read("Facebook");		
		$this->set('fbappid', $facebookConfig['fbappid']);
	   	$sessionState = $this->Session->read('state');
		if(!isset($sessionState)){
			$this->Session->write('state' , md5(uniqid(rand(), TRUE))); // CSRF protection
		}
	 	$dialog_url = "https://www.facebook.com/dialog/oauth?client_id=" 
		   . $facebookConfig['fbappid'] . "&redirect_uri=" . urlencode($facebookConfig['base_url'].'/users/checkfbuser/') . "&state="
		   . $this->Session->read('state').'&scope=publish_stream,email,user_birthday,publish_actions,user_location';
	   	$this->set('dialog_url', $dialog_url);
        $this->layout = 'bootstrap';
    }
	
	public function isAuthorized() {
        return $this->Auth->user('id');
    }

    public function isFbAuthorized() {
        return $this->Session->read('facebook_id');
    }

    public function beforeRender() {
        $this->set('base_url', 'http://' . $_SERVER['SERVER_NAME'] . Router::url('/'));
        $this->set('appId', '224557674331900');
    }

	public function sendMail($email,$subject,$template,$data,$code=null){
		$this->Email->smtpOptions = array(
			'port'=>'587',
			'timeout'=>'30',
			'host' => 'smtp.sendgrid.net',
			'username'=>'anikendra',
			'password'=>'dihing139',
			'client' => 'pinvertisement.com'
		);
		$this->Email->delivery = 'smtp';
		$this->Email->to = $email;
		// $this->Email->bcc = array('anikendra@gmail.com');
		$this->Email->subject = $subject;
		$this->Email->replyTo = "Anikendra at Vidoofy<anikendra@gmail.com>";
		$this->Email->from = "Anikendra at Vidoofy<anikendra@gmail.com>";
		$this->Email->template = $template; // note no '.ctp'
		//Send as 'html', 'text' or 'both' (default is 'text')
		$this->Email->sendAs = 'html'; // because we like to send pretty mail
		//Set view variables as normal
		$this->set('data', $data);
		if(isset($code)){
			$this->set('code',$code);
		}
		//Do not pass any args to send()        
		return $this->Email->send();
	}

	public function createUploadDirectory($modelClass, $celebId) {
        //Create directory
        if (!is_dir(WWW_ROOT.'uploads'.DS.$celebId.DS.$modelClass)) {
            if (!is_dir(WWW_ROOT.'uploads'.DS.$celebId)) {
                mkdir(WWW_ROOT.'uploads'.DS.$celebId, 0777);
            }
            $this->log("making app models dir ". WWW_ROOT.DS.'uploads'.DS.$celebId.DS.$modelClass);
            mkdir(WWW_ROOT.'uploads'.DS.$celebId.DS.$modelClass,0777);
        }
        if (!is_dir(WWW_ROOT.'uploads'.DS.$celebId.DS.$modelClass)) {
            $this->log("failed to create");
            return false; 
        } else {
            return true;
        }
    }

    public function upload($celebId=1) {

        $result['status'] = 0; 
        $result['success'] = false;
        $result['message'] = __('Unable to upload');

        App::import('Vendor','qqFileUploader',array('file' =>'qqFileUploader.php'));

        $uploader = new qqFileUploader();

        // Specify the list of valid extensions, ex. array("jpeg", "xml", "bmp")
        $uploader->allowedExtensions = array('jpeg','png','jpg','gif','bmp');

        // Specify max file size in bytes.
        $uploader->sizeLimit = 10 * 1024 * 1024;

        // Specify the input name set in the javascript.
        $uploader->inputName = 'qqfile';

        // If you want to use resume feature for uploader, specify the folder to save parts.
        $uploader->chunksFolder = 'chunks';

        // $min_width = isset($this->request->data['minwidth']) ? $this->request->data['minwidth'] : 0; 
        // $min_height = isset($this->request->data['minheight']) ? $this->request->data['minheight'] : 0; 
        $modelClass = $this->modelClass; 

        $this->log($this->request);
        $folderName = Inflector::pluralize(strtolower($modelClass));

        if (!$this->createUploadDirectory($folderName, $celebId)) {
            $result['message'] = 'Failed to create directory. Model:'.$modelClass.
            '.  Sorry we are having trouble.  Please try again, or email support@stylesaute.com';
        } else {
            // $filesize = getimagesize(WWW_ROOT.'uploads'.DS.$celebId.DS.$folderName.DS.$uploader->getName());

            // To save the upload with a specified name, set the second parameter
            $result = $uploader->handleUpload('uploads'.DS.$celebId.DS.$folderName.DS, $uploader->getName());
            if($result){
                //Resize and create thumbnail
                $inFile = WWW_ROOT.'uploads'.DS.$celebId.DS.$folderName.DS. $uploader->getName();

                $largeOutFile = WWW_ROOT.'uploads'.DS.$celebId.DS.$folderName.DS.'large-'.basename($inFile);
                $this->resizeImage($inFile,$largeOutFile,800,800);
                
                $outFile = $inFile;
                $this->resizeImage($inFile,$outFile,200,200);

                $newUrl = '/uploads/'.$celebId.'/'.$folderName.'/large-'.basename($inFile);
                // To return a name used for uploaded file you can use the following line.
                $result['uploadName'] = $newUrl;
                
                $result['status'] = 1;
                $result['success'] = true;
                // $result['filesize'] = $filesize;
                $result['message'] = __('Uploaded');
            }
        }
        $this->log($result);
        return new CakeResponse(array('body' => json_encode($result)));
    }

    public function cropImage ($url, $height, $width, $x1, $x2, $y1, $y2) {
        ini_set('memory_limit', '2G');
        $result['status'] = 0; 
        $result['message'] = __('Unable to crop');

        $image_type = substr($url, strrpos($url, '.', -1)); 
        $filepath = WWW_ROOT.substr($url, strlen(FULL_BASE_URL)+1);
        $croppedfile = substr($filepath, 0, strrpos($filepath, '/', -1)).
            '/C_'.substr($filepath, strrpos($filepath, '/', -1)+1);
        
        // Create image instances
        $dest = imagecreatetruecolor($x2,$y2);

        switch ($image_type) {
            case '.jpg':
            case '.jpeg':
            case '.JPEG':
            case '.JPG':
                $src = imagecreatefromjpeg($filepath);
                imagecopyresampled($dest,$src,0,0,$x1,$y1,$x2,$y2,$width,$height);
                imagejpeg($dest, $croppedfile);
                $ext = '.jpg';
                break;
            case '.gif':
                $src = imagecreatefromgif($filepath);
                imagecopyresampled($dest,$src,0,0,$x1,$y1,$x2,$y2,$width,$height);
                imagegif($dest, $croppedfile);
                $ext = '.gif';
                break;
            case '.png':
                $src = imagecreatefrompng($filepath);
                imagecopyresampled($dest,$src,0,0,$x1,$y1,$x2,$y2,$width,$height);
                imagepng($dest, $croppedfile);
                $ext = '.png';
                break;
            default: 
                $result['message'] = __('Unsupported image format.');   
                return $result;
        }
        $result['status'] = 1; 
        $result['message'] = __('Cropped');
        $result['data'] = substr($url, 0, strrpos($url, '/', -1)).'/C_'.substr($url, strrpos($url, '/', -1)+1);
        return $result;
    }

    public function resizeImage ($inFile, $outFile, $w, $h) {
        $image = $this->Resize;
        $image->load($inFile);                
       
        $image->crop($w,$h);
        $image->save($outFile);
    }

    public function crop() {
        $url = $this->request->data['file_url'];
        $height = $this->request->data['h']; 
        $width = $this->request->data['w']; 
        $x1 = $this->request->data['x'];
        $x2 = $this->request->data['x2'];
        $y1 = $this->request->data['y'];
        $y2 = $this->request->data['y2'];

        $result = $this->cropImage($url, $height, $width, $x1, $x2, $y1, $y2);

        $this->set('result', $result);
        $this->set('_serialize', array('result'));

    }

    public function compress($celebId = 1) {
    	// Processing may take a while
		set_time_limit(0);
    	App::import('Vendor','SmushIt',array('file' =>'SmushIt.class.php'));
    	$modelClass = $this->modelClass; 
    	$folderName = Inflector::pluralize(strtolower($modelClass));
    	$dirPath = WWW_ROOT.'uploads'.DS.$celebId.DS.$folderName; 
    	// echo $dirPath;
    	if(is_dir($dirPath)){
    		$files = glob($dirPath.'/*');
    		$urls = array();
    		foreach($files AS $file){
    			$urls[] = FULL_BASE_URL.'/uploads/'.$celebId.'/'.$folderName.'/'.basename($file);
    		}
    		// debug($urls);die;
 
    		// Make batches of 3 images
			//$files = array_chunk($urls, 3);
			$urls = array_chunk($files, 3);

			// Take a batch of three files
			foreach($urls as $batch) {

			    try {
			        // Compress the batch
			        $smushit = new SmushIt($batch);
			        debug($smushit);
			        // And finaly, replace original files by their compressed version
			        foreach($smushit->get() as $file) {
			            // Sometimes, Smush.it convert files. We don't want that to happen.
			            $src = pathinfo($file->source, PATHINFO_EXTENSION);
			            $dst = pathinfo($file->destination, PATHINFO_EXTENSION);
			            if ($src == $dst AND copy($file->destination, $file->source)) {
			                // Success !
			            }
			        }
			    } catch(Exception $e) {
			        continue;
			    }
			}
    	}else{
    		die('Not a directory!');
    	}
    }
}
