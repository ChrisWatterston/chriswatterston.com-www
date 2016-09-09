<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
extract($vars);
?>
<div class="form-group">
    <label><?php echo t('Test Mode')?></label>
    <?php  echo $form->select('paypalTestMode',array(false=>'Live',true=>'Test Mode'),$paypalTestMode); ?>
</div>
<div class="form-group">
    <?php  echo $form->label('paypalCurrency',t("Currency")); ?>
    <?php  echo $form->select('paypalCurrency',$currencies,$paypalCurrency?$paypalCurrency:'USD');?>
</div>
<div class="form-group">
    <label><?php echo t("PayPal E-mail")?></label>
    <input type="text" name="paypalEmail" value="<?php echo $paypalEmail?>" class="form-control">
</div>