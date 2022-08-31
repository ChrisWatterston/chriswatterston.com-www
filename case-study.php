<?
include_once($_SERVER['DOCUMENT_ROOT'] . '/config/funcs.global.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/config/keys.contentful.php');

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- OUTPUT SELECTED WORK ----------
// ----------
// ----------
//
$jsonContentOutput = json_decode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/data/contentful.work.json'), true);
$workID = $_GET['work'];
// Output content
foreach ($jsonContentOutput as $k => $v) {
    if ($v['workUrlSlug'] == $workID) {
        $workHeroImageUrl = $v['workHeroImage']['fields']['file']['url'];
        $workHeroImageTitle = $v['workHeroImage']['fields']['title'];
        $workTitle = $v['workTitle'];
        $workDescription = $v['workDescription'];
        $workLiveDate = $v['workLiveDate'];
        $workUpdateDate = $v['workUpdateDate'];
        $workBodyIntro = $v['workBodyIntro'];
        $workBodyObjective = $v['workBodyObjective'];
        $workBodyMyRole = $v['workBodyMyRole'];
        $workBodyPartners = $v['workBodyPartners'];
        $workMetricsEntriesNumber = $v['workMetricsEntriesNumber'];
        $workMetricsUniqueNumber = $v['workMetricsUniqueNumber'];
        $workMetricsWinnerNumber = $v['workMetricsWinnerNumber'];
        $workMetricsDescription = $v['workMetricsDescription'];
        $workBodyLearnings = $v['workBodyLearnings'];
        $workImageGallery = $v['workImageGallery'];
        $workRoleTags = $v['workRoleTags'];
    }
}

// Local config
$localMetaTitle = $workTitle . ' - Chris Watterston';
$localMetaDesc = $workDescription;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/header.global.php'); ?>
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/config/analytics.global.php'); ?>

    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css" />
    <script>
        Fancybox.bind('[data-fancybox="gallery"]', {
            dragToClose: false,
            Toolbar: false,
            closeButton: "top",
            Image: {
                zoom: false,
            },
            on: {
                initCarousel: (fancybox) => {
                    const slide = fancybox.Carousel.slides[fancybox.Carousel.page];

                    fancybox.$container.style.setProperty(
                        "--bg-image",
                        `url("${slide.$thumb.src}")`
                    );
                },
                "Carousel.change": (fancybox, carousel, to, from) => {
                    const slide = carousel.slides[to];

                    fancybox.$container.style.setProperty(
                        "--bg-image",
                        `url("${slide.$thumb.src}")`
                    );
                },
            },
        });
    </script>
</head>

