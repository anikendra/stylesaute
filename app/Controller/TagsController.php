<?php
App::uses('AppController', 'Controller');
/**
 * Tags Controller
 *
 * @property Tag $Tag
 */
class TagsController extends AppController {

	function searchbyname(){
		$this->layout = 'ajax';
        $this->Tag->recursive = -1;
		$q = $this->params['url']['typeahead'];
		$order = array('Tag.tag'=>'ASC');
		$fields = array('Tag.tag','Tag.id');
		$conditions[] = array('lower(Tag.tag) LIKE' => "$q%");
		$tags = $this->Tag->find('all',array('fields'=>$fields,'conditions'=>$conditions,'order'=>$order));
        $array = array();
        $tagList = array();
        foreach($tags as $tag)
        {  
           $array['id'] = $tag['Tag']['id'];
           $array['name'] = $tag['Tag']['tag'];
           $tagList[] = $array;
        }
        $tag =  json_encode($tagList);
        $this->set(compact('tag','q'));
	}
/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->layout = 'ajax';
		$this->Tag->recursive = -1;
		$this->set('tags', $this->Tag->find('list'));
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Tag->id = $id;
		if (!$this->Tag->exists()) {
			throw new NotFoundException(__('Invalid tag'));
		}
		$this->set('tag', $this->Tag->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->layout = 'ajax';
		if ($this->request->is('post')) {
			$this->request->data['user_id'] = $this->Auth->user('id');
			$this->Tag->create();
			if ($this->Tag->save($this->request->data)) {
				$result = array('success'=>true,'message'=>'Tag created');
				// $this->Session->setFlash(__('The tag has been saved'));
				// $this->redirect(array('action' => 'index'));
			} else {
				$result = array('success'=>false,'message'=>'Tag not created');
				// $this->Session->setFlash(__('The tag could not be saved. Please, try again.'));
			}
				$this->set('result');			
		}
		// $users = $this->Tag->User->find('list');
		// $sites = $this->Tag->Site->find('list');
		// $this->set(compact('users', 'sites'));
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Tag->id = $id;
		if (!$this->Tag->exists()) {
			throw new NotFoundException(__('Invalid tag'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Tag->save($this->request->data)) {
				$this->Session->setFlash(__('The tag has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The tag could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Tag->read(null, $id);
		}
		$users = $this->Tag->User->find('list');
		$sites = $this->Tag->Site->find('list');
		$this->set(compact('users', 'sites'));
	}

/**
 * delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->Tag->id = $id;
		if (!$this->Tag->exists()) {
			throw new NotFoundException(__('Invalid tag'));
		}
		if ($this->Tag->delete()) {
			$this->Session->setFlash(__('Tag deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Tag was not deleted'));
		$this->redirect(array('action' => 'index'));
	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Tag->recursive = 0;
		$this->set('tags', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->Tag->id = $id;
		if (!$this->Tag->exists()) {
			throw new NotFoundException(__('Invalid tag'));
		}
		$this->set('tag', $this->Tag->read(null, $id));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Tag->create();
			if ($this->Tag->save($this->request->data)) {
				$this->Session->setFlash(__('The tag has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The tag could not be saved. Please, try again.'));
			}
		}
		$users = $this->Tag->User->find('list');
		$sites = $this->Tag->Site->find('list');
		$this->set(compact('users', 'sites'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		$this->Tag->id = $id;
		if (!$this->Tag->exists()) {
			throw new NotFoundException(__('Invalid tag'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Tag->save($this->request->data)) {
				$this->Session->setFlash(__('The tag has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The tag could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Tag->read(null, $id);
		}
		$users = $this->Tag->User->find('list');
		$sites = $this->Tag->Site->find('list');
		$this->set(compact('users', 'sites'));
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
		$this->Tag->id = $id;
		if (!$this->Tag->exists()) {
			throw new NotFoundException(__('Invalid tag'));
		}
		if ($this->Tag->delete()) {
			$this->Session->setFlash(__('Tag deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Tag was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
}
