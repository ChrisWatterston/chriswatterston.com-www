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

        <section class="<?= $globalPrefix; ?>-article-container _listing">
            <?php
            // Output content
            echo '
                <img src="' . $articleHeroImageUrl . '" title="' . $articleHeroImageTitle . '" width="200" />
                <div class="__content _shadow-grey _image-reverse">
                    <h1>' . $articleTitle . '</h1>
                    <p class="_article-desc">' . $articleDescription . '</p>
                    <p class="_article-date">' . $articleLiveDate . '</p>
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