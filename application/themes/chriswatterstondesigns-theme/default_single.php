<?php $view->inc('inc/header.php'); ?>
	<section class="body">
		<div class="cntr">
			<h3 class="sunk"><?php print $c->getCollectionName(); ?></h3>
			<div class="flt single">
				<div class="lft-hlf nul">
					<div class="content align-left nul logo">
						<?php
						    $lc = new Area('Left Column');
						    $lc->display($c);
						?>
					</div>
				</div>
				<div class="rgt-hlf nul type">
					<div class="content align-left nul">
						<?php
						    $rc = new Area('Right Column');
						    $rc->display($c);
						?>
					</div>
				</div>
			</div>			
			<div class="content align-left single nul nub">
				<?php
				    $mc = new Area('Main Content');
				    $mc->display($c);
				?>
			</div>
			<div class="flt single fnl">
				<div class="lft-hlf nub">
					<div class="content align-left nul">
						<?php
						    $lec = new Area('Left End Column');
						    $lec->display($c);
						?>
					</div>
				</div>
				<div class="rgt-hlf nub">
					<div class="content align-left nul">
						<?php
						    $rec = new Area('Right End Column');
						    $rec->display($c);
						?>
					</div>
				</div>
			</div>			
		</div>
	</section>
	<div class="split tall"></div>
<?php $view->inc('inc/footer.php'); ?>