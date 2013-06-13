<?php
App::uses('AppController', 'Controller');
/**
 * Dresses Controller
 *
 * @property Dress $Dress
 */
class DressesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Dress->recursive = 0;
		$this->set('dresses', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Dress->id = $id;
		if (!$this->Dress->exists()) {
			throw new NotFoundException(__('Invalid dress'));
		}
		$this->set('dress', $this->Dress->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Dress->create();
			if ($this->Dress->save($this->request->data)) {
				$this->Session->setFlash(__('The dress has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The dress could not be saved. Please, try again.'));
			}
		}
		$profiles = $this->Dress->Profile->find('list');
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
		$this->Dress->id = $id;
		if (!$this->Dress->exists()) {
			throw new NotFoundException(__('Invalid dress'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Dress->save($this->request->data)) {
				$this->Session->setFlash(__('The dress has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The dress could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Dress->read(null, $id);
		}
		$profiles = $this->Dress->Profile->find('list');
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
		$this->Dress->id = $id;
		if (!$this->Dress->exists()) {
			throw new NotFoundException(__('Invalid dress'));
		}
		if ($this->Dress->delete()) {
			$this->Session->setFlash(__('Dress deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Dress was not deleted'));
		$this->redirect(array('action' => 'index'));
	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Dress->recursive = 0;
		$this->set('dresses', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->Dress->id = $id;
		if (!$this->Dress->exists()) {
			throw new NotFoundException(__('Invalid dress'));
		}
		$this->set('dress', $this->Dress->read(null, $id));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Dress->create();
			if ($this->Dress->save($this->request->data)) {
				$this->Session->setFlash(__('The dress has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The dress could not be saved. Please, try again.'));
			}
		}
		$profiles = $this->Dress->Profile->find('list');
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
		$this->Dress->id = $id;
		if (!$this->Dress->exists()) {
			throw new NotFoundException(__('Invalid dress'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Dress->save($this->request->data)) {
				$this->Session->setFlash(__('The dress has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The dress could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Dress->read(null, $id);
		}
		$profiles = $this->Dress->Profile->find('list');
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
		$this->Dress->id = $id;
		if (!$this->Dress->exists()) {
			throw new NotFoundException(__('Invalid dress'));
		}
		if ($this->Dress->delete()) {
			$this->Session->setFlash(__('Dress deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Dress was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
}
