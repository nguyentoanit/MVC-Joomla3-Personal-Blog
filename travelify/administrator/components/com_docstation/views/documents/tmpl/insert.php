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

$user		= JFactory::getUser();
$userId		= $user->get('id');
$listOrder	= $this->escape($this->state->get('list.ordering'));
$listDirn	= $this->escape($this->state->get('list.direction'));
?>
<script type="text/javascript">
	Joomla.orderTable = function()
	{
		table = document.getElementById("sortTable");
		direction = document.getElementById("directionTable");
		order = table.options[table.selectedIndex].value;
		if (order != '<?php echo $listOrder; ?>')
		{
			dirn = 'asc';
		}
		else
		{
			dirn = direction.options[direction.selectedIndex].value;
		}
		Joomla.tableOrdering(order, dirn, '');
	}
</script>

<form action="<?php echo JRoute::_('index.php?option=com_docstation&view=documents'); ?>" method="post" name="adminForm" id="adminForm">
	<div id="j-main-container" class="span12">
		<?php
		// Search tools bar
		echo JLayoutHelper::render('joomla.searchtools.default', array('view' => $this));
	
		if ( empty($this->items) ) { ?>
			<div class="alert alert-no-items" style="margin-top: 10px;">
				<?php echo JText::_('COM_DOCSTATION_NO_MATCHING_RESULTS'); ?>
			</div>
		<?php } else { ?>
			<table class="table table-striped" id="articleList">
				<thead>
					<tr>
						<th width="1%" style="min-width:55px" class="nowrap center">
							<?php echo JHtml::_('searchtools.sort', 'JSTATUS', 'a.state', $listDirn, $listOrder); ?>
						</th>
						<th>
							<?php echo JHtml::_('searchtools.sort', 'JGLOBAL_TITLE', 'a.title', $listDirn, $listOrder); ?>
						</th>
						<th width="10%" class="nowrap hidden-phone">
							<?php echo JHtml::_('searchtools.sort', 'JCATEGORY', 'a.parent_id', $listDirn, $listOrder); ?>
						</th>
						<th width="10%" class="nowrap hidden-phone">
							<?php echo JHtml::_('searchtools.sort',  'JGRID_HEADING_ACCESS', 'a.access', $listDirn, $listOrder); ?>
						</th>
						<th width="10%" class="nowrap hidden-phone">
							<?php echo JHtml::_('searchtools.sort',  'JAUTHOR', 'a.created_by', $listDirn, $listOrder); ?>
						</th>
						<th width="5%" class="nowrap hidden-phone">
							<?php echo JHtml::_('searchtools.sort', 'JGRID_HEADING_LANGUAGE', 'language', $listDirn, $listOrder); ?>
						</th>
						<th width="10%" class="nowrap hidden-phone">
							<?php echo JHtml::_('searchtools.sort', 'JDATE', 'a.created', $listDirn, $listOrder); ?>
						</th>
						<th width="1%" class="nowrap hidden-phone">
							<?php echo JHtml::_('searchtools.sort', 'JGRID_HEADING_ID', 'a.id', $listDirn, $listOrder); ?>
						</th>
					</tr>
				</thead>
				<tbody>
				<?php foreach($this->items as $i => $item):
					$canEdit	= $user->authorise('core.edit',			'com_docstation.document.'.$item->id);
					$canEditOwn	= $user->authorise('core.edit.own',		'com_docstation.document.'.$item->id) && $item->created_by == $userId;
					$i_id = $item->id;
					$i_title = $this->escape($item->title);
					$i_fname = substr( $item->file_name, strrpos($item->file_name, '.') + 1 );
					?>
					<tr class="row<?php echo $i % 2; ?>" sortable-group-id="<?php echo $item->parent_type.'-'.$item->parent_id; ?>">
						<td class="center">
							<div class="btn-group">
								<?php echo JHtml::_('jgrid.published', $item->published, $i, 'documents.', false, 'cb', $item->publish_up, $item->publish_down); ?>
							</div>
						</td>
						<td class="has-context">
							<div class="pull-left">
								<?php if ($canEdit || $canEditOwn) : ?>
									<a href="javascript:void(0);" title="<?php echo JText::_('COM_DOCSTATION_ATTACHMENT_INSERT'); ?>"
										onclick="window.parent.DocStation.Editor.Insert(<?php
											echo "'$i_id', '$i_title', '$i_fname'";
										?>); window.parent.SqueezeBox.close();">
										<?php echo $this->escape($item->title); ?></a>
								<?php else : ?>
									<span><?php echo $this->escape($item->title); ?></span>
								<?php endif; ?>
							</div>
						</td>
						<td class="small hidden-phone">
							<?php echo $this->escape($item->category_title); ?>
						</td>
						<td class="small hidden-phone">
							<?php echo $this->escape($item->access_level); ?>
						</td>
						<td class="small hidden-phone">
							<?php echo $this->escape($item->author_name); ?>
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
						<td class="center hidden-phone">
							<?php echo (int) $item->id; ?>
						</td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
		<?php } ?>
		<?php echo $this->pagination->getListFooter(); ?>
		<?php //Load the batch processing form. ?>
		<?php echo $this->loadTemplate('batch'); ?>
		
		<div>
			<input type="hidden" name="task" value="" />
			<input type="hidden" name="tmpl" value="component" />
			<input type="hidden" name="layout" value="insert" />
			<?php echo JHtml::_('form.token'); ?>
		</div>
	</div>
</form>