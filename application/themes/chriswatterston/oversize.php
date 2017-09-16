<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = enable;

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');

	$pageMeta = $c->getAttribute('meta_title');
	$pageName = $c->getCollectionName();
	$pageID = strtolower(str_replace(" ", "-", $pageName));
	$pageDesc = $c->getAttribute('meta_description');
	$pageURL = $c->getCollectionPath();

	$img = $c->getAttribute('thumbnail');
	if ($img) {
		$thumb = $ih->getThumbnail($img, 1440, 250, array('crop'=>true, 'quality'=>40));
		$tagSrc = $thumb->src;
	}
?>
<header class="main page-oversize">
	<div class="bkgrnd-img" style="background-image:url('<?php echo $tagSrc; ?>');"></div>
	<section class="navigation-wrap">
		<div class="cols">
			<div class="col branding">
				<img src="<?php echo $view->getThemePath()?>/img/brnd/chriswatterston-logo.svg" class="logo" />
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
			<!-- <h1 class="colour-white type-semibold type-uppercase"><?php if ($pageMeta) { echo $pageMeta; } else { echo $pageName; } ?></h1> -->
		</div>
	</section>
</header>
<section class="body page-oversize">
	<section class="services-wrap">
		<div class="service-section ecommerce">
			<div class="service-header">
				<h1 class="main-heading colour-shopify-dark type-uppercase">
					<strong>eCommerce.</strong> Your bespoke online shop becomes real.
				</h1>
			</div>
			<div class="service-desc">
				<div class="bkgrnd-grad"></div>
				<div class="bkgrnd-pixel-white"></div>
				<div class="content">
					<?php
						$meca = new Area('Main eCommerce Area');
					  $meca->display($c);
					?>
				</div>
			</div>
		</div>
		<div class="service-section mobileapp">
			<div class="service-header">
				<h1 class="main-heading colour-orange-dark type-uppercase">
					<strong>Mobile App.</strong> Enabling you to fluidly touch your ideas.
				</h1>
			</div>
			<div class="service-desc">
				<div class="bkgrnd-grad"></div>
				<div class="bkgrnd-pixel-white"></div>
				<div class="content">
					<?php
						$mmaa = new Area('Main Mobile App Area');
					  $mmaa->display($c);
					?>
				</div>
			</div>
		</div>
		<div class="service-section websitedesign">
			<div class="service-header">
				<h1 class="main-heading colour-blue-dark type-uppercase">
					<strong>Website Design.</strong> Handcrafted art build from your vision.
				</h1>
			</div>
			<div class="service-desc">
				<div class="bkgrnd-grad"></div>
				<div class="bkgrnd-pixel-white"></div>
				<div class="content">
					<?php
						$mwda = new Area('Main Website Design Area');
					  $mwda->display($c);
					?>
				</div>
			</div>
		</div>
		<div class="service-section full">
			<div class="service-desc">
				<div class="content">
					<?php
						$mfa = new Area('Main Full Area');
					  $mfa->display($c);
					?>
				</div>
			</div>
		</div>
		<div class="service-section general">
			<div class="service-desc">
				<div class="content">
					<?php
						$mga = new Area('Main General Area');
					  $mga->display($c);
					?>
				</div>
			</div>
		</div>
	</section>
</section>
<?php include('inc/footer.php'); ?>
