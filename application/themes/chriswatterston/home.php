<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');
?>

<header class="main">
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
				$hst = Stack::getByName('Header Site Title');
				$hst->display();
			?>
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


<footer class="main">
	<section class="contact-wrap">
		<div class="cols">
			<div class="col navigation">
				<?php
					$fcd = Stack::getByName('Footer Contact');
					$fcd->display();
				?>
			</div>
			<div class="col subscribe">

				<!-- Begin MailChimp Signup Form -->
				<div id="mc_embed_signup">
					<form action="//chriswatterston.us6.list-manage.com/subscribe/post?u=4eb0c55f52da7e19c6658cbf7&amp;id=a8fb7877b6" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
					    <div id="mc_embed_signup_scroll">
						
					<div class="indicates-required"><span class="asterisk">*</span> indicates required</div>
					<div class="mc-field-group">
						<label for="mce-EMAIL">Email Address  <span class="asterisk">*</span>
					</label>
						<input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL">
					</div>
						<div id="mce-responses" class="clear">
							<div class="response" id="mce-error-response" style="display:none"></div>
							<div class="response" id="mce-success-response" style="display:none"></div>
						</div>    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
					    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_4eb0c55f52da7e19c6658cbf7_a8fb7877b6" tabindex="-1" value=""></div>
					    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
					    </div>
					</form>
				</div>
				<!--End mc_embed_signup-->

			</div>
		</div>
	</section>
	<section class="social-wrap">
		<div class="cols">
			<div class="col social">
				social links
			</div>
			<div class="col instagram">
				instagram
			</div>
		</div>
	</section>
	<section class="copyright-wrap">
		<div class="cols">
			<div class="col copyright">
				<?php
					$fcl = Stack::getByName('Footer Legal');
					$fcl->display();
				?>
			</div>
			<div class="col navigation">
				<nav class="footer">
					<?php
						$fmm = Stack::getByName('Footer Navigation');
						$fmm->display();
					?>
				</nav>
			</div>
		</div>
	</section>
</footer>

<?php include('inc/footer.php'); ?>