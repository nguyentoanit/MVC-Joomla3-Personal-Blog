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
 * DocStationList Model
 */
class DocStationModelDocuments extends JModelList
{
	/**
	 * Constructor.
	 *
	 * @param	array	An optional associative array of configuration settings.
	 * @see		JController
	 * @since	1.6
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields'])) {
			$config['filter_fields'] = array(
				'id', 'a.id',
				'title', 'a.title',
				'checked_out', 'a.checked_out',
				'checked_out_time', 'a.checked_out_time',
				'parent_id', 'a.parent_id', 'category_title',
				'parent_type', 'a.parent_type',
				'published', 'a.published',
				'access', 'a.access', 'access_level',
				'created', 'a.created',
				'created_by', 'a.created_by',
				'ordering', 'a.ordering',
				'language', 'a.language',
				'publish_up', 'a.publish_up',
				'publish_down', 'a.publish_down',
			);
		}

		parent::__construct($config);
	}

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

		// Adjust the context to support modal layouts.
		if ($layout = JRequest::getVar('layout')) {
			$this->context .= '.'.$layout;
		}

		// Receive old style filters (GET compatible)
		$parent_id = $this->getUserStateFromRequest($this->context.'.filter.parent_id', 'filter_parent_id');
		$this->setState('filter.parent_id', $parent_id);

		$parent_type = $this->getUserStateFromRequest($this->context.'.filter.parent_type', 'filter_parent_type');
		$this->setState('filter.parent_type', $parent_type);
		
		// TODO: Filters validation
		
		// List state information. (Filters populated there)
		parent::populateState('a.title', 'asc');
		
		// Force only own attachments under editor if this is new parent
		if ( $layout === 'editor' && (int) $parent_id == 0 )
		{
			$this->setState('author_id', JFactory::getUser()->id);
		}
		// Force only own documents on frontend (except attachments under editor)
		// On frontend this model used only for attahcment list and list of documents to insert
		elseif ( $layout !== 'editor' && $app->isSite() )
		{
			$this->setState('author_id', JFactory::getUser()->id);
		}
		else
		{
			$this->setState('author_id', $this->state->get('filter.author_id', null));
		}
		
		// Correct context
		if ( $this->state->get('filter.parent_type') ) {
			$parentType = DocStationHelper::getParentType( $this->state->get('filter.parent_type') );
			$parentType = empty($parentType) ? 'com_docstation' : $parentType;
			$this->setState('filter.parent_type', $parentType);
			
			if ( $parentType !== 'com_docstation' && $layout !== 'editor' ) {
				$this->setState('filter.parent_id', null);
			}
		}
		else {
			$this->setState('filter.parent_type', 'com_docstation');
		}
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
		$id	.= ':'.$this->getState('filter.search');
		$id	.= ':'.$this->getState('filter.access');
		$id	.= ':'.$this->getState('filter.published');
		$id	.= ':'.$this->getState('filter.parent_id');
		$id	.= ':'.$this->getState('filter.parent_type');
		$id	.= ':'.$this->getState('filter.author_id');
		$id	.= ':'.$this->getState('filter.language');

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
				'a.id, a.title, a.file_name, a.checked_out, a.checked_out_time, a.parent_id, a.parent_type' .
				', a.published, a.access, a.created, a.created_by, a.ordering, a.language' .
				', a.publish_up, a.publish_down, a.hits'
			)
		);
		$query->from('#__docstation AS a');

		// Join over the language
		$query->select('l.title AS language_title');
		$query->join('LEFT', $db->quoteName('#__languages').' AS l ON l.lang_code = a.language');

		// Join over the users for the checked out user.
		$query->select('uc.name AS editor');
		$query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');

		// Join over the asset groups.
		$query->select('ag.title AS access_level');
		$query->join('LEFT', '#__viewlevels AS ag ON ag.id = a.access');

		// Join over the users for the author.
		$query->select('ua.name AS author_name');
		$query->join('LEFT', '#__users AS ua ON ua.id = a.created_by');

		// Filter by access level.
		if ($access = $this->getState('filter.access')) {
			$query->where('a.access = ' . (int) $access);
		}

		// Implement View Level Access
		if (!$user->authorise('core.admin'))
		{
		    $groups	= implode(',', $user->getAuthorisedViewLevels());
			$query->where('a.access IN ('.$groups.')');
		}

		// Filter by published state
		$published = $this->getState('filter.published');
		if ( is_numeric($published) ) {
			$query->where('a.published = ' . (int) $published);
		}
		else {
			$query->where('(a.published = 0 OR a.published = 1)');
		}

		// Filter by extension
		$parentType = $this->getState('filter.parent_type');
		if ( $parentType ) {
			$query->where( 'a.parent_type = ' . $db->quote($parentType, true) );
		}
		
		// Join over the categories.
		if ( $parentType == 'com_docstation' ) {
			$query->select('c.title AS category_title');
			$query->join('LEFT', '#__categories AS c ON a.parent_type=\'com_docstation\' AND c.id = a.parent_id');
		}
		else {
			$table = DocStationHelper::getAttachmentParentTable( $parentType );
			if ( $table ) {
				$table_name = $table->table->get( 'special' )->dbtable;
				$fields = $table->field_mappings->get( 'common' );
				
				$query->select( "c.$fields->core_title AS category_title");
				$query->join('LEFT', "$table_name AS c ON c.$fields->core_content_item_id = a.parent_id");
			}
			else {
				$query->select( "a.parent_id AS category_title");
			}
		}
		
		$parentId = $this->getState('filter.parent_id');
		
		// Filter by a single or group of categories.
		if ( $parentType == 'com_docstation' ) {
			$baselevel = 1;
			
			if ( is_numeric($parentId) ) {
				$cat_tbl = JTable::getInstance('Category', 'JTable');
				$cat_tbl->load($parentId);
				$rgt = $cat_tbl->rgt;
				$lft = $cat_tbl->lft;
				$baselevel = (int) $cat_tbl->level;
				$query->where('c.lft >= ' . (int) $lft)
					->where('c.rgt <= ' . (int) $rgt);
			}
			elseif ( is_array($parentId) ) {
				JArrayHelper::toInteger($parentId);
				$parentId = implode(',', $parentId);
				$query->where('a.parent_id IN ('.$parentId.')');
			}
	
			// Filter on the level.
			if ( $level = $this->getState('filter.level') ) {
				$query->where('c.level <= '.((int) $level + (int) $baselevel - 1));
			}
		}
		// Filter by attachment's parent.
		elseif ( is_numeric($parentId) ) {
			$query->where( 'a.parent_id = ' . (int) $parentId );
		}

		// Filter by author
		$authorId = $this->getState('author_id');
		if ( is_numeric($authorId) ) {
			$type = $this->getState('filter.author_id.include', true) ? '= ' : '<>';
			$query->where('a.created_by '.$type.(int) $authorId);
		}

		// Filter by search in title.
		$search = $this->getState('filter.search');
		if (!empty($search)) {
			if (stripos($search, 'id:') === 0) {
				$query->where('a.id = '.(int) substr($search, 3));
			}
			elseif (stripos($search, 'author:') === 0) {
				$search = $db->Quote('%'.$db->escape(substr($search, 7), true).'%');
				$query->where('(ua.name LIKE '.$search.' OR ua.username LIKE '.$search.')');
			}
			else {
				$search = $db->Quote('%'.$db->escape($search, true).'%');
				$query->where('(a.title LIKE '.$search.')');
			}
		}

		// Filter on the language.
		if ($language = $this->getState('filter.language')) {
			$query->where('a.language = '.$db->quote($language));
		}

		// Add the list ordering clause.
		$orderCol	= $this->state->get('list.ordering', 'a.title');
		$orderDirn	= $this->state->get('list.direction', 'asc');
		if ($orderCol == 'a.ordering' || $orderCol == 'category_title') {
			$orderCol = 'a.parent_type, a.parent_id '.$orderDirn.', a.ordering';
		}
		//sqlsrv change
		if($orderCol == 'language')
			$orderCol = 'l.title';
		if($orderCol == 'access_level')
			$orderCol = 'ag.title';
		$query->order($db->escape($orderCol.' '.$orderDirn));

		return $query;
	}

	/**
	 * Method to get a list of documents.
	 * Overridden to add a check for access levels.
	 *
	 * @return	mixed	An array of data items on success, false on failure.
	 * @since	1.6.1
	 */
	public function getItems()
	{
		$items	= parent::getItems();
		$app	= JFactory::getApplication();
		$hide	= !JComponentHelper::getParams('com_docstation')->get('show_forbidden', true);
		if ( $app->isSite() && $hide ) {
			$user	= JFactory::getUser();
			$groups	= $user->getAuthorisedViewLevels();

			for ($x = 0, $count = count($items); $x < $count; $x++) {
				//Check the access level. Remove documents the user shouldn't see
				if (!in_array($items[$x]->access, $groups)) {
					unset($items[$x]);
				}
			}
		}
		return $items;
	}

 	/**
	 * Method to get the state of the DocStation plug-ins.
	 *
	 * @return  array   Array of relevant plug-ins and whether they are enabled or not.
	 *
	 * @since   2.5
	 */
	public function getPluginState()
	{
		$db = $this->getDbo();
		$query = $db->getQuery(true);

		$query->select('name, enabled');
		$query->from($db->quoteName('#__extensions'));
		$query->where($db->quoteName('type') . ' = ' .  $db->quote('plugin'));
		$query->where($db->quoteName('folder') . ' IN(' .  $db->quote('editors-xtd') . ',' . $db->quote('content') . ')');
		$query->where($db->quoteName('element') . ' = ' .  $db->quote('docstation'));
		$db->setQuery($query);
//		$db->query();
		$plugins = $db->loadObjectList('name');

		return $plugins;
	}
}