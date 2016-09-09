<?php $view->inc('inc/header.php'); ?>
	<section class="body">
		<div class="cntr">
			<h3 class="sunk"><?php print $c->getCollectionName(); ?></h3>
			<div class="flt">
				<div class="tmp-wr">
				<?php
				    $tmp = new Area('Temp');
				    $tmp->display($c);
				?>
				</div>
				<div class="lft-hlf">
					<div class="content align-left">
						<?php
						    $cl = new Area('Left Column');
						    $cl->display($c);
						?>
					</div>
				</div>
				<div class="rgt-hlf">
					<div class="content align-left">
						<?php
						    $cr = new Area('Right Column');
						    $cr->display($c);
						?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="split tall"></div>
<?php $view->inc('inc/footer.php'); ?>