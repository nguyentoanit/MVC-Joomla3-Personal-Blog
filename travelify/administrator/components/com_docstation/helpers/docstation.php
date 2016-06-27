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

//Import joomlas filesystem functions, we will do all the filewriting with joomlas functions,
//so if the ftp layer is on, joomla will write with that, not the apache user, which might
//not have the correct permissions
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

// Root folder for file storage
define('DIR_SEP', '/');
define('DS_ROOT', 'docstation');
define('DS_ICONS', 'media/com_docstation/docicons');

/**
 * DocStation component helper.
 */
abstract class DocStationHelper
{
	static protected $icons;
	static protected $aliases;
	static protected $errors;
	static protected $states = array();

	const VIEW_CASE_INSERTED = 1;
	const VIEW_CASE_DOCUMENT_LIST = 2;
	const VIEW_CASE_ATTACHMENT_LIST = 3;
	const VIEW_CASE_HOVER = 4;

	/**
	 * Configure the Linkbar.
	 */
	public static function addSubmenu($submenu)
	{
		JHtmlSidebar::addEntry(
			JText::_('COM_DOCSTATION_SUBMENU_DOCUMENTS'),
			'index.php?option=com_docstation',
			$submenu == 'documents'
		);
		JHtmlSidebar::addEntry(
			JText::_('COM_DOCSTATION_SUBMENU_CATEGORIES'),
			'index.php?option=com_categories&view=categories&extension=com_docstation',
			$submenu == 'categories'
		);
		JHtmlSidebar::addEntry(
			JText::_('COM_DOCSTATION_SUBMENU_MASSUPLOAD'),
			'index.php?option=com_docstation&view=massupload',
			$submenu == 'massupload'
		);
	}

	/**
	 * Implement to allow edit or not
	 * Overwrites: JControllerForm::allowEdit
	 *
	 * @param array $data
	 * @param string $key
	 * @return bool
	 */
	protected function allowEdit($data = array(), $key = 'id')
	{
		$id = isset( $data[ $key ] ) ? $data[ $key ] : 0;
		if( !empty( $id ) ){
			$user = JFactory::getUser();
			return $user->authorise( "core.edit", "com_docstation.document." . $id );
		}
	}
	
	/**
	 * Get the actions
	 */
	public static function getActions($catid = 0)
	{
		jimport('joomla.access.access');
		$user   = JFactory::getUser();
		$result = new JObject;
	
		if ( $catid ) {
			$actions = JAccess::getActions('com_docstation', 'category');

			foreach ($actions as $action) {
				$result->set($action->name, $user->authorise($action->name, 'com_docstation.category.'.$catid));
			}
		}
		else {
			$actions = JAccess::getActions('com_docstation', 'component');
			
			foreach ($actions as $action) {
				$result->set($action->name, $user->authorise($action->name, 'com_docstation'));
			}
		}

		return $result;
	}

	/**
	 * Returns the address to the file of the icon
	 *
	 * @param	size_bytes	Size in bytes
	 */
	public static function getIcon($extension, $size)
	{
		// If icons are empty
		if ( !is_array(self::$icons) )
		{
			self::$icons = array();
		}
		
		// If icon for this extension not yet seted
		if ( !isset(self::$icons["$extension.$size"]) )
		{
			$ext = '_'.$size.'.png';
			if ( !JFile::exists( JPATH_SITE .DIR_SEP. DS_ICONS .DIR_SEP. $extension.$ext ) ) {
				self::$icons["$extension.$size"] = DS_ICONS .DIR_SEP. 'file'.$ext;
			} else {
				self::$icons["$extension.$size"] = DS_ICONS .DIR_SEP. $extension.$ext;
			}
		}
		
		return self::$icons["$extension.$size"];
	}

	/**
	 * This method returns the real parent type
	 *
	 * @param	context		Context of the application
	 *
	 * @return	string		Real context
	 */
	public static function getParentType($context)
	{
		// If aliases are empty
		if ( !is_array(self::$aliases) ) {
			// Split to pairs
			$pairs = explode( ';', JComponentHelper::getParams('com_docstation')->get('parent_type_aliases') );
			// Split pairs
			self::$aliases = array();
			foreach($pairs as $pair) {
				$a = explode( '=', $pair );
				if ( sizeof($a) > 1 ) {
					self::$aliases[ trim($a[0]) ] = trim($a[1]);
				}
			}
		}
		
		return isset(self::$aliases[$context]) ? self::$aliases[$context] : $context;
	}

