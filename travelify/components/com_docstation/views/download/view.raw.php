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
 * HTML View class for the DocStation Component
 */
class DocStationViewDownload extends JViewLegacy
{
	/**
	 * DocStation view display method
	 * @return void
	 */
	function display($tpl = null)
	{
		// Get data from the model
		$this->item = $this->get('Item');

		// Check for errors.
		if ( count($errors = $this->get('Errors')) ) 
		{
			return JError::raiseError(500, implode("\n", $errors));
		}

		if ( $this->item == false )
		{
			return JError::raiseError(404, JText::_('COM_DOCSTATION_DOCUMENT_NOT_FOUND'));
		}

		if ( $this->item->params->get('access-view') != true )
		{
			return JError::raiseError(403, JText::_('JERROR_ALERTNOAUTHOR'));
		}
				
		$model = $this->getModel();
		$model->hit();
		
		$app = JFactory::getApplication();
		$app->redirect( DocStationHelper::getDirectLink( $this->item ) );
	}
}
?>