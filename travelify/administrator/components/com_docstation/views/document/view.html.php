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
 * Document View
 */
class DocStationViewDocument extends JViewLegacy
{
	protected $form;
	protected $item;
	protected $canDo;
	
	/**
	 * display method of Document view
	 * @return void
	 */
	public function display($tpl = null) 
	{
		// get the Data
		$this->form = $this->get('Form');
		$this->item = $this->get('Item');


		// What Access Permissions does this user have? What can (s)he do?
		$this->canDo = DocStationHelper::getActions(
			$this->item->parent_type == 'com_docstation' ? $this->item->parent_id : 0
		);

		// Check for errors.
		if (count($errors = $this->get('Errors'))) 
		{
			JError::raiseError(500, implode('<br />', $errors));
			return false;
		}

		// Set the toolbar
		if ( $this->getLayout() != 'attach' ) {
			$this->addToolbar();
		}
 
		// Display the template
		parent::display($tpl);
	}
 
	/**
	 * Setting the toolbar
	 */
	protected function addToolBar() 
	{
		JFactory::getApplication()->input->set('hidemainmenu', true);
		$user = JFactory::getUser();
		$isNew = ($this->item->id == 0);
		JToolBarHelper::title($isNew ? JText::_('COM_DOCSTATION_MANAGER_DOCUMENT_NEW')
					     : JText::_('COM_DOCSTATION_MANAGER_DOCUMENT_EDIT'), 'pencil-2 document-add');
		// Build the actions for new and existing records.
		if ( $isNew ) 
		{
			// For new records, check the create permission.
			if ( $this->canDo->get('core.create') ) 
			{
				JToolBarHelper::apply('document.apply', 'JTOOLBAR_APPLY');
				JToolBarHelper::save('document.save', 'JTOOLBAR_SAVE');
				JToolBarHelper::custom('document.save2new', 'save-new.png', 'save-new_f2.png',
						       'JTOOLBAR_SAVE_AND_NEW', false);
			}
			JToolBarHelper::cancel('document.cancel', 'JTOOLBAR_CANCEL');
		}
		else
		{
			if ( $this->canDo->get('core.edit')
					 || ($this->canDo->get('core.edit.own') && $this->item->created_by == $user->id) )
			{
				// We can save the new record
				JToolBarHelper::apply('document.apply', 'JTOOLBAR_APPLY');
				JToolBarHelper::save('document.save', 'JTOOLBAR_SAVE');
 
				// We can save this record, but check the create permission to see
				// if we can return to make a new one.
				if ($this->canDo->get('core.create')) 
				{
					JToolBarHelper::custom('document.save2new', 'save-new.png', 'save-new_f2.png',
							       'JTOOLBAR_SAVE_AND_NEW', false);
				}
			}
			JToolBarHelper::cancel('document.cancel', 'JTOOLBAR_CLOSE');
		}
	}
}