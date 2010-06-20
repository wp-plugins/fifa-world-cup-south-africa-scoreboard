<?php

$match_times              = array();
$match_times_mysql        = array();
$match_scraped            = array();
$last_scrape_match_number = 0;

if (preg_match_all("/<table[^>]*>(.*?)<\/table>/si", $unit, $groups, PREG_SET_ORDER))
{
    foreach ($groups as $i => $group)
    {
        foreach ($group as $matchs)
        {
            if ($a = preg_match_all("/<tr class=\"(odd|even)\"><td[^>]*>(.*?)<\/td><td[^>]*>(.*?)<\/td>\s*<td[^>]*>\s*<a[^>]*href=\"([^\"]+)\"[^>]*>(.*?)<\/a>\s*<\/td>\s*<td[^>]*>.*?(\w{3})\.gif.*?<\/td>\s*<td[^>]*>\s*<a[^>]*href=\"([^\"]+)\"[^>]*>(.*?)<\/a><\/td>\s*<td[^>]*>\s*(<span[^>]*>\s*)?<a[^>]*href=\"([^\"]+)\"[^>]*>(.*?)<\/a>(\s*<\/span>)?\s*<\/td>\s*<td[^>]*>\s*<a[^>]*href=\"([^\"]+)\"[^>]*>(.*?)<\/a><\/td>\s*<td[^>]*>.*?(\w{3})\.gif.*?<\/td>\s*<\/tr>/si", $matchs, $match, PREG_SET_ORDER))
            {
                foreach ($match as $j => $records)
                {
                    $results['group'][$i][$j]['number']      = strip_tags(trim($records[2]));
                    $results['group'][$i][$j]['date']        = strip_tags(trim($records[3]));
                    $results['group'][$i][$j]['venue_link']  = strip_tags(trim($records[4]));
                    $venue = strip_tags(trim($records[5]));
                    if ( strstr($venue, 'Port Elizabeth') )
                        $venue = 'Port Elizabeth';
                    else if ( strstr($venue, 'Bloemfontein') )
                        $venue = 'Bloemfontein';
                    else if ( strstr($venue, 'Johannesburg') )
                        $venue = 'Johannesburg';
                    else if ( strstr($venue, 'Pretoria') )
                        $venue = 'Pretoria';
                    $results['group'][$i][$j]['venue_text']  = $venue;
                    $results['group'][$i][$j]['team1_flag']  = strip_tags(trim($records[6]));
                    $results['group'][$i][$j]['team1_link']  = strip_tags(trim($records[7]));
                    $results['group'][$i][$j]['team1_text']  = strip_tags(trim($records[8]));
                    $results['group'][$i][$j]['result_link'] = strip_tags(trim($records[10]));
                    $results['group'][$i][$j]['result_text'] = strip_tags(trim($records[11]));
                    $results['group'][$i][$j]['team2_link']  = strip_tags(trim($records[13]));
                    $results['group'][$i][$j]['team2_text']  = strip_tags(trim($records[14]));
                    $results['group'][$i][$j]['team2_flag']  = strip_tags(trim($records[15]));

                    # switch month by day to match english format time
                    $date  = $results['group'][$i][$j]['date'];
                    $date  = explode(' ', $date);
                    $date2 = $date[1];
                    $date1 = explode('/', $date[0]);
                    $date1 = $date1[1] . '/' . $date1[0];

                    $x = strtotime("2010/$date1/$date2");
                    $y = date('Y-m-d H:i:s', $x);

                    $match_number = $results['group'][$i][$j]['number'];

                    $match_scraped[$match_number]['date']    = $x;
                    $match_scraped[$match_number]['scraped'] = 0;

                    # has numeric results (d:d) => scraped ready
                    $result_text = $results['group'][$i][$j]['result_text'];
                    if (preg_match("/\d+:\d+/si", $result_text))
                    {
                        $match_scraped[$match_number]['scraped'] = 1;
                        $last_scrape_match_number = $match_number;
                    }

                    # set this data only once
                    # -----------------------
                    if ( ! $this->options->match_times )
                    {
                        if ( ! in_array($x, $match_times))
                        {
                            $match_times[]       = $x;
                            $match_times_mysql[] = $y;
                        }
                    }
                }
            }
        }
    }
}

?>