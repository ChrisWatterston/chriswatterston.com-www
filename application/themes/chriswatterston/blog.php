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
<script type='text/javascript' src='//platform-api.sharethis.com/js/sharethis.js#property=5943f9e919fdf8001169e9c3&product=inline-share-buttons' async='async'></script>

<header class="main page-blog">
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
			<h2 class="colour-white type-light"><?php echo $date; ?> <span class="type-closetag" style="font-size:0.9em;"></span> <?php echo $microposttag, $posttypetitlefirst, " Post"; ?></h2>
			<h1 class="colour-white type-semibold type-uppercase"><?php echo $pageName; ?></h1>
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
				<div class="sharethis-inline-share-buttons"></div>
				<div id="disqus_thread"></div>
				<script>
					var disqus_config = function () {
						this.page.url = <?php echo('http://chriswatterston.com'.$pageURL.''); ?>;
						this.page.identifier = <?php echo $pageID; ?>;
					};
					(function() {
						var d = document, s = d.createElement('script');
						s.src = 'https://chriswatterston.disqus.com/embed.js';
						s.setAttribute('data-timestamp', +new Date());
						(d.head || d.body).appendChild(s);
					})();
				</script>
				<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
			</div>
		</div>
	</section>
</section>

<?php include('inc/footer.php'); ?>
