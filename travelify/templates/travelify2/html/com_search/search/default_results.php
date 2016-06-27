<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_search
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>

<div class="search-results<?php echo $this->pageclass_sfx; ?>">
<?php foreach ($this->results as $result) : ?>
	<section class="post-562 post type-post status-publish format-chat has-post-thumbnail hentry category-france category-other-destinations tag-post-formats post_format-post-format-chat">
		<article>
			<div class="result-title entry-header">
				<h2 class="entry-title">
					<?php //echo $this->pagination->limitstart + $result->count . '. ';?>
					<?php if ($result->href) :?>
						<a href="<?php echo JRoute::_($result->href); ?>"<?php if ($result->browsernav == 1) :?> target="_blank"<?php endif;?>>
							<?php echo $this->escape($result->title);?>
						</a>
					<?php else:?>
						<?php echo $this->escape($result->title);?>
					<?php endif; ?>
				</h2>
			</div>
			<!--
			<?php if ($result->section) : ?>
				<div class="result-category">
					<span class="small<?php echo $this->pageclass_sfx; ?>">
						(<?php echo $this->escape($result->section); ?>)
					</span>
				</div>
			<?php endif; ?>
			
			-->
			<div class="result-text entry-content clearfix">
				<p>
				<?php echo $result->text; ?>
				</p>
			</div>
			<?php if ($this->params->get('show_date')) : ?>
				<div class="result-created<?php echo $this->pageclass_sfx; ?>">
					<?php echo JText::sprintf('JGLOBAL_CREATED_DATE_ON', $result->created); ?>
				</div>
			<?php endif; ?>
		</article>
	</section>
<?php endforeach; ?>
</div>

<div class="pagination">
	<?php echo $this->pagination->getPagesLinks(); ?>
</div>
