<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
extract($vars);
?>

<div class="form-group">
    <label><?php echo t("Minimum Order Value")?></label>
<input type="text" name="invoiceMinimum" value="<?php echo $invoiceMinimum?>" class="form-control">
</div>

<div class="form-group">
    <label><?php echo t("Maximum Order Value")?></label>
    <input type="text" name="invoiceMaximum" value="<?php echo $invoiceMaximum?>" class="form-control">
</div>

