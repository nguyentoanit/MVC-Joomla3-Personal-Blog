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

JHtml::_('behavior.formvalidation');
JHtml::_('behavior.keepalive');
JHtml::_('formbehavior.chosen', 'select');

if ( $exist = (intval($this->item->id) != 0) )
{
	$this->form->setValue('upload', null, $this->item->file_name);
	
	// Hide 'parent_id' for attachments
	if ( $this->item->parent_type != 'com_docstation' )
		$this->form->setFieldAttribute('parent_id', 'type', 'hidden');
}
else
{
	$this->form->setValue('parent_type', null, 'com_docstation');
}
?>
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if (task == 'upload.cancel' || document.formvalidator.isValid(document.id('item-form')))
		{
			<?php echo $this->form->getField('description')->save(); ?>
			Joomla.submitform(task, document.getElementById('item-form'));
		}
	}
</script>

<div style="margin-bottom: 15px;">
	<button class="btn btn-primary" type="button" onclick="Joomla.submitbutton('upload.save')">
		<span class="icon-ok"></span>&nbsp;<?php echo JText::_('JSAVE') ?></button>
	<button class="btn" type="button" onclick="Joomla.submitbutton('upload.cancel')">
		<span class="icon-cancel"></span>&nbsp;<?php echo JText::_( $exist ? 'COM_DOCSTATION_CLOSE' : 'JCANCEL') ?></button>
</div>
			
<form action="<?php echo JRoute::_('index.php?option=com_docstation&layout=edit&id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="item-form" class="form-validate" enctype="multipart/form-data">

	<div class="form-horizontal">

		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_DOCSTATION_FIELDSET_DETAILS', true)); ?>
		<div class="row-fluid">
			<fieldset class="adminform">
				<?php echo $this->form->getControlGroup('title'); ?>
				<?php echo $this->form->getControlGroup('upload'); ?>
				<?php echo $this->form->getControlGroup('alias'); ?>
				<?php echo $this->form->getInput('description'); ?>
			</fieldset>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>
		
		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'publishing', JText::_('COM_DOCSTATION_FIELDSET_PUBLISHING', true)); ?>
		<div class="row-fluid form-horizontal-desktop">
			<?php foreach ($this->form->getFieldset('main') as $field) : ?>
				<?php echo $field->getControlGroup(); ?>
			<?php endforeach; ?>
			<?php foreach ($this->form->getFieldset('attribs') as $field) : ?>
				<?php echo $field->getControlGroup(); ?>
			<?php endforeach; ?>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>
		
		<?php echo JHtml::_('bootstrap.endTabSet'); ?>
	</div>
	<div>
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="return" value="<?php echo $this->return_page; ?>" />
		<?php echo JHtml::_('form.token'); ?>
	</div>
</form>
