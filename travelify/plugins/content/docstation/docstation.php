<?php
/**
 * @package     DocStation
 * @subpackage  plg_content_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

defined('_JEXEC') or die;

// Require helper files
JLoader::register('DocStationHelper', JPATH_ADMINISTRATOR . '/components/com_docstation/helpers/docstation.php');
JLoader::register('DocStationHelperRoute', JPATH_SITE . '/components/com_docstation/helpers/route.php');

/**
 * DocStation Content Plugin
 *
 * @package		DocStation.Plugin
 * @subpackage	Content.DocStation
 * @since		1.6
 */
class plgContentDocStation extends JPlugin
{
	/**
	 * Load the language file on instantiation.
	 *
	 * @var    boolean
	 * @since  3.1
	 */
	protected $autoloadLanguage = true;
	
	/**
	 * Content preparation plugin hook
	 * 
	 * @param srting $context
	 * @param object $row
	 * @param array $params
	 * @param int $limitstart
	 */
	public function onContentPrepare($context, &$row, &$params, $limitstart = 0)
	{
		// Prevent recursion
		if ( strncmp($context, 'com_docstation', 14) == 0 )
		{
			return true;
		}
		
		// Simple performance check to determine whether bot should process further.
		$link_replace = JString::strpos($row->text, '{docstation:') !== false;
		$docs_list = isset( $row->id ) ? (int) $row->id : 0;
		$matches = array();
		$matched_id = '';
		$added = false;
		
		if ( !$link_replace && !$docs_list )
		{
			return true;
		}

		$dsParams = JComponentHelper::getParams('com_docstation');
		$inline_size		= $dsParams->get('icon_inline_size', 32);
		$attachment_size	= $dsParams->get('icon_attachment_size', 48);
		$hide_forbidden		= !$dsParams->get('show_forbidden', true);
		$hide_used			= !$dsParams->get('show_used', true);
		$document_page		= $dsParams->get('show_document_page', 1);
		$replace_attrs		= $dsParams->get('replace_attributes', 1);
		$new_window			= $dsParams->get('open_new_window', 1) && !$document_page;
		$show_desc			= $dsParams->get('show_attachments_desc', 0);
		$show_size			= $dsParams->get('show_document_size', array(DocStationHelper::VIEW_CASE_HOVER));
		$show_size_list		= in_array(DocStationHelper::VIEW_CASE_ATTACHMENT_LIST, $show_size);
		$show_size_insert	= in_array(DocStationHelper::VIEW_CASE_INSERTED, $show_size);
		$show_size_hover	= in_array(DocStationHelper::VIEW_CASE_HOVER, $show_size);

		// Search for links that need to replace
		if ( $link_replace )
		{
			// Define the regular expression for the bot.
			$pattern = '/<a([^>]*)data-marker="\/?\{docstation:([0-9]*)\}"([^>]*)>((?:(?!<\/a).)*?)<\/a>/si';

			// Perform the search.
			preg_match_all($pattern, $row->text, $matches, PREG_SET_ORDER);
			
			// Get ID's documents
			foreach($matches as $match)
			{
				$matched_id .= $match[2].',';
			}
			// If links not found
			if ( empty($matched_id) ) {
				$link_replace = false;
			}
		}
		
		if ( !$link_replace && !$docs_list )
		{
			return true;
		}
		
		// Get documents from Database
		$db = JFactory::getDbo();
		$date = JFactory::getDate();
		$nullDate = $db->quote($db->getNullDate());
		$nowDate = $db->quote($date->toSql());
		
		$query = 'SELECT * FROM #__docstation WHERE published = 1
				AND (publish_up = ' . $nullDate . ' OR publish_up <= ' . $nowDate . ')
				AND (publish_down = ' . $nullDate . ' OR publish_down >= ' . $nowDate . ')';
		
		// Generate query for document list
		$context = DocStationHelper::getParentType( $context );
		$query_docs_list = 'parent_id = '.$docs_list.' AND parent_type = \''.$db->escape($context).'\'';
		// Generate query for link replacement
		$query_link_replace = 'id IN ('.substr($matched_id, 0, -1).')';
		
		// Compile query
		if ( $docs_list && $link_replace ) {
			$query .= "AND ( ($query_docs_list) OR $query_link_replace )";
		}
		elseif ( $docs_list ) {
			$query .= "AND $query_docs_list";
		}	
		else {
			$query .= "AND $query_link_replace";
		}
		
		// Set query
		$db->setQuery( $query );
		$docs = $db->loadObjectList('id');

		$user		= JFactory::getUser();
		$groups		= $user->getAuthorisedViewLevels();
		$dispatcher	= JEventDispatcher::getInstance();
		
		// Import content plugins
		JPluginHelper::importPlugin('content');

		foreach($docs as $doc) {
			//Check the access level. Remove documents the user shouldn't see
			$doc->forbidden = !in_array($doc->access, $groups);
			$doc->hide = $doc->forbidden && $hide_forbidden;

			// Trigger content plugins
			if ( !empty($doc->description) )
			{
				$doc->text = &$doc->description;
				$dispatcher->trigger('onContentPrepare', array('com_docstation.plugin', &$doc, &$params, 0));
			}
		}
		
		// Replace matches
		if ( $link_replace )
		{
			foreach($matches as $match)
			{
				$doc_id = $match[2];
				
				if ( isset($docs[$doc_id]) ) {
					// If access forbidden
					if ( $docs[$doc_id]->forbidden ) {
						$doc = false;
						$msg = JText::_('PLG_DOCSTATION_CONTENT_FORBIDDEN');
						$ico = 'forbidden';
					}
					else {
						$doc = $docs[$doc_id];
					}
					// Hide used documents from list
					if ( $hide_used )
						$docs[$doc_id]->hide = true;
				}
				else {
					$doc = false;
					$msg = JText::_('PLG_DOCSTATION_CONTENT_NO_FILE');
					$ico = 'no_file';
				}
								
				if ( $doc !== false )
				{
					if ( !$replace_attrs )
					{
						// Attributes
						$attr = trim($match[1].$match[3]);
						if ( empty($attr) )
						{
							$attrs = array();
						}
						else
						{
							preg_match_all("/([^\s=]+)(=\"([^\"]*)\"|=([^\s]*))?/", $attr, $att_matches, PREG_SET_ORDER);
							$attrs = array();
							foreach($att_matches as $att_match)
							{
								if ( $att_match[1] == 'href' ) continue;
								$attrs[$att_match[1]] = !isset($att_match[3]) ? '' : (isset($att_match[4]) ? $att_match[4] : $att_match[3]);
							}
						}
						
						// Add tittle to attributes
						if ( !isset($attrs['title']) )
						{
							// Title
							$size = ' (' . DocStationHelper::getSize($doc->file_size) . ')';
							$attrs['title'] = '<strong>' . DocStationHelper::makeHtmlSafe($doc->title) . ($show_size_hover ? $size : '') . '</strong>';
							if ( $doc->description ) $attrs['title'] .= '<br/>' . DocStationHelper::makeHtmlSafe( $doc->description );
						}

						// Add target if not set yet
						if ( !isset($attrs['target']) && $new_window )
						{
							$attrs['target'] = '_blank';
						}
						
						// Add class if not firbidden
						if ( !isset($attrs['class']) )
						{
							$attrs['class'] = 'hasTooltip docstation-file';
						}
						else if ( JString::strpos($attrs['class'], 'ds-no-class') === false )
						{
							if ( JString::strpos($attrs['class'], 'hasTooltip') === false )
								$attrs['class'] .= ' hasTooltip';
							if ( JString::strpos($attrs['class'], 'docstation-file') === false )
								$attrs['class'] .= ' docstation-file';
						}
						
						$attr = '';
						foreach ( $attrs as $key => $val )
						{
							$attr .= $key.'="'.$val.'" ';
						}
					}
					else
					{
						// Title
						$size = ' (' . DocStationHelper::getSize($doc->file_size) . ')';
						$title = '<strong>' . DocStationHelper::makeHtmlSafe($doc->title) . ($show_size_hover ? $size : '') . '</strong>';
						if ( $doc->description ) $title .= '<br/>' . DocStationHelper::makeHtmlSafe( $doc->description );
						$class = 'hasTooltip docstation-file';
						$attr = "title=\"$title\" class=\"$class\"";
						if ( $new_window ) $attr .= ' target="_blank"';
					}

					// Extension
					$ext = substr( $doc->file_name, strrpos($doc->file_name, '.') + 1 );
						
					// Document icon
					$img = '<img alt="'.$ext.'" src="'.DocStationHelper::getIcon($ext, $inline_size).'" class="docstation-icon" />';

					// Link
					$link = JRoute::_( DocStationHelperRoute::getDocumentRoute( "$doc->id:$doc->alias", "$doc->parent_id.$doc->parent_type", $doc->language, $document_page ) );
					
					// Replace code
					if ( empty($size) ) $size = ' (' . DocStationHelper::getSize($doc->file_size) . ')';
					$replace = '<a ' . $attr . ' href="' . $link . '">' . $img . $match[4] . ($show_size_insert ? $size : '') . '</a>';
					
					// File processed
					$added = true;
				}
				else {
					// Document icon
					$img = '<img alt="'.$msg.'" src="'.DocStationHelper::getIcon($ico, $inline_size).'" class="docstation-icon" />';
					// Replace code
					$replace = '<span class="docstation-file ds-no-file" title="'.$msg.'">'.$img.$match[4].'</span>';
				}
				$row->text = str_replace( $match[0], $replace, $row->text );
			}
		}
		
		// Generate documents list
		if ( $docs_list )
		{
			$attachments = '';
			$count = 0;
			
			// Generate documents list
			foreach($docs as $doc)
			{
				if ( $doc->parent_type != $context || $doc->parent_id != $row->id || $doc->hide )
				{
					continue;
				}
				
				// Title
				$size = ' (' . DocStationHelper::getSize($doc->file_size) . ')';
				$text = DocStationHelper::makeHtmlSafe( $doc->title ) . ($show_size_list ? $size : '');
				$title = '<strong>' . DocStationHelper::makeHtmlSafe($doc->title) . ($show_size_hover ? $size : '') . '</strong>';
				$file_ext = substr( $doc->file_name, strrpos($doc->file_name, '.') + 1 );
				$target = $new_window ? 'target="_blank"' : '';

				if ( $doc->description && !$show_desc )
				{
					$title .= '<br/>' . DocStationHelper::makeHtmlSafe( $doc->description );
				}
				
				// Link
				$link = JRoute::_( DocStationHelperRoute::getDocumentRoute( "$doc->id:$doc->alias", "$doc->parent_id.$doc->parent_type", $doc->language, $document_page ) );
				if ( !$doc->forbidden )
				{
					$attachments .= '
					<div class="docstation-row">
						<a class="hasTooltip docstation-file" title="'.$title.'" href="'.$link.'" '.$target.'>
							<img alt="'.$file_ext.'" src="'.DocStationHelper::getIcon($file_ext, $attachment_size).'" class="docstation-icon" />
							'.$text.'
						</a>';
				}
				else
				{
					$msg = JText::_('PLG_DOCSTATION_CONTENT_FORBIDDEN');
					$attachments .= '
					<div class="docstation-row">
						<span class="docstation-file ds-no-file" title="'.$msg.'">
							<img alt="'.$msg.'" src="'.DocStationHelper::getIcon('forbidden', $attachment_size).'" class="docstation-icon" />
							'.$text.'
						</span>';
				}
				
				// Insert description if needed
				if ( $doc->description && $show_desc ) {
					$attachments .= '
						<div class="docstation-desc">
							'.$doc->description.'
						</div>';
				}
				
				// Close row
				$attachments .= '
					</div>';
				
				// Count
				++$count;
			}
			
			// Append attachments
			if ( $count > 0 )
			{
				$added = true;
				$row->text .= '
			<div class="docstation-attachments">
				<h3>'.JText::_('PLG_DOCSTATION_CONTENT_ATTACHMENTS_HEADER').'</h3>
				<div class="docstation-list">
					'.$attachments.'
				</div>
			</div>';
			}
		}
		
		if ( $added )
		{
			JHtml::_('bootstrap.tooltip');
			JFactory::getDocument()->addStyleSheet('media/com_docstation/css/docstation.css');
		}

		return true;
	}

