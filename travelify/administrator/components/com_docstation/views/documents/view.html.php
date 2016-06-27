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
class DocStationViewDocuments extends JViewLegacy
{
	protected $items;
	protected $pagination;
	protected $canDo;
	protected $state;

	/**
	 * DocStation view display method
	 * @return void
	 */
	function display($tpl = null) 
	{
		$layout = $this->getLayout();
		// Get data from the model
		$this->items		= $this->get('Items');
		$this->pagination	= $this->get('Pagination');
		$this->state		= $this->get('State');
		$this->pluginState	= $this->get('PluginState');
		$this->activeFilters = $this->get('ActiveFilters');
		
		// If 'parent_type' is default - this is not active filter
		if ( isset($this->activeFilters['parent_type']) && $this->activeFilters['parent_type'] == 'com_docstation')
		{
			unset($this->activeFilters['parent_type']);
		}
		
		if ( $layout != 'editor' )
		{
			$this->filterForm	= $this->get('FilterForm');
			
			if ( $this->state->get('filter.parent_type') !== 'com_docstation' )
			{
				$this->filterForm->removeField('parent_id', 'filter');
			}
		}
		
		// What Access Permissions does this user have? What can (s)he do?
		$this->canDo = DocStationHelper::getActions();

		// Check for errors.
		if (count($errors = $this->get('Errors'))) 
		{
			JError::raiseError(500, implode('<br />', $errors));
			return false;
		}

		// Levels filter.
		$options	= array();
		$options[]	= JHtml::_('select.option', '1', JText::_('J1'));
		$options[]	= JHtml::_('select.option', '2', JText::_('J2'));
		$options[]	= JHtml::_('select.option', '3', JText::_('J3'));
		$options[]	= JHtml::_('select.option', '4', JText::_('J4'));
		$options[]	= JHtml::_('select.option', '5', JText::_('J5'));
		$options[]	= JHtml::_('select.option', '6', JText::_('J6'));
		$options[]	= JHtml::_('select.option', '7', JText::_('J7'));
		$options[]	= JHtml::_('select.option', '8', JText::_('J8'));
		$options[]	= JHtml::_('select.option', '9', JText::_('J9'));
		$options[]	= JHtml::_('select.option', '10', JText::_('J10'));

		$this->f_levels = $options;

		// Set the submenu & toolbar
		if ( $layout != 'editor' && $layout != 'insert' )
		{
			DocStationHelper::addSubmenu('documents');
			$this->addToolbar();
			$this->sidebar = JHtmlSidebar::render();
		}

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
		
		JToolBarHelper::title(JText::_('COM_DOCSTATION_MANAGER_DOCUMENTS'), 'stack docstation');
		
		if ($canDo->get('core.create')) 
		{
			JToolBarHelper::addNew('document.add');
		}
		
		if ($canDo->get('core.edit')) 
		{
			JToolBarHelper::editList('document.edit');
		}
		
		if ($canDo->get('core.edit.state')) {
			JToolBarHelper::publish('documents.publish', 'JTOOLBAR_PUBLISH', true);
			JToolBarHelper::unpublish('documents.unpublish', 'JTOOLBAR_UNPUBLISH', true);
			JToolbarHelper::archiveList('documents.archive');
			JToolBarHelper::checkin('documents.checkin');
		}
		
		if ($this->state->get('filter.published') == -2 && $canDo->get('core.delete')) 
		{
			JToolBarHelper::deleteList('', 'documents.delete', 'JTOOLBAR_DELETE');
		}
		elseif ($canDo->get('core.edit.state'))
		{
			JToolbarHelper::trash('documents.trash');
		}
		
		// Add a batch button
		if ($canDo->get('core.create') && $canDo->get('core.edit') && $canDo->get('core.edit.state'))
		{
			JHtml::_('bootstrap.modal', 'collapseModal');
			$title = JText::_('JTOOLBAR_BATCH');

			// Instantiate a new JLayoutFile instance and render the batch button
			$layout = new JLayoutFile('joomla.toolbar.batch');

			$dhtml = $layout->render(array('title' => $title));
			$bar->appendButton('Custom', $dhtml, 'batch');
		}
		
		if ($canDo->get('core.admin')) 
		{
			JToolBarHelper::preferences('com_docstation');
		}
	}

	/**
	 * Returns an array of fields the table can be sorted by
	 *
	 * @return  array  Array containing the field name to sort by as the key and display text as value
	 *
	 * @since   3.0
	 */
/*	protected function getSortFields()
	{
		return array(
			'a.ordering'     => JText::_('JGRID_HEADING_ORDERING'),
			'a.state'        => JText::_('JSTATUS'),
			'a.title'        => JText::_('JGLOBAL_TITLE'),
			'category_title' => JText::_('JCATEGORY'),
			'access_level'   => JText::_('JGRID_HEADING_ACCESS'),
			'a.created_by'   => JText::_('JAUTHOR'),
			'language'       => JText::_('JGRID_HEADING_LANGUAGE'),
			'a.created'      => JText::_('JDATE'),
			'a.id'           => JText::_('JGRID_HEADING_ID'),
			'a.featured'     => JText::_('JFEATURED')
		);
	}*/
}