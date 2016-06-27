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
JHtml::_('formbehavior.chosen', 'select');

if ( $exist = (intval($this->item->id) != 0) ) {
	$this->form->setValue( 'upload', null, $this->item->file_name );
	$this->form->setFieldAttribute('parent_id', 'type', 'hidden');
}
else {
	$parent_type = JRequest::getString('parent_type');
	$parent_id = JRequest::getString('parent_id');
	if ( empty($parent_type) ) $parent_type = $this->form->getValue('parent_type');
	if ( empty($parent_id) ) $parent_id = $this->form->getValue('parent_id');
	$this->form->removeField('parent_type');
	$this->form->removeField('parent_id');
}

// Remove Tags from attachment form
$this->form->removeField('tags');

?>
<div id="j-main-container" class="span12">

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
	
	<div style="margin-bottom: 15px;">
		<button class="btn" type="button" onclick="Joomla.submitbutton('document.save')"><?php echo JText::_('JSAVE') ?></button>
		<?php if ( $exist ) : ?>
		<button class="btn" type="button" onclick="Joomla.submitbutton('document.cancel')"><?php echo JText::_('JCANCEL') ?></button>
		<?php else : ?>
		<button class="btn" type="button" onclick="window.parent.SqueezeBox.close();"><?php echo JText::_('JCANCEL') ?></button>
		<?php endif; ?>
	</div>
	
	<form action="<?php echo JRoute::_('index.php?option=com_docstation&tmpl=component&layout=attach&close_modal='
			.(int) JRequest::getString('close_modal').'&id='
			.(int) $this->item->id); ?>" method="post" name="adminForm" id="item-form" class="form-validate" enctype="multipart/form-data">
	
		<div class="form-inline form-inline-header">
			<?php echo $this->form->getControlGroup('title'); ?>
			<?php echo $this->form->getControlGroup('upload'); ?>
			<?php echo $this->form->getControlGroup('alias'); ?>
		</div>
	
		<div class="form-horizontal">
	
			<?php echo JHtml::_('bootstrap.startTabSet', 'addDocTab', array('active' => 'general')); ?>
	
			<?php echo JHtml::_('bootstrap.addTab', 'addDocTab', 'general', JText::_('COM_DOCSTATION_FIELDSET_DETAILS', true)); ?>
			<div class="row-fluid">
				<div class="span8">
					<fieldset class="adminform">
						<?php echo $this->form->getInput('description'); ?>
					</fieldset>
				</div>
				<div class="span4 form-vertical">
					<?php foreach ($this->form->getFieldset('main') as $field) : ?>
						<?php echo $field->getControlGroup(); ?>
					<?php endforeach; ?>
				</div>
			</div>
			<?php echo JHtml::_('bootstrap.endTab'); ?>
			
			<?php echo JHtml::_('bootstrap.addTab', 'addDocTab', 'publishing', JText::_('COM_DOCSTATION_FIELDSET_OPTIONS', true)); ?>
			<div class="row-fluid form-vertical">
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
			<?php if ( !$exist ) : ?>
			<input type="hidden" name="jform[parent_type]" value="<?php echo $parent_type; ?>" />
			<input type="hidden" name="jform[parent_id]" value="<?php echo $parent_id; ?>" />
			<?php endif; ?>
			<?php echo JHtml::_('form.token'); ?>
		</div>
	</form>
</div>