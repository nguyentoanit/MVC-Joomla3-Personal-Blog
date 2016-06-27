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

// import the Joomla modellist library
jimport('joomla.application.component.modellist');

/**
 * DocStationCategory Model
 */
class DocStationModelCategory extends JModelList
{
	/**
	 * Category items data
	 *
	 * @var array
	 */
	protected $_item = null;

	protected $_children = null;
	
	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @return	void
	 * @since	1.6
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		// Initialise variables.
		$app = JFactory::getApplication();
		$user = JFactory::getUser();

		// Load the parameters.
		$params = $app->getParams();
		$subcategory = (int) $params->get('show_subcategories', 1);
		$owndocs = (int) $params->get('only_own_docs', 0);

		$pk  = $app->input->getInt('id');
		if ( !$pk ) $pk = (int) $params->get('id', 0);
		
		$this->setState('params', $params);
		$this->setState('category.id', $pk);
		$this->setState('subcategory.show', $subcategory);
		$this->setState('documents.own', $owndocs);
		
		// List state information. (Filters populated there)
		parent::populateState('a.title', 'asc');

		if ( $subcategory == 2 ) {
			$this->setState('filter.level', (int) $params->get('maxLevel', 2));
		}
		else {
			$this->setState('filter.level', 1);
		}
		
