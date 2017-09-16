<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = false;

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

<header class="main page-default">
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

<section class="body page-default">
	<section class="services-wrap">
		<div class="services-header">
			<?php
			    $mbcd = new Area('Main Description');
			    $mbcd->display($c);
		    ?>
		</div>
		<div class="services-desc">
			<div class="pcontent colour-grey">
				<?php
				    $mbco1 = new Area('Main Body One');
				    $mbco1->display($c);
			    ?>
			</div>
			<div class="cols">
				<?php
				    $mbco2 = new Area('Main Body Two');
				    $mbco2->display($c);
			    ?>
			</div>
			<div class="pcontent colour-grey">
				<?php
				    $mbco3 = new Area('Main Body Three');
				    $mbco3->display($c);
			    ?>
			</div>
		</div>
	</section>
</section>

<?php include('inc/footer.php'); ?>