	/**
	 * This method attachs the documents to the newly created item
	 *
	 * @param	string		The context of the content passed to the plugin (added in 1.6)
	 * @param	object		A JTableContent object
	 * @param	bool		If the content is just about to be created
	 * @since	1.6
	 */
	public function onContentAfterSave($context, $article, $isNew)
	{
		// If this is not a new item - exit
		if ( !$isNew || strncmp($context, 'com_docstation', 14) == 0 )
		{
			return true;
		}
		
		// Get real context
		$context = DocStationHelper::getParentType( $context );
		
		$db = JFactory::getDbo();
		$user = JFactory::getUser();
		
		// Get unhandled documents
		$query = 'SELECT id, file_name FROM #__docstation WHERE parent_type = \''.
				$db->escape($context).'\' AND parent_id = 0 AND created_by = '.intval($user->id);
		$db->setQuery( $query );
		$docs = $db->LoadAssocList();
		
		// Check for a database error.
		if ( $db->getErrorNum() ) {
			JError::raiseWarning(500, $db->getErrorMsg());
			return false;
		}
		
		// If there is no unhandled documents
		if ( sizeof($docs) == 0 )
		{
			return true;
		}

		$update_ids = '';

		// Move documents
		foreach($docs as $doc)
		{
			// Collect id
			$update_ids .= $doc['id'].',';
			// Move file
			DocStationHelper::moveFile( $context, 0, $article->id, $doc['file_name'] );
		}
		
		// Set parent id for unhandled documents
		$query = 'UPDATE #__docstation SET parent_id = '.intval($article->id).' WHERE id IN ('.substr( $update_ids, 0, strlen($update_ids) - 1 ).')';
		$db->setQuery( $query );
		$db->query();

		// Check for a database error.
		if ( $db->getErrorNum() ) {
			JError::raiseWarning(500, $db->getErrorMsg());
			return false;
		}

		return true;
	}

