<?php $view->inc('inc/header.php'); ?>
	<section class="body">
		<div class="cntr">
			<h3 class="sunk"><?php print $c->getCollectionName(); ?></h3>
			<div class="content align-left single">
				<?php print $innerContent; ?>
			</div>
		</div>
	</section>
	<div class="split tall"></div>
<?php $view->inc('inc/footer.php'); ?>