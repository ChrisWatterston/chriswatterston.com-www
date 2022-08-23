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

        <section class="<?= $globalPrefix; ?>-stream-container">
            <?php
            //
            // ------------------------------------------------------------
            // ------------------------------------------------------------
            // ------------------------------------------------------------
            // ---------- OUTPUT ALL POSTS ----------
            // ----------
            // ----------
            //
            $jsonContentOutput = json_decode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/data/contentful.blog.json'), true);
            foreach ($jsonContentOutput['items'] as $k => $v) {
                echo '
                    <article class="' . $globalPrefix . '-card-container" data-content-id="' . $v['sys']['id'] . '" data-content-count=' . $limitList . '>
                        <div class="__type _text-align__right">
                            <h5>Latest Post</h5>
                        </div>
                        <div class="__title _text-align__right">
                            <h6>' . $v['fields']['articleTitle'] . '</h6>
                        </div>
                        <div class="__posted _text-align__right"><p class="_post-date">' . date('jS M Y', strtotime($v['fields']['articleLiveDate'])) . '</p></div>
                        <a href="/article.php?article=' . $v['fields']['articleUrlSlug'] . '" class="_hidden" title="' . $v['fields']['articleTitle'] . '">&#32;</a>
                    </article>
                ';
                // Lets loop again...
                $limitList++;
            }
            ?>
        </section>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>