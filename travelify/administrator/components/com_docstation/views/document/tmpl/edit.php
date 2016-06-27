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

if ( intval($this->item->id) == 0 )
{
	$this->form->setValue( 'parent_type', null, 'com_docstation' );
}
else
{
	$this->form->setValue( 'upload', null, $this->item->file_name );
}
?>
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if (task == 'document.cancel' || document.formvalidator.isValid(document.id('item-form')))
		{
			<?php echo $this->form->getField('description')->save();
			// Add task to action field to prevent it lost due to too big POST size ?>
			var form = document.getElementById('item-form');
			form.action += (form.action.indexOf('?') > -1 ? '&' : '?') + 'task=' + task;
			Joomla.submitform(task, form);
		}
	}
</script>

<form action="<?php echo JRoute::_('index.php?option=com_docstation&layout=edit&id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="item-form" class="form-validate" enctype="multipart/form-data">

	<div class="form-inline form-inline-header">
		<?php echo $this->form->getControlGroup('title'); ?>
		<?php echo $this->form->getControlGroup('upload'); ?>
		<?php echo $this->form->getControlGroup('alias'); ?>
	</div>

	<div class="form-horizontal">

		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_DOCSTATION_FIELDSET_DETAILS', true)); ?>
		<div class="row-fluid">
			<div class="span9">
				<fieldset class="adminform">
					<?php echo $this->form->getInput('description'); ?>
				</fieldset>
			</div>
			<div class="span3 form-vertical">
				<?php foreach ($this->form->getFieldset('main') as $field) : ?>
					<?php echo $field->getControlGroup(); ?>
				<?php endforeach; ?>
			</div>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>
		
		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'publishing', JText::_('COM_DOCSTATION_FIELDSET_OPTIONS', true)); ?>
		<div class="row-fluid form-horizontal-desktop">
		<?php
			$i = 0;
			$column = array('', '', '');
			$count = count( $attribs = $this->form->getFieldset('attribs') );
			foreach ($attribs as $field) {
				if ( $field->hidden )
					$column[2] .= $field->getControlGroup();
				else
					$column[$i++ % 2] .= $field->getControlGroup();
			}
		?>
			<div class="span6">
				<?php echo $column[0]; ?>
			</div>
			<div class="span6">
				<?php echo $column[1].$column[2]; ?>
			</div>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>
		
		<?php echo JHtml::_('bootstrap.endTabSet'); ?>
	</div>
	<div>
		<input type="hidden" name="task" value="document.edit" />
		<?php echo JHtml::_('form.token'); ?>
	</div>
</form>
