<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$listViews = array('view','success','updated','removed','class_deleted','class_updated','class_added');
$addViews = array('add','add_rate','edit');
$addClassViews = array('add_class','edit_class','save_class');

if(in_array($controller->getTask(),$addViews)){
/// Add Tax Method View    
?>
    
    
<form id="settings-tax" action="<?php echo URL::to('/dashboard/store/settings/tax','add_rate')?>" method="post" data-states-utility="<?php echo View::url('/checkout/getstates')?>">

    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
            <input type="hidden" name="taxRateID" value="<?php echo $taxRate->getTaxRateID()?>">
            <div class="row">
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <?php  echo $form->label('taxEnabled',t('Enable Tax Rate')); ?>
                                <?php  echo $form->select('taxEnabled',array(false=>t('No'),true=>t('Yes')),$taxRate->isEnabled()); ?>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <?php  echo $form->label('taxLabel',t('Tax Label')); ?>
                                <?php  echo $form->text('taxLabel',$taxRate->getTaxLabel());?>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <?php  echo $form->label('taxRate',t('Tax Rate %')); ?>
                                <div class="input-group">
                                    <?php  echo $form->text('taxRate',$taxRate->getTaxRate()); ?>
                                    <div class="input-group-addon">%</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="taxBased"><?php echo t("Tax is Based on the")?></label>
                        <?php  echo $form->select('taxBased',array('subtotal'=>t("Product Total"),'grandtotal'=>t("Product Total + Shipping")),$taxRate->getTaxBasedOn()); ?>
                    </div>
                    
                    <h3><?php echo t("When to Charge Tax")?></h3>
                    
                    
                    <div class="row">
                        
                        <div class="col-sm-5">
                   
                            <div class="form-group">
                                <label for="taxAddress" class="control-label"><?php echo t("If the Customers...")?></label>
                                <?php  echo $form->select('taxAddress',array('shipping'=>t("Shipping Address"),'billing'=>t("Billing Address")),$taxRate->getTaxAddress()); ?>
                            </div>
                        
                        </div>
                        
                        <div class="col-sm-7">
                        <div class="form-horizontal">
                            <p><strong><?php echo t("Matches...")?></strong></p>
                            <div class="form-group">
                                <label for="taxCountry" class="col-sm-5 control-label"><?php echo t("Country")?> <small class="text-muted"><?php echo t("Required")?></small></label>
                                <div class="col-sm-7">    
                                    <?php  $country = $taxRate->getTaxCountry(); ?>
                                    <?php  echo $form->select('taxCountry',$countries,$country?$country:'US',array("onchange"=>"updateTaxStates()")); ?>    
                                </div>
                            </div>
                            
                            
                            <div class="form-group">
                                <label for="taxState" class="col-sm-5 control-label"><?php echo t("Region")?> <small class="text-muted"><?php echo t("Optional")?></small></label>
                                <div class="col-sm-7"> 
                                    <?php  $state = $taxRate->getTaxState(); ?>
                                    <?php  echo $form->select('taxState',$states,$state?$state:""); ?>
                                    <?php  echo $form->hidden("savedTaxState",$state); ?>
                                </div>
                            </div>
        
                            <div class="form-group">
                                <label for="taxState" class="col-sm-5 control-label"><?php echo t("City")?> <small class="text-muted"><?php echo t("Optional")?></small></label>
                                <div class="col-sm-7"> 
                                    <?php  echo $form->text('taxCity',$taxRate->getTaxCity());?>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
            
        </div>
    </div>

    
    <div class="ccm-dashboard-form-actions-wrapper">
        <div class="ccm-dashboard-form-actions">
            <button class="pull-right btn btn-success" type="submit" ><?php echo t('%s Tax Rate',$task)?></button>
        </div>
    </div>
    
</form>
     
<?php  } elseif(in_array($controller->getTask(),$listViews)) { ?>
<div class="ccm-dashboard-header-buttons">
    <a href="<?php  echo View::url('/dashboard/store/settings/tax','add')?>" class="btn btn-primary"><?php  echo t("Add Tax Rate")?></a>
    <a href="<?php  echo View::url('/dashboard/store/settings/tax','add_class')?>" class="btn btn-primary"><?php  echo t("Add Tax Class")?></a>
    <a href="<?php  echo View::url('/dashboard/store/settings')?>" class="btn btn-default"><i class="fa fa-gear"></i> <?php  echo t("General Settings")?></a>
</div>

<div class="dashboard-tax-rates">
	
	<table class="table table-striped">
        <thead>
            <th><?php echo t("Tax Classes")?></th>
            <th><?php echo t("Associated Tax Rates")?></th>
            <th class="text-right"><?php echo t("Actions")?></th>
        </thead>
        <tbody>
            <?php  if(count($taxClasses)>0){?>
                <?php  foreach($taxClasses as $tc){?>
                    <tr>
                        <td><?php echo $tc->getTaxClassName()?></td>
                        <td>
                            <?php 
                                $taxClassRates = $tc->getTaxClassRates();
                                if($taxClassRates){
                                    foreach($taxClassRates as $taxRate){
                                        echo $taxRate->getTaxLabel()."<br>";
                                    }
                                }
                             ?>
                        </td>
                        <td class="text-right">
                            <a href="<?php echo URL::to('/dashboard/store/settings/tax/edit_class',$tc->getTaxClassID())?>" class="btn btn-default"><?php echo t("Edit")?></a>
                            <?php  if(!$tc->isLocked()){?>
                            <a href="<?php echo URL::to('/dashboard/store/settings/tax/delete_class',$tc->getTaxClassID())?>" class="btn btn-danger"><?php echo t("Delete")?></a>
                            <?php  } ?>
                        </td>
                    </tr>
                 <?php  } ?>
            <?php  } ?>
        </tbody>
    </table>
	
	<table class="table table-striped">
		<thead>
			<th><?php echo t("Tax Rates")?></th>
			<th class="text-right"><?php echo t("Actions")?></th>
		</thead>
		<tbody>
		    <?php  if(count($taxRates)>0){?>
		        <?php  foreach($taxRates as $tr){?>
        			<tr>
        				<td><?php echo $tr->getTaxLabel()?></td>
        				<td class="text-right">
        					<a href="<?php echo URL::to('/dashboard/store/settings/tax/edit',$tr->getTaxRateID())?>" class="btn btn-default"><?php echo t("Edit")?></a>
        					<a href="<?php echo URL::to('/dashboard/store/settings/tax/delete',$tr->getTaxRateID())?>" class="btn btn-danger"><?php echo t("Delete")?></a>
        				</td>
        			</tr>
			     <?php  } ?>
			<?php  } ?>
		</tbody>
	</table>
	
</div>

<?php  } elseif(in_array($controller->getTask(),$addClassViews)){ ?>

<form id="settings-tax" action="<?php echo URL::to('/dashboard/store/settings/tax','save_class')?>" method="post" data-states-utility="<?php echo View::url('/checkout/getstates')?>">

    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
            <input type="hidden" name="taxClassID" value="<?php echo $tc->getTaxClassID()?>">
            <div class="form-group">
                <?php  echo $form->label('taxClassName',t("Tax Class Name")); ?>
                <?php  echo $form->text('taxClassName',$tc->getTaxClassName()); ?>
            </div>  
            <?php  if(Config::get("vividstore.calculation")=="extract"){?>
                <div class="alert alert-info">
                    <?php echo t("Since you're prices INCLUDE Tax, you can only specify one tax rate per class. If you need more, you must change this setting in the %stax setting here%s",'<a href="'.URL::to('/dashboard/store/settings').'">','</a>')?>
                </div>
            <?php  } ?>
            <div class="form-group">
                <?php  echo $form->label('taxClassRates[]',t("Select Tax Class Rates")); ?>
                <select name="taxClassRates[]" class="form-control" multiple="multiple">
                    <?php  
                        $selectedTaxRates = $tc->getTaxClassRateIDs();
                        if(count($taxRates)){
                            foreach($taxRates as $taxRate){?>
                                <option value="<?php echo $taxRate->getTaxRateID()?>" <?php  if(in_array($taxRate->getTaxRateID(), $selectedTaxRates)){echo "selected";}?>><?php echo $taxRate->getTaxLabel()?></option>
                    <?php  
                            }
                        } 
                    ?>
                </select>
            </div>          
        </div>
    </div>

    
    <div class="ccm-dashboard-form-actions-wrapper">
        <div class="ccm-dashboard-form-actions">
            <button class="pull-right btn btn-success" type="submit" ><?php echo t('%s Tax Rate',$task)?></button>
        </div>
    </div>
    
</form>

<?php  } ?>