<?php
namespace Application\Theme\stpaulscatholiccollege;

class PageTheme extends \Concrete\Core\Page\Theme\Theme {
	
	public function getThemeName() {
	    return t('STPCC');
	}
	
	public function getThemeDescription() {
	    return t('The \'STPCC\' theme has been designed and developed by Chris Watterston, for the use by \'St Pauls Catholic College\' in Sunbury-on-Thames, Surrey ONLY. Please contact hello@chriswatterston.com for all website and theme support.');
	}
	
	public function getThemeEditorClasses() {

	    return [
	        ['title' => t('Type - Blue'), 'menuClass' => 'type-blue', 'spanClass' => 'type-blue', 'forceBlock' => 1],
	        ['title' => t('Type - Gold'), 'menuClass' => 'type-gold', 'spanClass' => 'type-gold', 'forceBlock' => 1],
	        ['title' => t('Type - Light Blue'), 'menuClass' => 'type-lightblue', 'spanClass' => 'type-lightblue', 'forceBlock' => 1],
	        ['title' => t('Type - Light Gold'), 'menuClass' => 'type-lightgold', 'spanClass' => 'type-lightgold', 'forceBlock' => 1],
	        ['title' => t('Type - Grey'), 'menuClass' => 'type-grey', 'spanClass' => 'type-grey', 'forceBlock' => 1],
	        ['title' => t('Type - Light Grey'), 'menuClass' => 'type-lightgrey', 'spanClass' => 'type-lightgrey', 'forceBlock' => 1],
	        ['title' => t('Type - Purple'), 'menuClass' => 'type-purple', 'spanClass' => 'type-purple', 'forceBlock' => 1],
	        ['title' => t('Type - White'), 'menuClass' => 'type-white', 'spanClass' => 'type-white', 'forceBlock' => 1],
	        ['title' => t('Type - Black'), 'menuClass' => 'type-black', 'spanClass' => 'type-black', 'forceBlock' => 1],
	        
	        ['title' => t('Label - Success'), 'menuClass' => 'success', 'spanClass' => 'success', 'forceBlock' => 1],
	        ['title' => t('Label - Info'), 'menuClass' => 'info', 'spanClass' => 'info', 'forceBlock' => 1],
	        ['title' => t('Label - Warning'), 'menuClass' => 'warning', 'spanClass' => 'warning', 'forceBlock' => 1],
	        ['title' => t('Label - Danger'), 'menuClass' => 'danger', 'spanClass' => 'danger', 'forceBlock' => 1],

	        ['title' => t('Alert - Success'), 'menuClass' => 'alert-success', 'spanClass' => 'alert-success', 'forceBlock' => 1],
	        ['title' => t('Alert - Info'), 'menuClass' => 'alert-info', 'spanClass' => 'alert-info', 'forceBlock' => 1],
	        ['title' => t('Alert - Warning'), 'menuClass' => 'alert-warning', 'spanClass' => 'alert-warning', 'forceBlock' => 1],
	        ['title' => t('Alert - Danger'), 'menuClass' => 'alert-danger', 'spanClass' => 'alert-danger', 'forceBlock' => 1],
	        
	    ];


/*
	    return array(
            array(
                'title' => t('Type - Gold'),
                'element' => array('h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p'),
                'attributes' => array('class' => 'type-gold')
            ),
            array(
                'title' => t('Button - Default'),
                'element' => 'a',
                'attributes' => array('class' => 'abtn')
            ),
        );
*/

	}
	
}

?>