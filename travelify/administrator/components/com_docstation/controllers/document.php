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
 
// import Joomla controllerform library
jimport('joomla.application.component.controllerform');
 
/**
 * Document Controller
 */
class DocStationControllerDocument extends JControllerForm
{
	/**
	 * Method to check if you can add a new record.
	 *
	 * Extended classes can override this if necessary.
	 *
	 * @param   array  $data  An array of input data.
	 *
	 * @return  boolean
	 *
	 * @since   12.2
	 */
	protected function allowAdd($data = array())
	{
		$user = JFactory::getUser();
		$parentType = JArrayHelper::getValue($data, 'parent_type', 'com_docstation', 'string');
		
		if ( $parentType == 'com_docstation' ) {
			$filter = $this->input->get('filter', null, 'array');
			$categoryId = isset($filter['parent_id']) ? $filter['parent_id'] : null;
			$categoryId = JArrayHelper::getValue($data, 'parent_id', $categoryId, 'int');
			
			// If has category
			if ( $categoryId )
				return $user->authorise('core.create', $this->option . '.category.' . $categoryId);
			else
				return parent::allowAdd( $data );
		}
		else
			return $user->authorise('core.attach', $this->option);
	}

	/**
	 * Method override to check if you can edit an existing record.
	 *
	 * @param   array   $data  An array of input data.
	 * @param   string  $key   The name of the key for the primary key.
	 *
	 * @return  boolean
	 *
	 * @since   1.6
	 */
	protected function allowEdit($data = array(), $key = 'id')
	{
		$recordId = (int) isset($data[$key]) ? $data[$key] : 0;
		
		if ( !$recordId )
			// Since there is no asset tracking, revert to the component permissions.
			return parent::allowEdit($data, $key);

		// Load document if needed
		if ( /*isset($data['parent_type']) &&*/ isset($data['parent_id']) && isset($data['created_by']) ) {
			//$parent_type = $data['parent_type'];
			$parent_id = $data['parent_id'];
			$owner_id = (int) $data['created_by'];
		}
		else {
			$table = JTable::getInstance('Documents', 'DocStationTable');
			if ( !$table->load( $recordId ) ) return false;
			//$parent_type = $table->parent_type;
			$parent_id = $table->parent_id;
			$owner_id = (int) $table->created_by;
		}
		
		$user = JFactory::getUser();
		
		// Check general edit permission first
		if ( $user->authorise('core.edit', $this->option . '.category.' . $parent_id) )
			return true;

		// Fallback on edit.own
		if ( $user->authorise('core.edit.own', $this->option . '.category.' . $parent_id) ) {
			if ( $owner_id == $user->get('id') )
				return true;
		}
		
		return false;
	}
	
	/**
	 * Method to save a record.
	 *
	 * @param	string	$key	The name of the primary key of the URL variable.
	 * @param	string	$urlVar	The name of the URL variable if different from the primary key (sometimes required to avoid router collisions).
	 *
	 * @return	Boolean	True if successful, false otherwise.
	 */
	public function save($key = null, $urlVar = null) {
		// Row ID
		if ( empty($urlVar) ) $urlVar = 'id';
		$recordId = JRequest::getInt($urlVar);

		// Eidt state
		$edit = ( $recordId != 0 );
		$error = false;

		// Name of the field with file data
		$fieldname = $edit ? 'replace' : 'upload';

		// Get the global table $_FILE which contains all the data file.
		$files = JRequest::get('files');
		$fileError = isset($files['jform']) ? $files['jform']['error'][$fieldname] : 4;
		if ($fileError > 0) 
		{
			switch ($fileError) 
			{
			case 1:
				$this->setError( JText::sprintf('COM_DOCSTATION_ERROR_PHP_SIZE_LIMIT', ini_get('upload_max_filesize')) );
				$error = true;
				break;

			case 2:
				$this->setError( JText::_('COM_DOCSTATION_ERROR_FORM_SIZE_LIMIT') );
				$error = true;
				break;

			case 3:
				$this->setError( JText::_('COM_DOCSTATION_ERROR_PARTIAL_FILE') );
				$error = true;
				break;

			case 4:
				//There must be a file if it is not Edit mode
				if ( !$edit )
				{
					$this->setError( JText::_('COM_DOCSTATION_ERROR_NO_FILE') );
					$error = true;
				}
				break;
			}
		}
		
		//If error occures
		if ( $error )
		{
			// If it is ajax upload - print response
			if ( DocStationHelper::getState('ctrlFormat') === 'json' )
			{
				echo json_encode(array('result' => false, 'message' => $this->getError()));
			}
			else
			{
				$this->setMessage( JText::sprintf('COM_DOCSTATION_ERROR_UPLOAD', $this->getError()), 'error' );
	
				// Save the data in the session.
				JFactory::getApplication()->setUserState($this->option.'.edit.document.data', JRequest::getVar('jform', array(), 'post', 'array'));
	
				// Redirect back to the edit screen.
				$this->setRedirect(
					JRoute::_(
						'index.php?option=' . $this->option . '&view=' . $this->view_item
						. $this->getRedirectToItemAppend($recordId, $urlVar), false
					)
				);
			}
			
			return false;
		}
		
		//Parent type
		$_POST['jform']['parent_type'] = preg_replace("/[^a-zA-Z0-9_\.\s]/","",$_POST['jform']['parent_type']);
		
		//Add filename to POST
		$_POST['jform'][$fieldname] = $files['jform']['name'][$fieldname];
		
		// Save document
		$result = parent::save($key, $urlVar);
		
		// If it is ajax upload - print response
		if ( DocStationHelper::getState('ctrlFormat') === 'json' )
		{
			echo json_encode(array('result' => $result, 'message' => $this->message));
			$this->message = null;
		}
		
		return $result;
	}

