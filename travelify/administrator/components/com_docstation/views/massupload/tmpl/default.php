<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access to this file
defined('_JEXEC') or die('Restricted Access');
 
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.multiselect');
JHtml::_('formbehavior.chosen', 'select');

?>
<div>
	<div id="j-sidebar-container" class="span2">
		<?php echo $this->sidebar; ?>
	</div>
	<div id="j-main-container" class="row-fluid">
		<div class="span7">
			<div id="ds-uploader" style="min-height: 300px;">
				<div class="form-inline form-inline-header">
					<?php foreach ($this->form->getFieldset('base') as $field) : ?>
						<?php echo $field->getControlGroup(); ?>
					<?php endforeach; ?>
				</div>
				<div id="ds-uploader-btn" class="btn" title="<?php echo JText::_('COM_DOCSTATION_SELECT_FILES_TIP'); ?>" onclick="jQuery('#ds-uploader-file').click();">
					<i class="icon-upload"></i> <?php echo JText::_('COM_DOCSTATION_SELECT_FILES'); ?>
				</div>
				<input id="ds-uploader-file" type="file" multiple style="display: none;"/>
				<div id="ds-uploader-progress"></div>
			</div>
		</div>
		<div class="span3">
			<?php foreach ($this->form->getFieldset('main') as $field) : ?>
				<?php echo $field->getControlGroup(); ?>
			<?php endforeach; ?>
		</div>
	</div>
</div>
