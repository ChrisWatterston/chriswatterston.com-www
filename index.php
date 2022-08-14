<?
// Local config
$localMetaTitle = 'Hey, I\m Chris Watterston';
$localMetaDesc = 'This is my page desc, it will be unique for each page';
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
            <article class="<?= $globalPrefix; ?>-card-container">
                <div class="__type">
                    <h5>Latest Post</h5>
                </div>
                <div class="__title">
                    <h6>'There is no Cloud' turns NFT. How and why I'm making the design available again</h6>
                </div>
                <div class="__posted"><span>25th Jan 2022</span></div>
            </article>
        </section>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>