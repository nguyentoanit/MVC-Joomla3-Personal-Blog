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

$useDefList = ($this->params->get('show_modify_date') || $this->params->get('show_publish_date')
		|| $this->params->get('show_create_date') || $this->params->get('show_hits')
		|| $this->params->get('show_category') || $this->params->get('show_parent_category')
		|| $this->params->get('show_author'));

?>
<div class="document-page<?php echo $this->pageclass_sfx?>">
	<?php if ($this->params->get('show_page_heading', 1)) : ?>
	<div class="page-header">
		<h1> <?php echo $this->escape($this->params->get('page_heading')); ?> </h1>
	</div>
	<?php endif; ?>
	
	<?php if (!$useDefList && $this->print) : ?>
		<div id="pop-print" class="btn hidden-print">
			<?php echo JHtml::_('icon.print_screen', $this->item, $this->params); ?>
		</div>
		<div class="clearfix"> </div>
	<?php endif; ?>
	
	<?php if ( $this->params->get('show_title') ) : ?>
	<div class="page-header">
			<h2>
				<?php if ( $this->params->get('link_titles') && !empty($this->item->download_link) ) : ?>
					<a href="<?php echo $this->item->download_link; ?>" <?php if ($this->new_window) { echo 'target="_blank"'; } ?>>
						<?php echo $this->escape($this->item->title); ?>
					</a>
				<?php else : ?>
					<?php echo $this->escape($this->item->title); ?>
				<?php endif; ?>
			</h2>
		<?php if ($this->item->published == 0) : ?>
			<span class="label label-warning"><?php echo JText::_('JUNPUBLISHED'); ?></span>
		<?php endif; ?>
		<?php if (strtotime($this->item->publish_up) > strtotime(JFactory::getDate())) : ?>
			<span class="label label-warning"><?php echo JText::_('JNOTPUBLISHEDYET'); ?></span>
		<?php endif; ?>
		<?php if ((strtotime($this->item->publish_down) < strtotime(JFactory::getDate())) && $this->item->publish_down != JFactory::getDbo()->getNullDate()) : ?>
			<span class="label label-warning"><?php echo JText::_('JEXPIRED'); ?></span>
		<?php endif; ?>
	</div>
	<?php endif; ?>
	
	<?php if (!$this->print) : ?>
		<?php if ($this->item->params->get('access-edit') || $this->params->get('show_print_icon') || $this->params->get('show_email_icon')) : ?>
		<div class="btn-group pull-right">
			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"> <span class="icon-cog"></span> <span class="caret"></span> </a>
			<?php // Note the actions class is deprecated. Use dropdown-menu instead. ?>
			<ul class="dropdown-menu actions">
				<?php if ( $this->params->get('show_print_icon') ) : ?>
				<li class="print-icon"> <?php echo JHtml::_('icon.print_popup', $this->item, $this->params); ?> </li>
				<?php endif; ?>
				<?php if ( $this->params->get('show_email_icon') ) : ?>
				<li class="email-icon"> <?php echo JHtml::_('icon.email', $this->item, $this->params); ?> </li>
				<?php endif; ?>
				<?php if ( $this->item->params->get('access-edit') ) : ?>
				<li class="edit-icon"> <?php echo JHtml::_('icon.edit', $this->item, $this->params); ?> </li>
				<?php endif; ?>
			</ul>
		</div>
		<?php endif; ?>
	<?php else : ?>
		<?php if ($useDefList) : ?>
			<div id="pop-print" class="btn hidden-print">
				<?php echo JHtml::_('icon.print_screen', $this->item, $this->params); ?>
			</div>
		<?php endif; ?>
	<?php endif; ?>

	<?php if ( $useDefList ) : ?>
		<div class="article-info muted">
			<dl class="article-info">
			<dt class="article-info-term"><?php echo JText::_('COM_DOCSTATION_DOCUMENT_INFO'); ?></dt>

			<?php if ($this->params->get('show_author') && !empty($this->item->author )) : ?>
				<dd class="createdby">
					<?php if (!empty($this->item->contact_link) && $this->params->get('link_author') == true) : ?>
						<?php echo JText::sprintf('COM_DOCSTATION_CREATED_BY', JHtml::_('link', $this->item->contact_link, $this->item->author)); ?>
					<?php else: ?>
						<?php echo JText::sprintf('COM_DOCSTATION_CREATED_BY', $this->item->author); ?>
					<?php endif; ?>
				</dd>
			<?php endif; ?>
			<?php if ($this->params->get('show_category') && !empty($this->item->category_title)) : ?>
				<dd class="category-name">
					<?php
						$title = $this->escape( $this->item->category_title );
						$link = '<a href="' . JRoute::_( $this->cat_url ) . '">' . $title . '</a>';
					?>
					<?php if ($this->params->get('link_category') && $this->item->parent_id) : ?>
						<?php echo JText::sprintf($this->cat_jtext, $link); ?>
					<?php else : ?>
						<?php echo JText::sprintf($this->cat_jtext, $title); ?>
					<?php endif; ?>
				</dd>
			<?php endif; ?>

			<?php if ($this->params->get('show_publish_date')) : ?>
				<dd class="published">
					<span class="icon-calendar"></span> <?php echo (int) $this->item->publish_up == 0 ? JText::_('COM_DOCSTATION_NEVER_PUBLISHED_YET') : JText::sprintf('COM_DOCSTATION_PUBLISHED_DATE_ON', JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3'))); ?>
				</dd>
			<?php endif; ?>

			<?php if ($this->params->get('show_modify_date')) : ?>
				<dd class="modified">
					<span class="icon-calendar"></span> <?php echo JText::sprintf('COM_DOCSTATION_LAST_UPDATED', JHtml::_('date', $this->item->modified, JText::_('DATE_FORMAT_LC3'))); ?>
				</dd>
			<?php endif; ?>
			<?php if ($this->params->get('show_create_date')) : ?>
				<dd class="create">
					<span class="icon-calendar"></span> <?php echo JText::sprintf('COM_DOCSTATION_CREATED_DATE_ON', JHtml::_('date', $this->item->created, JText::_('DATE_FORMAT_LC3'))); ?>
				</dd>
			<?php endif; ?>

				<dd class="size">
					<span class="icon-file-2"></span> <?php echo JText::sprintf('COM_DOCSTATION_DOCUMENT_SIZE', DocStationHelper::getSize($this->item->file_size)); ?>
				</dd>

			<?php if ($this->params->get('show_hits')) : ?>
				<dd class="hits">
					<span class="icon-download"></span> <?php echo JText::sprintf('COM_DOCSTATION_DOCUMENT_HITS_COUNT', $this->item->hits); ?>
				</dd>
			<?php endif; ?>
			</dl>
		</div>
	<?php endif; ?>

	<?php if ($this->params->get('show_tags', 1) && !empty($this->item->tags)) : ?>
		<?php $this->item->tagLayout = new JLayoutFile('joomla.content.tags'); ?>
		<?php echo $this->item->tagLayout->render($this->item->tags->itemTags); ?>
		<br/>
	<?php endif; ?>

	<?php if ( $this->item->params->get('access-view') ):?>
		<?php echo JHtml::_('icon.download', $this->item, $this->new_window ? array('target' => '_blank') : array()); ?>
		<br/><br/>
		<?php echo $this->item->description; ?>
	<?php endif; ?>
</div>
