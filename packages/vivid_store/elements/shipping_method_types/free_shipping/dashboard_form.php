<?php 
defined('C5_EXECUTE') or die("Access Denied.");
extract($vars); ?>
<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <?php  echo $form->label('countries',t("Which Countries does this Apply to?")); ?>
            <?php  echo $form->select('countries',array('all'=>t("All Countries"),'selected'=>t("Certain Countries")),$smtm->getCountries()); ?>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <?php  echo $form->label('countriesSelected',t("If Certain Countries, which?")); ?>
            <select class="form-control" multiple name="countriesSelected[]">
                <?php  $selectedCountries = explode(',',$smtm->getCountriesSelected()); ?>
                <?php  foreach($countryList as $code=>$country){?>
                    <option value="<?php echo $code?>"<?php  if(in_array($code,$selectedCountries)){echo " selected";}?>><?php echo $country?></option>
                <?php  } ?>
            </select>
        </div>
    </div>
</div> 
<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <?php  echo $form->label('minimumAmount',t("Minimum Purchase Amount for this rate to apply")); ?>
            <?php  echo $form->text('minimumAmount',$smtm->getMinimumAmount()?$smtm->getMinimumAmount():'0'); ?>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <?php  echo $form->label('maximumAmount',t("Maximum Purchase Amount for this rate to apply")); ?>
            <?php  echo $form->text('maximumAmount',$smtm->getMaximumAmount()?$smtm->getMaximumAmount():'0'); ?>
            <p class="help-block"><?php echo t("Leave at 0 for no maximum")?></p>
        </div>
    </div>
</div> 
<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <?php  echo $form->label('minimumWeight',t("Minimum Weight Amount for this rate to apply")); ?>
            <div class="input-group">
                <?php  echo $form->text('minimumWeight',$smtm->getMinimumWeight()?$smtm->getMinimumWeight():'0'); ?>
                <div class="input-group-addon"><?php echo Config::get('vividstore.weightUnit')?></div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <?php  echo $form->label('maximumWeight',t("Maximum Weight Amount for this rate to apply")); ?>
            <div class="input-group">
                <?php  echo $form->text('maximumWeight',$smtm->getMaximumWeight()?$smtm->getMaximumWeight():'0'); ?>
                <div class="input-group-addon"><?php echo Config::get('vividstore.weightUnit')?></div>
            </div>
            <p class="help-block"><?php echo t("Leave at 0 for no maximum")?></p>
        </div>
    </div>
</div> 
