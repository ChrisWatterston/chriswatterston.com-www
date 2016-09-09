<!DOCTYPE html>
<html lang="en-GB">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<?php Loader::element('header_required'); ?>
<link rel="stylesheet" type="text/css" href="<?php echo $view->getThemePath()?>/css/core.css" />
<script type="text/javascript" src="<?=ASSETS_URL_JAVASCRIPT?>/jquery.js"></script>
<link rel="shortcut icon" href="<?php echo $view->getThemePath()?>/img/ico/icon-32x32.png" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/ico/icon-114x114.png" sizes="114x114" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/ico/icon-72x72.png" sizes="72x72" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/ico/icon-57x57.png" />
<script src="//use.typekit.net/aut5day.js"></script>
<script>try{Typekit.load();}catch(e){}</script>
<!--[if lt IE 9]>
	<script src="/js/html5shiv-printshiv.js"></script>
<![endif]-->
<script>
var _prum = [['id', '55842366abe53dab7041a5a4'],
             ['mark', 'firstbyte', (new Date()).getTime()]];
(function() {
    var s = document.getElementsByTagName('script')[0]
      , p = document.createElement('script');
    p.async = 'async';
    p.src = '//rum-static.pingdom.net/prum.min.js';
    s.parentNode.insertBefore(p, s);
})();
</script>
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');

fbq('init', '1673334912907615');
fbq('track', "PageView");
fbq('track', 'ViewContent');
fbq('track', 'Lead');
</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1673334912907615&ev=PageView&noscript=1"/></noscript>
</head>
<body>
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-NPMWMJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NPMWMJ');</script>
<!--[if lte IE 8]>
<p class="ie-upgrade">Your internet browser is outdated, for which an <a href="http://updatemybrowser.org/" title="Browsercheck - Update my browser" target="_blank">update is highly recommended</a>&#33; Not doing so will cause visible and security issues while using the internet.</p>
<style>header.main {margin-top:50px;</style>
<![endif]-->
<div id="cw-wrap" class="<?php echo $c->getPageWrapperClass()?>">
	<header class="main">
		<div class="cntr">
			<div class="flt">
				<div class="lft-hlf">
					<div class="logo align-left">
						<a href="<?php echo DIR_REL?>/" title="Home"><img class="brnd" src="<?php echo $view->getThemePath()?>/img/brnd/chriswatterstondesigns-logo.png" width="80px" height="80px" align="left" alt="Chris Watterston, Branding - Website - Development" /></a>
						<h1>Chris Watterston</h1><p class="desc">Branding - Website - Development</p>
					</div>
				</div>
				<div class="rgt-hlf">
					<nav class="main align-right">
						<span class="resp-nav"><a href="javascript:void(0);" title="Navigation">&#149;&#149;&#149;</a></span>
						<?php
						    $bt_main = BlockType::getByHandle('autonav');
						    $bt_main->controller->displayPages = 'top';
						    $bt_main->controller->orderBy = 'display_asc';
						    $bt_main->controller->displaySubPages = 'none';
						    $bt_main->render('templates/level1');
						?>
						<p><a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#104;&#101;&#108;&#108;&#111;&#064;&#099;&#104;&#114;&#105;&#115;&#119;&#097;&#116;&#116;&#101;&#114;&#115;&#116;&#111;&#110;&#046;&#099;&#111;&#109;" class="email">hello@chriswatterston.com</a></p>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="split"></div>