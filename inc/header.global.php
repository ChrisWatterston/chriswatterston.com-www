<?php
// Debug
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/php.debug.php');
// Headers
header("X-Robots-Tag: index, follow", true);
date_default_timezone_set('Europe/London');
// Generic
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/vars.global.php');
?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta content="True" name="HandheldFriendly" />
<meta name="googlebot" content="index,follow" />
<meta name="robots" content="index,follow" />

<title><?php echo $localMetaTitle; ?></title>
<meta name="description" content="<?php echo $localMetaTitle; ?>" />

<link type="text/css" rel="stylesheet" href="<?php echo $globalDomainRoot; ?>dist/css/chriswatterston-www.min.css" />
<link rel="apple-touch-icon" href="<?php echo $globalDomainRoot; ?>dist/images/device/apple-touch-icon.png">
<link rel="icon" href="<?php echo $globalDomainRoot; ?>favicon.ico" />
<link rel="shortcut icon" href="<?php echo $globalDomainRoot; ?>favicon.ico" />
<meta property="og:type" content="website" />
<meta property="og:image" content="<?php echo $globalDomainRoot; ?>dist/images/share/shared-chris-watterston.jpg" />

<!-- Sharing details  -->
<meta property="og:url" content="<?php echo $globalDomainRoot; ?>/PAGE-LINK" />
<meta property="og:title" content="<?php echo $localMetaTitle; ?>" />
<meta property="og:description" content="<?php echo $localMetaTitle; ?>" />

<!-- Libraries -->
<style>
    @import url('https://fonts.googleapis.com/css2?family=Khula:wght@300;400;600;800&display=swap');
</style>

<!-- PWA details -->
<!-- <meta name="theme-color" content="#0061A0" />
<link rel="manifest" href="<?php echo $globalDomainRoot; ?>manifest.json" />
<script>
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('./service-worker.js');
    };
</script> -->