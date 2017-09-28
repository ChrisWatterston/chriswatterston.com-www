<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<!DOCTYPE html>
<html class="no-js" lang="en-GB">
<head>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-12746728-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments)};
  gtag('js', new Date());
  gtag('config', 'UA-12746728-1');
</script>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" type="text/css" href="<?php echo $view->getThemePath()?>/css/core.css" />
<script src="https://use.typekit.net/aut5day.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<?php
  $metaTitle = $c->getCollectionAttributeValue('meta_title');
  if ($metaTitle) $pageTitle = $metaTitle.' - Chris Watterston';
  if (!$pageTitle)
  {
      $siteName = h(\Config::get('concrete.site'));
      $collentionName = $c->getCollectionName();

      $isRoot = null;
      $trail = $nh->getTrailToCollection($c);
      if (is_array($trail) && count($trail) > 1) {
          $count = count($trail);
          array_splice($trail, $count - 1);
          $deptC = array_pop($trail);
          $deptName = h($deptC->getCollectionName());
      } else {
          $isRoot = true;
      }
      if ($isRoot) {
          $pageTitle = $collentionName . ' - ' . $siteName;
      } else {
          $pageTitle = $collentionName . ' | ' . $deptName . ' - ' . $siteName;
      }
  }

  $thisPageDescription = $c->getAttribute('meta_description');
  if (!$thisPageDescription) $thisPageDescription = $c->getCollectionDescription();
  if ($thisPageDescription) $pageDescription = $thisPageDescription;

  $thisPageMetaKeywords = $c->getAttribute('meta_keywords');
  if ($thisPageMetaKeywords) $pageMetaKeywords = $thisPageMetaKeywords;

	View::element('header_required', [
      'pageTitle' => $pageTitle,
	    // 'pageTitle' => isset($pageTitle) ? $pageTitle : '',
	    'pageDescription' => isset($pageDescription) ? $pageDescription : '',
	    'pageMetaKeywords' => isset($pageMetaKeywords) ? $pageMetaKeywords : ''
	]);

	$this->requireAsset('javascript', 'jquery');
?>
<link rel="shortcut icon" href="<?php echo $view->getThemePath()?>/img/icns/icon-32x32.png" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/icns/icon-114x114.png" sizes="114x114" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/icns/icon-72x72.png" sizes="72x72" />
<link rel="apple-touch-icon-precomposed" href="<?php echo $view->getThemePath()?>/img/icns/icon-57x57.png" />
<script type="text/javascript" src="<?php echo $view->getThemePath()?>/js/slidenavigation.min.js"></script>
<script>function isTouchDevice(){return true == ("ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch);}if(isTouchDevice()===true){$('html').addClass('dev-touch');}else{$('html').addClass('dev-no-touch');}</script>
<?php
	$u = new User();
	if($u->isLoggedIn()) {} else {
?>
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
<?php } ?>
</head>
<body>
<!--[if lte IE 8]><p class="ie-upgrade">Your internet browser is outdated, for which an <a href="http://updatemybrowser.org/" title="Browsercheck - Update my browser" target="_blank">update is highly recommended</a>&#33;<br />Not doing so will cause visible issues while viewing our website, and leave you vulnerable to security threats throughout the internet.</p></p><![endif]-->
<div id="cw-wrap" class="<?php echo $c->getPageWrapperClass()?>">
