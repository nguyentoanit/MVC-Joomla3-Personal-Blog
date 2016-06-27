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
 * DocStation Component Category Tree
 */
class DocStationCategories extends JCategories
{
	public function __construct($options = array())
	{
		$options['table'] = '#__docstation';
		$options['extension'] = 'com_docstation';

		parent::__construct($options);
	}
}
