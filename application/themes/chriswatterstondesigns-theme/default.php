<?php $view->inc('inc/header.php'); ?>
	<section class="body">
		<div class="cntr">
			<h3 class="sunk"><?php print $c->getCollectionName(); ?></h3>
			<div class="flt">
				<div class="lft-man">
					<div class="content align-left">
						<?php
						    $mc = new Area('Main Content');
						    $mc->display($c);
						?>
					</div>
				</div>
				<div class="rgt-man">
					<div class="content align-left">
						<?php
						    $sb = new Area('Sidebar');
						    $sb->display($c);
						?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="split tall"></div>
<?php $view->inc('inc/footer.php'); ?>