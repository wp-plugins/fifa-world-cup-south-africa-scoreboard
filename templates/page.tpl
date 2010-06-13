
<?php
if ( ! $this->options->results )
{
    echo 'No results for FIFA World Cup South Africa scoreboard :(';
    return;
}

$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL = NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL;

foreach ( $this->options->results as $i => $group )
{
    foreach ( $group as $j => $matchs )
    {
        $gletter = chr($j + 97);

        $alert_goal_flag = 0;
        echo '<table class="nomikos_fifa_world_cup_scoreboard_class_table"><caption>Group '.strtoupper($gletter).'</caption>';
        echo '<tr>';

        if ($this->options->show_results->number)
            echo '<td width="5%">Match</td>';
        if ($this->options->show_results->date)
            echo '<td>Date</td>';
        echo '<td width="20%">Venue</td><td width="20">&nbsp;</td><td width="20%">&nbsp;</td><td align="center">Results</td><td width="20%">&nbsp;</td><td width="20">&nbsp;</td></tr>';

        foreach ( $matchs as $k => $records )
        {
            echo '<tr>';
            if ($this->options->show_results->number)
                echo "<td align=\"right\">{$records['number']}</td>";
            if ($this->options->show_results->date)
                echo "<td>{$records['date']}</td>";
echo <<<EOF
<td><a target="_blank" href="http://www.fifa.com{$records['venue_link']}">{$records['venue_text']}</a></td>
<td align="right"><img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team1_flag']}.gif" /></td>
<td><a target="_blank" href="http://www.fifa.com{$records['team1_link']}">{$records['team1_text']}</a></td>
<td align="center"><a target="_blank" href="http://www.fifa.com{$records['result_link']}">{$alert_goal}{$records['result_text']}</a></td>
<td align="right"><a target="_blank" href="http://www.fifa.com{$records['team2_link']}">{$records['team2_text']}</a></td>
<td><img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team2_flag']}.gif" /></td>
</tr>
EOF;
        }

        echo '</table>';
    }
}

?>