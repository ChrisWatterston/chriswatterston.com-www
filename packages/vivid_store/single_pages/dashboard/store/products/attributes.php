<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$addViews = array('select_type','add','edit');
if (isset($key)) { ?>
    
    <form method="post" action="<?php  echo $this->action('edit')?>" id="ccm-attribute-key-form">
    
        <?php   Loader::element("attribute/type_form_required", array('category' => $category, 'type' => $type, 'key' => $key)); ?>
    
    </form>

<?php   } elseif (in_array($controller->getTask(),$addViews)) { ?>

	
	<?php   if (isset($type)) { ?>
		<form method="post" action="<?php  echo $this->action('add')?>" id="ccm-attribute-key-form">
		    <?php   Loader::element("attribute/type_form_required", array('category' => $category, 'type' => $type)); ?>
		</form>	
	<?php   } ?>
	
<?php   } else {

    Loader::element('dashboard/attributes_table', array('category' => $category, 'attribs'=> $attrList, 'editURL' => '/dashboard/store/products/attributes')); ?>

	<form method="get" class="form-horizontal" action="<?php  echo $this->action('select_type')?>" id="ccm-attribute-type-form">
    	
    	<div class="form-group">
        	<div class="col-xs-12">
        	<?php  echo $form->label('atID', t('Add Attribute'))?>
        	</div>
        	<div class="input">
                <div class="col-xs-7">
            	<?php  echo $form->select('atID', $types)?>
                </div>
                <div class="col-xs-3">
            	<?php  echo $form->submit('submit', t('Add'), array('class'=>'btn-primary'))?>
                </div>
        	</div>
    	</div>
	
	</form>


<?php   } ?>