<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = true;

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');

	$pageMeta = $c->getAttribute('meta_title');
	$pageName = $c->getCollectionName();
	$pageID = $c->getCollectionID();
	$pageDesc = $c->getAttribute('meta_description');
	$pageClient = $c->getAttribute('client');
	$pageURL = $c->getCollectionPath();
	$date = $c->getCollectionDatePublicObject()->format('jS F Y');

	$posttypetitle = $c->getAttribute('post_topics');
	if ($posttypetitle) {
		$posttypetitlefirst = $posttypetitle[0]->getTreeNodeDisplayName();
	}

	$posttyperesult = "post-type-full";
	$micropost = $c->getAttribute('micro_post');
	$microposttag = "";
	if ($micropost) {
		$posttyperesult = "post-type-micro";
		$microposttag = "Micro <span class='type-closetag' style='font-size:0.9em;'></span> ";
	}

	$img = $c->getAttribute('thumbnail');
	if ($img) {
		$thumb = $ih->getThumbnail($img, 1440, 400, array('crop'=>true, 'quality'=>40));
		$tagSrc = $thumb->src;
	}
?>
<?php include('inc/body.php'); ?>
<script type='text/javascript' src='//platform-api.sharethis.com/js/sharethis.js#property=5943f9e919fdf8001169e9c3&product=inline-share-buttons' async='async'></script>
<header class="main page-blog">
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
			<h2 class="colour-white type-light"><?php echo $date; ?> <span class="type-closetag" style="font-size:0.9em;"></span> <?php echo $microposttag, $posttypetitlefirst, " <span class='type-closetag' style='font-size:0.9em;'> Case Study"; ?></h2>
			<h1 class="colour-white type-semibold type-uppercase"><?php echo $pageName; ?></h1>
			<h2 class="colour-white type-semibold"><?php echo $pageClient; ?></h2>
		</div>
	</section>
</header>
<section class="body page-blog">
	<section class="services-wrap">
		<div class="services-header">
			<h2 class="sub-heading colour-grey title-sub"><strong><?php echo $pageDesc; ?></strong></h2>
		</div>
		<div class="services-desc">
			<div class="pcontent colour-grey">
				<?php
						$mbco = new Area('Main Body');
						$mbco->display($c);
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
				<div class="sharethis-inline-share-buttons"></div>
			</div>
		</div>
	</section>
</section>
<?php include('inc/footer.php'); ?>
