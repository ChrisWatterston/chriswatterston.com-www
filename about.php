<?
// Local config
$localMetaTitle = 'About';
$localMetaDesc = 'I am still building this page, check back soon!';
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
            <section class="<?= $globalPrefix; ?>-intro-container _title _text-align__center">
                <h1 class="_black _stacked"><?php echo $localMetaTitle; ?></h1>
            </section>
            <article class="<?= $globalPrefix; ?>-article-container _exc-padding _max-width__1000">
                <div class="__content">
                    <section class="<?= $globalPrefix; ?>-grid-container _column-about _about-body-aboutme">
                        <div class="_sub-title">
                            <h3>About Me</h3>
                        </div>
                        <div class="_sub-detail">
                            <p>My name is Chris Watterston. I'm a Digital Product Manager based just outside of London (UK), with a strong background in digital design and web development.</p>
                            <p>I'm passionate about digital product design and architecture, design, development, and product growth. When it comes to digital products- I care a ton about how they look and function, grow with meaning, and teach us learnings.</p>
                            <p>I also enjoy spending time with family and friends, stepping outdoors, and trying to find the time for kite boarding. Although with 3 kids, finding that time is near impossible.</p>
                        </div>
                    </section>
                    <section class="<?= $globalPrefix; ?>-grid-container _column-about _about-body-contacting">
                        <div class="_sub-title">
                            <h3>Contacting</h3>
                        </div>
                        <div class="_sub-detail">
                            <p>Emailing me directly at <a href="mailto:hello@chriswatterston.com" title="Email Chris Watterston" class="_link-colour__purple">hello@chriswatterston.com</a> is the best way to reach out to me.</p>
                            <p>Alternatively, you can call or message (inc. WhatsApp) me on <a href="tel:+44757563815" title="Call Chris Watterston" class="_link-colour__purple">(+44) 07515 163815</a>.</p>
                        </div>
                    </section>
                    <section class="<?= $globalPrefix; ?>-grid-container _column-about _about-body-social">
                        <div class="_sub-title">
                            <h3>Social</h3>
                        </div>
                        <div class="_sub-detail">
                            <p>
                                <a href="https://github.com/ChrisWatterston" target="_blank" title="Visit Chris Watterston's Github Profile" class="_about-social-icons">
                                    <img src="/dist/images/icons/icon-github-black.svg" alt="GitHub" />
                                </a>
                                <a href="https://twitter.com/chriswatterston" target="_blank" title="Visit Chris Watterston's Twitter Profile" class="_about-social-icons">
                                    <img src="/dist/images/icons/icon-twitter-black.svg" alt="Twitter" />
                                </a>
                                <a href="https://www.linkedin.com/in/chriswatterston/" target="_blank" title="Visit Chris Watterston's LinkedIn Profile" class="_about-social-icons">
                                    <img src="/dist/images/icons/icon-linkedin-black.svg" alt="LinkedIn" />
                                </a>
                                <a href="https://www.figma.com/@chriswatterston" target="_blank" title="Visit Chris Watterston's Figma Profile" class="_about-social-icons">
                                    <img src="/dist/images/icons/icon-figma-black.svg" alt="Figma" />
                                </a>
                                <a href="https://dribbble.com/chriswatterston" target="_blank" title="Visit Chris Watterston's Dribbble Profile" class="_about-social-icons">
                                    <img src="/dist/images/icons/icon-dribbble-black.svg" alt="Dribbble" />
                                </a>
                            </p>
                        </div>
                    </section>
                    <section class="<?= $globalPrefix; ?>-grid-container _column-about _about-body-experience">
                        <div class="_sub-title">
                            <h3>Experience</h3>
                        </div>
                        <div class="_sub-detail">
                            <div class="<?= $globalPrefix; ?>-grid-container _stat-headline">
                                <div class="_icon" style="background-image: url(/dist/images/brands/logo-experience-suntory-gbi.jpg);"></div>
                                <div class="_stats">
                                    <h2>Senior Developer & Digital Projects Manager</h2>
                                    <h5>Suntory Beverage & Food GB&I</h5>
                                    <p class="_post-date">March 2018 - Present (Remote + Uxbridge)</p>
                                </div>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum velit vel risus posuere, eget pharetra enim finibus. Pellentesque non felis eu mi interdum congue. Cras placerat odio vel felis venenatis, et varius enim cursus. Etiam ut ultrices dolor.</p>
                            <p>Duis ut metus nibh. Quisque egestas efficitur magna, vel aliquam odio hendrerit et. Aenean sodales nibh urna, ac iaculis augue faucibus quis. Nulla tincidunt ligula eu mi bibendum sagittis. Phasellus sollicitudin aliquam velit, sed venenatis mi tristique ut. Maecenas a nisi venenatis, finibus lorem ac, volutpat ligula. Fusce egestas sagittis metus, a lobortis magna venenatis et.</p>

                            <div class="<?= $globalPrefix; ?>-grid-container _stat-headline">
                                <div class="_icon" style="background-image: url(/dist/images/brands/logo-experience-basicsss-app.jpg);"></div>
                                <div class="_stats">
                                    <h2>Founder, CEO + Co. (Side Project)</h2>
                                    <h5>Basicsss.app</h5>
                                    <p class="_post-date">June 2022 - Present (Remote)</p>
                                </div>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum velit vel risus posuere, eget pharetra enim finibus. Pellentesque non felis eu mi interdum congue. Cras placerat odio vel felis venenatis, et varius enim cursus. Etiam ut ultrices dolor.</p>
                            <p>Duis ut metus nibh. Quisque egestas efficitur magna, vel aliquam odio hendrerit et. Aenean sodales nibh urna, ac iaculis augue faucibus quis. Nulla tincidunt ligula eu mi bibendum sagittis. Phasellus sollicitudin aliquam velit, sed venenatis mi tristique ut. Maecenas a nisi venenatis, finibus lorem ac, volutpat ligula. Fusce egestas sagittis metus, a lobortis magna venenatis et.</p>

                            <div class="<?= $globalPrefix; ?>-grid-container _stat-headline">
                                <div class="_icon" style="background-image: url(/dist/images/brands/logo-experience-chris-watterston.jpg);"></div>
                                <div class="_stats">
                                    <h2>Web & Mobile Designer and Developer</h2>
                                    <h5>Freelance</h5>
                                    <p class="_post-date">Sept 2013 - Jan 2021 (Remote + On-site)</p>
                                </div>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum velit vel risus posuere, eget pharetra enim finibus. Pellentesque non felis eu mi interdum congue. Cras placerat odio vel felis venenatis, et varius enim cursus. Etiam ut ultrices dolor.</p>
                            <p>Duis ut metus nibh. Quisque egestas efficitur magna, vel aliquam odio hendrerit et. Aenean sodales nibh urna, ac iaculis augue faucibus quis. Nulla tincidunt ligula eu mi bibendum sagittis. Phasellus sollicitudin aliquam velit, sed venenatis mi tristique ut. Maecenas a nisi venenatis, finibus lorem ac, volutpat ligula. Fusce egestas sagittis metus, a lobortis magna venenatis et.</p>

                            <div class="<?= $globalPrefix; ?>-grid-container _stat-headline">
                                <div class="_icon" style="background-image: url(/dist/images/brands/logo-experience-st-pauls-catholic-college.jpg);"></div>
                                <div class="_stats">
                                    <h2>Web Design & Development Manager</h2>
                                    <h5>St Paul's Catholic College</h5>
                                    <p class="_post-date">Oct 2008 - Sept 2013 (Sunbury)</p>
                                </div>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum velit vel risus posuere, eget pharetra enim finibus. Pellentesque non felis eu mi interdum congue. Cras placerat odio vel felis venenatis, et varius enim cursus. Etiam ut ultrices dolor.</p>

                            <div class="<?= $globalPrefix; ?>-grid-container _stat-headline">
                                <div class="_icon" style="background-image: url(/dist/images/brands/logo-experience-cd-surveys.jpg);"></div>
                                <div class="_stats">
                                    <h2>Junior Surveyor & CAD Operator</h2>
                                    <h5>CD Surveys Ltd</h5>
                                    <p class="_post-date">2007 - 2008 (Godalming)</p>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

            </article>
        </section>

        <? include_once($_SERVER['DOCUMENT_ROOT'] . '/inc/footer.global.php'); ?>
    </div>
</body>

</html>