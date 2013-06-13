<?php
App::uses('AppController', 'Controller');
/**
 * Users Controller
 *
 * @property User $User
 */
class UsersController extends AppController {

	public $components = array('SignMeUp.SignMeUp');

    public function beforeFilter() {
    	parent::beforeFilter();
    	$this->Auth->loginRedirect = array('controller' => 'users', 'action' => 'dashboard');
        $this->Auth->allow(array('login', 'forgotten_password', 'register', 'activate', 'checkemail','checkfbuser','registertwitteruser'));        
    }
    

	function registertwitteruser(){
		$this->twitterObj->setToken($_GET['oauth_token']);
		$token = $this->twitterObj->getAccessToken();
		$this->twitterObj->setToken($token->oauth_token, $token->oauth_token_secret);
		$twitterInfo= $this->twitterObj->get_accountVerify_credentials();
		$data = array();
		$data['twitter_id'] = $twitterInfo->id;		
		$this->Session->write('twtusername',$twitterInfo->screen_name);
		$data['twitter_token'] = $token->oauth_token;
		$data['twitter_secret'] = $token->oauth_token_secret;
		$data['twitter_screen_name'] = $twitterInfo->screen_name;					
		$data['active'] = 1;

		$id = $this->Auth->user('id');
		if(!isset($id) || $id == ''){
		//	$count = $this->User->find('count',array('conditions' => array('twitter_id' => $data['twitter_id'])));
			$user = $this->User->find('first',array('conditions' => array('twitter_id' => $data['twitter_id'])));
			//if($count<1){
			if(empty($user)){
				$this->User->create();
				$this->User->save($data);
//				$dbuser = $this->User->read(null,$this->User->id);
				$this->Auth->login($this->User->data);
			}else{
		//		$data = $this->User->find('first',array('conditions' => array('twitter_id' => $data['twitter_id'])));
				$this->Auth->login($user['User']);
			}
		}else{
			//$data['id'] = $this->Auth->user('id');
			$user = $this->Auth->user;
//			$this->User->save($data);
//			$this->Auth->login($data);
		}                
		$user = $this->User->read(null, $this->Auth->User('id'));
		if ($user['User']['group_id'] == 1) {
			$this->redirect(array('controller' => 'users', 'action' => 'dashboard'));
			exit();
		}
		elseif ($user['User']['group_id'] == 2) {
			$this->redirect(array('controller' => 'administration', 'action' => 'dashboard'));
			exit();
		}
	}

    public function checkfbuser($accessToken=null){
	   	$sessionState = $this->Session->read('state');
	   	if($sessionState != $_GET['state']) {
			$this->redirect(array('controller'=>'pages','action'=>'display','home'));
		}
		else {
			if(isset($_GET['code'])){
			 	$code = $_GET['code'];
			 	$facebookConfig = Configure::read("Facebook");		
			 	$token_url = "https://graph.facebook.com/oauth/access_token?"
			       . "client_id=" . $facebookConfig['fbappid'] . "&redirect_uri=" . urlencode($facebookConfig['base_url'].'/users/checkfbuser/')
			       . "&client_secret=" . $facebookConfig['secret'] . "&code=" . $code;

			    $response = file_get_contents($token_url);
			    $params = null;
			    parse_str($response, $params);
			    $accessToken = $params['access_token'];
			}else{
				$this->redirect(array('controller'=>'pages','action'=>'display','home'));
			}
		}
		$this->User->recursive = -1;
        if (!$accessToken) {
            $this->redirect(array('controller'=>'pages','action'=>'display','home'));
        }        
        if (isset($accessToken) && $accessToken != 'undefined') {			

		    $graph_url = "https://graph.facebook.com/me?access_token=" . $accessToken;

		    $user = json_decode(file_get_contents($graph_url));
            if (!empty($user)) {
                if (!$this->isAuthorized()) {
                    $id = $this->User->checkFbUser($user,$accessToken);
			$dbuser = $this->User->findById($id);
                    $this->Session->write('facebook_id',$user->id);
			$this->Auth->login($dbuser['User']);
			if($this->Auth->login()){
				$this->log("logged = ".print_r($this->Auth->user('id'),1)."\n",'fb');
			}
			$this->redirect(array('controller'=>'users','action'=>'dashboard'));
                } else {                	
			$this->redirect(array('controller'=>'users','action'=>'dashboard'));
                }
            }
        }
	}

	public function uploadavatar(){
		$this->log(print_r($_FILES,1),'debug');
		$path = "img/avatars/";
		$valid_formats = array("jpg", "png", "gif", "bmp");
		if ($this->request->is('post')) {
			$name = $_FILES['photoimg']['name'];
			$size = $_FILES['photoimg']['size'];
			
			if(strlen($name))
				{
					list($txt, $ext) = explode(".", $name);
					if(in_array($ext,$valid_formats))
					{
					if($size<(1024*1024))
						{
							$actual_image_name = time().substr(str_replace(" ", "_", $txt), 5).".".$ext;
							$tmp = $_FILES['photoimg']['tmp_name'];
							if(move_uploaded_file($tmp, $path.$actual_image_name))
								{
									echo "<img width='250' src='../".$path.$actual_image_name."'  class='preview'>";
									echo "<input type='hidden' id='imageUrl' name='photo_url' value='".'http://' . $_SERVER['SERVER_NAME'] . Router::url('/').$path.$actual_image_name."'></input>";
								}
							else
								echo __('Upload Failed');
						}
						else
						echo __("Maximum allowed image file size is 1 MB");					
						}
						else
						echo __("Invalid file format");	
				}
			else
				echo __("Please select image");
			exit;
		}
	}