<body>
    <div class="<?= $globalPrefix; ?>-body-container _free">
        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/nav.global.php'); ?>

        <article class="<?= $globalPrefix; ?>-article-container _inc-stream _max-width__1000">
            <?php
            // Output content
            echo '
                <div class="__content _image-reverse">
            ';

            if ($workUpdateDate !== null) {
                echo '
                    <p class="_post-date _max-width__700">
                        Published on ' . date('jS M Y', strtotime($workLiveDate)) . ' - 
                        <span>Updated on ' . date('jS M Y', strtotime($workUpdateDate)) . '</span>
                    </p>
                ';
            } else {
                echo '
                    <p class="_post-date _max-width__700">
                        Published on ' . date('jS M Y', strtotime($workLiveDate)) . '
                    </p>
                ';
            }

            echo '
                    <h1 class="_black _max-width__700">' . $workTitle . '</h1>
                    <p class="_work-desc _max-width__700">' . $workDescription . '</p>
                    <img src="' . $workHeroImageUrl . '" title="' . $workHeroImageTitle . '" />
                    <p class="_image-caption">' . $workHeroImageTitle . '</p>
                    <div class="_work-body-intro _max-width__700">
                    ' . $workBodyIntro . '
                    </div>
                ';
            echo '
                    <section class="' . $globalPrefix . '-grid-container _column-about _work-body-objective">
                        <div class="_sub-title">
                            <h3>Objective</h3>
                        </div>
                        <div class="_sub-detail">
                            ' . $workBodyObjective . '
                        </div>
                    </section>
                    <section class="' . $globalPrefix . '-grid-container _column-about _work-body-role">
                        <div class="_sub-title">
                            <h3>My Role</h3>
                        </div>
                        <div class="_sub-detail">
                            ' . $workBodyMyRole . '
                            <p class="_post-date">
                    ';
            foreach ($workRoleTags as $t) {
                echo '<span class="__role-tag">' . $t . '</span>';
            }
            echo '
                                </p>
                        </div>
                    </section>
                    <section class="' . $globalPrefix . '-grid-container _column-about _work-body-partners">
                        <div class="_sub-title">
                            <h3>Partners</h3>
                        </div>
                        <div class="_sub-detail">
                            ' . $workBodyPartners . '
                        </div>
                    </section>
                    <section class="' . $globalPrefix . '-grid-container _column-about _work-body-metric-num">
                        <div class="_sub-title">
                            <h3>Metrics</h3>
                        </div>
                        <div class="_sub-detail">
                            <div class="' . $globalPrefix . '-grid-container _stat-headline">
                                <div class="_icon"></div>
                                <div class="_stats">
                                    <h2>' . formatNumber($workMetricsEntriesNumber) . '</h2>
                                    <h5>Entries</h5>
                                </div>
                            </div>
                            <div class="' . $globalPrefix . '-grid-container _stat-headline">
                                <div class="_icon"></div>
                                <div class="_stats">
                                    <h2>' . formatNumber($workMetricsUniqueNumber) . '</h2>
                                    <h5>Unique</h5>
                                </div>
                            </div>
                            <div class="' . $globalPrefix . '-grid-container _stat-headline">
                                <div class="_icon"></div>
                                <div class="_stats">
                                    <h2>' . formatNumber($workMetricsWinnerNumber) . '</h2>
                                    <h5>Winners</h5>
                                </div>
                            </div>
                            <br />
                            ' . $workMetricsDescription . '
                        </div>
                    </section>
                    <section class="' . $globalPrefix . '-grid-container _column-about _work-body-learnings">
                        <div class="_sub-title">
                            <h3>Learnings</h3>
                        </div>
                        <div class="_sub-detail">
                            ' . $workBodyLearnings . '
                        </div>
                    </section>
                    <section class="' . $globalPrefix . '-grid-container _column-about _work-body-gallery">
                        <div class="_sub-title">
                            <h3>Gallery</h3>
                        </div>
                        <div class="_sub-detail">
                            <div class="' . $globalPrefix . '-grid-container _column-3 __gallery _work">
                    ';
            foreach ($workImageGallery as $gi) {
                $galleryImageUrl = $gi['fields']['file']['url'];
                $galleryImageTitle = $gi['fields']['title'];
                $galleryImageDesc = $gi['fields']['description'];
                echo '
                                <a data-fancybox="gallery" href="' . $galleryImageUrl . '" data-caption="<p>' . $galleryImageDesc . '</p>">
                                    <img src="' . $galleryImageUrl . '" title="' . $galleryImageTitle . '" />
                                </a>
                ';
            }
            echo '  
                            </div>
                        </div>
                    </section>
                </div>
                ';
            ?>
        </article>
        <article class="<?= $globalPrefix; ?>-article-container _max-width__1280">
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
                    foreach ($v['workRoleTags'] as $t) {
                        echo '<span class="__role-tag">' . $t . '</span>';
                    }
                    echo '
                                </p>
                            </div>
                            <a href="/case-study.php?work=' . $v['workUrlSlug'] . '" class="_hidden" title="' . $v['workTitle'] . '">&#32;</a>
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
                        <a href="/article.php?article=' . $v['articleUrlSlug'] . '" class="_hidden" title="' . $v['articleTitle'] . '">&#32;</a>
                    </article>
                ';
                }
                ?>
            </div>
        </article>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>