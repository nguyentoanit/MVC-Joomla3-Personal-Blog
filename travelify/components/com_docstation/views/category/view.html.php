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

// Require helper file
JLoader::register('DocStationHelperRoute', JPATH_COMPONENT . '/helpers/route.php');

/**
 * HTML View class for the DocStation Component
 */
class DocStationViewCategory extends JViewCategory
{
	protected $actions;
	protected $state;
	protected $items;
	protected $category;
	protected $children;
	protected $pagination;
	protected $defaultPageTitle = 'COM_DOCSTATION_TITLE_DOCUMENTS';
	
	/**
	 * DocStation view display method
	 * @return void
	 */
	function display($tpl = null)
	{
		$app    = JFactory::getApplication();
		$user   = JFactory::getUser();
		
		// Get data from the model
		$this->state			= $this->get('State');
		$this->items			= $this->get('Items');
		$this->category			= $this->get('Category');
		$this->children			= $this->get('Children');
		$this->pagination		= $this->get('Pagination');
		$this->params			= &$this->state->params;
		$dispatcher				= JEventDispatcher::getInstance();

		$this->pageclass_sfx = htmlspecialchars($this->params->get('pageclass_sfx'));
		$this->new_window = $this->params->get('open_new_window', 1);
		$this->doc_page = $this->params->get('show_document_page', 1);
		$this->show_desc = $this->params->get('show_documents_desc', 0);
		$this->icon_size = $this->params->get('icon_list_size', 64);

		$show_size = $this->params->get('show_document_size', array(DocStationHelper::VIEW_CASE_HOVER));
		$this->show_size_list = in_array(DocStationHelper::VIEW_CASE_DOCUMENT_LIST, $show_size);
		$this->show_size_hover = in_array(DocStationHelper::VIEW_CASE_HOVER, $show_size);

		// Check for errors.
		if ( count($errors = $this->get('Errors')) ) 
		{
			return JError::raiseError(500, implode("\n", $errors));
		}

		if ( $this->category == false && ($this->state->get('category.id') || $this->getLayout() != 'my') )
		{
			return JError::raiseError(404, JText::_('JGLOBAL_CATEGORY_NOT_FOUND'));
		}
		
		// Check whether category access level allows access.
		$groups = $user->getAuthorisedViewLevels();
		
		if ( $this->category && !in_array($this->category->access, $groups) )
		{
			return JError::raiseWarning(403, JText::_('JERROR_ALERTNOAUTHOR'));
		}
		
		// Import content plugins
		JPluginHelper::importPlugin('content');
		
		// Process items
		foreach ( $this->items as $item )
		{
			$item->params = new JRegistry();
			
			$canDo = $this->getActions( $item->parent_id );

			// Check edit permission.
			if ( $canDo->get('core.edit')
					|| ( $canDo->get('core.edit.own') && $item->created_by == $user->id ) )
			{
				$item->params->set( 'access-edit', true );
			}
		
			// Check change permission.
			if ( $canDo->get('core.edit.state')
					|| ( $canDo->get('core.edit.state.own') && $item->created_by == $user->id ) )
			{
				$item->params->set( 'access-change', true );
			}
				
			// Check change permission.
			if ( $canDo->get('core.delete')
					|| ( $canDo->get('core.delete.own') && $item->created_by == $user->id ) )
			{
				$item->params->set( 'access-delete', true );
			}
			
			// Trigger content plugins
			if ( !empty($item->description) )
			{
				$item->text = &$item->description;
				$dispatcher->trigger('onContentPrepare', array('com_docstation.category', &$item, &$this->params, 0));
			}
		}
		
		JFactory::getDocument()->addStyleSheet('media/com_docstation/css/docstation.css');

		// Category tags and description
		if ( $this->category )
		{
			$this->category->tags = new JHelperTags;
			$this->category->tags->getItemTags( 'docstation.category', $this->category->id );
			
			// Trigger content plugins
			if ( !empty($this->category->description) )
			{
				$this->category->text = &$this->category->description;
				$dispatcher->trigger('onContentPrepare', array('com_docstation.category', &$this->category, &$this->params, 0));
			}
		}
		
		// Display the template
		parent::display($tpl);
	}

	/**
	 * Method to prepares the document
	 *
	 * @return  void
	 *
	 * @since   3.2
	 */
	protected function prepareDocument()
	{
		parent::prepareDocument();
		
		$menu = $this->menu;
		$id = (int) @$menu->query['id'];

		if ($menu && $this->category && ($menu->query['option'] != 'com_docstation' || $menu->query['view'] == 'download' || $id != $this->category->id))
		{
			$path = array(array('title' => $this->category->title, 'link' => ''));
			$category = $this->category->getParent();

			while (($menu->query['option'] != 'com_docstation' || $menu->query['view'] == 'download' || $id != $category->id) && $category->id > 1)
			{
				$path[] = array('title' => $category->title, 'link' => DocStationHelperRoute::getCategoryRoute($category->id));
				$category = $category->getParent();
			}

			$path = array_reverse($path);

			foreach ($path as $item)
			{
				$this->pathway->addItem($item['title'], $item['link']);
			}
		}
	}
	
	/**
	 * Get the actions
	 */
	protected function getActions($catid = 0)
	{
		if ( !isset($this->actions[$catid]) )
		{
			$this->actions[$catid] = DocStationHelper::getActions( $catid );
		}

		return $this->actions[$catid];
	}
}
?>