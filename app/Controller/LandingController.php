<?php
App::uses('AppController', 'Controller');
/**
 * Posts Controller
 *
 * @property Post $Post
 */
class LandingController extends AppController {


	public function beforeFilter() {
		parent::beforeFilter();
		$this->Auth->allow();  
	}

	public function multimanager() {
		$this->layout = 'homepage';
		$title_for_layout = __("Pinterest Management Team");
		$nonavlinks = true;
		$this->set(compact('title_for_layout','nonavlinks'));
	}

	public function scheduler() {
		$this->layout = 'homepage';
		$title_for_layout = __("Pinterest Scheduler");
		$nonavlinks = true;
		$this->set(compact('title_for_layout','nonavlinks'));
	}

	public function analytics() {
		$this->layout = 'homepage';
		$title_for_layout = __("Pinterest Campaign Analytics");
		$nonavlinks = true;
		$this->set(compact('title_for_layout','nonavlinks'));
	}

	public function howitworks() {
		$this->layout = 'homepage';
		$title_for_layout = __("How it works");
		$nonavlinks = true;
		$this->set(compact('title_for_layout','nonavlinks'));
	}
}
