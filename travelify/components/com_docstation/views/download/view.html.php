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
class DocStationViewDownload extends JViewLegacy
{
	/**
	 * DocStation view display method
	 * @return void
	 */
	function display($tpl = null)
	{
		$app = JFactory::getApplication();
		
		// Get data from the model
		$this->item		= $this->get('Item');
		$this->params	= $app->getParams();
		$this->print	= $app->input->getBool('print');
		$dispatcher		= JEventDispatcher::getInstance();
		
		// Check for errors.
		if ( count($errors = $this->get('Errors')) ) 
		{
			return JError::raiseError(500, implode("\n", $errors));
		}

		if ( $this->item == false )
		{
			return JError::raiseError(404, JText::_('COM_DOCSTATION_DOCUMENT_NOT_FOUND'));
		}

		if ( $this->item->params->get('access-view') != true )
		{
			JError::raiseWarning(403, JText::_('JERROR_ALERTNOAUTHOR'));
		}
		else
		{
			$this->item->download_link = DocStationHelperRoute::getDocumentRoute(
				$this->item->id.':'.$this->item->alias,
				$this->item->parent_id.'.'.$this->item->parent_type,
				$this->item->language, false );
		}

		if ( $this->item->parent_type == 'com_docstation' )
		{
			$this->item->tags = new JHelperTags;
			$this->item->tags->getItemTags('com_docstation.document' , $this->item->id);
			
			$this->cat_url = DocStationHelperRoute::getCategoryRoute( $this->item->parent_id );
			$this->cat_jtext = 'COM_DOCSTATION_CATEGORY';
		}
		else
		{
			$this->cat_url = DocStationHelperRoute::getAttachmentParentRoute( $this->item->parent, $this->item->parent_table );
			$this->cat_jtext = 'COM_DOCSTATION_ATTACHED_TO_' . str_replace(' ', '_', $this->item->parent_table->type_title);
		}
		
		$this->pageclass_sfx = htmlspecialchars($this->params->get('pageclass_sfx'));
		$this->new_window = $this->params->get('open_new_window', 1);
		
		// Add description alias for content plugins
		$this->item->text = &$this->item->description;
		
		JPluginHelper::importPlugin('content');
		$dispatcher->trigger('onContentPrepare', array('com_docstation.download', &$this->item, &$this->params, 0));
		
		$this->prepareDocument();
		
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
		$app           = JFactory::getApplication();
		$menus         = $app->getMenu();
		$this->pathway = $app->getPathway();
		$title         = null;

		// Because the application sets a default page title, we need to get it from the menu item itself
		$this->menu = $menus->getActive();

		if ($this->menu)
		{
			$this->params->def('page_heading', $this->params->get('page_title', $this->menu->title));
		}
		else
		{
			$this->params->def('page_heading', JText::_('COM_DOCSTATION_TITLE_DOCUMENTS'));
		}

		$title = $this->params->get('page_title', '');

		if ( $this->item->parent_type == 'com_docstation' ) {
			$id = (int) @$this->menu->query['id'];
			
			// if the menu item does not concern this article
			if ($this->menu && ($this->menu->query['option'] != 'com_docstation' || $this->menu->query['view'] != 'download' || $id != $this->item->id))
			{
				// If this is not a single document menu item, set the page title to the document title
				if ($this->item->title)
				{
					$title = $this->item->title;
				}
				$path = array(array('title' => $this->item->title, 'link' => ''));
				$category = JCategories::getInstance('DocStation')->get($this->item->parent_id);
			
				while ($category && ($this->menu->query['option'] != 'com_docstation' || $this->menu->query['view'] == 'download' || $id != $category->id) && $category->id > 1)
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
		else
		{
			if ($this->item->title)
			{
				$title = $this->item->title;
			}
			$this->pathway->addItem($this->item->category_title, $this->cat_url);
			$this->pathway->addItem($this->item->title, '');
		}
		
		if (empty($title))
		{
			$title = $app->get('sitename');
		}
		elseif ($app->get('sitename_pagetitles', 0) == 1)
		{
			$title = JText::sprintf('JPAGETITLE', $app->get('sitename'), $title);
		}
		elseif ($app->get('sitename_pagetitles', 0) == 2)
		{
			$title = JText::sprintf('JPAGETITLE', $title, $app->get('sitename'));
		}

		$this->document->setTitle($title);

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
?>