	/**
	 * Don't allow categories to be deleted if they contain items or subcategories with items
	 *
	 * @param	string	The context for the content passed to the plugin.
	 * @param	object	The data relating to the content that was deleted.
	 * @return	boolean
	 * @since	1.6
	 */
	public function onContentBeforeDelete($context, $data)
	{
		// If we are deleting not a categories
		if ( $context != 'com_categories.category' || JRequest::getString('extension') != 'com_docstation' )
		{
			return true;
		}

		// Default to true
		$result = true;

		// Get table name for known core extensions
		$table = '#__docstation';
		// See if this category has any content items
		$count = $this->_countItemsInCategory($table, $data->get('id'));
		
		// Return false if db error
		if ($count === false)
		{
			$result = false;
		}
		else
		{
			// Show error if items are found in the category
			if ($count > 0 ) {
				$msg = JText::sprintf('COM_CATEGORIES_DELETE_NOT_ALLOWED', $data->get('title')) .
				JText::plural('COM_CATEGORIES_N_ITEMS_ASSIGNED', $count);
				JError::raiseWarning(403, $msg);
				$result = false;
			}
			// Check for items in any child categories (if it is a leaf, there are no child categories)
			if (!$data->isLeaf()) {
				$count = $this->_countItemsInChildren($table, $data->get('id'), $data);
				if ($count === false)
				{
					$result = false;
				}
				elseif ($count > 0)
				{
					$msg = JText::sprintf('COM_CATEGORIES_DELETE_NOT_ALLOWED', $data->get('title')) .
					JText::plural('COM_CATEGORIES_HAS_SUBCATEGORY_ITEMS', $count);
					JError::raiseWarning(403, $msg);
					$result = false;
				}
			}
		}

		return $result;
	}

