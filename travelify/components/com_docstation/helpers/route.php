<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

defined('_JEXEC') or die;

/**
 * Content Component Route Helper
 *
 * @static
 * @package     Joomla.Site
 * @subpackage  com_content
 * @since       1.5
 */
abstract class DocStationHelperRoute
{
	protected static $lookup = array();

	protected static $lang_lookup = array();

	/**
	 * The route of the content item
	 */
	public static function getDocumentRoute($id, $catid = 0, $language = 0, $document_page = null)
	{
		if ( $document_page === null ) {
			$document_page = JComponentHelper::getParams('com_docstation')->get( 'show_document_page', 1 );
		}
		
		if ( strpos($catid, '.') !== false )
			list($catid, $parent_type) = explode('.', $catid, 2);
		
		$needles = array(
			'download'  => array((int) $id)
		);

		//Create the link
		$link = 'index.php?option=com_docstation&view=download&id='. $id;

		if ( !$document_page )
		{
			$link .= '&format=raw';
		}
		
		if ( (int) $catid > 1 && (!isset($parent_type) || $parent_type == 'com_docstation') )
		{
			$categories = JCategories::getInstance('DocStation');
			$category = $categories->get((int) $catid);
			if ($category)
			{
				$needles['category'] = array_reverse($category->getPath());
				$link .= '&catid='.$catid;
			}
		}
		
		if ($language && $language != "*" && JLanguageMultilang::isEnabled())
		{
			self::buildLanguageLookup();

			if (isset(self::$lang_lookup[$language]))
			{
				$link .= '&lang=' . self::$lang_lookup[$language];
				$needles['language'] = $language;
			}
		}

		if ($item = self::_findItem($needles))
		{
			$link .= '&Itemid='.$item;
		}

		return $link;
	}

	public static function getCategoryRoute($catid, $language = 0)
	{
		if ($catid instanceof JCategoryNode)
		{
			$id = $catid->id;
			$category = $catid;
		}
		else
		{
			$id = (int) $catid;
			$category = JCategories::getInstance('DocStation')->get($id);
		}

		if ($id < 1 || !($category instanceof JCategoryNode))
		{
			$link = '';
		}
		else
		{
			$needles = array();

			$link = 'index.php?option=com_docstation&view=category&id='.$id;

			$catids = array_reverse($category->getPath());
			$needles['category'] = $catids;

			if ($language && $language != "*" && JLanguageMultilang::isEnabled())
			{
				self::buildLanguageLookup();

				if(isset(self::$lang_lookup[$language]))
				{
					$link .= '&lang=' . self::$lang_lookup[$language];
					$needles['language'] = $language;
				}
			}

			if ($item = self::_findItem($needles))
			{
				$link .= '&Itemid='.$item;
			}
		}

		return $link;
	}
	
	public static function getAttachmentParentRoute($parent, $parent_table)
	{
		// Require helper file
		JLoader::register('TagsHelperRoute', JPATH_ROOT . '/components/com_tags/helpers/route.php');
			
		return TagsHelperRoute::getItemRoute(
					$parent->core_content_item_id,
					$parent->core_alias,
					$parent->core_catid,
					$parent->core_language,
					$parent_table->type_alias,
					$parent_table->router
		);
	}	

	protected static function buildLanguageLookup()
	{
		if (count(self::$lang_lookup) == 0)
		{
			$db    = JFactory::getDbo();
			$query = $db->getQuery(true)
				->select('a.sef AS sef')
				->select('a.lang_code AS lang_code')
				->from('#__languages AS a');

			$db->setQuery($query);
			$langs = $db->loadObjectList();

			foreach ($langs as $lang)
			{
				self::$lang_lookup[$lang->lang_code] = $lang->sef;
			}
		}
	}

	protected static function _findItem($needles = null)
	{
		$app		= JFactory::getApplication();
		$menus		= $app->getMenu('site');
		$language	= isset($needles['language']) ? $needles['language'] : '*';

		// Prepare the reverse lookup array.
		if (!isset(self::$lookup[$language]))
		{
			self::$lookup[$language] = array();

			$component	= JComponentHelper::getComponent('com_docstation');

			$attributes = array('component_id');
			$values = array($component->id);

			if ($language != '*')
			{
				$attributes[] = 'language';
				$values[] = array($needles['language'], '*');
			}

			$items		= $menus->getItems($attributes, $values);

			foreach ($items as $item)
			{
				if (isset($item->query) && isset($item->query['view']))
				{
					$view = $item->query['view'];
					if (!isset(self::$lookup[$language][$view]))
					{
						self::$lookup[$language][$view] = array();
					}
					if (isset($item->query['id'])) {

						// here it will become a bit tricky
						// language != * can override existing entries
						// language == * cannot override existing entries
						if (!isset(self::$lookup[$language][$view][$item->query['id']]) || $item->language != '*')
						{
							self::$lookup[$language][$view][$item->query['id']] = $item->id;
						}
					}
				}
			}
		}

		if ($needles)
		{
			foreach ($needles as $view => $ids)
			{
				if (isset(self::$lookup[$language][$view]))
				{
					foreach ($ids as $id)
					{
						if (isset(self::$lookup[$language][$view][(int) $id]))
						{
							return self::$lookup[$language][$view][(int) $id];
						}
					}
				}
			}
		}

		// Check if the active menuitem matches the requested language
		$active = $menus->getActive();
		if ($active && $active->component == 'com_docstation' && ($language == '*' || in_array($active->language, array('*', $language)) || !JLanguageMultilang::isEnabled()))
		{
			return $active->id;
		}

		// If not found, return language specific home link
		$default = $menus->getDefault($language);
		return ($default &&  $default->component == 'com_docstation') ? $default->id : null;
	}
}
