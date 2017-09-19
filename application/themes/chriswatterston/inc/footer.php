<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<footer class="main">
	<section class="contact-wrap" <?php if(!$enableFullFooter){ ?> style="margin-bottom:60px;"<?php } ?>>
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
								    <div style="position: absolute; left: -5000px;" aria-hidden="true">
									    <input type="text" name="b_4eb0c55f52da7e19c6658cbf7_a8fb7877b6" tabindex="-1" value="">
									</div>
								    <div class="clear submit-button">
									    <input type="submit" value="Sign Me Up" name="subscribe" id="mc-embedded-subscribe" class="button">
									</div>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
  <?php if($enableFullFooter) { ?>
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
  <?php } ?>
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
</div>
<!--[if lt IE 9]><script src="<?php echo $view->getThemePath()?>/js/html5shiv-printshiv.js"></script><![endif]-->
<?php View::element('footer_required'); ?>
<script type='text/javascript'>var fc_CSS=document.createElement('link');fc_CSS.setAttribute('rel','stylesheet');var fc_isSecured = (window.location && window.location.protocol == 'https:');var fc_lang = document.getElementsByTagName('html')[0].getAttribute('lang'); var fc_rtlLanguages = ['ar','he']; var fc_rtlSuffix = (fc_rtlLanguages.indexOf(fc_lang) >= 0) ? '-rtl' : '';fc_CSS.setAttribute('type','text/css');fc_CSS.setAttribute('href',((fc_isSecured)? 'https://d36mpcpuzc4ztk.cloudfront.net':'http://assets1.chat.freshdesk.com')+'/css/visitor'+fc_rtlSuffix+'.css');document.getElementsByTagName('head')[0].appendChild(fc_CSS);var fc_JS=document.createElement('script'); fc_JS.type='text/javascript'; fc_JS.defer=true;fc_JS.src=((fc_isSecured)?'https://d36mpcpuzc4ztk.cloudfront.net':'http://assets.chat.freshdesk.com')+'/js/visitor.js';(document.body?document.body:document.getElementsByTagName('head')[0]).appendChild(fc_JS);window.livechat_setting= 'eyJ3aWRnZXRfc2l0ZV91cmwiOiJjaHJpc3dhdHRlcnN0b24uZnJlc2hkZXNrLmNvbSIsInByb2R1Y3RfaWQiOm51bGwsIm5hbWUiOiJDaHJpcyBXYXR0ZXJzdG9uIFN1cHBvcnQiLCJ3aWRnZXRfZXh0ZXJuYWxfaWQiOm51bGwsIndpZGdldF9pZCI6IjQwOTZkZjZiLWI2ODMtNGJhOC05NDM4LTdjN2I2Y2NmMzNmYSIsInNob3dfb25fcG9ydGFsIjp0cnVlLCJwb3J0YWxfbG9naW5fcmVxdWlyZWQiOmZhbHNlLCJsYW5ndWFnZSI6bnVsbCwidGltZXpvbmUiOm51bGwsImlkIjo1MDAwMDU4OTg1LCJtYWluX3dpZGdldCI6MSwiZmNfaWQiOiIyYjk2NTRhZjdlMDlkZTBkMjBjNDc4MmQ4ZjM4MmFhOSIsInNob3ciOjEsInJlcXVpcmVkIjoyLCJoZWxwZGVza25hbWUiOiJDaHJpcyBXYXR0ZXJzdG9uIERlc2lnbnMiLCJuYW1lX2xhYmVsIjoiTmFtZSIsIm1lc3NhZ2VfbGFiZWwiOiJNZXNzYWdlIiwicGhvbmVfbGFiZWwiOiJQaG9uZSIsInRleHRmaWVsZF9sYWJlbCI6IlRleHRmaWVsZCIsImRyb3Bkb3duX2xhYmVsIjoiRHJvcGRvd24iLCJ3ZWJ1cmwiOiJjaHJpc3dhdHRlcnN0b24uZnJlc2hkZXNrLmNvbSIsIm5vZGV1cmwiOiJjaGF0LmZyZXNoZGVzay5jb20iLCJkZWJ1ZyI6MSwibWUiOiJNZSIsImV4cGlyeSI6MCwiZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwiZW5kX2NoYXRfdGhhbmtfbXNnIjoiVGhhbmsgeW91ISEhIiwiZW5kX2NoYXRfZW5kX3RpdGxlIjoiRW5kIiwiZW5kX2NoYXRfY2FuY2VsX3RpdGxlIjoiQ2FuY2VsIiwic2l0ZV9pZCI6IjJiOTY1NGFmN2UwOWRlMGQyMGM0NzgyZDhmMzgyYWE5IiwiYWN0aXZlIjoxLCJyb3V0aW5nIjpudWxsLCJwcmVjaGF0X2Zvcm0iOjEsImJ1c2luZXNzX2NhbGVuZGFyIjpudWxsLCJwcm9hY3RpdmVfY2hhdCI6MSwicHJvYWN0aXZlX3RpbWUiOjE1LCJzaXRlX3VybCI6ImNocmlzd2F0dGVyc3Rvbi5mcmVzaGRlc2suY29tIiwiZXh0ZXJuYWxfaWQiOm51bGwsImRlbGV0ZWQiOjAsIm1vYmlsZSI6MSwiYWNjb3VudF9pZCI6bnVsbCwiY3JlYXRlZF9hdCI6IjIwMTUtMDItMjhUMTE6MDg6NTkuMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDE2LTAxLTA1VDIxOjQ4OjI2LjAwMFoiLCJjYkRlZmF1bHRNZXNzYWdlcyI6eyJjb2Jyb3dzaW5nX3N0YXJ0X21zZyI6IllvdXIgc2NyZWVuc2hhcmUgc2Vzc2lvbiBoYXMgc3RhcnRlZCIsImNvYnJvd3Npbmdfc3RvcF9tc2ciOiJZb3VyIHNjcmVlbnNoYXJpbmcgc2Vzc2lvbiBoYXMgZW5kZWQiLCJjb2Jyb3dzaW5nX2RlbnlfbXNnIjoiWW91ciByZXF1ZXN0IHdhcyBkZWNsaW5lZCIsImNvYnJvd3NpbmdfYWdlbnRfYnVzeSI6IkFnZW50IGlzIGluIHNjcmVlbiBzaGFyZSBzZXNzaW9uIHdpdGggY3VzdG9tZXIiLCJjb2Jyb3dzaW5nX3ZpZXdpbmdfc2NyZWVuIjoiWW91IGFyZSB2aWV3aW5nIHRoZSB2aXNpdG9y4oCZcyBzY3JlZW4gIiwiY29icm93c2luZ19jb250cm9sbGluZ19zY3JlZW4iOiJZb3UgaGF2ZSBhY2Nlc3MgdG8gdmlzaXRvcuKAmXMgc2NyZWVuICIsImNvYnJvd3NpbmdfcmVxdWVzdF9jb250cm9sIjoiUmVxdWVzdCB2aXNpdG9yIGZvciBzY3JlZW4gYWNjZXNzICIsImNvYnJvd3NpbmdfZ2l2ZV92aXNpdG9yX2NvbnRyb2wiOiJHaXZlIGFjY2VzcyBiYWNrIHRvIHZpc2l0b3IgIiwiY29icm93c2luZ19zdG9wX3JlcXVlc3QiOiJFbmQgeW91ciBzY3JlZW5zaGFyaW5nIHNlc3Npb24iLCJjb2Jyb3dzaW5nX3JlcXVlc3RfY29udHJvbF9yZWplY3RlZCI6IllvdXIgcmVxdWVzdCB3YXMgZGVjbGluZWQiLCJjb2Jyb3dzaW5nX2NhbmNlbF92aXNpdG9yX21zZyI6IlNjcmVlbnNoYXJpbmcgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIiwiY29icm93c2luZ19hZ2VudF9yZXF1ZXN0X2NvbnRyb2wiOiJBZ2VudCBpcyByZXF1ZXN0aW5nIGFjY2VzcyB0byB5b3VyIHNjcmVlbiIsImNiX3ZpZXdpbmdfc2NyZWVuX3ZpIjoiQWdlbnQgY2FuIHZpZXcgeW91ciBzY3JlZW4gIiwiY2JfY29udHJvbGxpbmdfc2NyZWVuX3ZpIjoiQWdlbnQgaGFzIGFjY2VzcyB0byB5b3VyIHNjcmVlbiAiLCJjYl92aWV3X21vZGVfc3VidGV4dCI6IllvdXIgYWNjZXNzIHRvIHRoZSBzY3JlZW4gaGFzIGJlZW4gd2l0aGRyYXduICIsImNiX2dpdmVfY29udHJvbF92aSI6IkFsbG93IGFnZW50IHRvIGFjY2VzcyB5b3VyIHNjcmVlbiAiLCJjYl92aXNpdG9yX3Nlc3Npb25fcmVxdWVzdCI6IkFnZW50IHNlZWtzIGFjY2VzcyB0byB5b3VyIHNjcmVlbiAifX0=';</script>
</body>
</html>
