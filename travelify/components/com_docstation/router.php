<?php
/**
 * @package     DocStation
 * @subpackage  com_docstation
 *
 * @copyright   Copyright (C) 2013 - 2014 Mikhail Meschangin. All rights reserved.
 * @license     GNU General Public License version 2. http://www.gnu.org/licenses/gpl-2.0.html
 */

// No direct access to this file
defined('_JEXEC') or die;

// Require helper file
JLoader::register('DocStationHelper', JPATH_ADMINISTRATOR . '/components/com_docstation/helpers/docstation.php');

/**
 * Routing class from com_docstation
 */
class DocStationRouter extends JComponentRouterBase
{
	/**
	 * Build the route for the com_content component
	 *
	 * @param   array  &$query  An array of URL arguments
	 *
	 * @return  array  The URL arguments to use to assemble the subsequent URL.
	 *
	 * @since   3.3
	 */
	public function build(&$query)
	{
		$segments = array();

		// Get a menu item based on Itemid or currently active
		$app = JFactory::getApplication();
		$menu = $app->getMenu();

		// We need a menu item.  Either the one specified in the query, or the current active one if none specified
		if ( empty($query['Itemid']) )
		{
			$menuItem = $menu->getActive();
		}
		else
		{
			$menuItem = $menu->getItem($query['Itemid']);
		}

		// Check again
		if ( isset($menuItem) && $menuItem->component != 'com_docstation' )
		{
			$menuItem = false;
			unset($query['Itemid']);
		}

		if ( isset($query['view']) )
		{
			$view = $query['view'];
			unset($query['view']);
			// Store view for document controller (can be used on redirection)
			DocStationHelper::setState('routeView', $view);
		}
		else
		{
			// We need to have a view in the query or it is an invalid URL
			return $segments;
		}

		// Are we dealing with a document or category that is attached to a menu item?
		if ( $menuItem && $menuItem->query['view'] == $view )
		{
			if ( isset($query['id']) && isset($menuItem->query['id']) && $menuItem->query['id'] == (int) $query['id'] )
			{
				if ( isset($query['catid']) )
				{
					unset($query['catid']);
				}
	
				if ( isset($query['layout']) )
				{
					unset($query['layout']);
				}
	
				unset($query['id']);
	
				return $segments;
			}
		}
		else
		{
			if ( isset($query['format']) && !$app->get('sef_suffix') )
			{
				$segments[] = $view . '.' . $query['format'];
				unset($query['format']);
			}
			else
			{
				$segments[] = $view;
			}
		}

		if ( $view == 'download' )
		{
			if ( $menuItem && $menuItem->query['view'] == 'category' && isset($menuItem->query['id']) )
			{
				$mCatid = $menuItem->query['id'];
			}
			else
			{
				$mCatid = 0;
			}

			if ( isset($query['id']) )
			{
				if ( isset($query['catid']) )
				{
					if ( $cpath = self::_getCategoryPath($query['catid'], $mCatid) )
					{
						$segments = array_merge($segments, $cpath);
					}

					unset($query['catid']);
				}

				$segments[] = $query['id'];
			}
			else
			{
				return $segments;
			}

			unset($query['id']);
		}
		
		else if ($view == 'category')
		{
			if ( $menuItem && isset($menuItem->query['id']) )
			{
				$mCatid = $menuItem->query['id'];
			}
			else
			{
				$mCatid = 0;
			}

			if ( isset($query['id']) && $cpath = self::_getCategoryPath($query['id'], $mCatid) )
			{
				$segments = array_merge($segments, $cpath);
			}
			else
			{
				return $segments;
			}
			
			unset($query['id']);
		}

		/*
		 * If the layout is specified and it is the same as the layout in the menu item, we
		 * unset it so it doesn't go into the query string.
		 */
		if (isset($query['layout']))
		{
			if ($menuItem && isset($menuItem->query['layout']))
			{
				if ($query['layout'] == $menuItem->query['layout'])
				{
					unset($query['layout']);
				}
			}
			else
			{
				if ($query['layout'] == 'default')
				{
					unset($query['layout']);
				}
			}
		}

		$total = count($segments);

		for ($i = 0; $i < $total; $i++)
		{
			$segments[$i] = str_replace(':', '-', $segments[$i]);
		}

		return $segments;
	}

	/**
	 * Parse the segments of a URL.
	 *
	 * @param   array  &$segments  The segments of the URL to parse.
	 *
	 * @return  array  The URL attributes to be used by the application.
	 *
	 * @since   3.3
	 */
	public function parse(&$segments)
	{
		$total = count($segments);
		$vars = array();

		for ($i = 0; $i < $total; $i++)
		{
			$segments[$i] = preg_replace('/-/', ':', $segments[$i], 1);
		}

		// Get the active menu item.
		$app = JFactory::getApplication();
		$menu = $app->getMenu();
		$item = $menu->getActive();
		$db = JFactory::getDbo();

		// Count route segments
		$count = count($segments);
		// Current segment
		$s = 0;

		// View
		if ( !isset($item) || (!is_numeric($segments[$s]) && strpos($segments[0], ':') === false) )
		{
			$vars['view'] = $view = $segments[$s++];
			
			if ( strpos($view, '.') !== false )
			{
				list($view, $format) = explode('.', $view, 2);
				$vars['view'] = $view;
				$vars['format'] = $format;
			}
		}
		else
		{
			$view = $item->query['view'];
		}
		
		if ( $s < $count )
		{
			$vars['id'] = $segments[$s++];
		}
	
		if ( $s < $count && $view == 'download' )
		{
			$vars['catid'] = $vars['id'];
			$vars['id'] = $segments[$count - 1];
		}

		return $vars;
	}
	
	/**
	 * Returns a category path
	 *
	 * @param   int    Category id.
	 * @param   int    Category id in menu item.
	 *
	 * @return  array  Segments of category path.
	 */
	protected function _getCategoryPath($catid, $mCatid)
	{
		$categories = JCategories::getInstance('DocStation');
		$category = $categories->get($catid);
		
		if (!$category)
		{
			return false;
		}
		
		$path = array_reverse($category->getPath());
		
		$array = array();
		
		foreach ($path as $id)
		{
			if ((int) $id == (int) $mCatid)
			{
				break;
			}
		
			list($tmp, $id) = explode(':', $id, 2);
		
			$array[] = $id;
		}
		
		$array = array_reverse($array);
		
		if (count($array))
		{
			$array[0] = (int) $catid . ':' . $array[0];
		}
		
		return $array;
	}
}

/**
 * Content router functions
 *
 * These functions are proxys for the new router interface
 * for old SEF extensions.
 *
 * @deprecated  4.0  Use Class based routers instead
 */
function DocStationBuildRoute(&$query)
{
	$router = new DocStationRouter;

	return $router->build($query);
}

function DocStationParseRoute($segments)
{
	$router = new DocStationRouter;

	return $router->parse($segments);
}
