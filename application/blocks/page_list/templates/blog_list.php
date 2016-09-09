<?php
defined('C5_EXECUTE') or die("Access Denied.");
$th = Loader::helper('text');
?>
<div class="ccm-page-list post">
	<?php foreach ($pages as $page):
		$meta_title = $page->getAttribute('meta_title');
		$description = $page->getCollectionDescription();
		$description = $controller->truncateSummaries ? $th->wordSafeShortText($description, $controller->truncateChars) : $description;
		$description = $th->entities($description);
		$url = $nh->getLinkToCollection($page);
		$target = ($page->getCollectionPointerExternalLink() != '' && $page->openCollectionPointerExternalLinkInNewWindow()) ? '_blank' : $page->getAttribute('nav_target');
		$target = empty($target) ? '_self' : $target;
		$post_tags = $page->getAttribute('post_tags');
	?>
	<div class="lft-ful">
		<div class="content align-left">
			<h2><a href="<?php echo $url ?>" target="<?php echo $target ?>" title="<?php echo $meta_title; ?>"><?php echo $meta_title; ?></a></h2>
			<p><?php echo $description; ?></p>
			<div class="date-tags">
				<div class="flt">
					<div class="lft-fth date colour-white">
						<span class="day"><?php echo date('j', strtotime($page->getCollectionDatePublic())); ?><sup><?php echo date('S', strtotime($page->getCollectionDatePublic())); ?></sup></span>
						<span class="month"><?php echo date('F', strtotime($page->getCollectionDatePublic())); ?></span>
					</div>	
					<div class="lft-fth tags">
						<ul>							
							<?php if(count($post_tags) > 0){ ?>
							   <?php foreach($post_tags as $tag){ ?>
							      <li class="list-item colour-white <?php echo $tag->value; ?>"><?php echo $tag->value; ?></li>
							   <?php } ?>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php  endforeach; ?>
</div>