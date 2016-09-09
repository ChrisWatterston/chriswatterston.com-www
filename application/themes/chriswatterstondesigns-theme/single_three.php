<?php $view->inc('inc/header.php'); ?>
	<section class="body">
		<div class="cntr">
			<h3 class="sunk"><?php print $c->getCollectionName(); ?></h3>
			<div class="content align-left single nul">
				<?php
				    $mc = new Area('Main Content');
				    $mc->display($c);
				?>
			</div>
			<div class="flt single">
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $co = new Area('Column One');
						    $co->display($c);
						?>
					</div>
				</div>
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $ct = new Area('Column Two');
						    $ct->display($c);
						?>
					</div>
				</div>
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $ct = new Area('Column Three');
						    $ct->display($c);
						?>
					</div>
				</div>
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $cf = new Area('Column Four');
						    $cf->display($c);
						?>
					</div>
				</div>
			</div>			
			<div class="flt single">
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $cv = new Area('Column Five');
						    $cv->display($c);
						?>
					</div>
				</div>
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $cs = new Area('Column Six');
						    $cs->display($c);
						?>
					</div>
				</div>
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $cn = new Area('Column Seven');
						    $cn->display($c);
						?>
					</div>
				</div>
				<div class="lft-four">
					<div class="content align-left nul">
						<?php
						    $ce = new Area('Column Eight');
						    $ce->display($c);
						?>
					</div>
				</div>
			</div>			
		</div>
	</section>
	<div class="split tall"></div>
<?php $view->inc('inc/footer.php'); ?>