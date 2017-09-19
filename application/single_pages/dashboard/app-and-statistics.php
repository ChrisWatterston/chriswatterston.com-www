<?php
	defined('C5_EXECUTE') or die("Access Denied.");
		
	$dashboard = "application/single_pages/dashboard/app-and-statistics/statistics-web.php";
	include $dashboard;
		
	echo Loader::helper('concrete/dashboard')->getDashboardPaneFooterWrapper();
?>