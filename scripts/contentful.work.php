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
    ->setContentType('workPost');

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
$workList = [];

foreach ($entriesList as $key => $entry) {
    // Extract data
    $workList[$i]['workLiveDate'] = $entry->get('workLiveDate');
    $workList[$i]['workUpdateDate'] = $entry->get('workUpdateDate');
    $workList[$i]['workTitle'] = $entry->get('workTitle');
    $workList[$i]['workUrlSlug'] = $entry->get('workUrlSlug');
    $workList[$i]['workDescription'] = $entry->get('workDescription');
    $workList[$i]['workHeroImage'] = $entry->get('workHeroImage');
    $workList[$i]['workClientLogo'] = $entry->get('workClientLogo');
    $workList[$i]['workRoleTags'] = $entry->get('workRoleTags');
    // Extract rich text
    $renderer = new Contentful\RichText\Renderer();
    $workBodyIntro = $renderer->render($entry->get('workBodyIntro'));
    $workList[$i]['workBodyIntro'] = $workBodyIntro;
    $workBodyObjective = $renderer->render($entry->get('workBodyObjective'));
    $workList[$i]['workBodyObjective'] = $workBodyObjective;
    $workBodyMyRole = $renderer->render($entry->get('workBodyMyRole'));
    $workList[$i]['workBodyMyRole'] = $workBodyMyRole;
    $workBodyPartners = $renderer->render($entry->get('workBodyPartners'));
    $workList[$i]['workBodyPartners'] = $workBodyPartners;
    $workMetricsDescription = $renderer->render($entry->get('workMetricsDescription'));
    $workList[$i]['workMetricsDescription'] = $workMetricsDescription;
    $workBodyLearnings = $renderer->render($entry->get('workBodyLearnings'));
    $workList[$i]['workBodyLearnings'] = $workBodyLearnings;
    // Extract Numbers
    $workList[$i]['workMetricsEntriesNumber'] = $entry->get('workMetricsEntriesNumber');
    $workList[$i]['workMetricsUniqueNumber'] = $entry->get('workMetricsUniqueNumber');
    $workList[$i]['workMetricsWinnerNumber'] = $entry->get('workMetricsWinnerNumber');
    // Extract Gallery
    $workList[$i]['workImageGallery'] = $entry->get('workImageGallery');
    // Lets loop again...
    $i++;
}

// Sort and put works into live date order
usort($workList, "orderBlogAscending");

// Clear static JSON file
file_put_contents(__DIR__ . '/../data/contentful.work.json', '');

// Rebuild static JSON file
if (getenv('ENVIRONMENT_STATE') === 'production') {
    $apiOutput = json_encode($workList, JSON_UNESCAPED_UNICODE); // JSON_UNESCAPED_UNICODE
} else {
    $apiOutput = json_encode($workList, JSON_UNESCAPED_UNICODE); // JSON_PRETTY_PRINT
}
file_put_contents(__DIR__ . '/../data/contentful.work.json', $apiOutput, FILE_APPEND);
