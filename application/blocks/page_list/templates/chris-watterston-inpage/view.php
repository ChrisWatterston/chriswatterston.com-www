<?php
	defined('C5_EXECUTE') or die("Access Denied.");

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');
?>
<div class="cols more-posts">
<?php if ( $c->isEditMode() && $controller->isBlockEmpty()) { ?>
	<div class="ccm-edit-mode-disabled-item"><?php echo t('Empty Page List Block.')?></div>
<?php } else { ?>
    <?php
	$i = 0;
    foreach ($pages as $page):
		$title = $th->entities($page->getCollectionName());
		$url = ($page->getCollectionPointerExternalLink() != '') ? $page->getCollectionPointerExternalLink() : $nh->getLinkToCollection($page);
		$description = $page->getCollectionDescription();
		$description = $controller->truncateSummaries ? $th->wordSafeShortText($description, $controller->truncateChars) : $description;
		$description = $th->entities($description);
    $img = false;

    if ($displayThumbnail) {
	    $img = $page->getAttribute('thumbnail');
    }
		if ($img) {
			$thumb = $ih->getThumbnail($img, 600, 320, array('crop'=>true, 'quality'=>40));
			$tagSrc = $thumb->src;
		}
    $i++;
		?>
		<div class="col newsfeed-entry entry-<?php echo $i; ?>">
			<div class="news-img" style="background-image:url('<?php echo $tagSrc; ?>');"></div>
			<div class="news-content-wrap">
				<div class="news-content">
          <?php if ($includeName): ?>
          	<h2 class="colour-grey type-semibold"><?php echo $title ?></h2>
          <?php endif; ?>
					<p class="description colour-grey">
						<?php if ($includeDescription): ?>
							<?php echo $description ?>
						<?php endif; ?>
					</p>
				</div>
			</div>
			<a href="<?php echo $url ?>" target="_self" title="Continue reading, <?php echo $title ?>" class="hidden"></a>
		</div>
	<?php endforeach; ?>
<?php } ?>
</div>
