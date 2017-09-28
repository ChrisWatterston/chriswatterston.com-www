<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = false;

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
<header class="main page-default">
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
