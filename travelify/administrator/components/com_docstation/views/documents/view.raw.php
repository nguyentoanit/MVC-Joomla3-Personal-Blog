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
 
/**
 * DocStation View
 */
class DocStationViewDocuments extends JViewLegacy
{
	protected $items;
	protected $state;

	/**
	 * DocStation view display method
	 * @return void
	 */
	function display($tpl = null) 
	{
		$layout = $this->getLayout();
		
		// Get data from the model
		$this->items		= $this->get('Items');
		$this->state		= $this->get('State');

		// Check for errors.
		if (count($errors = $this->get('Errors'))) 
		{
			JError::raiseError(500, implode('<br />', $errors));
			return false;
		}

		// Display the template
		parent::display($tpl);
	}
}