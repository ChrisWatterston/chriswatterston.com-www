<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = True;

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();

	$pageDesc = $c->getAttribute('meta_description');
	$pageURL = $c->getCollectionPath();

?>
<header class="main page-default" style="height:auto !important;">
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
		<div class="intro type-center colour-white">
			<?php
				echo $innerContent;

				$mttc = new Area('Title Content');
				$mttc->display($c);
			?>
		</div>
	</section>
</header>
<?php include('inc/footer.php'); ?>
