<?php  
defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
$subject = t("Order Receipt");


/**
 * HTML BODY START
 */
ob_start();

?>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'> 
<html>

<body bgcolor='#ddd'>
    
    <div style="font-family: Arial; background: #fff; box-shadow: 0 3px 3px #ccc; width: 600px; max-width: 100%;color: #444;">
        <div style="background:#009C8D; padding: 20px; color: #fff; font-size: 24px;"><?php echo t('Your Order Receipt')?></div>
        <div style="padding: 20px;">
            <p><strong><?php echo t("Order")?>#:</strong> <?php echo $order->getOrderID()?></p>
            <p><?php echo t('Thanks for your order. Below are the details of your order.')?></p>
            <table border="0" width="100%">
                <tr>
                    <td width="50%">
                        <strong><?php echo t('Billing Information')?></strong>
                        <p>
                            <?php echo $order->getAttribute("billing_first_name"). " " . $order->getAttribute("billing_last_name")?><br>
                            <?php echo $order->getAttribute("shipping_address")->address1?><br>
                            <?php  if($order->getAttribute("billing_address")->address2){
                                echo $order->getAttribute("billing_address")->address2 . "<br>";
                            } ?>
                            <?php echo $order->getAttribute("billing_address")->city?>, <?php echo $order->getAttribute("billing_address")->state_province?> <?php echo $order->getAttribute("billing_address")->postal_code?><br>
                            <?php echo $order->getAttribute("billing_phone")?>
                        </p>
                    </td>
                    <td>
                       <?php  if ($order->isShippable()) { ?>
                        <strong><?php echo t('Shipping Information')?></strong>
                        <p>
                            <?php echo $order->getAttribute("shipping_first_name"). " " . $order->getAttribute("shipping_last_name")?><br>
                            <?php echo $order->getAttribute("shipping_address")->address1?><br>
                            <?php  if($order->getAttribute("shipping_address")->address2){
                                echo $order->getAttribute("shipping_address")->address2 . "<br>";
                            } ?>
                            <?php echo $order->getAttribute("shipping_address")->city?>, <?php echo $order->getAttribute("shipping_address")->state_province?> <?php echo $order->getAttribute("shipping_address")->postal_code?><br>
                        </p>
                        <?php  } ?>
                    </td>
                </tr>
            </table>
            
            <p style="font-size: 18px;"><?php echo t('Order Details')?></p>
            <table border="0" cellpawidth="0" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style="border-bottom: 1px solid #aaa; text-align: left;"><?php echo t('Product Name')?></th>
                        <th style="border-bottom: 1px solid #aaa; text-align: left;"><?php echo t('Options')?></th>
                        <th style="border-bottom: 1px solid #aaa; text-align: left;"><?php echo t('Qty')?></th>
                        <th style="border-bottom: 1px solid #aaa; text-align: left;"><?php echo t('Price')?></th>
                        <th style="border-bottom: 1px solid #aaa; text-align: left;"><?php echo t('Subtotal')?></th>
                    </tr>
                </thead>
                <tbody>
                    <?php  
                        $items = $order->getOrderItems();
                        if($items){
                            foreach($items as $item){
                      ?>
                        <tr>
                            <td><?php echo $item->getProductName()?></td>
                            <td>
                                <?php 
                                    $options = $item->getProductOptions();
                                    if($options){
                                        echo "<ul class='list-unstyled'>";
                                        foreach($options as $option){
                                            echo "<li>";
                                            echo "<strong>".$option['oioKey'].": </strong>";
                                            echo $option['oioValue'];
                                            echo "</li>";
                                        }
                                        echo "</ul>";
                                    }
                                ?>
                            </td>
                            <td><?php echo $item->getQty()?></td>
                            <td><?php echo Price::format($item->getPricePaid())?></td>
                            <td><?php echo Price::format($item->getSubTotal())?></td>
                        </tr>
                      <?php 
                            }
                        }
                    ?>
                </tbody>
            </table>
            

            <?php 
                $downloads = array();
                $orderItems = $order->getOrderItems();
                foreach($orderItems as $item){
                    $pObj = $item->getProductObject();
                    if(is_object($pObj)){
                        if($pObj->hasDigitalDownload()){
                            $fileObjs = $pObj->getProductDownloadFileObjects();
                            $downloads[$item->getProductName()] = $fileObjs[0];
                        }
                    }
                }
                if(count($downloads) > 0){?>
                    <div style="margin: 30px 0;">
                    <p><strong><?php echo t("Your Downloads")?></strong></p>
                    <p><?php echo t("Note: You must be logged in to download files")?></p>
                    <ul class="order-downloads">
                    <?php 
                    foreach($downloads as $name=>$file){
                        if(is_object($file)){
                            echo '<li><a href="'.$file->getDownloadURL().'">'.$name.'</a></li>';
                        }
                    }?>
                    </ul>
                    </div>
                <?php  } ?>

            <p>
                <?php  if ($order->isShippable()) { ?>
                <strong><?php echo t("Shipping")?>:</strong>  <?php echo Price::format($order->getShippingTotal())?><br>
                <?php  } ?>

                <?php  foreach($order->getTaxes() as $tax){?>
                    <strong><?php echo $tax['label']?>:</strong> <?php echo Price::format($tax['amount'] ? $tax['amount'] : $tax['amountIncluded'])?><br>
                <?php  } ?>

                <strong class="text-large"><?php echo t("Total")?>:</strong>  <?php echo Price::format($order->getTotal())?>
            </p>
            
        </div>
    </div>
    
</body>
</html>

<?php  
$bodyHTML = ob_get_clean();
/**
 * HTML BODY END
 *
 * ======================
 *
 * PLAIN TEXT BODY START
 */
ob_start();

?>

<?php echo t("Order #%s has been received",$order->getOrderID())?>

<?php echo t("BILLING INFORMATION")?>
<?php echo $order->getAttribute("billing_first_name"). " " . $order->getAttribute("billing_last_name")?>
<?php  if($order->getAttribute("billing_address")->address2){
    echo $order->getAttribute("billing_address")->address2;
} ?>
<?php echo $order->getAttribute("billing_address")->city?>, <?php echo $order->getAttribute("billing_address")->state_province?> <?php echo $order->getAttribute("billing_address")->postal_code?>
<?php echo $order->getAttribute("billing_phone")?>

<?php echo t("SHIPPING INFORMATION")?>
<?php echo $order->getAttribute("shipping_first_name"). " " . $order->getAttribute("shipping_last_name")?>
<?php echo $order->getAttribute("shipping_address")->address1?>
<?php  if($order->getAttribute("shipping_address")->address2){
    echo $order->getAttribute("shipping_address")->address2;
} ?>
<?php echo $order->getAttribute("shipping_address")->city?>, <?php echo $order->getAttribute("shipping_address")->state_province?> <?php echo $order->getAttribute("shipping_address")->postal_code?>

<?php echo t("ORDER ITEMS")?>
<?php  
    $items = $order->getOrderItems();
    if($items){
        foreach($items as $item){
            echo "{$item->getQty()}x {$item->getProductName()}";
        }
    }
?>

<?php echo t("Tax")?>: <?php echo Price::format($order->getTaxTotal())?>
<?php echo t("Shipping")?>:  <?php echo Price::format($order->getShippingTotal())?>
<?php echo t("Total")?>: <?php echo Price::format($order->getTotal())?>

<?php  

$body = ob_get_clean(); ?>
