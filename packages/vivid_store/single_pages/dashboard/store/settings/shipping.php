<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$addViews = array('add','add_method','edit');
$editViews = array('edit');

use \Concrete\Package\VividStore\Src\VividStore\Shipping\Method as ShippingMethod;

if(in_array($controller->getTask(),$addViews)){
/// Add Shipping Method View    
?>
    
    
<form action="<?php echo URL::to('/dashboard/store/settings/shipping','add_method')?>" method="post">

    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
        <?php  //echo var_dump($smt); ?>
            <h2><?php  echo $smt->getShippingMethodTypeName(); ?></h2>
            <?php  echo $form->hidden('shippingMethodTypeID',$smt->getShippingMethodTypeID()); ?>
            <?php  if(is_object($sm)){ ?>
            <?php  echo $form->hidden('shippingMethodID',$sm->getShippingMethodID()); ?>
            <?php  } ?>
            <div class="row">
                <div class="col-xs-12 col-sm-6">
                    <div class="form-group">
                        <?php  echo $form->label('methodName',t("Method Name")); ?>
                        <?php  echo $form->text('methodName',is_object($sm)?$sm->getName():''); ?>
                    </div>
                    <div class="form-group">
                        <?php  echo $form->label('methodEnabled',t("Enabled")); ?>
                        <?php  echo $form->select('methodEnabled',array(true=>"Enabled",false=>"Disabled"),is_object($sm)?$sm->isEnabled():''); ?>
                    </div>
                </div>                
            </div>    
            <hr>
            <?php  $smt->renderDashboardForm($sm); ?>    
        </div>
    </div>

    
    <div class="ccm-dashboard-form-actions-wrapper">
        <div class="ccm-dashboard-form-actions">
            <button class="pull-right btn btn-success" type="submit" ><?php echo t('%s Shipping Method',$task)?></button>
        </div>
    </div>
    
</form>
     
<?php  } else { ?>
<div class="ccm-dashboard-header-buttons">
    <?php  
    if(count($methodTypes) > 0){?>
    <div class="btn-group">
        <a href="" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><?php echo t('Add Method')?> <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
            <?php  foreach($methodTypes as $smt){?>
            <li><a href="<?php echo URL::to('/dashboard/store/settings/shipping/add',$smt->getShippingMethodTypeID())?>"><?php echo $smt->getShippingMethodTypeName()?></a></li>
            <?php  } ?>
        </ul>
    </div>
    <?php  } ?>
    <a href="<?php  echo View::url('/dashboard/store/settings')?>" class="btn btn-default"><i class="fa fa-gear"></i> <?php  echo t("General Settings")?></a>
</div>

<div class="dashboard-shipping-methods">
	
	<?php  if(count($methodTypes) > 0){?>
		<?php  foreach($methodTypes as $methodType){?>
			<table class="table table-striped">
				<thead>
					<th><?php echo $methodType->getShippingMethodTypeName().t(" Methods")?></th>
					<th class="text-right"><?php echo t("Actions")?></th>
				</thead>
				<tbody>
					<?php  foreach(ShippingMethod::getAvailableMethods($methodType->getShippingMethodTypeID()) as $method){ ?>
					<tr>
						<td><?php echo $method->getName()?></td>
						<td class="text-right">
							<a href="<?php echo URL::to('/dashboard/store/settings/shipping/edit',$method->getShippingMethodID())?>" class="btn btn-default"><?php echo t("Edit")?></a>
							<a href="<?php echo URL::to('/dashboard/store/settings/shipping/delete',$method->getShippingMethodID())?>" class="btn btn-danger"><?php echo t("Delete")?></a>
						</td>
					</tr>
					<?php  } ?>
				</tbody>
			</table>
		<?php  } ?>
	<?php  } ?>
	
</div>

<?php  } ?>