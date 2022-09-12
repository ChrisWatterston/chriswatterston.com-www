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
        $articleUpdateDate = $v['articleUpdateDate'];
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

        // // EMBEDDED IMAGE - Search and build embed block
        // $searchInsta = '<p>[image-embedded]</p>';
        // $instaPartA = '123';
        // if (str_contains($articleBody, $searchInsta)) {
        //     $articleBody = str_replace("<p>[image-embedded]</p>", $instaPartA, "$articleBody");
        // }
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
    <meta property="og:image" content="<?php echo $articleHeroImageUrl; ?>" />
    <? include_once($_SERVER['DOCUMENT_ROOT'] . '/config/analytics.global.php'); ?>
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

            if ($articleUpdateDate !== null) {
                echo '
                    <p class="_post-date _max-width__700">
                        Published on ' . date('jS M Y', strtotime($articleLiveDate)) . ' - 
                        <span>Updated on ' . date('jS M Y', strtotime($articleUpdateDate)) . '</span>
                    </p>
                ';
            } else {
                echo '
                    <p class="_post-date _max-width__700">
                        Published on ' . date('jS M Y', strtotime($articleLiveDate)) . '
                    </p>
                ';
            }

            echo '
                    <h1 class="_black _max-width__700">' . $articleTitle . '</h1>
                    <p class="_article-desc _max-width__700">' . $articleDescription . '</p>
                    <img src="' . $articleHeroImageUrl . '" title="' . $articleHeroImageTitle . '" />
                    <p class="_image-caption">' . $articleHeroImageTitle . '</p>
                    <div class="_article-body _max-width__700">
                    ' . $articleBody . '
                    </div>
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
                    // foreach ($v['workRoleTags'] as $t) {
                    //     echo '<span class="__role-tag">' . $t . '</span>';
                    // }
                    echo '
                                </p>
                            </div>
                            <a href="/work/case-study/' . $v['workUrlSlug'] . '" class="_hidden" title="' . $v['workTitle'] . '">&#32;</a>
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
                        <a href="/article/' . $v['articleUrlSlug'] . '" class="_hidden" title="' . $v['articleTitle'] . '">&#32;</a>
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