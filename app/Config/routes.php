<?php
/**
 * Routes configuration
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different urls to chosen controllers and their actions (functions).
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
 * @package       app.Config
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/View/Pages/home.ctp)...
 */
	Router::connect('/bookmarklet/*', array('controller' => 'static', 'action' => 'bookmarklet'));
	Router::connect('/terms/*', array('controller' => 'static', 'action' => 'terms'));
	Router::connect('/privacy/*', array('controller' => 'static', 'action' => 'privacy'));
	Router::connect('/howitworks/*', array('controller' => 'landing', 'action' => 'howitworks'));
	Router::connect('/go/*', array('controller' => 'posts', 'action' => 'go'));
	Router::connect('/pinterest-management-team', array('controller' => 'landing', 'action' => 'multimanager'));
	Router::connect('/pinterest-scheduler-tool', array('controller' => 'landing', 'action' => 'scheduler'));
	Router::connect('/pinterest-analytics', array('controller' => 'landing', 'action' => 'analytics'));

	Router::connect('/', array('controller' => 'pages', 'action' => 'display', 'home'));
/**
 * ...and connect the rest of 'Pages' controller's urls.
 */
	Router::connect('/pages/*', array('controller' => 'pages', 'action' => 'display'));

/**
 * Load all plugin routes.  See the CakePlugin documentation on
 * how to customize the loading of plugin routes.
 */
	CakePlugin::routes();

/**
 * Load the CakePHP default routes. Only remove this if you do not want to use
 * the built-in default routes.
 */
	require CAKE . 'Config' . DS . 'routes.php';

	Router::connect('/register', array('controller' => 'users', 'action' => 'register'));
	Router::connect('/activate', array('controller' => 'users', 'action' => 'activate'));
	Router::connect('/activate/:activation_code', array('controller' => 'users', 'action' => 'activate'), array('pass' => 'activation_code'));
	Router::connect('/forgotten_password/:password_reset', array('controller' => 'users', 'action' => 'forgotten_password'), array('pass' => 'password_reset_code'));
	Router::connect('/login', array('controller' => 'users', 'action' => 'login'));
