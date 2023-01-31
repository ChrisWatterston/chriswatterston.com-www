<?
// Local config
$localMetaTitle = 'Thoughts, Ideas & Expressions. Simple Words from a Digital Product Designer & Manager';
$localMetaDesc = 'Writing about areas of interest and learnings from a Digital Product Designer. But may also cover development, outdoors, nature and adventures';
$localMetaKeywords = 'digital product design blog, blog about digital product design field and processes, web tech blog and articles';
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

        <section class="<?= $globalPrefix; ?>-stream-container _listing _max-width__1280">
            <section class="<?= $globalPrefix; ?>-intro-container _title _text-align__center">
                <h1 class="_black _stacked">Blog</h1>
            </section>
            <div class="<?= $globalPrefix; ?>-grid-container _column-3 _listing">
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
                foreach ($jsonContentOutput as $k => $v) {
                    echo '
                    <article class="' . $globalPrefix . '-card-container _listing">
                        <div class="__type">
                            <div class="__thumb" style="background-image:url(' . $v['articleHeroImage']['fields']['file']['url'] . ');" data-image-title="' . $v['articleHeroImage']['fields']['title'] . '"></div>
                        </div>
                        <div class="__title _text-align__right">
                            <h3>' . $v['articleTitle'] . '</h3>
                            <h6>' . $v['articleDescription'] . '</h6>
                        </div>
                        <div class="__posted _text-align__right"><p class="_post-date">' . date('jS M Y', strtotime($v['articleLiveDate'])) . '</p></div>
                        <a href="/article/' . $v['articleUrlSlug'] . '" data-cabin-event="Listing / Article" class="_hidden" title="' . $v['articleTitle'] . '">&#32;</a>
                    </article>
                ';
                }
                ?>
            </div>
        </section>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>