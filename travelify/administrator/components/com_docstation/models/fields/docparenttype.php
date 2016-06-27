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
class JFormFieldDocParentType extends JFormFieldList
{
	/**
	 * The field type.
	 *
	 * @var	 string
	 */
	protected $type = 'DocParentType';
 
	/**
	 * Method to get a list of options for a list input.
	 *
	 * @return      array	   An array of JHtml options.
	 */
	protected function getOptions() 
	{
		// Create a new query object.
		$db = JFactory::getDBO();
		$query = $db->getQuery(true);

		// Construct the query
		$query->select('CASE WHEN c.type_title = NULL THEN a.parent_type ELSE c.type_title END AS text, a.parent_type AS value');
		$query->from('#__docstation AS a');
		$query->join('LEFT', '#__content_types AS c ON a.parent_type = c.type_alias');
		$query->group('a.parent_type, c.type_title');
		$query->order('a.parent_type');

		// Setup the query
		$db->setQuery($query->__toString());
		
		// Return the result
		$result = $db->loadObjectList();
		
		$options = array();
		
		if ( $result ) {
			foreach ($result as $option) {
				if ( $option->value != 'com_docstation' )
					$options[] = JHtml::_('select.option', $option->value, $option->text);
			}
		}
		
		$options = array_merge(parent::getOptions(), $options);
		
		return $options;
	}
}
?>