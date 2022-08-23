<?
// Local config
$localMetaTitle = 'Blog';
$localMetaDesc = 'I am still building this site, be sure to come back soon!';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/header.global.php'); ?>
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/config/analytics.global.php'); ?>
</head>

<body>
    <div class="<?= $globalPrefix; ?>-body-container">
        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/nav.global.php'); ?>

        <div class="<?= $globalPrefix; ?>-flex-prep">
            <div class="<?= $globalPrefix; ?>-flex-container _flex-intro">
                <section class="<?= $globalPrefix; ?>-article-container">
                    <?php
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
                    foreach ($jsonContentOutput['items'] as $k => $v) {
                        if ($v['fields']['articleUrlSlug'] == $articleID) {
                            echo '
                                <div class="__image" style="background-image: url(' . $globalDomainRoot, $v['fields']['articleHeroImage']['sys']['id'] . ');"></div>
                                <div class="__content _shadow-grey _image-reverse">
                                    <h1>' . $v['fields']['articleTitle'] . '</h1>
                                    <p class="_article-desc">' . $v['fields']['articleDescription'] . '</p>
                                    <p class="_article-date">' . $v['fields']['articleLiveDate'] . '</p>
                                    
                                    ' . $v['fields']['articleBody'] . '
                                </div>
                            ';
                        }
                    }

                    ?>
                </section>
            </div>
        </div>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>