<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');
?>

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
					<a href="#" class="sidebar-link type-uppercase colour-white family-table type-semibold type-right" title="View All Updates">View All Updates <i class="icon arrow-top-white"></i></a>
					<a href="#" class="rotate-link" title="View All Updates"></a>
				</div>
			</div>
		</div>
	</section>
</header>





<section class="body">
	
	<section class="services-wrap">
		<div class="services-header">
			<h1 class="main-heading colour-yellow type-uppercase">
				<strong>We create trusted solutions.</strong> Grown from your ideas.
			</h1>
			<h2 class="sub-heading colour-grey title-sub"><strong>Solutions that help achieve your expectations and dreams, in a fluid and rootlike way.</strong></h2>
		</div>
		<div class="services-desc">
			<p class="sub-heading colour-grey">Chris Watterston will help achieving your ideas and dreams in a proper way. The number of internet users have well and truly flown past 3 billion. And now is definitely that time when a website is a must have. Investing time and resources into your online presence has never been so important.</p>
		</div>
		<div class="services-body">
			<div class="contain">
					
				<div class="service-one type-right">
					<?php
					    $sa1 = new Area('Services Area One');
					    $sa1->display($c);
				    ?>
				</div>
				<div class="service-two type-right">
					<?php
					    $sa2 = new Area('Services Area Two');
					    $sa2->display($c);
				    ?>
				</div>
				<div class="service-three">
					<?php
					    $sa3 = new Area('Services Area Three');
					    $sa3->display($c);
				    ?>
				</div>
				<div class="service-four">
					<?php
					    $sa4 = new Area('Services Area Four');
					    $sa4->display($c);
				    ?>
				</div>
				<div class="sidebar-link-wrap">
					<div class="rotate-fix">
						<a href="#" class="sidebar-link type-uppercase colour-white family-table type-semibold type-right" title="All Services">All Services <i class="icon arrow-top-white"></i></a>
						<a href="#" class="rotate-link" title="All Services"></a>
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
			<h1 class="main-heading colour-lime type-uppercase">
				<strong>Recent case studies.</strong> Show and tell.
			</h1>
		</div>
		<div class="feed-desc">
			<p class="sub-heading colour-white">The number of internet users have well and truly flown past 3 billion. And now is definitely that time when a website is a must have. Investing time and resources into your online presence has never been so important.</p>
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
			<h1 class="main-heading colour-blue type-uppercase">
				<strong>Recognition from us.</strong> Success isn’t built overnight.
			</h1>
		</div>
		<div class="feed-desc">
			<p class="sub-heading colour-white">The number of internet users have well and truly flown past 3 billion. And now is definitely that time when a website is a must have. Investing time and resources into your online presence has never been so important.</p>
		</div>
		<div class="feed-body">
			<div class="contain">
				<div class="cols newsfeed-entrys flex-row">
					<?php
					    $bcf3 = new Area('Content Area Two');
					    $bcf3->display($c);
				    ?>
				</div>
			</div>
		</div>
		<div class="feed-footer">
			<div class="feed-stroke">
				<div class="contain">
					<div class="cols">
						<div class="col title facebook type-right">
							<h3 class="colour-facebook type-uppercase type-semibold">Friendly Facebook</h3>
							<a href="https://www.facebook.com/chriswatterston.co" class="abtn facebook small spaced" target="_blank">Let’s Connect</a>
						</div>
						<div class="col facebook">
							<div class="cols">
								<?php
								    $bcf4 = new Area('Content Area Footer Two');
								    $bcf4->display($c);
							    ?>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
</section>





<footer class="main">
	<section class="contact-wrap">
		<div class="contain">
			<div class="cols">
				<div class="col navigation colour-white type-lowercase">
					<?php
						$fcd = Stack::getByName('Footer Contact');
						$fcd->display();
					?>
				</div>
				<div class="col subscribe colour-white">
					<h1 class="colour-white type-semibold type-uppercase">Get Updated.</h1>
					<!-- Begin MailChimp Signup Form -->
					<div id="mc_embed_signup">
						<form action="//chriswatterston.us6.list-manage.com/subscribe/post?u=4eb0c55f52da7e19c6658cbf7&amp;id=a8fb7877b6" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
						    <div id="mc_embed_signup_scroll">
							
								<div class="indicates-required">
									<p>*We’ll only email you with important bits, never spam - pinky promise!</p>
								</div>
								<div class="mc-field-group">
									<label for="mce-EMAIL">Email Address  <span class="asterisk">*</span></label>
									<input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Email address...">
								</div>
								<div id="mce-responses" class="clear">
									<div class="response" id="mce-error-response" style="display:none"></div>
									<div class="response" id="mce-success-response" style="display:none"></div>
								</div>
								<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
							    <div style="position: absolute; left: -5000px;" aria-hidden="true">
								    <input type="text" name="b_4eb0c55f52da7e19c6658cbf7_a8fb7877b6" tabindex="-1" value="">
								</div>
							    <div class="clear submit-button">
								    <input type="submit" value="Sign Me Up" name="subscribe" id="mc-embedded-subscribe" class="button">
								</div>
							    
						    </div>
						</form>
					</div>
					<!--End mc_embed_signup-->
				</div>
			</div>
		</div>
	</section>
	<section class="social-wrap">
		<div class="contain">
			<div class="cols">
				<div class="col social colour-white">
					<?php
						$fsli = Stack::getByName('Social Links');
						$fsli->display();
					?>
				</div>
				<div class="col instagram colour-white">
					<?php
						$fins = Stack::getByName('Social Feed');
						$fins->display();
					?>
				</div>
			</div>
		</div>
	</section>
	<section class="copyright-wrap">
		<div class="contain">
			<div class="cols">
				<div class="col copyright colour-white family-table">
					<?php
						$fcl = Stack::getByName('Footer Legal');
						$fcl->display();
					?>
				</div>
				<div class="col navigation">
					<nav class="footer colour-white type-lowercase type-right family-table">
						<?php
							$fmm = Stack::getByName('Footer Navigation');
							$fmm->display();
						?>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<div class="bkgrnd-image"></div>
</footer>

<?php include('inc/footer.php'); ?>