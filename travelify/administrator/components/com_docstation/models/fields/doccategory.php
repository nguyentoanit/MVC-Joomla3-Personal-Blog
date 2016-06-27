<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access to this file
defined('_JEXEC') or die;
 
// import the list field type
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('list');
 
/**
 * DocStation Form Field class for the DocStation component
 */
class JFormFieldDocCategory extends JFormFieldList
{
	/**
	 * The field type.
	 *
	 * @var	 string
	 */
	protected $type = 'DocCategory';
 
	/**
	 * Method to get a list of options for a list input.
	 *
	 * @return      array	   An array of JHtml options.
	 */
	protected function getOptions() 
	{
		$db = JFactory::getDBO();
		$query = $db->getQuery(true);
		$query->select('#__docstation.id as id, #__docstation.title as title,
						#__categories.title as category, parent_id');
		$query->from('#__docstation');
		$query->leftJoin('#__categories on parent_id=#__categories.id');
		$db->setQuery((string)$query);
		$messages = $db->loadObjectList();
		$options = array();
		if ($messages)
		{
			foreach($messages as $message) 
			{
				$options[] = JHtml::_('select.option', $message->id, $message->title .
							($message->catid ? ' (' . $message->category . ')' : ''));
			}
		}
		$options = array_merge(parent::getOptions(), $options);
		return $options;
	}
}
?>