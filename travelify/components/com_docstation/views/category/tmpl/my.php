<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');
JHtml::_('bootstrap.tooltip');
JHtml::_('script', 'com_docstation/docstation.js', true, true);

// Add main category to the list
if ( $this->category )
	$this->children[ $this->category->id ] = $this->category;

$group = $this->params->get('group_categories', 1);
$doc_page = $this->params->def('show_document_page', 1);
$return_page = base64_encode( JUri::getInstance() );

?>
<div class="docstation-docs<?php echo $this->pageclass_sfx;?>">
	<?php if ($this->params->get('show_page_heading', 1)) : ?>
		<div class="page-header">
			<h1> <?php echo $this->escape($this->params->get('page_heading')); ?> </h1>
		</div>
	<?php endif; ?>

	<?php if ( $this->category && ($this->params->get('show_category_title', 1) or $this->params->get('page_subheading')) ) : ?>
		<h2> <?php echo $this->escape($this->params->get('page_subheading')); ?>
			<?php if ($this->params->get('show_category_title')) : ?>
				<span class="subheading-category"><?php echo $this->category->title; ?></span>
			<?php endif; ?>
		</h2>
	<?php endif; ?>

	<?php /*
	<fieldset class="radio btn-group">
		<input type="radio" name="jform[filter][published]" value="1">
		<label class="btn active btn-success">Documents</label>
		<input type="radio" name="jform[filter][published]" value="0">
		<label class="btn">Attachments</label>
		<input type="radio" name="jform[filter][published]" value="2">
		<label class="btn">Archive</label>
		<input type="radio" name="jform[filter][published]" value="3">
		<label class="btn">Trash</label>
	</fieldset>
	*/ ?>

	<?php if ( !count($this->items) ) { ?>
	
		<div class="alert alert-no-items">
			<?php echo JText::_('COM_DOCSTATION_NO_MATCHING_RESULTS'); ?>
		</div>
		
	<?php } else { ?>
	
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if ( task == 'category.delete' )
		{
			if ( confirm('Delete document?') )
				Joomla.submitform(task, document.getElementById('adminForm'));
		}
	}
	submitbutton = Joomla.submitbutton;
</script>
	
<form action="<?php echo htmlspecialchars(JUri::getInstance()->toString()); ?>" method="post" name="adminForm" id="adminForm" class="form-inline">
	
	<?php $cur_cat = 0; $first = true;
		foreach ($this->items as $i => $item) {
			// Title
			$text = $this->escape( $item->title );
			$title = '<strong>' . $text . ' (' . DocStationHelper::getSize($item->file_size) . ')</strong>';
			if ( $item->description )
			{
				$title .= '<br/>' . $this->escape( $item->description );
			}
			// Class
			$file_ext = substr( $item->file_name, strrpos($item->file_name, '.') + 1 );
			// Link
			$link = JRoute::_( DocStationHelperRoute::getDocumentRoute( "$item->id:$item->alias", "$item->parent_id.$item->parent_type", $item->language, $doc_page ) );
	
			// Sub categories
			if ( ( $group || $first ) && $cur_cat != $item->parent_id )
			{
	?>

	<?php if ( $cur_cat ) : ?>
			</tbody>
		</table>

		<div style="text-align: right;">
			<?php if ( $this->children[$cur_cat]->params->get('access-create') ) {
				echo JHtml::_('icon.create', $cur_cat);
			} ?>
		</div>
	<?php endif; ?>

	<?php if ( $group ) : ?>
		<h3><?php echo $this->escape( $this->children[$item->parent_id]->title ); ?></h3>
	<?php endif; ?>

		<table class="docstation-category<?php echo $this->pageclass_sfx;?> table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th><?php echo JText::_('JGLOBAL_TITLE'); ?></th>
					<th><?php echo JText::_('COM_DOCSTATION_DOCUMENT_HITS'); ?></th>
					<th><?php echo JText::_('COM_DOCSTATION_EDIT_DOCUMENT'); ?></th>
				</tr>
			</thead>
			<tbody>
	
	<?php
				$cur_cat = $item->parent_id;
				$first = false;
			} ?>
		
			<tr class="docstation-row">
				<td>
					<a class="hasTooltip docstation-file ds-<?php echo $file_ext; ?>" title="<?php echo $title; ?>" href="<?php echo $link; ?>">
						<?php echo $text; ?></a>
					<div style="display: none;">
						<?php echo JHtml::_('grid.id', $i, $item->id); ?>
					</div>
				</td>
				<td class="list-hits">
					<span class="badge badge-info">
						<?php echo JText::sprintf('COM_DOCSTATION_DOCUMENT_HITS_COUNT', $item->hits); ?>
					</span>
				</td>
				<td class="list-edit">
					<?php if ( $item->params->get('access-edit') ) : ?>
						<?php echo JHtml::_('icon.edit', $item); ?>
					<?php endif; ?>
					<?php if ( $item->params->get('access-delete') ) : ?>
						<?php echo JHtml::_('icon.delete', $item, $i, 'category'); ?>
					<?php endif; ?>
				</td>
			</tr>
			
	<?php } ?>
	
			</tbody>
		</table>

		<div style="text-align: right;">
			<?php if ( $cur_cat && $this->children[$cur_cat]->params->get('access-create') ) {
				echo JHtml::_('icon.create', $cur_cat);
			} ?>
		</div>

	<?php if (($this->params->def('show_pagination', 1) == 1 || ($this->params->get('show_pagination') == 2)) && ($this->pagination->get('pages.total') > 1)) : ?>
		<div class="pagination">
			<?php if ($this->params->def('show_pagination_results', 1)) : ?>
				<p class="counter pull-right"> <?php echo $this->pagination->getPagesCounter(); ?> </p>
			<?php endif; ?>
			<?php echo $this->pagination->getPagesLinks(); ?>
		</div>
	<?php endif; ?>
	
	<input type="hidden" id="task" name="task" value ="">
	<input type="hidden" id="boxchecked" name="boxchecked" value ="">
	<input type="hidden" name="return" value="<?php echo $return_page; ?>" />
	<?php echo JHtml::_('form.token'); ?>
</form>

	<?php } ?>

</div>