	/**
	 * This method returns current context from input
	 * In Joomla context consist from option.view.id, but in some extension this variables may store differently
	 *
	 * @return	list(option, view, id)
	 */
	public static function getContext()
	{
		$input = JFactory::getApplication()->input;

		/** @var \Joomla\Registry\Registry $context_vars */
		$context_vars = new JRegistry;
		$context_vars->loadString(JComponentHelper::getParams('com_docstation')->get('parent_context_vars'));

		$option = $input->get('option');

		$view_alias = $context_vars->get($option.'.view', 'view');
		$view = $input->get($view_alias);

		$id_alias = $context_vars->exists($option.'.id.'.$view) ? $context_vars->get($option.'.id.'.$view) : $context_vars->get($option.'.id._default', 'id');
		if ( is_object($id_alias) )
		{
			$raw_id = $input->get($id_alias->name, 0, 'array');
			switch($id_alias->type)
			{
				case 'explode':
					if ( is_array($raw_id) && !empty($raw_id) ) $raw_id = $raw_id[0];
					if ( !is_string($raw_id) ) break;

					$index = (int)$id_alias->index;
					$parts = explode($id_alias->delimiter, $raw_id);

					if ( !$parts || $index > count($parts) - 1) break;

					$id = $parts[$index];
					break;

				case 'array':
					if ( empty($raw_id) || !is_array($raw_id) ) break;

					$index = (int)$id_alias->index;

					if ( $index > count($raw_id) - 1) break;

					$id = $raw_id[$index];
					break;

				default:
					$id = 0;
					break;
			}
		}
		else
		{
			$id = $input->get($id_alias, 0);
		}

		return array($option, $view, (int)$id);
	}

	/**
	 * This method returns the size converted to Kb or Mb
	 *
	 * @param	size_bytes	Size in bytes
	 */
	public static function getSize( $size_bytes )
	{
		$size = $size_bytes / 1024.0;
		if ( $size < 1024.0 ) {
			return ceil( $size ).'&nbsp;Kb';
		}
		$size = $size / 1024.0;
		$string = "$size";
		$dot = strpos( $string, '.' );
		if ( $dot === false ) {
			return $string.'&nbsp;Mb';
		}
		return substr( $string, 0, $dot + 2 ).'&nbsp;Mb';
	}

	/**
	 * This method returns the direct link (url) to the file
	 *
	 * @param	Object	Item object
	 */
	public static function getDirectLink( $document )
	{
		return JUri::base() .DIR_SEP. DS_ROOT .DIR_SEP. $document->parent_type .DIR_SEP. $document->parent_id .DIR_SEP. $document->file_name;
	}

	/**
	 * This method returns table of the attachment's parent
	 *
	 * @param	string		Content type alias
	 */
	public static function getAttachmentParentTable( $alias )
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		
		$query->select( '*' )->from( '#__content_types' )->where( 'type_alias = '. $db->quote($alias, true) );
		
		$db->setQuery( $query );
		
		$table = $db->loadObject();
		
		if ( $table )
		{
			$table->table = new JRegistry( $table->table );
			$table->field_mappings = new JRegistry( $table->field_mappings );
			
			return $table;
		}
		
