<?php $view->inc('inc/header.php'); ?>
	<section class="body">
		<div class="cntrx">
			<div class="content align-left">
				<?php
				    $mc = new Area('Main Content');
				    $mc->display($c);
				?>
			</div>
		</div>
	</section>
	<div class="split tall"></div>
<?php $view->inc('inc/footer.php'); ?>