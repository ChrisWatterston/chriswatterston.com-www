<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
extract($vars);
?>
<div class="form-group">
    <label><?php echo t('Test Mode')?></label>
    <?php  echo $form->select('authnetTestmode',array(false=>'No',true=>'Yes'),$authnetTestmode); ?>
</div>

<div class="form-group">
    <label><?php echo t("Auth.net Login ID")?></label>
    <input type="text" name="authnetLoginID" value="<?php echo $authnetLoginID?>" class="form-control">
</div>

<div class="form-group">
    <label><?php echo t("Auth.net Transaction Key")?></label>
    <input type="text" name="authnetTransactionKey" value="<?php echo $authnetTransactionKey?>" class="form-control">
</div>
