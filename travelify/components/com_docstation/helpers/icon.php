<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

defined('_JEXEC') or die;

/**
 * DocStation Component HTML Helper
 */
abstract class JHtmlIcon
{
	/**
	 * Method to generate a link to the create document page for the given category
	 *
	 * @param   object     $category  The category information
	 * @param   array      $attribs   Optional attributes for the link
	 *
	 * @return  string  The HTML markup for the create item link
	 */
	public static function create($category, $attribs = array())
	{
		JHtml::_('bootstrap.tooltip');

		$uri = JUri::getInstance();

		$url = 'index.php?option=com_docstation&task=upload.add&return=' . base64_encode($uri) . '&id=0&parent_id=' . $category . '&layout=edit';

		$text = '<span class="icon-plus"></span>&#160;' . JText::_('JNEW') . '&#160;';

		// Add the button classes to the attribs array
		if (isset($attribs['class']))
		{
			$attribs['class'] = $attribs['class'] . ' btn btn-primary';
		}
		else
		{
			$attribs['class'] = 'btn btn-primary';
		}

		$button = JHtml::_('link', JRoute::_($url), $text, $attribs);

		$output = '<span class="hasTooltip" title="' . JHtml::tooltipText('COM_DOCSTATION_UPLOAD_DOCUMENT') . '">' . $button . '</span>';

		return $output;
	}

	/**
	 * Display an edit icon for the document.
	 *
	 * Edit access checks must be performed in the calling code.
	 *
	 * @param   object     $article  The article information
	 * @param   array      $attribs  Optional attributes for the link
	 *
	 * @return  string	The HTML for the document edit icon.
	 */
	public static function edit($document, $attribs = array())
	{
		$db   = JFactory::getDBO();
		$user = JFactory::getUser();
		$uri  = JUri::getInstance();

		JHtml::_('bootstrap.tooltip');

		// Show checked_out icon if the article is checked out by a different user
		if ( property_exists($document, 'checked_out') && property_exists($document, 'checked_out_time') && $document->checked_out > 0 && $document->checked_out != $user->get('id'))
		{
			$checkoutUser = JFactory::getUser($document->checked_out);
			$date         = JHtml::_('date', $document->checked_out_time);
			$tooltip      = JText::_('COM_DOCSTATION_CHECKED_OUT') . ' :: ' . JText::sprintf('COM_DOCSTATION_CHECKED_OUT_BY', $checkoutUser->name) . ' <br /> ' . $date;

			return '<span class="hasTooltip icon-lock tip" title="' . JHtml::tooltipText($tooltip) . '">&#160;' . JText::_('COM_DOCSTATION_CHECKED_OUT') . '&#160;</span>';
		}

		$url = 'index.php?option=com_docstation&task=upload.edit&id=' . $document->id . '&return=' . base64_encode($uri) . '&layout=edit';

		switch ( $document->published )
		{
			case -2:
				$overlib = JText::_('JTRASHED');
				$icon = 'trash';
				break;
			case 0:
				$overlib = JText::_('JUNPUBLISHED');
				$icon = 'eye-close';
				break;
			case 2:
				$overlib = JText::_('JARCHIVED');
				$icon = 'archive';
				break;
			default:
				$overlib = JText::_('JPUBLISHED');
				$icon = 'edit';
		}

		$date   = JHtml::_('date', $document->created);

		$overlib .= '&lt;br /&gt;';
		$overlib .= $date;
		$overlib .= '&lt;br /&gt;';
		$overlib .= JText::sprintf('COM_DOCSTATION_CREATED_BY', htmlspecialchars($document->author, ENT_COMPAT, 'UTF-8'));

		if (strtotime($document->publish_up) > strtotime(JFactory::getDate())
			|| ((strtotime($document->publish_down) < strtotime(JFactory::getDate())) && $document->publish_down != $db->getNullDate()))
		{
			$icon = 'eye-close';
		}
		$text = '<span class="hasTooltip icon-' . $icon . ' tip" title="' . JHtml::tooltipText(JText::_('COM_DOCSTATION_EDIT_DOCUMENT'), $overlib, 0) . '"></span>&#160;' . JText::_('JGLOBAL_EDIT') . '&#160;';

		$output = JHtml::_('link', JRoute::_($url), $text, $attribs);

		return $output;
	}

	/**
	 * Display a delete icon for the document.
	 *
	 * Delete access checks must be performed in the calling code.
	 *
	 * @param   object     $article  The article information
	 * @param   array      $attribs  Optional attributes for the link
	 *
	 * @return  string	The HTML for the document delete icon.
	 */
	public static function delete($document, $i, $controller, $attribs = array())
	{
		$user	= JFactory::getUser();

		JHtml::_('bootstrap.tooltip');

		// Show checked_out icon if the article is checked out by a different user
		if ( property_exists($document, 'checked_out') && property_exists($document, 'checked_out_time') && $document->checked_out > 0 && $document->checked_out != $user->get('id'))
		{
			return;
		}

		$text = '<span class="hasTooltip icon-delete tip" title="' . JHtml::tooltipText(JText::_('COM_DOCSTATION_DELETE_DOCUMENT')) . '"></span>&#160;' . JText::_('JACTION_DELETE') . '&#160;';
		
		$attribs['onclick'] = "listItemTask( 'cb$i', '$controller.delete' );";

		$output = JHtml::_('link', 'javascript:void(0)', $text, $attribs);

		return $output;
	}
	
