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

?>
<div class="docstation-docs<?php echo $this->pageclass_sfx;?>">
	<?php if ($this->params->get('show_page_heading', 1)) : ?>
		<div class="page-header">
			<h1> <?php echo $this->escape($this->params->get('page_heading')); ?> </h1>
		</div>
	<?php endif; ?>

	<?php if ($this->params->get('show_category_title', 1) or $this->params->get('page_subheading')) : ?>
		<h2> <?php echo $this->escape($this->params->get('page_subheading')); ?>
			<?php if ($this->params->get('show_category_title')) : ?>
				<span class="subheading-category"><?php echo $this->category->title; ?></span>
			<?php endif; ?>
		</h2>
	<?php endif; ?>

	<?php if ($this->params->get('show_tags', 1) && !empty($this->category->tags->itemTags)) : ?>
		<?php $this->category->tagLayout = new JLayoutFile('joomla.content.tags'); ?>
		<?php echo $this->category->tagLayout->render($this->category->tags->itemTags); ?>
	<?php endif; ?>

	<?php if ($this->params->get('show_description', 1) || $this->params->def('show_description_image', 1)) : ?>
		<div class="category-desc clearfix">
			<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
				<img src="<?php echo $this->category->getParams()->get('image'); ?>"/>
			<?php endif; ?>
			<?php if ($this->params->get('show_description') && $this->category->description) : ?>
				<?php echo JHtml::_('content.prepare', $this->category->description, '', 'com_content.category'); ?>
			<?php endif; ?>
		</div>
	<?php endif; ?>
	
	<div class="docstation-category<?php echo $this->pageclass_sfx;?>">
	
<?php
	$target = ($this->new_window && !$this->doc_page) ? 'target="_blank"' : '';
	$cur_cat = $this->category->id;
	foreach ($this->items as $i => $item) {
		// Title
		$size = ' (' . DocStationHelper::getSize($item->file_size) . ')';
		$text = $this->escape( $item->title ) . ($this->show_size_list ? $size : '');
		$title = '<strong>' . $this->escape( $item->title ) . ($this->show_size_hover ? $size : '') . '</strong>';
		if ( $item->description && !$this->show_desc )
		{
			$title .= '<br/>' . $this->escape( $item->description );
		}
		// Class
		$file_ext = substr( $item->file_name, strrpos($item->file_name, '.') + 1 );
		// Link
		$link = JRoute::_( DocStationHelperRoute::getDocumentRoute( "$item->id:$item->alias", "$item->parent_id.$item->parent_type", $item->language, $this->doc_page ) );

		// Sub categories
		if ( $cur_cat != $item->parent_id )
		{
			if ( $this->params->get('show_subcat_title', 1) ) {

			$access = $cur_cat == $this->category->id ? $this->category->params->get('access-create')
					: $this->children[$cur_cat]->params->get('access-create');
			if ( $access ) {
				echo JHtml::_('icon.create', $cur_cat);
			} ?>

			<h3><?php echo $this->escape( $this->children[$item->parent_id]->title ); ?></h3>
<?php
			}
			if ( $this->params->get('show_subcat_desc') ) {
?>
			<div class="subcategory-desc">
				<?php echo JHtml::_('content.prepare', $this->children[$item->parent_id]->description, '', 'com_docstation.documents'); ?>
			</div>
<?php
			}
			$cur_cat = $item->parent_id;
		} ?>
		<div class="docstation-row">
			<a class="hasTooltip docstation-file ds-<?php echo $file_ext; ?>" title="<?php echo $title; ?>" href="<?php echo $link; ?>" <?php echo $target; ?>>
				<img alt="<?php echo $file_ext; ?>" src="<?php echo DocStationHelper::getIcon($file_ext, $this->icon_size); ?>" class="docstation-icon" />
				<?php echo $text; ?>
			</a>
		<?php if ( $item->description && $this->show_desc ) { ?>
			<div class="docstation-desc"><?php echo $item->description; ?></div>
		<?php } ?>
		</div>
	<?php } ?>
	
	</div>

	<?php
	$access = $cur_cat == $this->category->id ? $this->category->params->get('access-create')
			: $this->children[$cur_cat]->params->get('access-create');
	if ( $access ) {
			echo JHtml::_('icon.create', $cur_cat);
	} ?>
	
	<?php if ( $this->state->get('subcategory.show') == 1 && !empty($this->children) ) : ?>
		<div class="cat-children">
			<?php if ($this->params->get('show_category_heading_title_text', 1) == 1) : ?>
				<h3> <?php echo JTEXT::_('JGLOBAL_SUBCATEGORIES'); ?> </h3>
			<?php endif; ?>
			<?php echo $this->loadTemplate('children'); ?> </div>
	<?php endif; ?>
	<?php if (($this->params->def('show_pagination', 1) == 1 || ($this->params->get('show_pagination') == 2)) && ($this->pagination->get('pages.total') > 1)) : ?>
		<div class="pagination">
			<?php if ($this->params->def('show_pagination_results', 1)) : ?>
				<p class="counter pull-right"> <?php echo $this->pagination->getPagesCounter(); ?> </p>
			<?php endif; ?>
			<?php echo $this->pagination->getPagesLinks(); ?> </div>
	<?php endif; ?>
</div>