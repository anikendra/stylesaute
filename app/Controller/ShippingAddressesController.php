<?php
App::uses('AppController', 'Controller');
/**
 * ShippingAddresses Controller
 *
 * @property ShippingAddress $ShippingAddress
 */
class ShippingAddressesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->ShippingAddress->recursive = 0;
		$this->set('shippingAddresses', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->ShippingAddress->id = $id;
		if (!$this->ShippingAddress->exists()) {
			throw new NotFoundException(__('Invalid shipping address'));
		}
		$this->set('shippingAddress', $this->ShippingAddress->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->ShippingAddress->create();
			if ($this->ShippingAddress->save($this->request->data)) {
				$this->Session->setFlash(__('The shipping address has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The shipping address could not be saved. Please, try again.'));
			}
		}
		$cities = $this->ShippingAddress->City->find('list');
		$states = $this->ShippingAddress->State->find('list');
		$countries = $this->ShippingAddress->Country->find('list');
		$users = $this->ShippingAddress->User->find('list');
		$this->set(compact('cities', 'states', 'countries', 'users'));
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->ShippingAddress->id = $id;
		if (!$this->ShippingAddress->exists()) {
			throw new NotFoundException(__('Invalid shipping address'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->ShippingAddress->save($this->request->data)) {
				$this->Session->setFlash(__('The shipping address has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The shipping address could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->ShippingAddress->read(null, $id);
		}
		$cities = $this->ShippingAddress->City->find('list');
		$states = $this->ShippingAddress->State->find('list');
		$countries = $this->ShippingAddress->Country->find('list');
		$users = $this->ShippingAddress->User->find('list');
		$this->set(compact('cities', 'states', 'countries', 'users'));
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
		$this->ShippingAddress->id = $id;
		if (!$this->ShippingAddress->exists()) {
			throw new NotFoundException(__('Invalid shipping address'));
		}
		if ($this->ShippingAddress->delete()) {
			$this->Session->setFlash(__('Shipping address deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Shipping address was not deleted'));
		$this->redirect(array('action' => 'index'));
	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->ShippingAddress->recursive = 0;
		$this->set('shippingAddresses', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->ShippingAddress->id = $id;
		if (!$this->ShippingAddress->exists()) {
			throw new NotFoundException(__('Invalid shipping address'));
		}
		$this->set('shippingAddress', $this->ShippingAddress->read(null, $id));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->ShippingAddress->create();
			if ($this->ShippingAddress->save($this->request->data)) {
				$this->Session->setFlash(__('The shipping address has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The shipping address could not be saved. Please, try again.'));
			}
		}
		$cities = $this->ShippingAddress->City->find('list');
		$states = $this->ShippingAddress->State->find('list');
		$countries = $this->ShippingAddress->Country->find('list');
		$users = $this->ShippingAddress->User->find('list');
		$this->set(compact('cities', 'states', 'countries', 'users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		$this->ShippingAddress->id = $id;
		if (!$this->ShippingAddress->exists()) {
			throw new NotFoundException(__('Invalid shipping address'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->ShippingAddress->save($this->request->data)) {
				$this->Session->setFlash(__('The shipping address has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The shipping address could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->ShippingAddress->read(null, $id);
		}
		$cities = $this->ShippingAddress->City->find('list');
		$states = $this->ShippingAddress->State->find('list');
		$countries = $this->ShippingAddress->Country->find('list');
		$users = $this->ShippingAddress->User->find('list');
		$this->set(compact('cities', 'states', 'countries', 'users'));
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
		$this->ShippingAddress->id = $id;
		if (!$this->ShippingAddress->exists()) {
			throw new NotFoundException(__('Invalid shipping address'));
		}
		if ($this->ShippingAddress->delete()) {
			$this->Session->setFlash(__('Shipping address deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Shipping address was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
}
