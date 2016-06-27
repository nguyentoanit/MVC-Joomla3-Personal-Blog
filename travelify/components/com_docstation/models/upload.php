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

// Base this model on the backend version.
require_once JPATH_COMPONENT_ADMINISTRATOR.'/models/document.php';

/**
 * DocStation Upload Model
 */
class DocStationModelUpload extends DocStationModelDocument
{

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
		$this->setState('document.id', $pk);
		$this->setState('upload.id', $pk);
		
		$return = $app->input->get('return', null, 'base64');
		$this->setState('return_page', base64_decode($return));
		
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
		$item = parent::getItem($pk);
	
		if ( $item ) {
			$item->params = new JRegistry();

			// Compute selected asset permissions.
			$user	= JFactory::getUser();
			
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
		}
	
		return $item;
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