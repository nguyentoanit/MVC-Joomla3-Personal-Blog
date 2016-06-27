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
 
// import Joomla modelform library
jimport('joomla.application.component.modeladmin');
 
/**
 * Document Model
 */
class DocStationModelDocument extends JModelAdmin
{
	/**
	 * List of parent types, whose attachments was altered.
	 *
	 * @var        Array
	 */
	protected $alteredParents = array();

	/**
	 * Model typeAlias string.
	 *
	 * @var        string
	 */
	public $typeAlias = 'com_docstation.document';

	/**
	 * Batch copy items to a new category or current.
	 *
	 * @param   integer  $value     The new category.
	 * @param   array    $pks       An array of row IDs.
	 * @param   array    $contexts  An array of item contexts.
	 *
	 * @return  mixed  An array of new IDs on success, boolean false on failure.
	 *
	 * @since	11.1
	 */
	protected function batchCopy($value, $pks, $contexts)
	{
		$categoryId = (int) $value;

		$table = $this->getTable();
		$i = 0;

		// Check that the category exists
		if ($categoryId)
		{
			$categoryTable = JTable::getInstance('Category');
			if (!$categoryTable->load($categoryId))
			{
				if ($error = $categoryTable->getError())
				{
					// Fatal error
					$this->setError($error);
					return false;
				}
				else
				{
					$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_MOVE_CATEGORY_NOT_FOUND'));
					return false;
				}
			}
		}

		if (empty($categoryId))
		{
			$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_MOVE_CATEGORY_NOT_FOUND'));
			return false;
		}

		// Check that the user has create permission for the component
		$extension = JFactory::getApplication()->input->get('option', '');
		$user = JFactory::getUser();
		if (!$user->authorise('core.create', $extension . '.category.' . $categoryId))
		{
			$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_CANNOT_CREATE'));
			return false;
		}

		// Parent exists so we let's proceed
		while (!empty($pks))
		{
			// Pop the first ID off the stack
			$pk = array_shift($pks);

			$table->reset();

			// Check that the row actually exists
			if (!$table->load($pk))
			{
				if ($error = $table->getError())
				{
					// Fatal error
					$this->setError($error);
					return false;
				}
				else
				{
					// Not fatal error
					$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_BATCH_MOVE_ROW_NOT_FOUND', $pk));
					continue;
				}
			}

			// Copy file
			$table->file_name = DocStationHelper::copyFile( 'com_docstation', $table->parent_id, $categoryId, $table->file_name );
			if ( $table->file_name === false )
			{
				// Not fatal error
				$this->setError( 'COM_DOCSTATION_CANNOT_COPY_FILE' );
				continue;
			}

			// Reset the ID because we are making a copy
			$table->id = 0;

			// New category ID
			$table->parent_id = $categoryId;

			// Check the row.
			if (!$table->check())
			{
				$this->setError($table->getError());
				return false;
			}

			// Store the row.
			if (!$table->store())
			{
				$this->setError($table->getError());
				return false;
			}
			
			// Save parent type for cache cleaning
			$dot = strpos( $table->parent_type, '.' );
			$ptype = ( $dot === false ) ? $table->parent_type : substr( $table->parent_type, 0, $dot );
			$this->alteredParents[] = $ptype;

			// Get the new item ID
			$newId = $table->get('id');

			// Add the new ID to the array
			$newIds[$i]	= $newId;
			$i++;
		}

		// Clean the cache
		$this->cleanCache();

		return $newIds;
	}

