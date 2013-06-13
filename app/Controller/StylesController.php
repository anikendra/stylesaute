<?php
App::uses('AppController', 'Controller');
/**
 * Styles Controller
 *
 * @property Style $Style
 */
class StylesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Style->recursive = 0;
		$this->set('styles', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Style->id = $id;
		if (!$this->Style->exists()) {
			throw new NotFoundException(__('Invalid style'));
		}
		$this->set('style', $this->Style->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Style->create();
			if ($this->Style->save($this->request->data)) {
				$this->Session->setFlash(__('The style has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The style could not be saved. Please, try again.'));
			}
		}
		$profiles = $this->Style->Profile->find('list');
		$this->set(compact('profiles'));
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Style->id = $id;
		if (!$this->Style->exists()) {
			throw new NotFoundException(__('Invalid style'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Style->save($this->request->data)) {
				$this->Session->setFlash(__('The style has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The style could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Style->read(null, $id);
		}
		$profiles = $this->Style->Profile->find('list');
		$this->set(compact('profiles'));
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
		$this->Style->id = $id;
		if (!$this->Style->exists()) {
			throw new NotFoundException(__('Invalid style'));
		}
		if ($this->Style->delete()) {
			$this->Session->setFlash(__('Style deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Style was not deleted'));
		$this->redirect(array('action' => 'index'));
	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Style->recursive = 0;
		$this->set('styles', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->Style->id = $id;
		if (!$this->Style->exists()) {
			throw new NotFoundException(__('Invalid style'));
		}
		$this->set('style', $this->Style->read(null, $id));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Style->create();
			if ($this->Style->save($this->request->data)) {
				$this->Session->setFlash(__('The style has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The style could not be saved. Please, try again.'));
			}
		}
		$profiles = $this->Style->Profile->find('list');
		$this->set(compact('profiles'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		$this->Style->id = $id;
		if (!$this->Style->exists()) {
			throw new NotFoundException(__('Invalid style'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Style->save($this->request->data)) {
				$this->Session->setFlash(__('The style has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The style could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Style->read(null, $id);
		}
		$profiles = $this->Style->Profile->find('list');
		$this->set(compact('profiles'));
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
		$this->Style->id = $id;
		if (!$this->Style->exists()) {
			throw new NotFoundException(__('Invalid style'));
		}
		if ($this->Style->delete()) {
			$this->Session->setFlash(__('Style deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Style was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
}