	/**
	 * Method to generate a link to the download document
	 *
	 * Download access checks must be performed in the calling code.
	 *
	 * @param   object     $document  The document information
	 * @param   array      $attribs   Optional attributes for the link
	 *
	 * @return  string  The HTML markup for the create item link
	 */
	public static function download($document, $attribs = array())
	{
		JHtml::_('bootstrap.tooltip');
	
		$url = DocStationHelperRoute::getDocumentRoute( "$document->id:$document->alias",
				"$document->parent_id.$document->parent_type",
				$document->language, false );
	
		$text = '<span class="icon-download"></span>&#160;' . JText::_('COM_DOCSTATION_DOWNLOAD_DOCUMENT') . '&#160;';
	
		// Add the button classes to the attribs array
		if (isset($attribs['class']))
		{
			$attribs['class'] = $attribs['class'] . ' btn btn-primary';
		}
		else
		{
			$attribs['class'] = 'btn btn-primary';
		}
	
		$button = JHtml::_('link', JRoute::_($url), $text, $attribs);
	
		$output = '<span class="hasTooltip" title="' . JHtml::tooltipText('COM_DOCSTATION_DOWNLOAD_DOCUMENT') . '">' . $button . '</span>';
	
		return $output;
	}
	
	/**
	 * Method to generate a link to the email item page for the given article
	 *
	 * @param   object		$document	The article information
	 * @param   boolean		$icon		True to show icon
	 * @param   array		$attribs	Optional attributes for the link
	 *
	 * @return  string  The HTML markup for the email item link
	 */
	public static function email($document, $icon, $attribs = array())
	{
		require_once JPATH_SITE . '/components/com_mailto/helpers/mailto.php';
	
		$uri      = JUri::getInstance();
		$base     = $uri->toString(array('scheme', 'host', 'port'));
		$template = JFactory::getApplication()->getTemplate();
		$link     = $base . JRoute::_(
			DocStationHelperRoute::getDocumentRoute( "$document->id:$document->alias",
				"$document->parent_id.$document->parent_type",
				$document->language, true ),
			false );
		$url      = 'index.php?option=com_mailto&tmpl=component&template=' . $template . '&link=' . MailToHelper::addLink($link);
	
		$status = 'width=400,height=350,menubar=yes,resizable=yes';
	
		if ( $icon )
		{
			$text = '<span class="icon-envelope"></span> ' . JText::_('JGLOBAL_EMAIL');
		}
		else
		{
			$text = JText::_('JGLOBAL_EMAIL');
		}
	
		$attribs['title']   = JText::_('JGLOBAL_EMAIL');
		$attribs['onclick'] = "window.open(this.href,'win2','" . $status . "'); return false;";
	
		$output = JHtml::_('link', JRoute::_($url), $text, $attribs);
	
		return $output;
	}
	
	/**
	 * Method to generate a popup link to print an article
	 *
	 * @param   object		$document	The article information
	 * @param   boolean		$icon		True to show icon
	 * @param   array		$attribs	Optional attributes for the link
	 *
	 * @return  string  The HTML markup for the popup link
	 */
	public static function print_popup($document, $icon = true, $attribs = array())
	{
		$url  = DocStationHelperRoute::getDocumentRoute( "$document->id:$document->alias",
					"$document->parent_id.$document->parent_type",
					$document->language, true );
		$url .= '&tmpl=component&print=1&layout=default';

		$status = 'status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=640,height=480,directories=no,location=no';

		if ( $icon )
		{
			$text = '<span class="icon-print"></span>&#160;' . JText::_('JGLOBAL_PRINT') . '&#160;';
		}
		else
		{
			$text = JText::_('JGLOBAL_PRINT');
		}

		$attribs['title']   = JText::_('JGLOBAL_PRINT');
		$attribs['onclick'] = "window.open(this.href,'win2','" . $status . "'); return false;";
		$attribs['rel']     = 'nofollow';

		return JHtml::_('link', JRoute::_($url), $text, $attribs);
	}

	/**
	 * Method to generate a link to print an article
	 *
	 * @param   boolean    $icon   True to show icon
	 *
	 * @return  string  The HTML markup for the popup link
	 */
	public static function print_screen($icon)
	{
		if ( $icon )
		{
			$text = '<span class="icon-print"></span>&#160;' . JText::_('JGLOBAL_PRINT') . '&#160;';
		}
		else
		{
			$text = JText::_('JGLOBAL_PRINT');
		}

		return '<a href="#" onclick="window.print();return false;">' . $text . '</a>';
	}
}
