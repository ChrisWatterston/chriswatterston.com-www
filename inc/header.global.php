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

<title><?php echo $localMetaTitle; ?></title>
<meta name="description" content="<?php echo $localMetaDesc; ?>" />

<link type="text/css" rel="stylesheet" href="<?php echo $globalDomainRoot; ?>dist/css/chriswatterston-www.min.css" />
<link rel="apple-touch-icon" href="<?php echo $globalDomainRoot; ?>dist/images/device/apple-touch-icon.png">
<link rel="icon" href="<?php echo $globalDomainRoot; ?>favicon.ico" />
<link rel="shortcut icon" href="<?php echo $globalDomainRoot; ?>favicon.ico" />
<meta property="og:type" content="website" />

<!-- Sharing details  -->
<meta property="og:url" content="<?php echo $globalDomainRoot; ?>" />
<meta property="og:title" content="<?php echo $localMetaTitle; ?>" />
<meta property="og:description" content="<?php echo $localMetaDesc; ?>" />

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
        "jobTitle": "Digital Project Manager",
        "image": "http://chriswatterston.com-www.dev-local/dist/images/brands/logo-experience-chris-watterston.jpg",
        "gender": "http://schema.org/Male",
        "sameAs": ["https://twitter.com/chriswatterston", "https://www.linkedin.com/in/chriswatterston/", "https://github.com/ChrisWatterston"]
    }
</script>