		return false;
	}

	/**
	 * This method returns attachment's parent object
	 *
	 * @param	int			Parent id
	 * @param	Object		Content type table info
	 */
	public static function getAttachmentParent( $id, $table )
	{
		$table_name = $table->table->get( 'special' )->dbtable;
		$fields = $table->field_mappings->get( 'common' );
		
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		
		// Select the required fields from the table.
		$query->select( "$fields->core_title AS core_title,
					$fields->core_content_item_id AS core_content_item_id,
					$fields->core_alias AS core_alias,
					$fields->core_catid AS core_catid,
					$fields->core_language AS core_language
			" )
			->from( $table_name )
			->where( $fields->core_content_item_id.' = '. (int) $id );
		
		$db->setQuery( $query );
		
		return $db->loadObject();
	}

	/**
	 * Return DocStation states
	 *
	 * @param   string  $state  The name of the state
	 *
	 * @return  string  State value
	 */
	public static function getState($state)
	{
		return isset(self::$states[$state]) ? self::$states[$state] : '';
	}

	/**
	 * Set DocStation states
	 *
	 * @param   string  $state  The name of the state
	 * @param   string  $value  The value of the state
	 */
	public static function setState($state, $value)
	{
		self::$states[$state] = $value;
	}
	
	/**
	 * Validate the file extension
	 *
	 * @param   string  $file  The name of the file [not full path]
	 *
	 * @return  string  Valid file extension or false
	 */
	public static function checkExt($file)
	{
		$pos = strrpos( $file, '.' );
		
		if ( $pos === false ) {
			self::setError( JText::_('COM_DOCSTATION_ERROR_INVALID_EXTENSION') );
			return false;
		}
		
		$ext = substr( $file, $pos + 1 );

		// Replace unwanted characters
		$valid = preg_replace( '#[^A-Za-z0-9\_]#', '', $ext );
		
		if ( $ext != $valid ) {
			self::setError( JText::sprintf('COM_DOCSTATION_ERROR_INVALID_EXTENSION', htmlspecialchars($ext)) );
			return false;
		}

		if ( in_array($valid, array('php', 'asp', 'exe', 'bat', 'cgi')) ) {
			self::setError( JText::sprintf('COM_DOCSTATION_ERROR_FORBIDDEN_EXTENSION', htmlspecialchars($valid)) );
			return false;
		}
		
		return $valid;
	}
	
	/**
	 * Makes file name safe to use
	 *
	 * @param   string  $file  The name of the file [not full path]
	 *
	 * @return  string  The sanitised string
	 */
	public static function makeFileSafe($file)
	{
		$pos = strrpos( $file, '.' );
		$ext = substr( $file, $pos + 1 );
		$file = substr( $file, 0, $pos );
		
		$lang = JFactory::getLanguage();
		$file = $lang->transliterate($file);

		// Trim white spaces at beginning and end of alias and make lowercase
		$file = trim( strtolower($file) );
		
		// Remove any '-' and white spaces
		$file = str_replace(array('-', ' '), '_', $file);

		// Replace unwanted characters
		$regex = array( '#[^A-Za-z0-9\.\_]#', '#^\.#' );
		$file = preg_replace( $regex, '', $file );
//		$file = preg_replace( '#(\.){2,}#', '.', $file );
		
		if ( empty($file) ) $file = time();
		
		$file .= '.'.$ext;
		
		// Limit the length of the file name
		$file = self::limitFileName( $file );
		
		return $file;
	}

	/**
	 * This method returns html safe string
	 */
	public static function makeHtmlSafe($string)
	{
		return htmlspecialchars( $string );
	}
	
	/**
	 * Copy file from category to category
	 */
	public static function copyFile( $extension, $cat_from, $cat_to, $file_name )
	{
		// Convert category id
		$cat_from = intval( $cat_from );
		$cat_to = intval( $cat_to );
		
		// Create path to new location
		$path = self::createPath( $extension, $cat_to );
		if ( $path === false ) {
			self::setError( JText::_( 'COM_DOCSTATION_ERROR_FAIL_CREATE_PATH' ) );
			return false;
		}
		
		$src = JPATH_SITE .DIR_SEP. DS_ROOT .DIR_SEP. $extension .DIR_SEP. $category .DIR_SEP. $file_name;
		$dest = $path .DIR_SEP. $file_name;

		// If this name already exists
		if ( JFile::exists($dest) ) {
			$file_name = self::changeDuplicateName( $file_name );
			$dest = $path .DIR_SEP. $file_name;
		}
		
		// Copy file
		if ( !JFile::copy($src, $dest) ) {
			self::setError( JText::_('COM_DOCSTATION_ERROR_FAIL_COPY_FILE') );
			return false;
		}
		
		return $file_name;
	}
	
	/**
	 * Move file from category to category
	 */
	public static function moveFile( $extension, $cat_from, $cat_to, $file_name )
	{
		// Convert category id
		$cat_from = intval( $cat_from );
		$cat_to = intval( $cat_to );
		
		// Create path to new location
		$path = self::createPath( $extension, $cat_to );
		if ( $path === false ) {
			self::setError( JText::_( 'COM_DOCSTATION_ERROR_FAIL_CREATE_PATH' ) );
			return false;
		}
		
		$src = JPATH_SITE .DIR_SEP. DS_ROOT .DIR_SEP. $extension .DIR_SEP. $cat_from .DIR_SEP. $file_name;
		$dest = $path .DIR_SEP. $file_name;
		
		// If this name already exists
		if ( JFile::exists($dest) ) {
			$file_name = self::changeDuplicateName( $file_name );
			$dest = $path .DIR_SEP. $file_name;
		}
		
		// Copy file
		if ( !JFile::move($src, $dest) ) {
			self::setError( JText::_('COM_DOCSTATION_ERROR_FAIL_MOVE_FILE') );
			return false;
		}
		
		return $file_name;
	}

	/**
	 * Upload file from tmp folder to category
	 */
	public static function uploadFile( $from_path, $extension, $category, $file_name )
	{
		// Convert category id
		$category = intval( $category );
		
		// Create path to new location
		$path = self::createPath( $extension, $category );
		if ( $path === false ) {
			self::setError( JText::_( 'COM_DOCSTATION_ERROR_FAIL_CREATE_PATH' ) );
			return false;
		}

		// Check file extension
		if ( self::checkExt( $file_name ) === false ) {
			// Detail error reports inside checkExt()
			return false;
		}

		// Make file name safe
		$file_name = self::makeFileSafe( $file_name );

		// If this name already exists
		if ( JFile::exists($path.DIR_SEP.$file_name) ) {
			$file_name = self::changeDuplicateName( $file_name );
		}
		
		// Copy file
		if ( !JFile::upload($from_path, $path.DIR_SEP.$file_name) ) {
			self::setError( JText::_('COM_DOCSTATION_ERROR_FAIL_MOVE_UPLOADED_FILE') );
			return false;
		}
		
		return $file_name;
	}

	/**
	 * Delete file
	 */
	public static function deleteFile( $extension, $category, $file_name )
	{
		// Convert category id
		$category = intval( $category );
		
		$path = JPATH_SITE .DIR_SEP. DS_ROOT .DIR_SEP. $extension .DIR_SEP. $category .DIR_SEP. $file_name;
		
		// Delete file
		if ( !JFile::delete($path) ) {
			return false;
		}
		
		return true;
	}

	/**
	 * Delete category folder
	 */
	public static function deleteCategory( $extension, $category )
	{
		// Convert category id
		$category = intval( $category );
		
		$path = JPATH_SITE .DIR_SEP. DS_ROOT .DIR_SEP. $extension .DIR_SEP. $category;
		
		// Delete folder
		if ( JFolder::exists($path) ) {
			if ( !JFolder::delete($path) ) {
				return false;
			}
		}
		
		return true;
	}

	/**
	 * Create path
	 */
	public static function createPath( $extension, $category )
	{
		$root = JPATH_SITE .DIR_SEP. DS_ROOT;
		$section = $root .DIR_SEP. $extension;
		$path = $section .DIR_SEP. $category;
		
		//Check if directory not exist
		if ( !JFolder::exists($path) ) {
			if ( !JFolder::exists($root) )
			{
				if ( !JFolder::create($root) ) {
					return false;
				}
			}
			if ( !JFolder::exists($section) )
			{
				if ( !JFolder::create($section) ) {
					return false;
				}
			}
			if ( !JFolder::create($path) ) {
				return false;
			}
		}
		
		return $path;
	}
	
	/**
	 * Change duplicate name
	 */
	public static function changeDuplicateName( $file_name )
	{
		$max_name = JComponentHelper::getParams('com_docstation')->get( 'max_name_length', 80 );
		// Get uniq suffix
		$suffix = '_' . time();
		// Limit the length of the file name
		$file_name = self::limitFileName( $file_name, $max_name - strlen($suffix) );
		// Get dot position
		$dot = strrpos( $file_name, '.' );
		if ( $dot === false ) {
			$dot = strlen( $file_name ) - 1;
		}
		// Insert suffix to the file name
		$file_name = substr_replace( $file_name, $suffix, $dot, 0 );

		return $file_name;
	}
	
	/**
	 * Limit file name
	 */
	public static function limitFileName( $file_name, $limit = 0 )
	{
		$params = JComponentHelper::getParams('com_docstation');
		
		// Default limit
		if ( $limit == 0 ) {
			$limit = $params->get( 'max_name_length', 80 );
		}
		
		// Limit the length of the file name
		if ( ($name_len = strlen($file_name)) > $limit )
		{
			// Get file extension
			$ext = JFile::getExt( $file_name );
			$ext_len = strlen($ext);
			$ext_len_max = $params->get( 'max_ext_length', 20 );
			
			// Remove extension
			$file_name = substr( $file_name, 0, $name_len - $ext_len - 1 );
			
			// If extension is to long, then just cut it
			if ( $ext_len > $ext_len_max ) {
				$ext = substr( $ext, 0, $ext_len_max );
				$ext_len = $ext_len_max;
			}
			
			// Generate new file name
			$file_name = substr( $file_name, 0, $limit - $ext_len ) .'.'. $ext;
		}
		
		return $file_name;
	}
	
	/**
	 * Returns all occured errors, and clear errors list
	 */
	public static function getErrors()
	{
		$errors = implode( '</br>', self::$errors );
		self::$errors = array();
		return $errors;
	}
	
	/**
	 * Add an error to the list
	 */
	public static function setError($error)
	{
		self::$errors[] = $error;
		// Logging
		JComponentHelper::getParams('com_docstation')->get( 'log' ) ? self::log( $error ) : null;
	}
	
	/**
	 * Log
	 */
	public static function log( $text ) {
		$log_path = JPATH_SITE .DS. 'logs' .DS. 'docstation.php';
		$date = JFile::exists($log_path) ? date('D, d M Y H:i:s') : "<?php die('Forbidden.'); ?>\r\n". date('D, d M Y H:i:s');
		$log = fopen($log_path, "a");
		if ( $log !== false )
			fwrite( $log, $date .": ". $text ."\n" );
	}
}