<?
include_once(__DIR__ . '/../config/php.debug.php');
include_once(__DIR__ . '/../config/funcs.global.php');
include_once(__DIR__ . '/../config/keys.contentful.php');

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- GET CONTENTFUL JSON ----------
// ----------
// ----------
//
require_once(__DIR__ . '/../vendor/autoload.php');

$query = (new Contentful\Delivery\Query())
    ->setContentType('blogPost');

$client = new \Contentful\Delivery\Client(
    $accessToken,
    $spaceId,
    $environmentId
);

try {
    $entry = $client->getEntry('nyancat');
} catch (\Contentful\Core\Exception\NotFoundException $exception) {
    // Entry does not exist
}

$entriesList = $client->getEntries($query);

// Default vars
$i = 0;
$articleList = [];

foreach ($entriesList as $key => $entry) {
    // Extract data
    $articleList[$i]['articleLiveDate'] = $entry->get('articleLiveDate');
    $articleList[$i]['articleUpdateDate'] = $entry->get('articleUpdateDate');
    $articleList[$i]['articleTitle'] = $entry->get('articleTitle');
    $articleList[$i]['articleUrlSlug'] = $entry->get('articleUrlSlug');
    $articleList[$i]['articleDescription'] = $entry->get('articleDescription');
    $articleList[$i]['articleKeywords'] = $entry->get('articleKeywords');
    $articleList[$i]['articleHeroImage'] = $entry->get('articleHeroImage');
    // Extract rich text
    $renderer = new Contentful\RichText\Renderer();
    $articleBody = $renderer->render($entry->get('articleBody'));
    $articleList[$i]['articleBody'] = $articleBody;
    // Lets loop again...
    $i++;
}

// Sort and put articles into live date order
usort($articleList, "orderBlogAscending");

// Clear static JSON file
file_put_contents(__DIR__ . '/../data/contentful.blog.json', '');

// Rebuild static JSON file
if (getenv('ENVIRONMENT_STATE') === 'production') {
    $apiOutput = json_encode($articleList, JSON_UNESCAPED_UNICODE); // JSON_UNESCAPED_UNICODE
} else {
    $apiOutput = json_encode($articleList, JSON_PRETTY_PRINT); // JSON_PRETTY_PRINT
}
file_put_contents(__DIR__ . '/../data/contentful.blog.json', $apiOutput, FILE_APPEND);
