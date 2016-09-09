<?php  defined('C5_EXECUTE') or die(_("Access Denied."));
extract($vars);
// Here we're setting up the form we're going to submit to paypal.
// This form will automatically submit itself 
?>
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="first_name" value="<?php echo $customer->getValue("billing_first_name")?>">
<input type="hidden" name="last_name" value="<?php echo $customer->getValue("billing_last_name")?>">
<input type="hidden" name="address1" value="<?php echo $customer->getValue("billing_address")->address1?>">
<input type="hidden" name="address2" value="<?php echo $customer->getValue("billing_address")->address2?>">
<input type="hidden" name="city" value="<?php echo $customer->getValue("billing_address")->city?>">
<input type="hidden" name="state" value="<?php echo $customer->getValue("billing_address")->state_province?>">
<input type="hidden" name="zip" value="<?php echo $customer->getValue("billing_address")->postal_code?>">
<input type="hidden" name="country" value="<?php echo $customer->getValue("billing_address")->country?>">
<input type="hidden" name="amount" value="<?php echo $total?>">
<input type="hidden" name="currency_code" value="<?php echo $currencyCode?>">
<input type="hidden" name="business" value="<?php echo $paypalEmail?>">
<input type="hidden" name="notify_url" value="<?php echo $notifyURL?>">
<input type="hidden" name="item_name" value="<?php echo t('Order from %s', $siteName)?>">
<input type="hidden" name="invoice" value="<?php echo $orderID?>">
<input type="hidden" name="return" value="<?php echo $returnURL?>">


