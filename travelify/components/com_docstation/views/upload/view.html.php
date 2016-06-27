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
class DocStationViewUpload extends JViewLegacy
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
		$user   = JFactory::getUser();
		
		// get the Data
		$this->item		= $this->get('Item');
		$this->form		= $this->get('Form');
		$this->state	= $this->get('State');
		$this->params	= &$this->state->params;
		$this->return_page	= $this->get('ReturnPage');
		
		// Check access.
		if ( empty($this->item->id) )
			$authorised = $user->authorise('core.create', 'com_docstation') || (count($user->getAuthorisedCategories('com_docstation', 'core.create')));
		else
			$authorised = $this->item->params->get('access-edit');
		
		if ( $authorised !== true )
		{
			JError::raiseError(403, JText::_('JERROR_ALERTNOAUTHOR'));
			return false;
		}

		// Check for errors.
		if ( count($errors = $this->get('Errors')) )
		{
			JError::raiseError(500, implode('<br />', $errors));
			return false;
		}
		
		if ( $this->params->get('enable_category') == 1 )
		{
			$this->form->setFieldAttribute('parent_id', 'default', $this->params->get('catid', ''));
			$this->form->setFieldAttribute('parent_id', 'readonly', 'true');
		}
		
		$this->_prepareDocument();
		
		// Display the template
		parent::display($tpl);
	}

	/**
	 * Prepares the document
	 */
	protected function _prepareDocument()
	{
		$app		= JFactory::getApplication();
		$menus		= $app->getMenu();
		$title 		= null;

		// Because the application sets a default page title,
		// we need to get it from the menu item itself
		$menu = $menus->getActive();
		if ($menu)
			$this->params->def('page_heading', $this->params->get('page_title', $menu->title));
		else
			$this->params->def('page_heading', JText::_('COM_DOCSTATION_TITLE_EDIT_DOCUMENT'));

		$title = $this->params->def('page_title', JText::_('COM_DOCSTATION_TITLE_EDIT_DOCUMENT'));
		if ($app->getCfg('sitename_pagetitles', 0) == 1)
		{
			$title = JText::sprintf('JPAGETITLE', $app->getCfg('sitename'), $title);
		}
		elseif ($app->getCfg('sitename_pagetitles', 0) == 2)
		{
			$title = JText::sprintf('JPAGETITLE', $title, $app->getCfg('sitename'));
		}
		$this->document->setTitle($title);

//		$pathway = $app->getPathWay();
//		$pathway->addItem($title, '');

		if ($this->params->get('menu-meta_description'))
		{
			$this->document->setDescription($this->params->get('menu-meta_description'));
		}

		if ($this->params->get('menu-meta_keywords'))
		{
			$this->document->setMetadata('keywords', $this->params->get('menu-meta_keywords'));
		}

		if ($this->params->get('robots'))
		{
			$this->document->setMetadata('robots', $this->params->get('robots'));
		}
	}
}