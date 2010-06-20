<?php

if ( ! extension_loaded('curl'))
{
    $this->error('You need to load/activate the curl extension');
    return false;
}

set_time_limit(60);

include (NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_DIR . '/php/curl.php');
$cc = new cURL();

if ( ! file_exists($parser = NOMIKOS_FIFA_WORLD_CUP_SCOREBOARD_PLUGIN_DIR . '/parser/parser.inc'))
{
    $this->error("WARNING: parser file missing $parser");
    return false;
}

if ( ! $page = $cc->get($this->scrape_url))
{
    $this->error("WARNING: can't fetch scrape from: $this->scrape_url");
    return false;
}

$results = array();

$unit = $cc->get_unit($page, ' id="bodyContent"', ' id="thirdRail"');

include ($parser);

if (empty($results['group']))
{
    $this->error('WARNING: parser breaked or page not available');
    return false;
}

?>
