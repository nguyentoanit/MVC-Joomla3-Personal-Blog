<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla view library
jimport('joomla.application.component.view');
 
/**
 * DocStation View
 */
class DocStationViewMassUpload extends JViewLegacy
{
	protected $canDo;
	protected $state;

	/**
	 * DocStation view display method
	 * @return void
	 */
	function display($tpl = null) 
	{
		// Get the Data
		$this->form = $this->get('Form');
				
		// What Access Permissions does this user have? What can (s)he do?
		$this->canDo = DocStationHelper::getActions();

		// Check for errors.
		if (count($errors = $this->get('Errors'))) 
		{
			JError::raiseError(500, implode('<br />', $errors));
			return false;
		}
		
		// Load additional resources
		JHtml::_('script', 'com_docstation/docstation.js', true, true);
		JHtml::_('stylesheet', 'com_docstation/docstation.css', true, true);
		
		JFactory::getDocument()->addScriptDeclaration("
			jQuery(document).ready( function(){
				DocStation.Uploader.Init('com_docstation', '".JSession::getFormToken()."', {useform: 1});
			} );
		");
		
		DocStationHelper::addSubmenu('massupload');
		$this->sidebar = JHtmlSidebar::render();
		
		$this->addToolbar();

		// Display the template
		parent::display($tpl);
	}
 
	/**
	 * Setting the toolbar
	 */
	protected function addToolBar() 
	{
		// Get the toolbar object instance
		$bar = JToolBar::getInstance('toolbar');
		$canDo = $this->canDo;
		
		JToolBarHelper::title(JText::_('COM_DOCSTATION_MANAGER_MASSUPLOAD'), 'stack docstation');
		
		if ($canDo->get('core.admin')) 
		{
			JToolBarHelper::preferences('com_docstation');
		}
	}
}