	/**
	 * Batch move items to a new category
	 *
	 * @param   integer  $value     The new category ID.
	 * @param   array    $pks       An array of row IDs.
	 * @param   array    $contexts  An array of item contexts.
	 *
	 * @return  boolean  True if successful, false otherwise and internal error is set.
	 *
	 * @since	11.1
	 */
	protected function batchMove($value, $pks, $contexts)
	{
		$categoryId = (int) $value;

		$table = $this->getTable();

		// Check that the category exists
		if ($categoryId)
		{
			$categoryTable = JTable::getInstance('Category');
			if (!$categoryTable->load($categoryId))
			{
				if ($error = $categoryTable->getError())
				{
					// Fatal error
					$this->setError($error);
					return false;
				}
				else
				{
					$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_MOVE_CATEGORY_NOT_FOUND'));
					return false;
				}
			}
		}

		if (empty($categoryId))
		{
			$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_MOVE_CATEGORY_NOT_FOUND'));
			return false;
		}

		// Check that user has create and edit permission for the component
		$extension = JFactory::getApplication()->input->get('option', '');
		$user = JFactory::getUser();
		if (!$user->authorise('core.create', $extension . '.category.' . $categoryId))
		{
			$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_CANNOT_CREATE'));
			return false;
		}

		// Parent exists so we let's proceed
		foreach ($pks as $pk)
		{
			if (!$user->authorise('core.edit', $contexts[$pk]))
			{
				$this->setError(JText::_('JLIB_APPLICATION_ERROR_BATCH_CANNOT_EDIT'));
				return false;
			}

			// Check that the row actually exists
			if (!$table->load($pk))
			{
				if ($error = $table->getError())
				{
					// Fatal error
					$this->setError($error);
					return false;
				}
				else
				{
					// Not fatal error
					$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_BATCH_MOVE_ROW_NOT_FOUND', $pk));
					continue;
				}
			}

			// Move file
			$table->file_name = DocStationHelper::moveFile( 'com_docstation', $table->parent_id, $categoryId, $table->file_name );
			if ( $table->file_name === false )
			{
				// Not fatal error
				$this->setError( 'COM_DOCSTATION_CANNOT_MOVE_FILE' );
				continue;
			}
			
			// Set the new category ID
			$table->parent_id = $categoryId;

			// Check the row.
			if (!$table->check())
			{
				$this->setError($table->getError());
				return false;
			}

			// Store the row.
			if (!$table->store())
			{
				$this->setError($table->getError());
				return false;
			}
			
			// Save parent type for cache cleaning
			$dot = strpos( $table->parent_type, '.' );
			$ptype = ( $dot === false ) ? $table->parent_type : substr( $table->parent_type, 0, $dot );
			$this->alteredParents[] = $ptype;
		}

		// Clean the cache
		$this->cleanCache();

		return true;
	}

	/**
	 * Prepare and sanitise the table data prior to saving.
	 *
	 * @param   JTable    A JTable object.
	 *
	 * @return  void
	 * @since   1.6
	 */
	protected function prepareTable($table)
	{
		// Set the publish date to now
		$db = $this->getDbo();
		if ( $table->published == 1 && (int) $table->publish_up == 0 )
		{
			$table->publish_up = JFactory::getDate()->toSql();
		}
	
		if ( $table->published == 1 && intval($table->publish_down) == 0 )
		{
			$table->publish_down = $db->getNullDate();
		}
		
		// Tags not allowed for attachments
		if ( $table->parent_type != 'com_docstation' )
		{
			$table->newTags = null;
		}
	}
	
	/**
	 * Returns a reference to the a Table object, always creating it.
	 *
	 * @param       type    The table type to instantiate
	 * @param       string  A prefix for the table class name. Optional.
	 * @param       array   Configuration array for model. Optional.
	 * @return      JTable  A database object
	 * @since       2.5
	 */
	public function getTable($type = 'Documents', $prefix = 'DocStationTable', $config = array()) 
	{
		return JTable::getInstance($type, $prefix, $config);
	}

	/**
	 * Method to get a single record.
	 *
	 * @param   integer    The id of the primary key.
	 *
	 * @return  mixed  Object on success, false on failure.
	 */
	public function getItem($pk = null)
	{
		if ($item = parent::getItem($pk))
		{
			if (!empty($item->id))
			{
				$item->tags = new JHelperTags;
				$item->tags->getTagIds($item->id, $this->typeAlias);
			}
		}
	
		return $item;
	}
	