		// Restrictions
		if ( !$owndocs )
			$this->setState('filter.published', 1);
		else
			$this->setState('filter.author_id', $user->id);
	}

	/**
	 * Method to get a store id based on model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param	string		$id	A prefix for the store id.
	 *
	 * @return	string		A store id.
	 * @since	1.6
	 */
	protected function getStoreId($id = '')
	{
		// Compile the store id.
		$id	.= ':'.$this->getState('category.id');
		$id	.= ':'.$this->getState('filter.published');
		$id	.= ':'.$this->getState('filter.language');
		$id	.= ':'.$this->getState('filter.author_id');
	
		return parent::getStoreId($id);
	}
	
	/**
	 * Method to build an SQL query to load the list data.
	 *
	 * @return      string  An SQL query
	 */
	protected function getListQuery()
	{
		// Create a new query object.
		$db		= JFactory::getDBO();
		$query	= $db->getQuery(true);
		$user	= JFactory::getUser();
	
		// Select the required fields from the table.
		$query->select(
				$this->getState(
						'list.select',
						'a.id, a.title, a.alias, a.file_name, a.file_size, a.checked_out, a.checked_out_time, a.parent_id' .
						', a.parent_type, a.published, a.access, a.created, a.created_by, a.ordering, a.language' .
						', a.description, a.publish_up, a.publish_down, a.hits'
				)
		);
		$query->from('#__docstation AS a');

		// Join over the users for the author and modified_by names.
		$query->select("ua.name AS author")		
			->join('LEFT', '#__users AS ua ON ua.id = a.created_by');
		
		// Join over the categories.
		$query->select('c.title AS category_title');
		$query->join('LEFT', '#__categories AS c ON a.parent_type=\'com_docstation\' AND c.id = a.parent_id');
		
		// Implement View Level Access
		if ( !$user->authorise('core.admin') )
		{
			$groups	= implode(',', $user->getAuthorisedViewLevels());
			$query->where('a.access IN ('.$groups.')');
		}
	
		// Filter by published state
		$published = $this->getState('filter.published');
		if ( is_numeric($published) ) {
			$query->where('a.published = ' . (int) $published);
		}
		elseif ( $published === '' ) {
			$query->where('(a.published = 0 OR a.published = 1)');
		}

		// Filter by category.
		if ( $this->getState('category.id') && $category = $this->getCategory() ) {
			$query->where('c.lft >= ' . (int) $category->lft);
			$query->where('c.rgt <= ' . (int) $category->rgt);
			
			if ( ($level = $this->getState('filter.level')) && $level > 0 )
				$query->where('c.level <= '.((int) $level + (int) $category->level - 1));
		}
		else {
			$query->where('a.parent_type=\'com_docstation\'');
		}

		// Filter by author
		$authorId = $this->getState('filter.author_id');
		if ( is_numeric($authorId) ) {
			$query->where('a.created_by = '.$authorId);
		}

		// Add the list ordering clause.
/*		$orderCol	= $this->state->get('list.ordering', 'a.title');
		$orderDirn	= $this->state->get('list.direction', 'asc');
		if ( $orderCol == 'a.ordering' || $orderCol == 'category_title' ) {
			$orderCol = 'a.parent_id '.$orderDirn.', a.ordering';
		}
		//sqlsrv change
		if($orderCol == 'language')
			$orderCol = 'l.title';
		if($orderCol == 'access_level')
			$orderCol = 'ag.title';
		$query->order($db->escape($orderCol.' '.$orderDirn));
			*/

		$params = $this->getState('params');
		$ordering = 'c.level';

		switch ( $params->get('category_order', 0) ) {
			case 1:
				$ordering .= ', c.title ASC';
				break;
			case 2:
				$ordering .= ', c.title DESC';
				break;
			case 4:
				$ordering .= ', c.created_time DESC';
				break;
			case 3:
			default:
				$ordering .= ', c.created_time ASC';
				break;
		}

		$ordering .= ', a.parent_id';

		switch ( $params->get('documents_order', 0) ) {
			case 1:
				$ordering .= ', a.title ASC';
				break;
			case 2:
				$ordering .= ', a.title DESC';
				break;
			case 3:
				$ordering .= ', a.created ASC';
				break;
			case 4:
				$ordering .= ', a.created DESC';
				break;
			default:
				$ordering .= ', a.ordering';
				break;
		}

		$query->order($ordering);
	
		return $query;
	}
	
	/**
	 * Method to load category data
	 *
	 * @param   integer  ID
	 *
	 * @return  object
	 */
	protected function _loadCategory($id)
	{
		$categories = JCategories::getInstance('DocStation');
		
		if ( $this->_item = $categories->get($id) )
		{
			$this->_item->getParams();
			
			$user = JFactory::getUser();
			
			// Check general create permission.
			if ( $user->authorise('core.create', 'com_docstation.category.'.$this->_item->id) )
			{
				$this->_item->params->set( 'access-create', true );
			}
		}
		
		return $this->_item;
	}

	/**
	 * Method to load category children
	 *
	 * @param   object  Parent category
	 *
	 * @return  object
	 */
	protected function _loadChildren($category = false)
	{
		$db			= JFactory::getDBO();
		$user		= JFactory::getUser();
		$query		= $db->getQuery(true);
		$level		= (int) $this->getState('filter.level');
		$baselevel	= $category ? (int) $category->level : 1;
		
		$query->select('c.*');
		$query->from('#__categories AS c');
		
		if ( $category ) {
			$query->where('c.lft > ' . (int) $category->lft);
			$query->where('c.rgt < ' . (int) $category->rgt);
		}
		else {
			$query->where('c.extension = \'com_docstation\'');
		}
		
		if ( $this->getState('subcategory.show') == 1 ) {
			++$level;
			$query->select('COUNT(a.id) AS docscount');
			$query->join('LEFT', '#__categories AS sc ON c.lft <= sc.lft AND sc.rgt <= c.rgt');
			$query->join('LEFT', '#__docstation AS a ON a.parent_id = sc.id');
			$query->group('c.id');
		}

		$query->where('c.access IN (' . implode(',', $user->getAuthorisedViewLevels()) . ')');

		if ( $level > 0 )
			$query->where('c.level <= ' . ($level + $baselevel - 1));

		$params = $this->getState('params');
		switch ( $params->get('category_order', 0) ) {
			case 1:
				$ordering = 'c.title ASC';
				break;
			case 2:
				$ordering = 'c.title DESC';
				break;
			case 4:
				$ordering = 'c.created_time DESC';
				break;
			case 3:
			default:
				$ordering = 'c.created_time ASC';
				break;
		}

		$query->order($ordering);

		$db->setQuery($query);

		$this->_children = $db->loadObjectList('id');

		foreach ( $this->_children as $child )
		{
			$child->params = new JRegistry( $child->params );
		
			// Check general create permission.
			if ( $user->authorise('core.create', 'com_docstation.category.'.$child->id) )
			{
				$child->params->set( 'access-create', true );
			}
		}
		
		return $this->_children;
	}
	
	/**
	 * Method to get category data for the current category
	 *
	 * @param   integer  An optional ID
	 *
	 * @return  object
	 * @since   1.5
	 */
	public function getCategory()
	{
		if ( $this->_item === null )
		{
			if ( $catid = $this->getState('category.id') ) {
				$this->_item = $this->_loadCategory( $catid );
				$this->_children = !$this->_item ? false : $this->_loadChildren( $this->_item );
			}
			else {
				$this->_item = false;
				$this->_children = $this->_loadChildren( false );
			}
		}

		return $this->_item;
	}

	/**
	 * Method to get category data for the current category
	 *
	 * @param   integer  An optional ID
	 *
	 * @return  object
	 * @since   1.5
	 */
	public function getChildren()
	{
		if ( $this->_children === null )
		{
			$this->getCategory();
		}

		return $this->_children;
	}
}