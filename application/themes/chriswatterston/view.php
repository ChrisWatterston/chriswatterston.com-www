<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = false;
?>

<header class="main">
	<section class="navigation-wrap">
		<div class="cols">
			<div class="col branding">
				logo
			</div>
			<div class="col navigation">
				<nav class="main">
					nav
				</nav>
			</div>
		</div>
	</section>
	<section class="introduction-wrap">
		<div class="intro">
			intro
		</div>
	</section>
	<section class="latestupdates-wrap">
		<div class="contain">
			<div class="cols">
				<div class="col latest">
					latest posts
				</div>
			</div>
		</div>
	</section>
</header>

<section class="body">
	<section class="feed-wrap">
		<div class="feed-header">
			<h2>Heading</h2>
			<p>introduction</p>
		</div>
		<div class="feed-body">
			feed
		</div>
		<div class="feed-footer">
			footer
		</div>
	</section>
</section>

<?php include('inc/footer.php'); ?>
