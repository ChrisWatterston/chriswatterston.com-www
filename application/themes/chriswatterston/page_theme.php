<?php
namespace Application\Theme\chriswatterston;

class PageTheme extends \Concrete\Core\Page\Theme\Theme {
	
	public function getThemeName() {
	    return t('Chris Watterston');
	}
	
	public function getThemeDescription() {
	    return t('The \'Chris Watterston\' theme has been designed and developed by Chris Watterston, for the use by \'Chris Watterston Designs\' in Sunbury-on-Thames, Surrey ONLY. Please contact hello@chriswatterston.com for all website and theme support.');
	}
	
	public function getThemeEditorClasses() {

	    return [
	        ['title' => t('Type - Blue'), 'menuClass' => 'type-blue', 'spanClass' => 'type-blue', 'forceBlock' => 1],
	        ['title' => t('Type - Gold'), 'menuClass' => 'type-gold', 'spanClass' => 'type-gold', 'forceBlock' => 1],
	        
	    ];

	}
	
}

?>