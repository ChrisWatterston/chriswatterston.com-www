<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<?php
	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$dh = Core::make('helper/date');
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
	$description = $page->getCollectionDescription();
	$description = $controller->truncateSummaries ? $th->wordSafeShortText($description, $controller->truncateChars) : $description;
	$description = $th->entities($description);
    $date = $page->getCollectionDatePublicObject()->format('jS F Y');
    $img = false;
    $topics = $page->getAttribute('news_tags');
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
		<div class="entry-break" style="background-image:url('<?php echo $tagSrc; ?>');">
			<div class="news-content-wrap">
				<div class="entry-tip"></div>
				<div class="news-content">
		            <?php if ($includeName): ?>
		            	<h2 class="type-blue"><?php echo $title ?></h2>
		            <?php endif; ?>
					<p class="type-blue">
						<?php if ($includeDescription): ?>
							<?php echo $description ?>
						<?php endif; ?>
		            </p>
		            <p class="date-tag type-blue type-uppercase">
			            <?php if ($includeDate) { echo $date; } ?> <span style="font-weight:400;">|</span>
			            <?php
			            if ($topics) {
						    foreach ($topics as $topic) {
						        $treeNodeID = $topic->getTreeNodeID();
						        $treeNodeName = $topic->getTreeNodeDisplayName();
						        $urlTreeNodeName = mb_strtolower($treeNodeName);
// 										        echo '<a href="' . URL::to($c, 'topic', $treeNodeID, $urlTreeNodeName) . '">';
						        	echo '<span class="news-post-topic">' . $treeNodeName . '</span>';
// 										        echo '</a>';
						    }
						}
						?>
		            </p>
				</div>
			</div>
		</div>
		<a href="<?php echo $url ?>" target="_self" title="Continue reading, <?php echo $title ?>" class="hidden"></a>
	</div>
<?php endforeach; ?>

<?php if ($showPagination): ?>
    <?php echo $pagination; ?>
<?php endif; ?>


<?php } ?>