<?php
/**
 * @package     DocStation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
/**
 * Script file of DocStation package
 */
class pkg_DocStationInstallerScript
{
	/**
	 * method to install the package
	 *
	 * @return void
	 */
	function install($parent) 
	{
		$this->_createDefaultCategory();
		$this->_enablePlugins();
		
		// Set messages
		$app = JFactory::getApplication();
		$app->enqueueMessage(JText::_('COM_DOCSTATION_MESSAGE_PLEASE_SAVE_THIS_SETTINGS'));
		$app->enqueueMessage(JText::_('COM_DOCSTATION_MESSAGE_TO_ENABLE_ATTACHMENTS'));

		// Redirect to config page
		$parent->getParent()->setRedirectURL('index.php?option=com_config&view=component&component=com_docstation');
	}

	/**
	 * Create default category.
	 */
	function _createDefaultCategory()
	{
		// Check category
		$db		= JFactory::getDbo();
		$query	= $db->getQuery(true);
		$query->select('a.id');
		$query->from('#__categories AS a');
		$query->where( 'a.alias = '.$db->quote('uncategorised') );
		$query->where( 'a.extension = '.$db->quote('com_docstation') );
		$db->setQuery($query);
		
		// If category exists
		if ( !is_null($db->loadResult()) ) return true;

		// Load category model file
		$basePath = JPATH_ADMINISTRATOR . '/components/com_categories';
		require_once $basePath . '/models/category.php';

		// Create category model
		$config = array( 'table_path' => $basePath . '/tables' );
		$catmodel = new CategoriesModelCategory( $config );
		
		// Create category
		$catData = array( 'id' => 0, 'parent_id' => 1, 'level' => 1, 'extension' => 'com_docstation', 'params' => '', 'metadesc' => '', 'metakey' => '', 'metadata' => '',
			'title' => 'Uncategorised', 'path' => 'uncategorised', 'alias' => 'uncategorised', 'published' => 1, 'language' => '*', 'rules' => array());
		
		// Return result
		return $catmodel->save( $catData );
	}

	/**
	 * Enable plug-ins.
	 */
	function _enablePlugins()
	{
		$db		= JFactory::getDbo();
		$query	= $db->getQuery(true);
		$query->update('#__extensions');
		$query->set('enabled = 1');
		$query->where( 'type = '.$db->quote('plugin') );
		$query->where( 'element = '.$db->quote('docstation') );
		$db->setQuery($query);
		
		return $db->execute();
	}
}