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
 * Button View
 */
class DocStationViewData extends JViewLegacy
{
	/**
	 * display method of Document view
	 * @return void
	 */
	public function display($tpl = null) 
	{
		$this->parent_id = JRequest::getInt('parent_id');
		$this->parent_type = JRequest::getString('parent_type');
		// Display the template
		parent::display($tpl);
	}
}