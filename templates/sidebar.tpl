
<?php
if ( ! $nomikos_fifa_world_cup_scoreboard_class->options->results )
{
    echo 'No results for FIFA World Cup South Africa scoreboard :(';
    return;
}

$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL = NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL;

foreach ( $nomikos_fifa_world_cup_scoreboard_class->options->results as $i => $group )
{
    foreach ( $group as $j => $matchs )
    {
        $gletter = chr($j + 97);
        if ( ! $instance[$gletter] )
            continue;

        echo '<table class="nomikos_fifa_world_cup_scoreboard_class_table"><caption>Group '.strtoupper($gletter).'</caption>';

        foreach ( $matchs as $records )
        {
            if ( $instance['date'] )
                $date = '<br />' . $records['date'];
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
<td align="center"><a target="_blank" href="http://www.fifa.com{$records['result_link']}">{$records['result_text']}</a></td>
</tr>
EOF;
            else
echo <<<EOF
<tr>
<td align="right"><img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team1_flag']}.gif" title="{$records['team1_text']}" /></td>
<td align="center"><a target="_blank" href="http://www.fifa.com{$records['venue_link']}">{$records['venue_text']}</a>$date</td>
<td align="left"><img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team2_flag']}.gif" title="{$records['team2_text']}" /></td>
</tr>
<tr>
<td align="right"><a target="_blank" href="http://www.fifa.com{$records['team1_link']}">{$records['team1_text']}</a></td>
<td align="center"><a target="_blank" href="http://www.fifa.com{$records['result_link']}">{$records['result_text']}</a></td>
<td align="left"><a target="_blank" href="http://www.fifa.com{$records['team2_link']}">{$records['team2_text']}</a></td>
</tr>
EOF;
        }
        echo '</table>';
    }
}
?>
