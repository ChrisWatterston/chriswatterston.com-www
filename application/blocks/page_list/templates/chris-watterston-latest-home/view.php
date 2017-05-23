<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<script type="text/javascript">$(document).ready(function(){var a=$(".col.welcome-message").height();$(".col.newsfeed-entry").height(a+80)});</script>
<link rel="stylesheet" type="text/css" href="<?php echo $view->getThemePath()?>/css/third-party/owl.carousel.min.css" />

<?php
	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$dh = Core::make('helper/date');
	$ih = Loader::helper('image');
?>

<div class="cols">	
	<div class="owl-carousel-controls">
		<a href="javascript:void(0)" class="entry-previous abtn transparent icon-prev">&#32;</a>	
		<a href="javascript:void(0)" class="entry-next abtn transparent icon-next">&#32;</a>
	</div>
	<div class="col welcome-message type-white">
		<?php
			$swm = Stack::getByName('Welcome Introduction');
			$swm->display();
		?>
	</div>
		
	<?php if ( $c->isEditMode() && $controller->isBlockEmpty()) { ?>
		<div class="ccm-edit-mode-disabled-item"><?php echo t('Empty Page List Block.')?></div>
	<?php } else { ?>
		<div class="col newsfeed-entrys" id="newsfeed-scroll">
			<div class="cols owl-carousel">
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
						<div class="entry-break">
							<div class="news-img" style="background-image:url('<?php echo $tagSrc; ?>');"></div>
							<div class="news-content-wrap">
								<div class="entry-tip"></div>
								<div class="news-content">
						            <?php if ($includeName): ?>
						            	<h3 class="type-white"><?php echo $title ?></h3>
						            <?php endif; ?>
									<p class="type-white">
										<?php if ($includeDescription): ?>
											<?php echo $description ?>
										<?php endif; ?>
						            </p>
						            <p class="date-tag type-white type-uppercase">
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
			</div>
		</div>
	<?php } ?>
	
</div>

<script type="text/javascript" src="<?php echo $view->getThemePath()?>/js/owl.carousel.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:0,
	    nav:false,
	    dots:false,
	    items:2,
	    autoplay:true,
	    autoplayHoverPause:true,
	    responsive : {
		    // breakpoint from 0 up
		    0 : {
	            items:1
		    },
		    // breakpoint from 480 up
		    930 : {
	            items:2
		    }
		}
	})
	var owl = $('.owl-carousel');
	owl.owlCarousel();
	$('.entry-next').click(function(){owl.trigger('next.owl.carousel',[300]);})
	$('.entry-previous').click(function(){owl.trigger('prev.owl.carousel',[300]);})
});
</script>