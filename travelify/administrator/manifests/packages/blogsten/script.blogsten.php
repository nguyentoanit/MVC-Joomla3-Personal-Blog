<?php
/**
 * @version     1.0
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 */
 
// No direct access
defined('_JEXEC') or die('Restricted access');

//Maybe it is possible to set this within the xml file note by Max Milbers
@ini_set( 'memory_limit', '32M' );
@ini_set( 'max_execution_time', '120' );

jimport( 'joomla.application.component.model');

defined('DS') or define('DS', DIRECTORY_SEPARATOR);

    jimport('joomla.installer.installer');
    /**
	 * Blogsten custom installer class
	 */
	class pkg_blogstenInstallerScript {
	    
            function postflight($type, $parent)
	    {
		$this->fixUpdateSite();
		
		$this->_fixMenuItems ();
		
		$msg = $this->_checksystem();
		
		if (JFolder::exists(JPATH_SITE . '/components/com_powermail/')) {
					$this->_checkPowermail();
		}
		
		$db = JFactory::getDbo();
		$tableExtensions = $db->quoteName("#__extensions");
		$columnFolder   = $db->quoteName("folder");
		$columnType      = $db->quoteName("type");
		$columnEnabled   = $db->quoteName("enabled");
		$folder= $db->quoteName("folder");
		$columnElement=$db->quoteName("element");
		// Enable plugin
		$db->setQuery("UPDATE $tableExtensions SET $columnEnabled=1 WHERE ($columnFolder='blogsten' OR ($columnElement='blogsten' OR $columnElement='me_edocs' OR $columnElement='easyembed' OR $columnElement='jw_allvideos' OR $columnElement='blogsten_edocs')) AND $columnType='plugin'");
		$db->query();
		
		 $params = '{"publish_new_content":"1","load_mail":"0","insertReadmore":"0","intro_chars":"300","access_control":"1","content":"corearticle","category":"2","file_type":"pptx,zip,xlsx,xls,doc,docx,ppt,pdf,txt","file_size":"1","download_max":"3","email":"","send_alert_mail":"1","imageResize":"1","width":"800","displayWidth":"540","imageborder":"0px solid black","margintop":"0","marginright":"0","marginbottom":"0","marginleft":"0","aligntop":"center","alignbottom":"center","imageposition":"1","imageFloat":"none","debug":"0","debug_delete":"1","debug_check":"0"}';
		 $db->setQuery('UPDATE #__extensions SET params = ' .
				    $db->quote( $params ) .
				    ' WHERE name = "blogsten" AND type = "component"' );
				    $db->query();
				
	    $query = "CREATE TABLE IF NOT EXISTS `#__blogsten_timer` (`id` int(10) NOT NULL AUTO_INCREMENT,`interval` datetime NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8;";
	    $db->setQuery($query);
	    $result = $db->query();
	    $db->query();
	
	    $fields = $db->getTableColumns('#__blogsten_item');
	    if (!array_key_exists('component', $fields)) {
	    $query = "ALTER TABLE #__blogsten_item ADD `component` varchar(255) NOT NULL AFTER `contentid`";
		$db->setQuery($query);
		$db->query();
	    }
	}
	
	
	public function uninstall($parent)
	    {
		$this->_removePlugin ();
	    }
	    
	    
	function _fixMenuItems() {

		$db = JFactory::getDBO ();
	
		$query = 'SELECT c.extension_id FROM #__extensions c WHERE c.element=\'com_blogsten\' ';
	
		$db->setQuery ( $query );
	
		$id = $db->loadResult ();
	
		$query = "UPDATE #__menu SET component_id=" . ( int ) $id . " WHERE path LIKE 'blogsten-4-joomla%'  AND type='component' ";
	
		$db->setQuery ( $query );
	
		$db->query ();

	}
	
	function _checksystem(){

		$msg = '';

	if (!extension_loaded('imap'))
		{
			$msg .= "<span style='color:red;'>Blogsten needs PHP's IMAP extension to function.</span><br/>";
		}
		
	if (!extension_loaded('iconv'))
	{
		$msg .= "<span style='color:red;'>Blogsten needs PHP's ICONV extension to function.</span><br/>";
	}
	
	if (!extension_loaded('curl'))
	{
		$msg .= "<span style='color:red;'>Blogsten needs PHP's CURL extension to function.</span><br/>";
	}

	if(!function_exists('fsockopen'))
	{
		$msg .="<span style='color:red;'>Blogsten needs PHP's fsockopen function to work properly.</span><br/>";
	}

	if(!function_exists('ini_set')) {
		$msg .="<span style='color:red;'>Blogsten needs PHP's ini_set function to work properly.</span><br/>";
	}

	if(!function_exists('ini_get')) {
		$msg .="<span style='color:red;'>Blogsten needs PHP's ini_get function to work properly.</span><br/>";
	}



		if(function_exists('spl_classes')){



			if(!in_array('RecursiveIteratorIterator',spl_classes())) {

				$msg .="<span style='color:red;'>Blogsten needs PHP's RecursiveIteratorIterator class to save images to a user's private folder.</span><br/>";

			}



			if(!in_array('RecursiveDirectoryIterator',spl_classes())) {

				$msg .="<span style='color:red;'>Blogsten needs PHP's RecursiveDirectoryIterator class to save images to a user's private folder.</span><br/>";

			}

		}else{
			$msg .="<span style='color:red;'>Please Upgrade Your PHP to version 5 or greater. Blogsten needs PHP's RecursiveDirectoryIterator class and RecursiveIteratorIterator class to save images to a user's private folder.</span><br/>";
		}
		
		JFactory::getApplication()->enqueueMessage($msg);
}
    
	function _removePlugin() {
		// remove existing plugin
		$db = JFactory::getDBO ();
		$query = "DELETE FROM #__extensions WHERE element='blogsten' AND folder='system' AND type='plugin' ";
		$db->setQuery ( $query );
		$db->query ();
		$query = "DELETE FROM #__extensions WHERE element='addmodal' AND folder='system' AND type='plugin' ";
		$db->setQuery ( $query );
		$db->query ();
		$xml = JPATH_PLUGINS . DIRECTORY_SEPARATOR. 'system' . DIRECTORY_SEPARATOR.'blogsten';

		jimport ( 'joomla.filesystem.file' );
	
		if (JFolder::exists ( $xml )) {
			JFolder::delete ( $xml );
		}
		
		$query = "DELETE FROM #__extensions WHERE element='blogsten_edocs' AND folder='content' AND type='plugin' ";
	
		$db->setQuery ( $query );
	
		$db->query ();
		$xml3 = JPATH_PLUGINS . DIRECTORY_SEPARATOR. 'content' . DIRECTORY_SEPARATOR. 'blogsten_edocs';
		if (JFolder::exists ( $xml3 )) {
	
			JFolder::delete ( $xml3 );
	
		}
		
		$query = "DELETE FROM #__extensions WHERE folder='blogsten'" ;
		$db->setQuery ( $query );
		$db->query ();
		$xml4 = JPATH_PLUGINS . DIRECTORY_SEPARATOR. 'blogsten';
		if (JFolder::exists ( $xml4 )) {
			JFolder::delete ( $xml4 );
		}
		
		$query = "DELETE FROM #__extensions WHERE element='jw_allvideos' AND folder='content' AND type='plugin' " ;
		$db->setQuery ( $query );
		$db->query ();
		$xml5 = JPATH_PLUGINS . DIRECTORY_SEPARATOR. 'content' . DIRECTORY_SEPARATOR. 'jw_allvideos';
		if (JFolder::exists ( $xml5 )) {
			JFolder::delete ( $xml5 );
		}
		
		$query = "DELETE FROM #__extensions WHERE element='easyembed' AND folder='content' AND type='plugin' " ;
		$db->setQuery ( $query );
		$db->query ();
		$xml6 = JPATH_PLUGINS . DIRECTORY_SEPARATOR. 'content' . DIRECTORY_SEPARATOR. 'easyembed';
		if (JFolder::exists ( $xml6 )) {
			JFolder::delete ( $xml6 );
		}
		
		$query = "DELETE FROM #__extensions WHERE element='pkg_blogsten' AND type='package' " ;
		$db->setQuery ( $query );
		$db->query ();
		
		return;
	}
	
	
	protected function fixUpdateSite() {
		$db = JFactory::getDbo();

		// Find all update sites.
		$query = $db->getQuery(true)
			->select($db->quoteName('update_site_id'))->from($db->quoteName('#__update_sites'))
			->where($db->quoteName('location') . ' LIKE '. $db->quote('http://www.powermail4joomla.com/blogsten_updater.xml%'))
			->order($db->quoteName('update_site_id') . ' ASC');
		$db->setQuery($query);
		$list = (array) $db->loadColumn();

		$query = $db->getQuery(true)
			->set($db->quoteName('name').'='.$db->quote('com_blogsten'))
			->set($db->quoteName('type').'='.$db->quote('extension'))
			->set($db->quoteName('location').'='.$db->quote('http://www.powermail4joomla.com/blogsten_updater.xml'))
			->set($db->quoteName('enabled').'=1')
			->set($db->quoteName('last_check_timestamp').'=0');

		if (!$list) {
			// Create new update site.
			$query->insert($db->quoteName('#__update_sites'));
			$id = $db->insertid();
		} else {
			// Update last Blogsten update site with new information.
			$id = array_pop($list);
			$query->update($db->quoteName('#__update_sites'))->where($db->quoteName('update_site_id') . '=' . $id);
		}
		$db->setQuery($query);
		$db->execute();

		if ($list) {
			$ids = implode(',', $list);

			// Remove old update sites.
			$query = $db->getQuery(true)->delete($db->quoteName('#__update_sites'))->where($db->quoteName('update_site_id') . 'IN ('.$ids.')');
			$db->setQuery($query);
			$db->execute();
		}

		// Currently only pkg_blogsten gets registered to update site, so remove everything else.
		$list[] = $id;
		$ids = implode(',', $list);

		// Remove old updates.
		$query = $db->getQuery(true)->delete($db->quoteName('#__updates'))->where($db->quoteName('update_site_id') . 'IN ('.$ids.')');
		$db->setQuery($query);
		$db->execute();

		// Remove old update extension bindings.
		$query = $db->getQuery(true)->delete($db->quoteName('#__update_sites_extensions'))->where($db->quoteName('update_site_id') . 'IN ('.$ids.')');
		$db->setQuery($query);
		$db->execute();
	}
	
	function _checkPowermail()
	{
		$db = JFactory::getDBO();
		$query = "SELECT extension_id  FROM #__extensions WHERE `element`= 'powermail' AND `type` = 'plugin' AND `folder` = 'system' AND `enabled` = '1'";
		$db->setQuery($query);
		$result = $db->loadResult();
		if($result)
		{
		    $query1 ="UPDATE #__extensions SET  `enabled` = 0 where `element`= 'powermail' AND `type` = 'plugin' AND `folder` = 'system'";
		    $db->setQuery($query1);
		    $db->query();
		}
		
		return;
	}
	
    }