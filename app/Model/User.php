<?php
App::uses('AppModel', 'Model');
/**
 * User Model
 *
 * @property Group $Group
 * @property Profile $Profile
 * @property Publisher $Publisher
 */
class User extends AppModel {

    public $actsAs = array('Acl' => array('type' => 'requester'),'SignMeUp.SignMeUp');
/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'username';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		/*'first_name' => array(
			'notempty' => array(
//				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'last_name' => array(
			'notempty' => array(
//				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'zipcode' => array(
			'notempty' => array(
//				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),*/
/*		'dob' => array(
			'date' => array(
//				'rule' => array('date'),
				//'message' => 'Your custom message here',
				'allowEmpty' => true,
				'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),*/
		'username' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'email' => array(
			'email' => array(
				'rule' => array('email'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
			'emailExists' => array(
				'rule' => 'isUnique',
				'message' => 'Sorry, this email already exists'
			),
		),
		'password' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
/*
		'address_1' => array(
			'notempty' => array(
				//'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'address_2' => array(
			'notempty' => array(
				//'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'city' => array(
			'notempty' => array(
				//'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'state' => array(
			'notempty' => array(
				//'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),*/
		'auth_token' => array(
			'notempty' => array(
				//'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'group_id' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'demo_valid_till' => array(
			'date' => array(
				'rule' => array('date'),
				//'message' => 'Your custom message here',
				'allowEmpty' => true,
				'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'premium_valid_till' => array(
			'date' => array(
				'rule' => array('date'),
				//'message' => 'Your custom message here',
				'allowEmpty' => true,
				'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Group' => array(
			'className' => 'Group',
			'foreignKey' => 'group_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

    public function parentNode() {
        if (!$this->id && empty($this->data)) {
            return null;
        }
        if (isset($this->data['User']['group_id'])) {
            $groupId = $this->data['User']['group_id'];
        } else {
            $groupId = $this->field('group_id');
        }
        if (!$groupId) {
            return null;
        } else {
            return array('Group' => array('id' => $groupId));
        }
    }

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'Tag' => array(
			'className' => 'Tag',
			'foreignKey' => 'user_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

	public function checkFbUser($user,$access_token){
		$conditions = array('User.email' => $user->email);
		// $conditions = array('User.facebook_id' => $user->id);
		$nativeUser = $this->find('first',array('conditions' => $conditions,'recursive' => -1));
		if(!empty($nativeUser) && isset($nativeUser['User']['id'])){
			$nativeUser['User']['fb_access_token'] = $access_token;
			$nativeUser['User']['active'] = 1;
			$nativeUser['User']['username'] =  $user->email;
			$nativeUser['User']['facebook_id'] = $user->id;
		$this->log(print_r($nativeUser,1),'fb');
			$this->save($nativeUser);
		}else{
			$conditions = array('User.facebook_id' => $user->id);
			$nativeUser = $this->find('first',array('conditions' => $conditions,'recursive' => -1));
			if(empty($nativeUser) && !isset($nativeUser['User']['id'])){
				$data['fb_access_token'] = $access_token;
				$data['active'] = 1;
				$data['facebook_id'] = $user->id;
				$data['email'] = $user->email;
				$data['username'] =  $user->email;
				$data['first_name'] = $user->first_name;
				// $data['group_id'] = $groupId;
				if(!empty($user->middle_name)){
					$data['last_name'] = $user->middle_name.' '.$user->last_name;
				}else{
					$data['last_name'] = $user->last_name;
				}
				if(!empty($user->gender)){
					$data['gender'] = $user->gender;
				}
				if(!empty($user->location->name)){
					$parts = explode(',',$user->location->name);
					$data['city'] = $parts[0];				
				}
				if(!empty($user->birthday)){
					$parts = explode('/',$user->birthday);
					$data['dob'] = $parts[2].'-'.$parts[0].'-'.$parts[1];
				}
				// $data['active'] = 1;
				$this->log(print_r($data,1),'fb');
				$this->set($data);
				if($this->validates()){
					$this->save($data);
				}else{
					$this->log(print_r($this->validationErrors,1),'fb');
				}
			}
		}
		return $this->id;
	}

	function getPinterestStats($username){
		/*App::uses('HttpSocket', 'Network/Http');	
		$httpSocket = new HttpSocket();
		$domain = 'http://pinauthority.com';		
		if(strlen($username)>0){
			return $httpSocket->get($domain.'/webservice/pinterestuser/'.$username.'.json');			
		}
		return null;*/
		if(strlen($username)>0){
			$ch = curl_init();
			$url = "http://pinauthority.com/webservice/pinterestuser/$username.json";
			$this->log($url,'webservice');
			// set url
			curl_setopt($ch, CURLOPT_URL, $url);

			//return the transfer as a string
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

			// $output contains the output string
			$output = curl_exec($ch);
			$this->log(print_r($output,1),'webservice');
			// close curl resource to free up system resources
			curl_close($ch);  
			return $output;
		}
		return null;
	}
}