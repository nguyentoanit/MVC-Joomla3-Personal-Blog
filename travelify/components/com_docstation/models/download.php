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

/**
 * DocStation Download Model
 */
class DocStationModelDownload extends JModelItem
{
	/**
	 * Model context string.
	 *
	 * @var        string
	 */
	protected $_context = 'com_docstation.download';

	/**
	 * Model typeAlias string.
	 *
	 * @var        string
	 */
	public $typeAlias = 'com_docstation.document';
	
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
		
		$pk  = $app->input->getInt('id');
		$this->setState('download.id', $pk);
		
		$params = $app->getParams();
		$this->setState('params', $params);
	}

	/**
	 * Method to get article data.
	 *
	 * @param   integer  $itemId  The id of the article.
	 *
	 * @return  mixed  Content item data object on success, false on failure.
	 */
	public function getItem($pk = null)
	{
		$pk = (!empty($pk)) ? (int) $pk : (int) $this->getState('download.id');
		
		// Create a new query object.
		$db		= JFactory::getDBO();
		$query	= $db->getQuery(true);
		$user	= JFactory::getUser();
	
		// Select the required fields from the table.
		$query->select(
				$this->getState(
						'list.select',
						'a.id, a.title, a.alias, a.file_name, a.file_size, a.checked_out, a.checked_out_time, a.parent_id' .
						', a.parent_type, a.published, a.access, a.created, a.created_by' .
						', CASE WHEN a.modified = ' . $db->quote($db->getNullDate()) . ' THEN a.created ELSE a.modified END as modified' .
						', a.ordering, a.language, a.description, a.publish_up, a.publish_down, a.hits'
				)
		);
		$query->from('#__docstation AS a');

		// Join over the users for the author and modified_by names.
		$query->select("ua.name AS author")		
			->join('LEFT', '#__users AS ua ON ua.id = a.created_by');
		
		// Join over the categories.
		$query->select('c.title AS category_title, c.access AS category_access');
		$query->join('LEFT', '#__categories AS c ON a.parent_type=\'com_docstation\' AND c.id = a.parent_id');
	
		// Filter by published state
		$published = $this->getState('filter.published');
		if ( is_numeric($published) ) {
			$query->where('a.published = ' . (int) $published);
		}
		elseif ( $published === '' ) {
			$query->where('(a.published = 0 OR a.published = 1)');
		}

		$query->where('a.id = ' . $pk);

		$db->setQuery( $query );
		
		$item = $db->loadObject();
			
		if ( $item )
		{
			// Load parent if needed
			if ( $item->parent_type != 'com_docstation' )
			{
				$item->parent_table = DocStationHelper::getAttachmentParentTable( $item->parent_type );
				
				if ( $item->parent_table )
				{
					$item->parent = DocStationHelper::getAttachmentParent( $item->parent_id, $item->parent_table );
					
					$item->category_title = $item->parent->core_title;
				}
			}
			else {
				$item->tags = new JHelperTags;
				$item->tags->getTagIds($item->id, $this->typeAlias);
			}
			
			$item->params = new JRegistry();

			// Compute selected asset permissions.
			$user	= JFactory::getUser();
			$groups = $user->getAuthorisedViewLevels();

			// Implement View Level Access
			if ( $item->category_access === null )
				$item->params->set('access-view', in_array($item->access, $groups));
			else
				$item->params->set('access-view', in_array($item->access, $groups)
												&& in_array($item->category_access, $groups));

			// Get asset name
			if ( $item->parent_type == 'com_docstation' )
				$asset = 'com_docstation.category.' . $item->parent_id;
			else
				$asset = 'com_docstation';
		
			// Check edit permission.
			if ( $user->authorise('core.edit', $asset)
					|| ($item->id && $user->authorise('core.edit.own', $asset)
							&& $item->created_by == $user->id) )
			{
				$item->params->set('access-edit', true);
			}

			// Check change permission.
			if ( $user->authorise('core.edit.state', $asset)
					|| ($item->id && $user->authorise('core.edit.state.own', $asset)
							&& $item->created_by == $user->id) )
			{
				$item->params->set('access-change', true);
			}
			
			// Don't show unpublished documents if user can't edit it
			$unpublished = ($item->published != 1)
				|| (strtotime($item->publish_up) > strtotime(JFactory::getDate()))
				|| ((strtotime($item->publish_down) < strtotime(JFactory::getDate())) && ($item->publish_down != $db->getNullDate()));
			
			if ( $unpublished && !$item->params->get('access-edit') && !$item->params->get('access-change'))
			{
				return false;
			}
		}
	
		return $item;
	}

	/**
	 * Increment the hit counter for the article.
	 *
	 * @param   integer  $pk  Optional primary key of the article to increment.
	 *
	 * @return  boolean  True if successful; false otherwise and internal error set.
	 */
	public function hit($pk = 0)
	{
		$pk = (!empty($pk)) ? $pk : (int) $this->getState('download.id');

		JTable::addIncludePath( JPATH_COMPONENT_ADMINISTRATOR . '/tables/' );
		$table = JTable::getInstance('Documents', 'DocStationTable');
		$table->load($pk);
		$table->hit($pk);
	
		return true;
	}
	
	/**
	 * Get the return URL.
	 *
	 * @return  string	The return URL.
	 *
	 * @since   1.6
	 */
	public function getReturnPage()
	{
		return base64_encode($this->getState('return_page'));
	}
}