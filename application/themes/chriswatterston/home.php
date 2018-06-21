<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = true;

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');

	$pageMeta = $c->getAttribute('meta_title');
	$pageName = $c->getCollectionName();
	$pageDesc = $c->getAttribute('meta_description');
	$pageURL = $c->getCollectionPath();

	$imgsocial = $c->getAttribute('social_thumbnail');
	if ($imgsocial) {
		$thumbsocial = $ih->getThumbnail($imgsocial, 1200, 630, array('crop'=>true, 'quality'=>90));
		$imgSocialSrc = $thumbsocial->src;
	}
?>
<meta property="og:url" content="http://<?php echo $_SERVER['SERVER_NAME'].$pageURL; ?>" />
<meta property="og:type" content="article" />
<meta property="og:title" content="<?php echo $pageMeta; ?>" />
<meta property="og:description" content="<?php echo $pageDesc; ?>" />
<meta property="og:image" content="<?php echo $imgSocialSrc; ?>" />
<meta property="fb:app_id" content="325530257865510" />
<?php include('inc/body.php'); ?>
<header class="main">
	<section class="navigation-wrap">
		<script type="text/javascript">
		$(document).ready(function() {
			var heightOne = $('.newsfeed-entry.entry-2').height();
			var heightTwo = $('.newsfeed-entry.entry-2').height();
			$('.contain .sidebar-link-wrap').height(heightOne + heightTwo + 20);
			$('.contain .sidebar-link-wrap .rotate-fix a.sidebar-link').width(heightOne + heightTwo + 20);
		});
		</script>
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
				$hst = Stack::getByName('Header Site Title');
				$hst->display();
			?>
		</div>
	</section>
	<section class="latestupdates-wrap">
		<div class="contain">
			<div class="cols newsfeed-entrys">
				<?php
				    $hlfe = new Area('Header Latest Feed');
				    $hlfe->display($c);
			    ?>
			</div>
			<div class="sidebar-link-wrap">
				<div class="rotate-fix">
					<a href="/blog" class="sidebar-link type-uppercase colour-white family-table type-semibold type-right" title="View all blog updates">All updates <i class="icon arrow-top-white"></i></a>
					<a href="/blog" class="rotate-link" title="View all blog updates"></a>
				</div>
			</div>
		</div>
	</section>
</header>
<section class="body">
	<section class="services-wrap">
		<div class="services-header">
			<h1 class="main-heading colour-yellow-dark type-uppercase">
				<strong>Creating trusted solutions.</strong> Grown from your ideas.
			</h1>
			<h2 class="sub-heading colour-grey title-sub"><strong>Solutions that help achieve your expectations and dreams, in a fluid and rootlike way.</strong></h2>
		</div>
		<div class="services-desc">
			<p class="sub-heading colour-grey">I provide guaranteed solutions to individuals, start-ups and established brands, that will get you off the ground. Many years of mastery and experience go into each and every project for both the public and private sectors, each completed with passion and determination.</p>
		</div>
		<div class="services-body">
			<div class="contain">
				<div class="cols">

					<div class="col service-one">
						<?php
						    $sa1 = new Area('Services Area One');
						    $sa1->display($c);
					    ?>
					</div>
					<div class="col service-two">
						<?php
						    $sa2 = new Area('Services Area Two');
						    $sa2->display($c);
					    ?>
					</div>
					<div class="col service-three">
						<?php
						    $sa3 = new Area('Services Area Three');
						    $sa3->display($c);
					    ?>
					</div>
					<div class="col service-four">
						<?php
						    $sa4 = new Area('Services Area Four');
						    $sa4->display($c);
					    ?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$(document).ready(function() {
			var feedCaseStudies = $('#feed-casestudies .feed-body').height();
			var feedCaseStudiesFooter = $('#feed-casestudies .feed-footer .feed-stroke .contain .cols').height();
			$('#feed-casestudies .feed-footer .feed-stroke').height(feedCaseStudies + feedCaseStudiesFooter  - 100);
			$('#feed-casestudies .feed-footer').css('margin-top', '-' + (feedCaseStudies - 129) + 'px');
			var feedRecognition = $('#feed-recognition .feed-body').height();
			var feedRecognitionFooter = $('#feed-recognition .feed-footer .feed-stroke .contain .cols').height();
			$('#feed-recognition .feed-footer .feed-stroke').height(feedRecognition + feedRecognitionFooter - 75);
			$('#feed-recognition .feed-footer').css('margin-top', '-' + (feedRecognition - 101) + 'px');
		});
	</script>
	<section class="feed-wrap negg lime" id="feed-casestudies">
		<div class="feed-header">
			<h1 class="main-heading colour-lime-dark type-uppercase">
				<strong>Case studies.</strong> A small insight into successful solutions.
			</h1>
		</div>
		<div class="feed-desc">
			<p class="sub-heading colour-white">Every design or development project are non-identical. These require different tacktical methods with slightly different solutions - each completed with passion and determination. Here are a few of my clients projects that not only delivered great client satisfaction, but have exceeded the above and beyond.</p>
		</div>
		<div class="feed-body">
			<div class="contain">
				<div class="cols newsfeed-entrys flex-row">
					<?php
					    $bcf1 = new Area('Content Area One');
					    $bcf1->display($c);
				    ?>
				</div>
			</div>
		</div>
		<div class="feed-footer">
			<div class="feed-stroke">
				<div class="contain">
					<div class="cols">
						<div class="col title type-right">
							<h3 class="colour-lime type-uppercase type-semibold">filter case studies</h3>
						</div>
						<div class="col topics">
							<?php
							    $bcf2 = new Area('Content Area Footer One');
							    $bcf2->display($c);
						    ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="feed-wrap blue" id="feed-recognition">
		<div class="feed-header">
			<h1 class="main-heading colour-blue-dark type-uppercase">
				<strong>Personal Projects.</strong> Visions that take the longest to create.
			</h1>
		</div>
		<div class="feed-desc">
			<p class="sub-heading colour-white">Not only do I have a need and passion to work on some of the most exciting projects brought forward by my clients, but I also thrive to bring my own ideas and visions to life. It's not often that I have free time to work on these projects, amongst family life - but when I do, I give them every last ounce of attention that I have.</p>
		</div>
		<div class="feed-body">
			<div class="contain">
				<div class="cols newsfeed-entrys">
					<?php
					    $bcf3 = new Area('Content Area Two');
					    $bcf3->display($c);
				    ?>
				</div>
			</div>
		</div>
	</section>
</section>
<?php include('inc/footer.php'); ?>
