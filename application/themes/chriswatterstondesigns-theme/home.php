<?php $view->inc('inc/header.php'); ?>
	<section class="intro">
		<div class="cntr">
			<div class="flt">
				<div class="lft-hlf">
					<div class="content align-right colour-white">
						<?php
						    $in = new Area('Introduction');
						    $in->display($c);
						?>
					</div>
				</div>
				<div class="rgt-hlf">
					<div class="content align-left colour-white">
						<?php
						    $ab = new Area('About');
						    $ab->display($c);
						?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="banner">
		<?php
		    $cta = new Area('Call To Action');
		    $cta->display($c);
		?>
	</section>
	<section class="recent-design">
		<div class="flt">
			<?php
			    $rd = new Area('Recent Designs');
			    $rd->display($c);
			?>
		</div>
	</section>
	<section class="services">
		<div class="cntr">
			<div class="flt">
				<div class="lft-hlf">
					<div class="content align-right">
						<?php
						    $sl = new Area('Service Left');
						    $sl->display($c);
						?>
					</div>
				</div>
				<div class="rgt-hlf">
					<div class="content align-left">
						<?php
						    $sr = new Area('Service Right');
						    $sr->display($c);
						?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="split"></div>
	<section class="latest-news">
		<div class="cntr">
			<h3 class="sunk">Our Latest Happenings</h3>
			<div class="flt">
				<?php
				    $lh = new Area('Latest Happening');
				    $lh->display($c);
				?>
			</div>
		</div>
	</section>
	<div class="split tall"></div>
	<footer class="main">
		<div class="cntr">
			<div class="flt">
				<div class="lft-twth">
					<div class="content align-left colour-white">
						<?php
						    $cu = new Area('Contact Us');
						    $cu->display($c);
						?>
					</div>
				</div>
				<div class="lft-twth">
					<div class="content align-left colour-white">
						<?php
						    $lt = new Area('Latest Tweets');
						    $lt->display($c);
						?>
						<a class="twitter-timeline" data-dnt="true" href="https://twitter.com/chriswatterston" data-widget-id="570976365751836672" data-link-color="#BABEC1" data-chrome="noheader nofooter transparent noborders" data-tweet-limit="2">Tweets by @chriswatterston</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
					</div>
				</div>
				<div class="lft-twth">
					<div class="content align-left colour-white">
						<?php
						    $ns = new Area('Network');
						    $ns->display($c);
						?>
					</div>
				</div>
				<div class="lft-twth">
					<div class="content align-left colour-white">
						<?php
						    $su = new Area('Sign Up');
						    $su->display($c);
						?>
					</div>
				</div>
			</div>
		</div>
	</footer>
<!--
<script type="text/javascript" src="http://assets.freshdesk.com/widget/freshwidget.js"></script>
<script type="text/javascript">
	FreshWidget.init("", {"queryString": "&widgetType=popup&formTitle=How+can+we+help%3F&submitThanks=Thumbs+up%2C+you've+submitted+your+enquiry.+We'll+be+reviewing+your+request+and+will+send+you+a+personal+response+usually+within+24+hours.&screenshot=no&attachFile=no&searchArea=no", "utf8": "✓", "widgetType": "popup", "buttonType": "text", "buttonText": "How can we help?", "buttonColor": "white", "buttonBg": "#009C8D", "alignment": "3", "offset": "50px", "submitThanks": "Thumbs up, you've submitted your enquiry. We'll be reviewing your request and will send you a personal response usually within 24 hours.", "formHeight": "500px", "screenshot": "no", "url": "http://support.chriswatterston.com"} );
</script>
-->
<?php $view->inc('inc/footer.php'); ?>