	/**
	 * Delete the files attachet to deleted item
	 *
	 * @param	string	The context for the content passed to the plugin.
	 * @param	object	The data relating to the content that was deleted.
	 * @return	boolean
	 * @since	1.6
	 */
	public function onContentAfterDelete($context, $data)
	{
		// If item have no ID
		if ( !isset($data->id) )
		{
			return true;
		}
		
		// Get real context
		$context = DocStationHelper::getParentType( $context );
		
		// If deleting files directly
		if ( strncmp( $context, 'com_docstation', 14 ) == 0 )
		{
			return DocStationHelper::deleteFile( $data->parent_type, $data->parent_id, $data->file_name );
		}

		// Delete item folder from docstation storage
		DocStationHelper::deleteCategory( $context, $data->id );
		
		// Delete records from DB
		$db = JFactory::getDbo();
		$db->setQuery( 'DELETE FROM #__docstation WHERE parent_type=\''.$db->escape($context).'\' AND parent_id = ' . $data->id );
		$db->query();

		// Check for a database error.
		if ( $db->getErrorNum() )
		{
			JError::raiseWarning(500, $db->getErrorMsg());
			return false;
		}
		
		return true;
	}

	/**
	 * Get count of items in a category
	 *
	 * @param	string	table name of component table (column is catid)
	 * @param	int		id of the category to check
	 * @return	mixed	count of items found or false if db error
	 * @since	1.6
	 */
	private function _countItemsInCategory($table, $catid)
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		// Count the items in this category
		$query->select('COUNT(id)');
		$query->from($table);
		$query->where('parent_type=\'com_docstation\' AND parent_id = ' . intval($catid));
		$db->setQuery($query);
		$count = $db->loadResult();

