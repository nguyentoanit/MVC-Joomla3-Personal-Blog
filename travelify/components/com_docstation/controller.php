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
 
// import Joomla controller library
jimport('joomla.application.component.controller');
 
/**
 * DocStation Component Controller
 */
class DocStationController extends JControllerLegacy
{
	function __construct($config = array())
	{
		$view = JRequest::getCmd('view');
		$layout = JRequest::getCmd('layout');

		// Document list frontpage Editor proxying:
		if ( ($view == 'documents' && ($layout == 'editor' || $layout == 'insert')) ) {
			//JHtml::_('stylesheet', 'com_docstation/list.css', true, true);
			$config['base_path'] = JPATH_COMPONENT_ADMINISTRATOR;
		}
		
		// Document edit frontpage Editor proxying:
		else if ( ($view == 'document' && $layout == 'attach') ) {
			JHtml::_('stylesheet', 'com_docstation/item.css', true, true);
			$config['base_path'] = JPATH_COMPONENT_ADMINISTRATOR;
		}

		// Document edit frontpage Editor proxying:
		else if ( $view == 'data' ) {
			$config['base_path'] = JPATH_COMPONENT_ADMINISTRATOR;
		}
		
		parent::__construct($config);
	}

	/**
	 * Method to display a view.
	 *
	 * @param   boolean			If true, the view output will be cached
	 * @param   array  An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return  JController		This object to support chaining.
	 * @since   1.5
	 */
	public function display($cachable = false, $urlparams = false)
	{
		$cachable = true;

		$id    = $this->input->getInt('id');
		$vName = $this->input->getCmd('view', 'category');
		$this->input->set('view', $vName);

		$user = JFactory::getUser();

		if ( $user->get('id') )
		{
			$cachable = false;
		}

		$safeurlparams = array('catid' => 'INT', 'id' => 'INT', 'cid' => 'ARRAY', 'year' => 'INT', 'month' => 'INT', 'limit' => 'UINT', 'limitstart' => 'UINT',
			'showall' => 'INT', 'return' => 'BASE64', 'filter' => 'STRING', 'filter_order' => 'CMD', 'filter_order_Dir' => 'CMD', 'filter-search' => 'STRING', 'print' => 'BOOLEAN', 'lang' => 'CMD', 'Itemid' => 'INT');

		// Check for edit form.
		if ($vName == 'upload' && !$this->checkEditId('com_docstation.edit.upload', $id))
		{
			// Somehow the person just went to the form - we don't allow that.
			return JError::raiseError(403, JText::sprintf('JLIB_APPLICATION_ERROR_UNHELD_ID', $id));
		}

		parent::display($cachable, $safeurlparams);

		return $this;
	}
}
?>