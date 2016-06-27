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
require_once JPATH_COMPONENT_ADMINISTRATOR.'/controllers/document.php';

/**
 * Upload Controller
 */
class DocStationControllerUpload extends DocStationControllerDocument
{
	/**
	 * Constructor.
	 *
	 * @param   array  $config  An optional associative array of configuration settings.
	 *
	 * @see     JControllerLegacy
	 * @since   12.2
	 * @throws  Exception
	 */
	public function __construct($config = array())
	{
		$this->view_item = 'upload';
		$this->view_list = 'documents';
		
		parent::__construct($config);
	}

	/**
	 * Gets the URL arguments to append to an item redirect.
	 *
	 * @param   integer  $recordId  The primary key id for the item.
	 * @param   string   $urlVar    The name of the URL variable for the id.
	 *
	 * @return  string  The arguments to append to the redirect URL.
	 *
	 * @since   12.2
	 */
	protected function getRedirectToItemAppend($recordId = null, $urlVar = 'id')
	{
		$return = JFactory::getApplication()->input->get('return', null, 'base64');
		$parent = JFactory::getApplication()->input->get('parent_id');
		$add = '';
		
		// Setup redirect info.
		if ( $return ) $add .= '&return=' . $return;
		if ( $parent ) $add .= '&parent_id=' . $parent;
		
		return parent::getRedirectToItemAppend($recordId, $urlVar).$add;
	}
}
?>