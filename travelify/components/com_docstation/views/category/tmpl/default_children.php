<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

defined('_JEXEC') or die;

JHtml::_('bootstrap.tooltip');

$lang	= JFactory::getLanguage();
$class = ' class="first"';

if ( count($this->children) > 0 ) : ?>

	<?php foreach ($this->children as $id => $child) : ?>
		<?php if ( $this->params->get('show_empty_categories') || $child->docscount ) : ?>
		<div<?php echo $class; ?>>
			<?php $class = ''; ?>
			<h3 class="page-header item-title">
				<a href="<?php echo JRoute::_( DocStationHelperRoute::getCategoryRoute($child->id) ); ?>" class="cat-title">
					<?php echo $this->escape($child->title); ?>
				</a>
				<?php if ( $this->params->get('show_cat_num_articles', 1)) : ?>
					<span class="badge badge-info tip hasTooltip" title="<?php echo JHtml::tooltipText('COM_DOCSTATION_NUM_ITEMS'); ?>">
						<?php echo $child->docscount; ?>
					</span>
				<?php endif; ?>
			</h3>

			<?php if ($this->params->get('show_subcat_desc') == 1 && $child->description) : ?>
				<div class="category-desc">
					<?php echo JHtml::_('content.prepare', $child->description, '', 'com_docstation.category'); ?>
				</div>
			<?php endif; ?>
		</div>
		<?php endif; ?>
	<?php endforeach; ?>

<?php endif;
