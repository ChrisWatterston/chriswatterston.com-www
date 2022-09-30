<?php
//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- DATA ORDERING ----------
// ----------
// ----------
//
function orderBlogAscending($a, $b)
{
    return ($a['articleLiveDate'] <= $b['articleLiveDate']) ? 1 : -1;
}

function orderWorkAscending($a, $b)
{
    return ($a['workLiveDate'] <= $b['workLiveDate']) ? 1 : -1;
}

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- FORMAT NUMBER ----------
// ----------
// ----------
//
function formatNumber($num)
{
    $num = number_format($num, 0, ".", ",");
    return $num;
}

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- CURL / API REQUEST ----------
// ----------
// ----------
//
function apiRequestGET($url, $curl)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
    ));
    $a = curl_exec($curl);
    return $a;
    curl_close($curl);
};

function apiRequestHeaderAuthGET($key, $url, $curl)
{
    $curlHeaders = array(
        'Cache-Control: no-cache',
        'Accept-Encoding: gzip, deflate, br',
        'Authorization: Bearer ' . $key . '',
    );

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_HEADER => 0,
        CURLOPT_HTTPHEADER => $curlHeaders,
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
    ));
    $a = curl_exec($curl);
    return $a;
    curl_close($curl);
};

function apiRequestPOST($url, $curl)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
    ));
    $a = curl_exec($curl);
    return $a;
    curl_close($curl);
};



//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- SITEMAP GENERATOR ----------
// ----------
// ----------
//
class SitemapGenerator
{
    // Config file with crawler/sitemap options
    private $config;

    // Array containing all scanned pages
    private $scanned;

    // The base of the given site url
    // EXAMPLE: https://student-laptop.nl
    private $site_url_base;

    // File where sitemap is written to.
    private $sitemap_file;

    // Constructor sets the given file for internal use
    public function __construct($conf)
    {
        // Setup class variables using the config
        $this->config = $conf;
        $this->scanned = [];
        $this->site_url_base = parse_url($this->config['SITE_URL'])['scheme'] . "://" . parse_url($this->config['SITE_URL'])['host'];
        $this->sitemap_file = fopen($this->config['SAVE_LOC'], "w");
    }

    public function GenerateSitemap()
    {
        // Call the recursive crawl function with the start url.
        $this->crawlPage($this->config['SITE_URL']);

        // Generate a sitemap with the scanned pages.
        $this->generateFile($this->scanned);
    }

    // Get the html content of a page and return it as a dom object
    private function getHtml($url)
    {
        // Get html from the given page
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $html = curl_exec($curl);
        curl_close($curl);

        //Load the html and store it into a DOM object
        $dom = new DOMDocument();
        @$dom->loadHTML($html);

        return $dom;
    }

    // Recursive function that crawls a page's anchor tags and store them in the scanned array.
    private function crawlPage($page_url)
    {
        $url = filter_var($page_url, FILTER_SANITIZE_URL);

        // Check if the url is invalid or if the page is already scanned;
        if (in_array($url, $this->scanned) || !filter_var($page_url, FILTER_VALIDATE_URL)) {
            return;
        }

        // Add the page url to the scanned array
        array_push($this->scanned, $page_url);

        // Get the html content from the 
        $html = $this->getHtml($url);
        $anchors = $html->getElementsByTagName('a');

        // Loop through all anchor tags on the page
        foreach ($anchors as $a) {
            $next_url = $a->getAttribute('href');

            // Check if there is a anchor ID set in the config.
            if ($this->config['CRAWL_ANCHORS_WITH_ID'] != "") {
                // Check if the id is set and matches the config setting, else it will move on to the next anchor
                if ($a->getAttribute('id') != "" || $a->getAttribute('id') == $this->config['CRAWL_ANCHORS_WITH_ID']) {
                    continue;
                }
            }

            // Split page url into base and extra parameters
            $base_page_url = explode("?", $page_url)[0];

            if (!$this->config['ALLOW_ELEMENT_LINKS']) {
                // Skip the url if it starts with a # or is equal to root.
                if (substr($next_url, 0, 1) == "#" || $next_url == "/") {
                    continue;
                }
            }

            // Check if the given url is external, if yes it will skip the iteration
            // This code will only run if you set ALLOW_EXTERNAL_LINKS to false in the config.
            if (!$this->config['ALLOW_EXTERNAL_LINKS']) {
                $parsed_url = parse_url($next_url);
                if (isset($parsed_url['host'])) {
                    if ($parsed_url['host'] != parse_url($this->config['SITE_URL'])['host']) {
                        continue;
                    }
                }
            }

            // Check if the link is absolute or relative.
            if (substr($next_url, 0, 7) != "http://" && substr($next_url, 0, 8) != "https://") {
                $next_url = $this->convertRelativeToAbsolute($base_page_url, $next_url);
            }

            // Check if the next link contains any of the pages to skip. If true, the loop will move on to the next iteration.
            $found = false;
            foreach ($this->config['KEYWORDS_TO_SKIP'] as $skip) {
                if (strpos($next_url, $skip) || $next_url === $skip) {
                    $found = true;
                }
            }

            // Call the function again with the new URL
            if (!$found) {
                $this->crawlPage($next_url);
            }
        }
    }

    // Convert a relative link to a absolute link
    // Example: Relative /articles
    //			Absolute https://student-laptop.nl/articles
    private function convertRelativeToAbsolute($page_base_url, $link)
    {
        $first_character = substr($link, 0, 1);
        if ($first_character == "?" || $first_character == "#") {
            return $page_base_url . $link;
        } else if ($first_character != "/") {
            return $this->site_url_base . "/" . $link;
        } else {
            return $this->site_url_base . $link;
        }
    }

    // Function to generate a Sitemap with the given pages array where the script has run through
    private function generateFile($pages)
    {
        $xml = '<?xml version="1.0" encoding="UTF-8"?>
        <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
		<!-- ' . count($pages) . ' total pages-->';


        // Print the amount of pages
        echo count($pages);

        foreach ($pages as $page) {
            $xml .= "<url><loc>" . $page . "</loc>
            <lastmod>" . $this->config['LAST_UPDATED'] . "</lastmod>
            <changefreq>" . $this->config['CHANGE_FREQUENCY'] . "</changefreq>
            <priority>" . $this->config['PRIORITY'] . "</priority></url>";
        }

        $xml .= "</urlset>";
        $xml = str_replace('&', '&amp;', $xml);

        // Format string to XML
        $dom = new DOMDocument;
        $dom->preserveWhiteSpace = FALSE;
        $dom->loadXML($xml);
        $dom->formatOutput = TRUE;

        // Write XML to file and close it
        fwrite($this->sitemap_file, $dom->saveXML());
        fclose($this->sitemap_file);
    }
}
