<?php 
defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Shipping\Method as ShippingMethod;
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price;

$eligibleMethods = ShippingMethod::getEligibleMethods();
$i=1;
foreach($eligibleMethods as $method){
    $sessionShippingMethodID = Session::get('smID');
    if($sessionShippingMethodID == $method->getShippingMethodID()){
        $checked = true;
    } else {
        if($i==1){
            $checked = true;
        } else {
            $checked = false;
        }
    } 
?>
    <div class="radio">
        <label>
            <input type="radio" name="shippingMethod" value="<?php echo $method->getShippingMethodID()?>"<?php  if($checked){echo " checked";}?>>
            <?php echo $method->getName()?> - <?php echo Price::format($method->getShippingMethodTypeMethod()->getRate())?>
        </label>
    </div>
<?php  $i++; } ?>
