<?php

$results = array();

if ( extension_loaded('curl'))
{
    include (NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_DIR . '/php/curl.php');
    $cc = new cURL();

    set_time_limit(60);

    if ( ! $page = $cc->get($this->scrape_url))
    {
        echo "WARNING: can't fetch (curl) scrape from: $this->scrape_url";
        return false;
    }
}
else
{
    if ( ! $page = file_get_contents($this->scrape_url))
    {
        echo "WARNING: can't fetch (file_get_contents) scrape from: $this->scrape_url";
        return false;
    }    
}

if ( ! file_exists($parser = NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_DIR . '/parser/parser.inc'))
{
    echo "WARNING: parser file missing $parser";
    return false;
}

$unit = $this->get_unit($page, ' id="bodyContent"', ' id="thirdRail"');

include ($parser);

if (empty($results['group']))
{
    echo 'WARNING: parser breaked or page not available';
    return false;
}

?>
