<?
// Local config
$localMetaTitle = 'Hey, I\'m Chris Watterston';
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
                <section class="<?= $globalPrefix; ?>-intro-container _text-align__center">
                    <h1 class="_green _stacked">Opportune</h1>
                    <h1 class="_yellow _stacked">Explore</h1>
                    <h1 class="_purple _stacked">Build</h1>
                    <h1 class="_red _stacked">Launch</h1>
                    <h1 class="_black _stacked">Test&Learn</h1>
                </section>
            </div>
        </div>

        <section class="<?= $globalPrefix; ?>-stream-container">
            <?php
            //
            // ------------------------------------------------------------
            // ------------------------------------------------------------
            // ------------------------------------------------------------
            // ---------- OUTPUT LATEST POST ----------
            // ----------
            // ----------
            //
            $limitList = 1;
            $jsonContentOutput = json_decode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/data/contentful.blog.json'), true);
            foreach ($jsonContentOutput as $k => $v) {
                if ($limitList === 1) {
                    echo '
                    <article class="' . $globalPrefix . '-card-container" data-content-count=' . $limitList . '>
                        <div class="__type _text-align__right">
                            <h5>Latest Post</h5>
                        </div>
                        <div class="__title _text-align__right">
                            <h6>' . $v['articleTitle'] . '</h6>
                        </div>
                        <div class="__posted _text-align__right"><p class="_post-date">' . date('jS M Y', strtotime($v['articleLiveDate'])) . '</p></div>
                        <a href="/article.php?article=' . $v['articleUrlSlug'] . '" class="_hidden" title="' . $v['articleTitle'] . '">&#32;</a>
                    </article>
                ';
                } else {
                    exit;
                }
                // Lets loop again...
                $limitList++;
            }
            ?>
        </section>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>