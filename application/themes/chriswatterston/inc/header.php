<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<!DOCTYPE html>
<html class="no-js" lang="en-GB">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" type="text/css" href="<?php echo $view->getThemePath()?>/css/core.css" />
<script src="https://use.typekit.net/aut5day.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<?php
	View::element('header_required', [
	    'pageTitle' => isset($pageTitle) ? $pageTitle : '',
	    'pageDescription' => isset($pageDescription) ? $pageDescription : '',
	    'pageMetaKeywords' => isset($pageMetaKeywords) ? $pageMetaKeywords : ''
	]);
	$this->requireAsset('javascript', 'jquery');
?>
<link rel="shortcut icon" href="<?php echo $view->getThemePath()?>/img/icns/icon-32x32.png" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/icns/icon-114x114.png" sizes="114x114" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/icns/icon-72x72.png" sizes="72x72" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/icns/icon-57x57.png" />
<meta property="og:site_name" content="Lamington London" />
<meta property="og:title" content="Printed shirts. Silky tees. Luxe tops."/>
<meta property="og:description" content="LAMINGTON London shirts celebrate 'color & pattern' with a single minded focus, dedicated to creating the perfect range of casual women’s shirts to wear with your denim" />
<meta property="og:image" content="/img/lamington-social-fb.jpg">
<meta property="og:url" content="http://www.chriswatterston.com/">
<meta property="og:type" content="product"/>
<script type="text/javascript" src="<?php echo $view->getThemePath()?>/js/slidenavigation.min.js"></script>
<script>function isTouchDevice(){return true == ("ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch);}if(isTouchDevice()===true){$('html').addClass('dev-touch');}else{$('html').addClass('dev-no-touch');}</script>
</head>
<body>
<!--[if lte IE 8]><p class="ie-upgrade">Your internet browser is outdated, for which an <a href="http://updatemybrowser.org/" title="Browsercheck - Update my browser" target="_blank">update is highly recommended</a>&#33;<br />Not doing so will cause visible issues while viewing our website, and leave you vulnerable to security threats throughout the internet.</p></p><![endif]-->
<div id="cw-wrap" class="<?php echo $c->getPageWrapperClass()?>">
