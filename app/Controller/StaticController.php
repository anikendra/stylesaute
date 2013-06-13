<?php
App::uses('AppController', 'Controller');
/**
 * Posts Controller
 *
 * @property Post $Post
 */
class StaticController extends AppController {


	public function beforeFilter() {
		parent::beforeFilter();
		$this->Auth->allow();  
	}

	public function terms() {
		$this->layout = 'homepage';
		$title_for_layout = __("Terms and Conditions - Copublsh");
		$this->set(compact('title_for_layout'));
	}

	public function privacy() {
		$this->layout = 'homepage';
		$title_for_layout = __("Privacy Policy - Copublish");
		$this->set(compact('title_for_layout'));
	}

	public function bookmarklet() {
		if(!$this->isAuthorized()){
			$this->layout = 'homepage';
		}
		$title_for_layout = __("Copublish Bookmarklet");
		$this->set(compact('title_for_layout'));	
	}
}
