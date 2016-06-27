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
 
// import Joomla controlleradmin library
jimport('joomla.application.component.controlleradmin');
 
/**
 * Documents Controller
 */
class DocStationControllerDocuments extends JControllerAdmin
{
	/**
	 * Proxy for getModel.
	 * @since       2.5
	 */
	public function getModel($name = 'Document', $prefix = 'DocStationModel', $config = array()) 
	{
		$model = parent::getModel($name, $prefix, array('ignore_request' => true));
		return $model;
	}

	/**
	 * Removes an item.
	 *
	 * @return  void
	 *
	 * @since   12.2
	 */
	public function delete()
	{
		parent::delete();
		
		$extensionURL = '';
		$tmpl = $this->input->get('tmpl');
		$format = $this->input->get('outformat');
		$layout = $this->input->get('layout');
		if ( $tmpl ) $extensionURL .= '&tmpl='.$tmpl;
		if ( $format ) $extensionURL .= '&format='.$format;
		if ( $layout ) $extensionURL .= '&layout='.$layout;
		
		$this->setRedirect(JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $extensionURL, false));
	}
		
	/**
	 * Method to publish a list of items
	 * Added options to redirection link to account for the tmpl and layout
	 *
	 * @return  void
	 *
	 * @since   12.2
	 */
	public function publish()
	{
		parent::publish();
		
		$extensionURL = '';
		$tmpl = $this->input->get('tmpl');
		$format = $this->input->get('outformat');
		$layout = $this->input->get('layout');
		if ( $tmpl ) $extensionURL .= '&tmpl='.$tmpl;
		if ( $format ) $extensionURL .= '&format='.$format;
		if ( $layout ) $extensionURL .= '&layout='.$layout;
		
		$this->setRedirect(JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $extensionURL, false));
	}

	/**
	 * Check in of one or more records.
	 *
	 * @return  boolean  True on success
	 *
	 * @since   12.2
	 */
	public function checkin()
	{
		$result = parent::checkin();
		
		$extensionURL = '';
		$tmpl = $this->input->get('tmpl');
		$format = $this->input->get('outformat');
		$layout = $this->input->get('layout');
		if ( $tmpl ) $extensionURL .= '&tmpl='.$tmpl;
		if ( $format ) $extensionURL .= '&format='.$format;
		if ( $layout ) $extensionURL .= '&layout='.$layout;
		
		if ( $result )
			$this->setRedirect(JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $extensionURL, false), $this->message);
		else
			$this->setRedirect(JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $extensionURL, false), $this->message, $this->messageType);
		
		return $result;
	}
}