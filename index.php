<?
// Local config
$localMetaTitle = 'Agile & Visionary Digital Product Designer & Manager in London UK';
$localMetaDesc = 'Digital Product Designer & Manager, with a strong background in digital marketing, User Experience (UX), and Web Development';
$localMetaKeywords = 'Agile and Visionary Product Designer, London UK Digital Product Designer, London UK Digital Product Manager, Digital Design System Designer, Digital Marketing, Figma Designer, London UX Designer, Designer with web development experience, Chris Watterston, There is No Cloud Sticker, Digital Designer';
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

        <section class="<?= $globalPrefix; ?>-stream-container _listing _max-width__1280 ">
            <section class="<?= $globalPrefix; ?>-intro-container _intro _text-align__center">
                <h2 class="_green _stacked">Opportune</h2>
                <h2 class="_yellow _stacked">Research</h2>
                <h2 class="_purple _stacked">Design&Build</h2>
                <h2 class="_red _stacked">Launch</h2>
                <h2 class="_black _stacked">Test&Learn</h2>
                <h1 class="_intro">I'm an agile & visionary <a href="/about?utm_source=intro" title="Agile and visionary Digital Product Designer & Product Manager in London" class="_link-colour__purple">Digital Product Designer & Manager</a>,</h1>
                <h3 class="_intro">with a strong background in <a href="/about?utm_source=intro" title="background in Digital Marketing, User Experience (UX), and Web Development." class="_link-colour__purple">Digital Marketing, User Experience (UX), and Web Development.</a></h3>
            </section>
            <div class="<?= $globalPrefix; ?>-grid-container _work-latest _listing _work">
                <?php
                //
                // ------------------------------------------------------------
                // ------------------------------------------------------------
                // ------------------------------------------------------------
                // ---------- OUTPUT ALL WORK ----------
                // ----------
                // ----------
                //
                $jsonWorkOutput = json_decode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/data/contentful.work.json'), true);
                $a = 0;
                foreach ($jsonWorkOutput as $k => $v) {
                    $a++;
                    if ($a >= 3) break;
                    echo '
                        <article class="' . $globalPrefix . '-card-container _listing _work">
                            <div class="__type">
                                <div class="__thumb" style="background-image:url(' . $v['workHeroImage']['fields']['file']['url'] . ');" data-image-title="' . $v['workHeroImage']['fields']['title'] . '"></div>
                            </div>
                            <div class="__client" style="background-image:url(' . $v['workClientLogo']['fields']['file']['url'] . ');" data-image-title="' . $v['workClientLogo']['fields']['title'] . '"></div>
                            <div class="__group _text-align__right">
                                <h3>' . $v['workTitle'] . '</h3>
                                <h4>' . date('Y', strtotime($v['workLiveDate'])) . '</h4>
                                <p class="_post-date">
                    ';
                    // foreach ($v['workRoleTags'] as $t) {
                    //     echo '<span class="__role-tag">' . $t . '</span>';
                    // }
                    echo '
                                </p>
                            </div>
                            <a href="/work/case-study/' . $v['workUrlSlug'] . '?utm_source=home" class="_hidden" title="' . $v['workTitle'] . '">&#32;</a>
                        </article>
                    ';
                }
                ?>
            </div>
            <section class="<?= $globalPrefix; ?>-intro-container _title _text-align__center"></section>
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
                $jsonBlogOutput = json_decode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/data/contentful.blog.json'), true);
                $b = 0;
                foreach ($jsonBlogOutput as $k => $v) {
                    $b++;
                    if ($b > 3) break;
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
                        <a href="/article/' . $v['articleUrlSlug'] . '?utm_source=home" class="_hidden" title="' . $v['articleTitle'] . '">&#32;</a>
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