		// Check for DB error.
		if ($error = $db->getErrorMsg())
		{
			JError::raiseWarning(500, $error);
			return false;
		}
		else {
			return $count;
		}
	}

	/**
	 * Get count of items in a category's child categories
	 *
	 * @param	string	table name of component table (column is catid)
	 * @param	int		id of the category to check
	 * @return	mixed	count of items found or false if db error
	 * @since	1.6
	 */
	private function _countItemsInChildren($table, $catid, $data)
	{
		$db = JFactory::getDbo();
		// Create subquery for list of child categories
		$childCategoryTree = $data->getTree();
		// First element in tree is the current category, so we can skip that one
		unset($childCategoryTree[0]);
		$childCategoryIds = array();
		foreach ($childCategoryTree as $node) {
			$childCategoryIds[] = $node->id;
		}

		// Make sure we only do the query if we have some categories to look in
		if (count($childCategoryIds))
		{
			// Count the items in this category
			$query = $db->getQuery(true);
			$query->select('COUNT(id)');
			$query->from($table);
			$query->where('parent_type=\'com_docstation\' AND parent_id IN (' . implode(',', $childCategoryIds) . ')');
			$db->setQuery($query);
			$count = $db->loadResult();

			// Check for DB error.
			if ($error = $db->getErrorMsg())
			{
				JError::raiseWarning(500, $error);
				return false;
			}
			else
			{
				return $count;
			}
		}
		else
		// If we didn't have any categories to check, return 0
		{
			return 0;
		}
	}
}
