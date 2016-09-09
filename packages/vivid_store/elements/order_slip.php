<?php 
defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
use \Concrete\Package\VividStore\Src\Attribute\Key\StoreOrderKey as StoreOrderKey;
?>
<link href="/concrete/css/app.css" rel="stylesheet" type="text/css" media="all">
<div class="ccm-ui">
    <div class="container">
<h3><?php echo t("Customer Overview")?></h3>
    <hr>
    
    <div class="row">
        <div class="col-xs-12">
            <?php  $orderemail = $order->getAttribute("email");

            if ($orderemail) { ?>
            <h4><?php echo t("Email")?></h4>
            <p><a href="mailto:<?php echo $order->getAttribute("email"); ?>"><?php echo $order->getAttribute("email"); ?></a></p>
            <?php  } ?>

            <?php 
            $ui = UserInfo::getByID($order->getCustomerID());
            if ($ui) { ?>
            <h4><?php echo t("User")?></h4>
            <p><a href="<?php echo  View::url('/dashboard/users/search/view/' . $ui->getUserID());?>"><?php echo  $ui->getUserName(); ?></a></p>
            <?php  } ?>
        </div>

        <div class="col-xs-6">
            <h4><?php echo t("Billing Information")?></h4>
            <p>
                <?php echo $order->getAttribute("billing_first_name"). " " . $order->getAttribute("billing_last_name")?><br>
                <?php echo $order->getAttributeValueObject(StoreOrderKey::getByHandle('billing_address'))->getValue('displaySanitized', 'display'); ?>
                <br /> <br /><?php  echo t('Phone'); ?>: <?php echo $order->getAttribute("billing_phone")?>
            </p>
        </div>
        <div class="col-xs-6">
            <?php  if ($order->getAttribute("shipping_address")->address1) { ?>
            <h4><?php echo t("Shipping Information")?></h4>
            <p>
                <?php echo $order->getAttribute("shipping_first_name"). " " . $order->getAttribute("shipping_last_name")?><br>
                <?php echo $order->getAttributeValueObject(StoreOrderKey::getByHandle('shipping_address'))->getValue('displaySanitized', 'display'); ?>
            </p>
            <?php  } ?>
        </div>
    </div>
    
    <h3><?php echo t("Order Info")?></h3>
    <hr>
    <table class="table table-striped">
        <thead>
            <tr>
                <th><strong><?php echo t("Product Name")?></strong></th>
                <th><?php echo t("Product Options")?></th>
                <th><?php echo t("Price")?></th>
                <th><?php echo t("Quantity")?></th>
                <th><?php echo t("Subtotal")?></th>
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
                    <td><?php echo Price::format($item->getPricePaid())?></td>
                    <td><?php echo $item->getQty()?></td>
                    <td><?php echo Price::format($item->getSubTotal())?></td>
                </tr>
              <?php 
                    }
                }
            ?>
        </tbody>
    </table>
    
    <p>
        <strong><?php echo t("Subtotal")?>: </strong><?php echo Price::format($order->getSubTotal())?><br>
        <?php  foreach($order->getTaxes() as $tax){?>
            <strong><?php echo $tax['label']?>:</strong> <?php echo $tax['amount']?><br>
        <?php  } ?>
        <strong><?php echo t("Shipping")?>: </strong><?php echo Price::format($order->getShippingTotal())?><br>
        <strong><?php echo t("Grand Total")?>: </strong><?php echo Price::format($order->getTotal())?>
    </p>
    <p>
        <strong><?php echo t("Payment Method")?>: </strong><?php echo $order->getPaymentMethodName()?><br>
        <strong><?php echo t("Shipping Method")?>: </strong><?php echo $order->getShippingMethodName()?>
    </p>

    <?php  $applieddiscounts = $order->getAppliedDiscounts();

    if (!empty($applieddiscounts)) { ?>
        <h3><?php echo t("Discounts Applied")?></h3>
        <hr />
        <table class="table table-striped">
            <thead>
            <tr>
                <th><strong><?php echo t("Name")?></strong></th>
                <th><?php echo t("Displayed")?></th>
                <th><?php echo t("Deducted From")?></th>
                <th><?php echo t("Amount")?></th>
                <th><?php echo t("Triggered")?></th>
            </tr>

            </thead>
            <tbody>
            <?php  foreach($applieddiscounts as $discount) { ?>
                <tr>
                    <td><?php echo  h($discount['odName']); ?></td>
                    <td><?php echo  h($discount['odDisplay']); ?></td>
                    <td><?php echo  h($discount['odDeductFrom']); ?></td>
                    <td><?php echo  ($discount['odValue'] > 0 ? $discount['odValue'] : $discount['odPercentage'] . '%' ); ?></td>
                    <td><?php echo  ($discount['odCode'] ? t('by code'). ' ' .$discount['odCode']: t('Automatically') ); ?></td>
                </tr>
            <?php  } ?>

            </tbody>
        </table>
    
    <p>
        <strong><?php echo t("Items Subtotal")?>:</strong>  <?php echo  Price::format($order->getSubTotal())?><br>
        <?php  $shipping = $order->getShippingTotal();
        if ($shipping > 0) { ?>
        <strong><?php echo t("Shipping")?>:</strong>  <?php echo  Price::format($shipping)?><br>
        <?php  } ?>
        <?php  foreach($order->getTaxes() as $tax){?>
            <strong><?php echo $tax['label']?>:</strong> <?php echo $tax['amount']?>
        <?php  } ?>
        <strong class="text-large"><?php echo t("Total")?>:</strong>  <?php echo  Price::format($order->getTotal())?><br>
        <strong><?php echo t("Payment Method")?>:</strong> <?php echo $order->getPaymentMethodName()?>
    </p>




    <?php  } ?>
    </div>
    </div>