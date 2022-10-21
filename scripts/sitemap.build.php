<?php
include_once(__DIR__ . '/../config/php.debug.php');
include_once(__DIR__ . '/../config/funcs.global.php');

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- BUILD SITEMAP ----------
// ----------
// ----------
//
// Create an object of the generator class passing the config file
$build = new SitemapGenerator(include(__DIR__ . '/../config/sitemap.global.php'));
// Run the generator
$build->GenerateSitemap();
