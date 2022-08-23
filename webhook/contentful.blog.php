<?
include_once($_SERVER['DOCUMENT_ROOT'] . '/config/php.debug.php');

include_once($_SERVER['DOCUMENT_ROOT'] . '/config/vars.global.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/config/funcs.global.php');

include_once($_SERVER['DOCUMENT_ROOT'] . '/config/keys.contentful.php');

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- GET CONTENTFUL JSON ----------
// ----------
// ----------
//
// Clear static JSON file
file_put_contents(__DIR__ . '/../data/contentful.blog.json', '');

// $contentfulURL = $globalDomainContentful . 'spaces/' . $spaceID . '/environments/master/entries?access_token=' . $accessToken . '&order=sys.updatedAt';
$contentfulURL = $globalDomainContentful . 'spaces/' . $spaceID . '/environments/master/entries?access_token=' . $accessToken;
$contentfulGET = apiRequestGET($contentfulURL, $curl);

// Output JSON
$apiResult = json_decode($contentfulGET, true);
// $apiResult = $apiResult['items'];

// echo '<pre>';
// print_r($apiResult);
// echo '</pre>';

// Rebuild static JSON file
$apiOutput = json_encode($apiResult, JSON_PRETTY_PRINT); // JSON_PRETTY_PRINT : JSON_UNESCAPED_UNICODE
file_put_contents(__DIR__ . '/../data/contentful.blog.json', $apiOutput, FILE_APPEND);
