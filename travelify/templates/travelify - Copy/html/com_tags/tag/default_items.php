<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_tags
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');

JHtml::_('behavior.core');
JHtml::_('formbehavior.chosen', 'select');

// Get the user object.
$user = JFactory::getUser();

// Check if user is allowed to add/edit based on tags permissions.
// Do we really have to make it so people can see unpublished tags???
$canEdit = $user->authorise('core.edit', 'com_tags');
$canCreate = $user->authorise('core.create', 'com_tags');
$canEditState = $user->authorise('core.edit.state', 'com_tags');
$items = $this->items;
$n = count($this->items);

?>

<form action="<?php echo htmlspecialchars(JUri::getInstance()->toString()); ?>" method="post" name="adminForm" id="adminForm" class="form-inline">
	<?php if ($this->params->get('show_headings') || $this->params->get('filter_field') || $this->params->get('show_pagination_limit')) : ?>
	<fieldset class="filters btn-toolbar">
		<?php if ($this->params->get('filter_field')) :?>
			<div class="btn-group">
				<label class="filter-search-lbl element-invisible" for="filter-search">
					<?php echo JText::_('COM_TAGS_TITLE_FILTER_LABEL') . '&#160;'; ?>
				</label>
				<input type="text" name="filter-search" id="filter-search" value="<?php echo $this->escape($this->state->get('list.filter')); ?>" class="inputbox" onchange="document.adminForm.submit();" title="<?php echo JText::_('COM_TAGS_FILTER_SEARCH_DESC'); ?>" placeholder="<?php echo JText::_('COM_TAGS_TITLE_FILTER_LABEL'); ?>" />
			</div>
		<?php endif; ?>
		<?php if ($this->params->get('show_pagination_limit')) : ?>
			<div class="btn-group pull-right">
				<label for="limit" class="element-invisible">
					<?php echo JText::_('JGLOBAL_DISPLAY_NUM'); ?>
				</label>
				<?php echo $this->pagination->getLimitBox(); ?>
			</div>
		<?php endif; ?>

		<input type="hidden" name="filter_order" value="" />
		<input type="hidden" name="filter_order_Dir" value="" />
		<input type="hidden" name="limitstart" value="" />
		<input type="hidden" name="task" value="" />
		<div class="clearfix"></div>
	</fieldset>
	<?php endif; ?>

	<?php if ($this->items == false || $n == 0) : ?>
		<p> <?php echo JText::_('COM_TAGS_NO_ITEMS'); ?></p>
	<?php else : ?>

	<div class="category list-striped">
		<?php foreach ($items as $i => $item) : ?>
			<?php if ($item->core_state == 0) : ?>
				<div class="system-unpublished cat-list-row<?php echo $i % 2; ?>">
			<?php else: ?>
				<section class="post-555 post type-post status-publish format-gallery has-post-thumbnail hentry category-italy category-other-destinations tag-post-formats post_format-post-format-gallery">
					<article>
						<div class="cat-list-row<?php echo $i % 2; ?> clearfix" >
							<figure class="post-featured-image">
							<!-- images -->
									<?php echo $item->event->afterDisplayTitle; ?>
								<?php $images  = json_decode($item->core_images);?>
								<?php if ($this->params->get('tag_list_show_item_image', 1) == 1 && !empty($images->image_intro)) :?>
									<a href="<?php echo JRoute::_(TagsHelperRoute::getItemRoute($item->content_item_id, $item->core_alias, $item->core_catid, $item->core_language, $item->type_alias, $item->router)); ?>">
									<img src="<?php echo htmlspecialchars($images->image_intro);?>" alt="<?php echo htmlspecialchars($images->image_intro_alt); ?>">
									</a>
								<?php endif; ?>
							</figure>
							<!--  -->
							<header class="entry-header">
								<h3 class="entry-title">
									<a href="<?php echo JRoute::_(TagsHelperRoute::getItemRoute($item->content_item_id, $item->core_alias, $item->core_catid, $item->core_language, $item->type_alias, $item->router)); ?>">
										<?php echo $this->escape($item->core_title); ?>
									</a>
								</h3>
							</header>
						<?php endif; ?>
							<div class="entry-content clearfix">
								<?php if ($this->params->get('tag_list_show_item_description', 1)) : ?>
									<?php echo $item->event->beforeDisplayContent; ?>
									<p class="tag-body">
										<?php echo JHtml::_('string.truncate', $item->core_body, $this->params->get('tag_list_item_maximum_characters')); ?>
									</p>
									<?php echo $item->event->afterDisplayContent; ?>
								<?php endif; ?>
							</div>
							<div class="entry-meta-bar clearfix">
								<div class="entry-meta">
									<div class="byline">
										<div class="author vcard">
											<a href="<?php echo $this->items['0']->author; ?>">
												<?php echo $this->items['0']->author; ?>
											</a>
										</div>
									</div>
									<div class="posted-on">
										<?php echo JHtml::_('date', $displayData['item']->publish_up, JText::_('DATE_FORMAT_LC3')); ?>
									</div>
									<div class="category">
									
<?php
	//var_dump($this);
	$db = JFactory::getDbo();
	$id=$this->items['0']->core_catid;
               $db->setQuery('SELECT cat.title FROM #__categories cat  WHERE cat.id='.$id);   
               $category_title = $db->loadResult();
                                   
               /* Printing category title*/
               if ($category_title)
               {
                   echo $category_title;         
               }    
?>
									</div>
									
								</div>
								<p class="readmore" id="tag-readmore">
								<a href="<?php echo JRoute::_(TagsHelperRoute::getItemRoute($item->content_item_id, $item->core_alias, $item->core_catid, $item->core_language, $item->type_alias, $item->router)); ?>">read more</a>
								
								</p>
							</div>
						</div>
					</article>
				</section>
				
		<?php endforeach; ?>
	</div>
	
	<?php endif; ?>
</form>
