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
 
// import contrlooer fom administrator panel
require_once JPATH_COMPONENT_ADMINISTRATOR.'/controllers/documents.php';

/**
 * Upload Controller
 */
class DocStationControllerCategory extends DocStationControllerDocuments
{
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
		parent::setRedirect($url, $msg, $type);

		// Frontend modal can't redirect to list view
		if ( strpos( $url, 'view=documents') !== false )
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