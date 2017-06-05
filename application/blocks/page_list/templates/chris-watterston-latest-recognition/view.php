<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	
	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');
?>

		
<?php if ( $c->isEditMode() && $controller->isBlockEmpty()) { ?>
	<div class="ccm-edit-mode-disabled-item"><?php echo t('Empty Page List Block.')?></div>
<?php } else { ?>
    <?php
	$i = 0;
    foreach ($pages as $page):
		$title = $th->entities($page->getCollectionName());
		$url = ($page->getCollectionPointerExternalLink() != '') ? $page->getCollectionPointerExternalLink() : $nh->getLinkToCollection($page);
        $img = false;
        
		$posttypetitle = $page->getAttribute('description_meta');
        
        
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
					<?php echo $posttypetitle; ?>
				</div>
			</div>
			<a href="<?php echo $url ?>" target="_self" title="Continue reading, <?php echo $title ?>" class="hidden"></a>
		</div>
		
	<?php endforeach; ?>
		
<?php } ?>