	/**
	 * Method to run batch operations.
	 *
	 * @param   object  $model  The model.
	 *
	 * @return  boolean	 True if successful, false otherwise and internal error is set.
	 *
	 * @since   1.6
	 */
	public function batch($model = null)
	{
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		// Set the model
		$model = $this->getModel('Document', '', array());

		// Preset the redirect
		$this->setRedirect(
			JRoute::_(
				'index.php?option=' . $this->option . '&view=' . $this->view_list
				. $this->getRedirectToListAppend(), false
			)
		);

		return parent::batch($model);
	}

	/**
	 * Gets the URL arguments to append to an item redirect.
	 *
	 * @param   integer  $recordId  The primary key id for the item.
	 * @param   string   $urlVar    The name of the URL variable for the id.
	 *
	 * @return  string  The arguments to append to the redirect URL.
	 *
	 * @since   12.2
	 */
	protected function getRedirectToItemAppend($recordId = null, $urlVar = 'id')
	{
		$close = JFactory::getApplication()->input->get('close_modal');
		
		// Setup redirect info.
		if ( $close )
			return parent::getRedirectToItemAppend($recordId, $urlVar).'&close_modal=' . $close;
		else
			return parent::getRedirectToItemAppend($recordId, $urlVar);
	}
	
	/**
	 * Gets the URL arguments to append to a list redirect.
	 *
	 * @return  string  The arguments to append to the redirect URL.
	 *
	 * @since   12.2
	 */
	protected function getRedirectToListAppend()
	{
		$close = JFactory::getApplication()->input->get('close_modal');
		$add = '';
		
		if ( $close )
			$add .= '&close_modal=' . $close;
		
		// Setup redirect info.
		return parent::getRedirectToListAppend().$add;
	}

	/**
	 * Get the return URL.
	 *
	 * If a "return" variable has been passed in the request
	 *
	 * @return  string	The return URL.
	 *
	 * @since   1.6
	 */
	protected function getReturnPage()
	{
		$return = $this->input->get('return', null, 'base64');
	
		if (empty($return) || !JUri::isInternal(base64_decode($return)))
		{
			return JUri::base();
		}
		else
		{
			return base64_decode($return);
		}
	}
	
	/**
	 * Set a URL for browser redirection.
	 *
	 * @param   string  $url   URL to redirect to.
	 * @param   string  $msg   Message to display on redirect. Optional, defaults to value set internally by controller, if any.
	 * @param   string  $type  Message type. Optional, defaults to 'message' or the type set by a previous call to setMessage.
	 *
	 * @return  JControllerLegacy  This object to support chaining.
	 *
	 * @since   12.2
	 */
	public function setRedirect($url, $msg = null, $type = null)
	{
		// If it is ajax upload
		if ( DocStationHelper::getState('ctrlFormat') === 'json' )
		{
			return $this;
		}
		
		parent::setRedirect($url, $msg, $type);

		// Frontend modal can't redirect to list view
		if ( strpos( $url, 'view=documents') !== false || DocStationHelper::getState('routeView') === 'documents' )
		{
			if ( strpos( $url, 'close_modal=1') !== false )
			{
				$this->redirect = JRoute::_(
						'index.php?option=' . $this->option . '&view=data&layout=closemodal&format=raw', false
				);
			}
			else if ( JFactory::getApplication()->isSite() )
			{
				$this->redirect = $this->getReturnPage();
			}
		}
		
		return $this;
	}
}
?>