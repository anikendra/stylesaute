<?php
App::uses('AppModel', 'Model');
/**
 * Style Model
 *
 * @property Profile $Profile
 */
class Style extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'style';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'style' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasAndBelongsToMany associations
 *
 * @var array
 */
	public $hasAndBelongsToMany = array(
		'Profile' => array(
			'className' => 'Profile',
			'joinTable' => 'profiles_styles',
			'foreignKey' => 'style_id',
			'associationForeignKey' => 'profile_id',
			'unique' => 'keepExisting',
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		)
	);

}