	/**
	 * Method to get the record form.
	 *
	 * @param       array   $data	   Data for the form.
	 * @param       boolean $loadData       True if the form is to load its own data (default case), false if not.
	 * @return      mixed   A JForm object on success, false on failure
	 * @since       2.5
	 */
	public function getForm($data = array(), $loadData = true) 
	{
		// Get the form.
		$form = $this->loadForm('com_docstation.document', 'document', array('control' => 'jform', 'load_data' => $loadData));
		
		if (empty($form)) return false;
		
		if ( $this->getState('document.id') != 0 )
		{
			$form->setFieldAttribute( 'upload', 'readonly', 'true' );
			$form->setFieldAttribute( 'upload', 'type', 'text' );
			$form->setFieldAttribute( 'replace', 'type', 'file' );
		}
		
		return $form;
	}
	
	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return      mixed   The data for the form.
	 * @since       2.5
	 */
	protected function loadFormData() 
	{
		// Check the session for previously entered form data.
		$data = JFactory::getApplication()->getUserState($this->option.'.edit.'.$this->name.'.data', array());
		if (empty($data)) 
		{
			$data = $this->getItem();
			
			// Prime some default values.
			if ($this->getState('document.id') == 0) {
				$app = JFactory::getApplication();

				$filters = (array) $app->getUserState('com_docstation.documents.filter');
				$filterCatId = isset($filters['parent_id']) ? $filters['parent_id'] : null;

				$data->set('parent_id', $app->input->getInt('parent_id', $filterCatId));
			}
		}
		return $data;
	}

	/**
	 * Method to allow derived classes to preprocess the form.
	 *
	 * @param   JForm   $form   A JForm object.
	 * @param   mixed   $data   The data expected for the form.
	 * @param   string  $group  The name of the plugin group to import (defaults to "content").
	 *
	 * @return  void
	 *
	 * @see     JFormField
	 * @since   12.2
	 * @throws  Exception if there is an error in the form event.
	 */
	protected function preprocessForm(JForm $form, $data, $group = 'content')
	{
		parent::preprocessForm($form, $data, $group);
		
		if ( is_array($data) )
		{
			if ( isset($data['parent_type']) && !empty($data['parent_type']) && $data['parent_type'] != 'com_docstation' )
				$form->removeField('tags');
		}
		else if ( $data instanceof JObject )
		{
			if ( isset($data->parent_type) && !empty($data->parent_type) && $data->parent_type != 'com_docstation' )
				$form->removeField('tags');
		}
	}
	
