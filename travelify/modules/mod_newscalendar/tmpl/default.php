<?php
/*------------------------------------------------------------------------
# mod_newscalendar - News Calendar
# ------------------------------------------------------------------------
# author    Jesús Vargas Garita
# Copyright (C) 2010 www.joomlahill.com. All Rights Reserved.
# @license - http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
# Websites: http://www.joomlahill.com
# Technical Support:  Forum - http://www.joomlahill.com/forum
-------------------------------------------------------------------------*/

// no direct access
defined('_JEXEC') or die;

$doc = JFactory::getDocument();
if (file_exists(JPATH_BASE . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'mod_newscalendar' . DIRECTORY_SEPARATOR . 'css' . DIRECTORY_SEPARATOR . $params->get('stylesheet'))) {
	$stylesheet = $params->get('stylesheet', 'blue-arrows.css');
} else {
	$stylesheet = 'blue-arrows.css';
}
$doc->addStyleSheet('modules/mod_newscalendar/css/' . $stylesheet);
$script = "var sfolder = '" . JURI::base(true) . "';";
$doc->addScriptDeclaration($script);
$doc->addScript('modules/mod_newscalendar/assets/newscalendar.js');
if (!$params->get('mid')) { 
	$mid = $module->id;
} else {
	$mid = $params->get('mid');
}
$Itemid = JFactory::getApplication()->input->getInt('Itemid');
?>
<?php if ($cal->ajaxed == 0) : ?>
<div class="newscalendar" id="newscalendar<?php echo $mid; ?>"><?php endif; ?>
	<table class="nc-header" cellspacing="0">
    	<thead>
            <tr>
                <td width="20"><a href="javascript:void(0)" onClick="updateNewsCalendar(<?php echo $cal->curmonth; ?>,<?php echo $cal->curyear-1; ?>,<?php echo $mid; ?>,<?php echo $Itemid; ?>)" class="back-yr"></a></td>
                <td width="20"><a href="javascript:void(0)" onClick="updateNewsCalendar(<?php echo ($cal->curmonth!=1?$cal->curmonth-1:12); ?>,<?php echo ($cal->curmonth!=1?$cal->curyear:$cal->curyear-1); ?>,<?php echo $mid; ?>,<?php echo $Itemid; ?>)" class="back-mth"></a></td>
                <td style="text-align:center"><div id="monthyear_<?php echo $mid; ?>"><span class="monthname"><?php echo $cal->monthname; ?></span> <span class="yearname"><?php echo ($params->get('subyearname')?substr($cal->curyear,2):$cal->curyear); ?></span></div></td>
                <td width="20" align="right"><a href="javascript:void(0)" onClick="updateNewsCalendar(<?php echo ($cal->curmonth!=12?$cal->curmonth+1:1); ?>,<?php echo ($cal->curmonth!=12?$cal->curyear:$cal->curyear+1); ?>,<?php echo $mid; ?>,<?php echo $Itemid; ?>)" class="fwd-mth"></a></td>
                <td width="20" align="right"><a href="javascript:void(0)" onClick="updateNewsCalendar(<?php echo $cal->curmonth; ?>,<?php echo $cal->curyear+1; ?>,<?php echo $mid; ?>,<?php echo $Itemid; ?>)" class="fwd-yr"></a></td>
            </tr>
        </thead>
    </table>
    <table class="nc-body" cellspacing="0">
    	<thead>
            <tr> 
            <?php 
			for($i = $params->get('firstday'); $i <= $params->get('firstday')+6; $i++) : 
		  ?>    <td class="dayname dayweek<?php echo (($i>6)?($i-6):($i+1)); ?>" style="text-align:center"><?php echo modNewsCalendarHelper::encode('MOD_NEWSCALENDAR_DAYNAME_' . $params->get('subdayname') . '_' . (($i>6)?($i-6):($i+1)),$params->get('encode'),$cal->ajaxed); ?></td>		
            <?php endfor; ?></tr>
        </thead>
        <tbody>
		<?php 
            $fday=$params->get('firstday');
            for($i = 0; $i < count($cal->weeks); $i++)
            { 
            ?><tr class="week<?php echo $i+1; ?>">
				<?php
                for($j=0; $j < 7; $j++)	
                {
                    if(!empty($cal->weeks[$i][$j])) 
                    {
                        $day = explode(' ',$cal->weeks[$i][$j]);
                        $class = 'nc-day';	
                        $ul = '';				
                        if ( $day[1] ) { 
                            $class .= " outofmonth";
                        } else {
                            $class .= " weekday".((($j+$fday)>6)?(($j+$fday)-6):($j+$fday+1)) . " relday" . ($j+1);	
                            if ($day[0]==date('j') && $cal->curmonth==date('m')) {
                                $class .= " today";	
                            }
                        }
                        if (isset($cal->items[$day[0]]) && !$day[1]) {
                            $class .= " hasitems";	
                        }
                        ?><td><span class="<?php echo $class; ?>"><?php 
							echo $day[0];
                        	if (isset($cal->items[$day[0]]) && !$day[1]) { ?>
                            
                            <ul class="nc-items"><?php
							
                            foreach ($cal->items[$day[0]] as $item) { ?> 
                                <li><a href="<?php echo preg_replace('/modules\/mod_newscalendar\/assets\//', '', $item->link); ?>"><?php echo $item->title; ?></a></li><?php }
                            ?></ul>
                        <?php } 
                       ?></span></td>
                    <?php } else { ?>
                    <td></td><?php
                    }
                } ?>
                </tr>
		<?php } ?>
            
        </tbody>
    </table>
	<?php if ($cal->ajaxed == 0) : ?>
    <div class="bgimgcall"><img src="modules/mod_newscalendar/assets/opacity.png" /></div>
</div><?php endif; ?>