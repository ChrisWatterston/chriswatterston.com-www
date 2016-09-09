<?php
defined('C5_EXECUTE') or die("Access Denied.");
$th = Loader::helper('text');
$c = Page::getCurrentPage();
?>
<div class="flt">
	<?php foreach ($pages as $page):
		$title = $th->entities($page->getCollectionName());
		$description = $page->getAttribute('hover_description');
		$url = $nh->getLinkToCollection($page);
		$target = ($page->getCollectionPointerExternalLink() != '' && $page->openCollectionPointerExternalLinkInNewWindow()) ? '_blank' : $page->getAttribute('nav_target');
		$target = empty($target) ? '_self' : $target;
		$thumbnail = $page->getAttribute('thumbnail');
	?>
	    <?php if (is_object($thumbnail)): ?>
			<figure class="effect-bubba">
				<?php
					$img = Core::make('html/image', array($thumbnail));
					$tag = $img->getTag();
					$tag->addClass('wrk-img');
					print $tag;
	        	?>
				<figcaption>
					<h2><?php echo $title?></h2>
					<p><?php echo $description; ?></p>
					<a href="<?php echo $url ?>" target="<?php echo $target ?>" title="<?php echo $title; ?>, <?php echo $description; ?>"><?php echo $title?></a>
					<!--[if lte IE 8]><a href="<?php echo $url ?>" target="<?php echo $target ?>" title="<?php echo $title; ?>, <?php echo $description; ?>"><?php echo $title?></a><![endif]-->
				</figcaption>
			</figure>
	    <?php endif; ?>
	<?php endforeach; ?>
</div>
<?php if (count($pages) == 0): ?>
    <div class="ccm-block-page-list-no-pages"><?php echo $noResultsMessage?></div>
<?php endif;?>
<?php if ( $c->isEditMode() ): ?>
    <style>.effect-bubba {display:none !important;}</style>
<?php endif; ?>