<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access
defined('_JEXEC') or die('Restricted access');
 
// import Joomla table library
jimport('joomla.database.table');
 
/**
 * Document Table class
 */
class DocStationTableDocuments extends JTable
{
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 */
	function __construct(&$db) 
	{
		parent::__construct('#__docstation', 'id', $db);
		
		$this->_observers = new JObserverUpdater($this);
		JObserverMapper::attachAllObservers($this);
		JObserverMapper::addObserverClassToClass('JTableObserverTags', 'DocStationTableDocuments', array('typeAlias' => 'com_docstation.document'));
	}

	/**
	 * Overloaded check function
	 *
	 * @return  boolean  True on success, false on failure
	 *
	 * @see     JTable::check()
	 * @since   11.1
	 */
	public function check()
	{
		if (trim($this->title) == '')
		{
			$this->setError(JText::_('COM_DOCSTATION_ERROR_PROVIDE_VALID_NAME'));
	
			return false;
		}
	
		if (trim($this->alias) == '')
		{
			$this->alias = $this->title;
		}
	
		$this->alias = JApplication::stringURLSafe($this->alias);
	
		if (trim(str_replace('-', '', $this->alias)) == '')
		{
			$this->alias = JFactory::getDate()->format('Y-m-d-H-i-s');
		}
	
		if (trim(str_replace('&nbsp;', '', $this->description)) == '')
		{
			$this->description = '';
		}
	
		// Check the publish down date is not earlier than publish up.
		if ($this->publish_down > $this->_db->getNullDate() && $this->publish_down < $this->publish_up)
		{
			// Swap the dates.
			$temp = $this->publish_up;
			$this->publish_up = $this->publish_down;
			$this->publish_down = $temp;
		}
	
		return true;
	}
	
	/**
	 * Overrides JTable::store to set modified data and user id.
	 *
	 * @param   boolean  $updateNulls  True to update fields even if they are null.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   11.1
	 */
	public function store($updateNulls = false)
	{
		$date = JFactory::getDate();
		$user = JFactory::getUser();

		if ($this->id)
		{
			// Existing item
			$this->modified = $date->toSql();
			$this->modified_by = $user->get('id');
		}
		else
		{
			// New article. An article created and created_by field can be set by the user,
			// so we don't touch either of these if they are set.
			if (!intval($this->created))
			{
				$this->created = $date->toSql();
			}

			if (empty($this->created_by))
			{
				$this->created_by = $user->get('id');
			}
		}
	
		// Verify that the alias is unique
		$table = JTable::getInstance('Documents', 'DocStationTable');
		$unique = true;

		if ($table->load(array('alias' => $this->alias, 'parent_id' => $this->parent_id)) && ($table->id != $this->id || $this->id == 0))
		{
			// Try to create unique alias for new files
			if ($this->id == 0)
			{
				$this->alias .= '_' . time();
					
				if ($table->load(array('alias' => $this->alias, 'parent_id' => $this->parent_id)))
				{
					$unique = false;
				}
			}
			else
			{
				$unique = false;
			}
		}
		
		if (!$unique)
		{
			$this->setError(JText::_('COM_DOCSTATION_ERROR_DOCUMENT_UNIQUE_ALIAS'));
			
			return false;
		}
		
		return parent::store($updateNulls);
	}
}