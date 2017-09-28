<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = enable;

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');

	$pageDesc = $c->getAttribute('meta_description');
	$pageURL = $c->getCollectionPath();

	$img = $c->getAttribute('thumbnail');
	if ($img) {
		$thumb = $ih->getThumbnail($img, 1440, 250, array('crop'=>true, 'quality'=>40));
		$tagSrc = $thumb->src;
	}
?>
<?php include('inc/body.php'); ?>
<header class="main page-oversize">
	<div class="bkgrnd-img" style="background-image:url('<?php echo $tagSrc; ?>');"></div>
	<section class="navigation-wrap">
		<div class="cols">
			<div class="col branding">
				<a href="<?php echo DIR_REL?>/" style="border:0;" title="Back to the start">
					<img src="<?php echo $view->getThemePath()?>/img/brnd/chriswatterston-logo.svg" class="logo" />
				</a>
			</div>
			<div class="col navigation">
				<nav class="main">
					<?php
						$hmn = Stack::getByName('Header Navigation');
						$hmn->display();
					?>
				</nav>
			</div>
		</div>
	</section>
	<section class="introduction-wrap">
		<div class="intro type-center">
			<?php
				$mttc = new Area('Title Content');
				$mttc->display($c);
			?>
		</div>
	</section>
</header>
<section class="body page-oversize">
	<section class="services-wrap">
		<div class="service-section featured">
			<div class="service-header">
				<h1 class="main-heading colour-blue-dark type-uppercase">
					<strong>Featured Product.</strong> Picked especially so you don't miss out.
				</h1>
			</div>
			<div class="service-desc">
				<div class="bkgrnd-grad"></div>
				<div class="bkgrnd-pixel-white"></div>
				<div class="content">
					<?php
						$mfca = new Area('Main Feature Area');
					  $mfca->display($c);
					?>
				</div>
			</div>
		</div>
		<div class="service-section full">
			<div class="service-desc">
				<div class="content store-list">
					<?php
						$mbco = new Area('Main Body');
						$mbco->display($c);
					?>
				</div>
			</div>
		</div>
	</section>
</section>
<?php include('inc/footer.php'); ?>
