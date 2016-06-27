<?php
/**
 * @package     DocStation
 * @subpackage  plg_editors-xtd_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// no direct access
defined('_JEXEC') or die;

// require helper file
JLoader::register('DocStationHelper', JPATH_ADMINISTRATOR . '/components/com_docstation/helpers/docstation.php');

/**
 * Editor Image buton
 *
 * @package		Joomla.Plugin
 * @subpackage	Editors-xtd.image
 * @since 1.5
 */
class plgButtonDocStation extends JPlugin
{
	/**
	 * Load the language file on instantiation.
	 *
	 * @var    boolean
	 * @since  3.1
	 */
	protected $autoloadLanguage = true;

	/**
	 * Constructor
	 *
	 * @access      protected
	 * @param       object  $subject The object to observe
	 * @param       array   $config  An array that holds the plugin configuration
	 * @since       1.5
	 */
	public function __construct(& $subject, $config)
	{
		parent::__construct($subject, $config);
		
		//TODO: Delete 2.5 compatibility
		if ( intval(JVERSION) < 3 ) {
			$this->loadLanguage();
		}
	}

	/**
	 * Display the button
	 *
	 * @return array A two element array of (imageName, textToInsert)
	 */
	function onDisplay($name, $asset, $author)
	{
		$document = JFactory::getDocument();
		$token = JSession::getFormToken();
		list($extension, $view, $id) = DocStationHelper::getContext();

		if ( $extension == 'com_docstation' )
		{
			return false;
		}
		
		// Add css
		JHtml::_('stylesheet', 'com_docstation/docstation.css', true, true);
		$document->addStyleDeclaration('.icon-doc-add:before {content: "\72";}');
		
		// Add script
		JHtml::_('script', 'com_docstation/docstation.js', true, true);
		$document->addScriptDeclaration("
			jQuery(document).ready( function(){
				DocStation.Lang.SELECT_FILES = '".JText::_('PLG_DOCSTATION_BUTTON_SELECT_FILES')."';
				DocStation.Lang.SELECT_FILES_TIP = '".JText::_('PLG_DOCSTATION_BUTTON_SELECT_FILES_TIP')."';
				DocStation.Editor.Init($id, '$extension.$view', '$name', '$token');
			} );
		");
			
		JHtml::_('behavior.modal');
		
		// Mozilla patch
		if ( JBrowser::getInstance()->getBrowser() == 'mozilla' )
			$handler = 'iframe';
		else
			$handler = 'ajax';
		
		$button = new JObject;
		$button->modal = true;
		$button->class = 'btn';
		$button->link = 'index.php?option=com_docstation&amp;view=data&amp;layout=attachmodal&amp;tmpl=component&amp;parent_id='
			. $id . '&amp;parent_type=' . $extension . '.' . $view;
		$button->text = JText::_('PLG_DOCSTATION_BUTTON_ATTACH_DOCUMENT');
		$button->name = 'doc-add';
		$button->options = "{handler: '$handler', size: {x: 800, y: 520}}";

		return $button;
	}
}