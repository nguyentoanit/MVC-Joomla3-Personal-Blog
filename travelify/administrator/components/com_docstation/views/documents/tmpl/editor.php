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

// Load message renderer
require_once JPATH_ROOT.'/libraries/joomla/document/html/renderer/message.php';

$messages	= new JDocumentRendererMessage( JFactory::getDocument() ); 
$user		= JFactory::getUser();
$userId		= $user->get('id');
$archived	= $this->state->get('filter.published') == 2 ? true : false;
$trashed	= $this->state->get('filter.published') == -2 ? true : false;
?>
<div id="ds-editor-form">
	<?php echo $messages->render(''); ?>
	<?php if ( empty($this->items) ) { ?>
		<div class="alert" style="margin: 4px 0 0 0;">
			<?php echo JText::_('COM_DOCSTATION_NO_ATTACHMENTS'); ?>
		</div>
	<?php } else { ?>
		<table class="table table-striped" id="articleList">
			<thead>
				<tr>
					<th width="5%" class="nowrap hidden-phone"></th>
					<th width="1%" style="min-width:55px" class="nowrap center">
						<?php echo JText::_('JSTATUS'); ?>
					</th>
					<th>
						<?php echo JText::_('JGLOBAL_TITLE'); ?>
					</th>
					<th width="10%" class="nowrap hidden-phone">
						<?php echo JText::_('JGRID_HEADING_ACCESS'); ?>
					</th>
					<th width="5%" class="nowrap hidden-phone">
						<?php echo JText::_('JGRID_HEADING_LANGUAGE'); ?>
					</th>
					<th width="10%" class="nowrap hidden-phone">
						<?php echo JText::_('JDATE', 'a.created'); ?>
					</th>
					<th width="10%">
						<?php echo JText::_('JGLOBAL_HITS'); ?>
					</th>
					<th width="1%" class="nowrap hidden-phone">
						<?php echo JText::_('JGRID_HEADING_ID'); ?>
					</th>
				</tr>
			</thead>
			<tbody>
			<?php foreach($this->items as $i => $item):
				$file_ext	= substr( $item->file_name, strrpos($item->file_name, '.') + 1 );
				$title		= $this->escape($item->title);
				$canEdit		= $user->authorise('core.edit',			'com_docstation');
				$canCheckin		= $user->authorise('core.manage',		'com_checkin') || $item->checked_out == $userId || $item->checked_out == 0;
				$canEditOwn		= $user->authorise('core.edit.own',		'com_docstation') && $item->created_by == $userId;
				$canChange		= $user->authorise('core.edit.state',	'com_docstation') && $canCheckin;
				$canChangeOwn	= $user->authorise('core.edit.state.own','com_docstation') && $item->created_by == $userId && $canCheckin;
				$canDelete		= $user->authorise('core.delete',		'com_docstation') && $canCheckin;
				$canDeleteOwn	= $user->authorise('core.delete.own',	'com_docstation') && $item->created_by == $userId && $canCheckin;
				?>
				<tr class="row<?php echo $i % 2; ?>" sortable-group-id="<?php echo $item->parent_type.'-'.$item->parent_id; ?>">
					<td>
						<?php if ( $item->published ) : ?>
						<a href="javascript:void(0);"
							onClick="DocStation.Editor.Insert(<?php echo "$item->id, '$title', '$file_ext'";?>);">
							<?php echo JText::_('COM_DOCSTATION_ATTACHMENT_INSERT'); ?></a>
						<?php endif; ?>
						<div style="display: none;">
							<?php echo JHtml::_('grid.id', $i, $item->id); ?>
						</div>
					</td>
					<td class="center">
						<div class="btn-group">
							<?php
							$actions = str_replace( 'hasTooltip', '', JHtml::_('jgrid.published', $item->published, $i, 'documents.', $canChange || $canChangeOwn, 'cb', $item->publish_up, $item->publish_down) );
							
							if ( $canDelete || $canDeleteOwn ) {
								// Create dropdown items
								JHtml::_('actionsdropdown.addCustomItem', JText::_('COM_DOCSTATION_DELETE'), 'trash', 'cb'.$i, 'documents.delete');
	
								// Render dropdown list
								$actions .= JHtml::_('actionsdropdown.render', $title);
							}
							
							echo str_replace( 'listItemTask', 'DocStation.Editor.Task', $actions );
							?>
						</div>
					</td>
					<td class="has-context">
						<div class="pull-left">
							<?php if ($item->checked_out) : ?>
								<?php echo	str_replace( 'listItemTask', 'DocStation.Editor.Task',
												str_replace( 'hasTooltip', '', JHtml::_('jgrid.checkedout', $i, $item->editor, $item->checked_out_time, 'documents.', $canCheckin) )
											); ?>
							<?php endif; ?>
							<?php if ($canEdit || $canEditOwn) : ?>
								<a rel="{handler: 'iframe', size: {x: 800, y: 500}}" class="modal"
									href="<?php echo JRoute::_('index.php?option=com_docstation&task=document.edit&layout=attach&close_modal=1&tmpl=component&id=' . $item->id); ?>"
									title="<?php echo JText::_('JACTION_EDIT'); ?>">
										<?php echo $title; ?></a>
							<?php else : ?>
								<span title="<?php echo JText::_('JAUTHOR').': '.$item->author_name; ?>"><?php echo $title; ?></span>
							<?php endif; ?>
						</div>
					</td>
					<td class="small hidden-phone">
						<?php echo $this->escape($item->access_level); ?>
					</td>
					<td class="small hidden-phone">
						<?php if ($item->language == '*'):?>
							<?php echo JText::alt('JALL', 'language'); ?>
						<?php else:?>
							<?php echo $item->language_title ? $this->escape($item->language_title) : JText::_('JUNDEFINED'); ?>
						<?php endif;?>
					</td>
					<td class="nowrap small hidden-phone">
						<?php echo JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC4')); ?>
					</td>
					<td class="center">
						<?php echo (int) $item->hits; ?>
					</td>
					<td class="center hidden-phone">
						<?php echo (int) $item->id; ?>
					</td>
				</tr>
			<?php endforeach; ?>
			</tbody>
		</table>
	<?php } ?>
	
	<div>
		<?php echo JHtml::_('form.token'); ?>
	</div>
</div>