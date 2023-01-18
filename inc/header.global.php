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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />
<meta content="True" name="HandheldFriendly" />
<meta name="googlebot" content="index,follow" />
<meta name="robots" content="index,follow" />

<title><?= $localMetaTitle; ?></title>
<meta name="description" content="<?= $localMetaDesc; ?>" />
<meta name="keywords" content="<?= $localMetaKeywords; ?>" />

<!-- Canonical details  -->
<?php
$a = ($_SERVER['REQUEST_URI']);
$t = trim($a, ".php");
$d = rtrim($t, '/') . '';
$canonicalURL = substr($globalDomainRoot, 0, -1) . $d;
?>
<link rel="canonical" href="<?= $canonicalURL ?>" />

<link type="text/css" rel="stylesheet" href="<?= $globalDomainRoot; ?>dist/css/chriswatterston-www.min.css" />
<link rel="apple-touch-icon" href="<?= $globalDomainRoot; ?>dist/images/device/apple-touch-icon.png">
<link rel="icon" href="<?= $globalDomainRoot; ?>favicon.ico" />
<link rel="shortcut icon" href="<?= $globalDomainRoot; ?>favicon.ico" />
<meta property="og:type" content="website" />

<!-- Sharing details  -->
<meta property="og:url" content="<?= $globalDomainRoot; ?>" />
<meta property="og:title" content="<?= $localMetaTitle; ?>" />
<meta property="og:description" content="<?= $localMetaDesc; ?>" />

<!-- Libraries -->
<style>
    @import url('https://fonts.googleapis.com/css2?family=Khula:wght@300;400;600;800&display=swap');
</style>

<!-- Schema Data -->
<script type="application/ld+json">
    {
        "@context": "http://schema.org",
        "@type": "Person",
        "familyName": "Watterston",
        "givenName": "Chris",
        "worksFor": "https://www.chriswatterston.com/",
        "jobTitle": "Digital Product Designer & Manager",
        "image": "https://www.chriswatterston.com/dist/images/id/chris-watterston-self-photo.jpg",
        "gender": "http://schema.org/Male",
        "sameAs": ["https://twitter.com/chriswatterston", "https://www.linkedin.com/in/chriswatterston/", "https://github.com/ChrisWatterston"]
    }
</script>