	/**
	 * Method to check if it's OK to delete a document. Overwrites JModelAdmin::canDelete
	 */
	protected function canDelete($record)
	{
		$user = JFactory::getUser();
		
		if ( $record->parent_type == 'com_docstation' )
			$asset = $this->option . '.category.' . $record->parent_id;
		else
			$asset = $this->option;

		if ( $user->authorise('core.delete', $asset) )
			return true;
		if ( $user->authorise('core.delete.own', $asset) && $user->id == $record->created_by )
			return true;
		
		return false;
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param   object  $record  A record object.
	 *
	 * @return  boolean  True if allowed to change the state of the record. Defaults to the permission for the component.
	 *
	 * @since   12.2
	 */
	protected function canEditState($record)
	{
		$user = JFactory::getUser();
		
		if ( $record->parent_type == 'com_docstation' )
			$asset = $this->option . '.category.' . $record->parent_id;
		else
			$asset = $this->option;

		if ( $user->authorise('core.edit.state', $asset) )
			return true;
		if ( $user->authorise('core.edit.state.own', $asset) && $user->id == $record->created_by )
			return true;
		
		return false;
	}
	
	/**
	 * Method to save the form data.
	 *
	 * @param   array  $data  The form data.
	 *
	 * @return  boolean  True on success, False on error.
	 *
	 * @since   11.1
	 */
	public function save($data)
	{
		$table = $this->getTable();
		$key = $table->getKeyName();
		$pk = (!empty($data[$key])) ? $data[$key] : (int) $this->getState($this->getName() . '.id');
		$isNew = true;

		// Allow an exception to be thrown.
		try
		{
			// Load the row if saving an existing record.
			if ($pk > 0)
			{
				$table->load($pk);
				$isNew = false;
			}
		}
		catch (Exception $e)
		{
			$this->setError($e->getMessage());
			return false;
		}
		
		// Get real context
		$data['parent_type'] = DocStationHelper::getParentType( $data['parent_type'] );

		// Save parent type for cache cleaning
		$dot = strpos( $table->parent_type, '.' );
		$ptype = ( $dot === false ) ? $data['parent_type'] : substr( $data['parent_type'], 0, $dot );
		$this->alteredParents[] = $ptype;
		
		//Check parent type
		if ( !$isNew && $data['parent_type'] != $table->parent_type ) {
			$this->setError('You can\'t change the type of the parent object');
			return false;
		}

		//Get the global table $_FILE which contains all the data file.
		$files = JRequest::get('files');
		
		//Field name
		$fieldName = $isNew ? 'upload' : 'replace';
		//Is New file uploaded?
		$file_uploaded = $files['jform']['error'][$fieldName] === 0;
		//Is it for replace?
		$replace = !$isNew && $file_uploaded;
		// Parent type
		$extension = $data['parent_type'];
		
		//New data
		$newFile = $file_uploaded ? $files['jform']['name'][$fieldName] : '';
		$newParentId = intval( $data['parent_id'] );
		//Old data
		$oldFile = $table->file_name;
		$oldParentId = intval( $table->parent_id );

		// If title is empty - get it from file name
		if ( empty($data['title']) )
		{
			if ( $replace || $isNew )
			{
				$data['title'] = JFile::stripExt($newFile);
			}
			else
			{
				$data['title'] = JFile::stripExt($table->file_name);
			}
		}
		
		//Upload file only if its new or need to replace
		if ( $replace || $isNew )
		{
			//Temporary file name
			$fileTemp = $files['jform']['tmp_name'][$fieldName];
			
			//Upload file
			$newFile = DocStationHelper::uploadFile( $fileTemp, $extension, $newParentId, $newFile );
			if ( $newFile === false )
			{
				$this->setError( DocStationHelper::getErrors() );
				return false;
			}

			//File info
			$data['file_name'] = $newFile;
			$data['file_type'] = $files['jform']['type'][$fieldName];
			$data['file_size'] = $files['jform']['size'][$fieldName];
		}
		//If parent changed
		else if ( $newParentId != $oldParentId )
		{
			//Move file to the new destination
			DocStationHelper::moveFile( $extension, $oldParentId, $newParentId, $oldFile );
		}
		
		$result = parent::save($data);
		
		if ( !$result )
		{
			if ( $isNew )
			{
				//Delete uploaded file
				DocStationHelper::deleteFile( $extension, $newParentId, $newFile );
			}
			else if ( $newParentId != $oldParentId )
			{
				//Move file back to the old filder
				DocStationHelper::moveFile( $extension, $newParentId, $oldParentId, $oldFile );
			}
		}
		else if ( $replace )
		{
			DocStationHelper::deleteFile( $extension, $oldParentId, $oldFile );
		}
		
		return $result;
	}
	
	/**
	 * A protected method to get a set of ordering conditions.
	 *
	 * @param	object	A record object.
	 *
	 * @return	array	An array of conditions to add to add to ordering queries.
	 * @since	1.6
	 */
	protected function getReorderConditions($table)
	{
		$condition = array();
		$condition[] = 'parent_type = \''.$table->parent_type.'\'';
		$condition[] = 'parent_id = '.(int) $table->parent_id;
		return $condition;
	}

	/**
	 * Custom clean the cache of com_docstation and attachment parents
	 *
	 * @since   1.6
	 */
	protected function cleanCache($group = null, $client_id = 0)
	{
		// Altered attachments also can be viewed through 'com_docstation', so add it to clean list
		$this->alteredParents[] = 'com_docstation';
		$this->alteredParents = array_unique( $this->alteredParents );
		
		foreach( $this->alteredParents as $option )
		{
			parent::cleanCache( $option );
		}
	}
}