    function checkemail() {
        $this->User->recursive = -1;
        $this->layout = 'ajax';
        if (!empty($this->params['url']['data']['User']['email'])) {
            $username = $this->params['url']['data']['User']['email'];
        } elseif (!empty($this->params['url']['data']['Doctor']['email'])) {
            $username = $this->params['url']['data']['Doctor']['email'];
        } else {
            $result = false;
            $this->set('result', $result);
        }
        if ($this->Auth->user('id') != null) {
            $conditions = array('User.email' => $username, 'User.id !=' => $this->Auth->user('id'));
        } else {
            $conditions = array('User.email' => $username);
        }
        $count = $this->User->find('count', array('conditions' => $conditions));
        if ($count > 0) {
            $result = false;
        } else {
            $result = true;
        }
        $this->set('result', $result);
    }

/**
 * index method
 *
 * @return void
 */
/*
	public function index() {
		$this->User->recursive = 0;
		$this->set('users', $this->paginate());
	}
*/
/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
/*
	public function view($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		$this->set('user', $this->User->read(null, $id));
	}
*/
/**
 * add method
 *
 * @return void
 */
/*
	public function add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		}
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}
*/
/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */

    public function edit() {
        $this->User->recursive = -1;
        $id = $this->Auth->User('id');
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash(__('Your profile has been saved', true),'success_message');
                $this->redirect(array('action' => 'dashboard'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. <br>'.print_r($this->User->validationErrors).' <br>Please, try again.', true),'error_message');
            }
        } else {        
            $this->request->data = $this->User->read(null, $id);
        }
        $this->loadModel('Country');
        $this->Country->recursive = -1;
        $fields = array('country', 'FIPS104');
        $result = $this->Country->find('all', array('fields' => $fields));
        $countries = array();
        foreach ($result AS $country) {
            $countries[$country['Country']['FIPS104']] = $country['Country']['country'];
        }        
        Configure::load('constant');
		$this->set('timeZones' , Configure::read("timeZones"));
        $this->set(compact('countries','id'));
        $this->set('title_for_layout', "Update Profile");
    }

/**
 * delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
/*
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->User->delete()) {
			$this->Session->setFlash(__('User deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('User was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
*/
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->User->recursive = 0;
		$this->set('users', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		$this->set('user', $this->User->read(null, $id));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		}
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->User->read(null, $id);
		}
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}

/**
 * admin_delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->User->delete()) {
			$this->Session->setFlash(__('User deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('User was not deleted'));
		$this->redirect(array('action' => 'index'));
	}

	public function dashboard() {
		App::uses('CakeTime', 'Utility');
		
		$user = $this->User->read(null,$this->Auth->user('id'));	
		$this->set(compact('user'));		
		$this->set('title_for_layout', "Dashboard");
	}

/**
* user authentication funtions
*/
	public function register($type='publisher') {
		$this->layout = 'homepage';
		$this->set('title_for_layout','Register your free copublish.in account');
	    $this->SignMeUp->register($type);
	}

	public function activate() {
		$this->layout = 'homepage';
		$this->set('title_for_layout','Activate your copublish.in account');
	    $this->SignMeUp->activate();
	}

	public function forgotten_password() {
		$this->layout = 'homepage';
		$this->set('title_for_layout','Reset your copublish.in password');
	    $this->SignMeUp->forgottenPassword();
	}	

	public function login() {
		$this->layout = 'homepage';
		if (!empty($this->data['User']['next'])) {
            $next = $this->data['User']['next'];
            $this->Session->write('next', $next);
        } elseif (!empty($this->params['url']['next'])) {
            $next = $this->params['url']['next'];
            $this->Session->write('next', $next);
        }
        if ($this->Auth->login()) {
            $next = $this->Session->read('next');
            if (!empty($next)) {
                header('location:' . $next);
                exit();
            }
            $user = $this->User->read(null, $this->Auth->User('id'));
            if ($user['User']['active'] == 0) {
                $this->Session->setFlash(__('Your account has not been activated yet. Contact the administrator.', true),'error_message');
                $this->redirect($this->Auth->logout());
                exit();
            } elseif ($user['User']['group_id'] == 2) {
                $this->redirect(array('controller' => 'administration', 'action' => 'dashboard'));
                exit();
            }
            $this->redirect(array('controller' => 'users', 'action' => 'dashboard'));
        } else {
            if (!empty($this->data)) {                
                $this->Session->setFlash(__('Invalid username or password'),'error_message');
            }
        }
        $this->set('title_for_layout', "Login to copublish.in and manage your Pinterest accounts");
	}

	public function logout() {
		$this->Session->setFlash(__('You have been logged out now'),'success_message');
		$this->redirect($this->Auth->logout());
	}

	public function updatetimezone() {
		$this->layout = 'ajax';		
		$timezone = $_GET['tz'];
		Configure::load('constant');
		$timeZones = Configure::read("timeZones");
		$query = "UPDATE users SET user_timezone = $timezone WHERE id = ".$this->Auth->User('id');
		if($this->User->query($query)){
			$result = array('success' => true,'tz' => $timeZones[$timezone]);
		}else{
			$result = array('success' => false);
		}
		$this->set('result',$result);
	}
}
