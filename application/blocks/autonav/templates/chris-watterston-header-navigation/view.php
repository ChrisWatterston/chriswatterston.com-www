<div class="nav-triggers-wrap type-right">
	<a href="/get-in-contact" title="Enquire for eCommerce, Website Designer and Mobile App solutions" class="contact colour-white type-lowercase type-semibold family-table">Let’s Talk?</a>
	<a href="/designer-developer-solutions-and-services" title="eCommerce, Website Designer and Mobile App solutions" class="contact colour-white type-lowercase type-semibold family-table">Become a Client</a>
	<a href="#" title="Navigation" id="cd-menu-trigger" class="nav-trigger colour-lime type-lowercase type-semibold family-table">Nav</a>
</div>

<nav id="cd-lateral-nav">
	<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	$navItems = $controller->getNavItems();
	$c = Page::getCurrentPage();

	foreach ($navItems as $ni) {
		$classes = array();
		if ($ni->isCurrent) {
			$classes[] = 'nav-selected';
		}
		if ($ni->inPath) {
			$classes[] = 'nav-path-selected';
		}
		if ($ni->hasSubmenu) {
			$classes[] = 'item-has-children';
		}
		$ni->classes = implode(" ", $classes);
	}

	if (count($navItems) > 0) {
	    echo '<ul class="nav type-right">';

	    foreach ($navItems as $ni) {
	        echo '<li class="' . $ni->classes . '">';
	        echo '<a href="' . $ni->url . '" target="' . $ni->target . '" class="colour-white family-table type-lowercase ' . $ni->classes . '">' . $ni->name . '</a>';

	        if ($ni->hasSubmenu) {
	            echo '<ul class="dropdown">';
	        } else {
	            echo '</li>';
	            echo str_repeat('</ul></li>', $ni->subDepth);
	        }
	    }

	    echo '</ul>';
	} else if (is_object($c) && $c->isEditMode()) { ?>
	    <div class="ccm-edit-mode-disabled-item"><?php echo t('Empty Auto-Nav Block.')?></div>
	<?php } ?>

	<div class="social type-right colour-white">
		<?php
			$fsli = Stack::getByName('Social Links');
			$fsli->display();
		?>
	</div>
</nav>
