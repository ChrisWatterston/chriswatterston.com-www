<?
include_once($_SERVER['DOCUMENT_ROOT'] . '/config/keys.contentful.php');
//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- OUTPUT SELECTED ARTICLE ----------
// ----------
// ----------
//
$jsonContentOutput = json_decode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/data/contentful.blog.json'), true);
$articleID = $_GET['article'];
// Output content
foreach ($jsonContentOutput as $k => $v) {
    if ($v['articleUrlSlug'] == $articleID) {
        $articleHeroImageUrl = $v['articleHeroImage']['fields']['file']['url'];
        $articleHeroImageTitle = $v['articleHeroImage']['fields']['title'];
        $articleTitle = $v['articleTitle'];
        $articleDescription = $v['articleDescription'];
        $articleLiveDate = $v['articleLiveDate'];
        $articleBody = $v['articleBody'];

        // YOUTUBE - Search and build embed block
        $searchYoutube = '<p>[youtube-start:';
        $youtubePartA = '<iframe width="700" height="395" src="https://www.youtube.com/embed/';
        $youtubePartB = '"title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
        if (str_contains($articleBody, $searchYoutube)) {
            $articleBody = str_replace("<p>[youtube-start:", $youtubePartA, "$articleBody");
            $articleBody = str_replace(":youtube-end]</p>", $youtubePartB, "$articleBody");
        }

        // INSTAGRAM - Search and build embed block
        $searchInsta = '<p>[instagram-start:';
        $instaPartA = '<div class="embed-container"><iframe width="700" height="600" src="https://instagram.com/p/';
        $instaPartB = '/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe></div>';
        if (str_contains($articleBody, $searchInsta)) {
            $articleBody = str_replace("<p>[instagram-start:", $instaPartA, "$articleBody");
            $articleBody = str_replace(":instagram-end]</p>", $instaPartB, "$articleBody");
        }
    }
}

// Local config
$localMetaTitle = $articleTitle . ' - Chris Watterston';
$localMetaDesc = $articleDescription;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/header.global.php'); ?>
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/config/analytics.global.php'); ?>
</head>

<body>
    <div class="<?= $globalPrefix; ?>-body-container _free">
        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/nav.global.php'); ?>

        <section class="<?= $globalPrefix; ?>-article-container">
            <?php
            // Output content
            echo '
                <div class="__content _shadow-grey _image-reverse">
                    <p class="_post-date">Published on ' . date('jS M Y', strtotime($articleLiveDate)) . '</p>
                    <h1 class="_black">' . $articleTitle . '</h1>
                    <p class="_article-desc">' . $articleDescription . '</p>
                    <img src="' . $articleHeroImageUrl . '" title="' . $articleHeroImageTitle . '" />
                    <p class="_image-caption">' . $articleHeroImageTitle . '</p>
                    <div class="_article-body">
                    ' . $articleBody . '
                    </div>
                </div>
            ';
            ?>
        </section>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>