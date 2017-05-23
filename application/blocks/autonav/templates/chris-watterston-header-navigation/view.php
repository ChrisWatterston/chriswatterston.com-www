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
		$classes[] = 'nav-incdropdown';
	}
	$ni->classes = implode(" ", $classes);
}

if (count($navItems) > 0) {
    echo '<ul class="nav type-right colour-white">';

    foreach ($navItems as $ni) {
        echo '<li class="' . $ni->classes . '">';
        echo '<a href="' . $ni->url . '" target="' . $ni->target . '" class="' . $ni->classes . '">' . $ni->name . '</a>';

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
<?php }