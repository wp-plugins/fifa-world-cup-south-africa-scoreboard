
<script type="text/javascript">
var NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_STATICBAR_CLOSE = <?php echo $_SESSION['staticBarClose'] ? 1 : 0; ?>;
</script>

<div id="staticBar">
<table cellspacing="0" cellpadding="0" width="100%">
<tr>
    <?php if ( $nomikos_fifa_world_cup_scoreboard_class->options->options->text3 ) : ?>
    <td align="center" width="20">
    <a target="_blank" title="FIFA World Cup South Africa Scoreboard - Wordpress plugin &copy; nomikos.info - Get it now!" href="http://nomikos.info/2010/06/10/fifa-world-cup-south-africa-scoreboard-wp-plugin.html">&copy;</a>
    </td>
    <?php endif; ?>
    <?php if ( $nomikos_fifa_world_cup_scoreboard_class->options->options->text1 ) : ?>
    <td align="center" width="240">
    FIFA World Cup South Africa Scoreboard
    </td>
    <?php endif; ?>
    <td>

<?php
$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL = NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL;
$output = '';

foreach ( $nomikos_fifa_world_cup_scoreboard_class->options->results as $i => $group )
{
    foreach ( $group as $j => $matchs )
    {
        foreach ( $matchs as $records )
        {
            $gletter = strtoupper(chr($j + 97));

            if ($nomikos_fifa_world_cup_scoreboard_class->alert_live_flag)
            {
                if ( ! stristr($records['result_text'], 'live') )
                    continue;

                    $output .=  <<<EOF
<table cellspacing="0" cellpadding="0" class="staticBar_table">
<tr>
    <td align="center" nowrap>
Now playing:
 &nbsp;
<img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team1_flag']}.gif" title="{$records['team1_text']}" />&nbsp;<a target="_blank" href="http://www.fifa.com{$records['team1_link']}">{$records['team1_text']}</a>
 &nbsp;
<a target="_blank" href="http://www.fifa.com{$records['result_link']}"><b>{$records['result_text']}</u></b></a>
 &nbsp;
<a target="_blank" href="http://www.fifa.com{$records['team2_link']}">{$records['team2_text']}</a>&nbsp;<img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team2_flag']}.gif" title="{$records['team2_text']}" />
 &nbsp;
Group $gletter - <a target="_blank" href="http://www.fifa.com{$records['venue_link']}">{$records['venue_text']}</a>
    </td>
</tr>
</table>
EOF;
            }
            else
            {
                if ($nomikos_fifa_world_cup_scoreboard_class->options->last_scrape_match_number != $records['number'])
                    continue;

                $output .=  <<<EOF
<table cellspacing="0" cellpadding="0" class="staticBar_table">
<tr>
    <td align="center" nowrap>
Last result:
 &nbsp;
<img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team1_flag']}.gif" title="{$records['team1_text']}" />&nbsp;<a target="_blank" href="http://www.fifa.com{$records['team1_link']}">{$records['team1_text']}</a>
 &nbsp;
<a target="_blank" href="http://www.fifa.com{$records['result_link']}"><b>{$records['result_text']}</u></b></a>
 &nbsp;
<a target="_blank" href="http://www.fifa.com{$records['team2_link']}">{$records['team2_text']}</a>&nbsp;<img width="19" height="13" src="$NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_URL/img/{$records['team2_flag']}.gif" title="{$records['team2_text']}" />
 &nbsp;
Group $gletter - <a target="_blank" href="http://www.fifa.com{$records['venue_link']}">{$records['venue_text']}</a>
    </td>
</tr>
</table>
EOF;
                break 3;
            }
        }
    }
}

echo $output;
?>
    </td>
    <?php if ( $nomikos_fifa_world_cup_scoreboard_class->options->options->text2 ) : ?>
    <td align="center" width="230">
    go to <a target="_blank" title="FIFA World Cup official website" href="http://www.fifa.com/worldcup/index.html">FIFA World Cup&trade; official website</a>
    </td>
    <?php endif; ?>
    <td align="center" id="staticBar3" width="20" style="cursor:pointer" title="Refresh data">&divide;&nbsp;</td>
    <td align="center" id="staticBar2" width="20" style="cursor:pointer" title="Close">&times;&nbsp;</td>
</tr>
</table>
</div>
