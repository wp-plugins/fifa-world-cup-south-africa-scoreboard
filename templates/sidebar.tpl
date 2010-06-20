
<?php
if ( ! $nomikos_fifa_world_cup_scoreboard_class->options->results )
{
    echo 'No results for FIFA World Cup South Africa scoreboard :(';
    return;
}

$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL = NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL;
?>

<table class="nomikos_fifa_world_cup_scoreboard_class_table">
<caption>
FIFA World Cup™ Scoreboard
</caption>
<tr style="text-align:center">
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">A</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">B</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">C</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">D</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">
<?php if ( $nomikos_fifa_world_cup_scoreboard_class->options->options->topbar ) : ?>
<input type="checkbox" title="Close/Open top bar" id="staticBar2b">
<?php else : ?>
&nbsp;
<?php endif; ?>
</td>
</tr>
<tr style="text-align:center">
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">E</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">F</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">G</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group">H</td>
<td class="nomikos_fifa_world_cup_scoreboard_class_table_group"><input type="checkbox" class="tzChanger" title="Check to show dates in local time. Uncheck to show Africa time"></td>
</tr>
</table>

<?php
foreach ( $nomikos_fifa_world_cup_scoreboard_class->options->results as $i => $group )
{
    foreach ( $group as $j => $matchs )
    {
        $gletter = chr($j + 97);
        // if ( ! $instance[$gletter] )            continue;

        echo '<table class="nomikos_fifa_world_cup_scoreboard_class_table" id="group'.strtoupper($gletter).'" style="display:none;"><caption>Group '.strtoupper($gletter).'</caption>';

        foreach ( $matchs as $records )
        {
            if ( $instance['date'] )
            {
                $date = "<br /><span id=\"{$records['timestamp']}\" class=\"tzChangerText\">{$records['date']}</span>";
            }

            $result_text = $records['result_text'];
            
            if ( $instance['one_row'] )
echo <<<EOF
<tr>
<td rowspan="2" align="right">
<a target="_blank" href="http://www.fifa.com{$records['team1_link']}">
<img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team1_flag']}.gif" title="{$records['team1_text']}" /></a></td>
<td align="center"><a target="_blank" href="http://www.fifa.com{$records['venue_link']}">{$records['venue_text']}</a>$date</td>
<td rowspan="2" align="left">
<a target="_blank" href="http://www.fifa.com{$records['team2_link']}">
<img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team2_flag']}.gif" title="{$records['team2_text']}" /></a></td>
</tr>
<tr>
<td align="center">$result_text</td>
</tr>
EOF;
            else
            {
                $result_text = preg_replace("/(<a[^>]*>\s*<img[^>]*matchmore.png[^>]*>\s*<\/a>)/si", "<br />\\1", $result_text);
echo <<<EOF
<tr>
<td align="right"><img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team1_flag']}.gif" title="{$records['team1_text']}" /></td>
<td align="center"><a target="_blank" href="http://www.fifa.com{$records['venue_link']}">{$records['venue_text']}</a>$date</td>
<td align="left"><img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team2_flag']}.gif" title="{$records['team2_text']}" /></td>
</tr>
<tr>
<td align="right"><a target="_blank" href="http://www.fifa.com{$records['team1_link']}">{$records['team1_text']}</a></td>
<td align="center">$result_text</td>
<td align="left"><a target="_blank" href="http://www.fifa.com{$records['team2_link']}">{$records['team2_text']}</a></td>
</tr>
EOF;
            }
        }
        echo '</table>';
    }
}
?>

<?php if ( $instance['schedule'] ) : ?>

<table class="nomikos_fifa_world_cup_scoreboard_class_table">
<tr style="text-align:center">
<td colspan="8">
<?php
echo <<<EOF
<a target="_blank" href="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/Fifa-2010-Schedule.png">
<img width="160" height="92" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/Fifa-2010-Schedule-thumbnail.png" title="Fifa 2010 Schedule" /></a>
EOF;
?>
</td>
</tr>
<caption>
Match Schedule
</caption>
</table>

<?php endif; ?>