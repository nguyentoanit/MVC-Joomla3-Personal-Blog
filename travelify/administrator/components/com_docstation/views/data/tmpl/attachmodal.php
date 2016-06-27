<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.environment.browser');
// Mozilla patch
if ( JBrowser::getInstance()->getBrowser() == 'mozilla' ) {
	JFactory::getDocument()->addScriptDeclaration("
		SqueezeBox = {
			close: function() {
				window.parent.SqueezeBox.close();
			}
		};
	");
}
?>

<div>
	<?php echo JHtml::_('bootstrap.startTabSet', 'DocAdd', array('active' => 'doc-attach')); ?>

	<?php echo JHtml::_('bootstrap.addTab', 'DocAdd', 'doc-attach', JText::_('COM_DOCSTATION_TITLE_DOCUMENT_ATTACH', true)); ?>
	<div>
		<iframe src="<?php
		echo JRoute::_('index.php?option=com_docstation&amp;view=document&amp;layout=attach&amp;tmpl=component&amp;parent_id='
		. $this->parent_id . '&amp;parent_type=' . $this->parent_type . '&amp;close_modal=1');
		?>" frameborder="0" width="100%" height="450"></iframe>
	</div>
	<?php echo JHtml::_('bootstrap.endTab'); ?>
	
	<?php echo JHtml::_('bootstrap.addTab', 'DocAdd', 'doc-insert', JText::_('COM_DOCSTATION_TITLE_DOCUMENT_INSERT', true)); ?>
		<iframe src="<?php
		echo JRoute::_('index.php?option=com_docstation&amp;view=documents&amp;layout=insert&amp;tmpl=component&amp;close_modal=1');
		?>" frameborder="0" width="100%" height="450"></iframe>
	<?php echo JHtml::_('bootstrap.endTab'); ?>
	
	<?php echo JHtml::_('bootstrap.endTabSet'); ?>
</div>