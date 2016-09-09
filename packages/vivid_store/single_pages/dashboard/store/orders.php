<?php 
defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
use \Concrete\Package\VividStore\Src\Attribute\Key\StoreOrderKey as StoreOrderKey;
?>

<?php  if ($controller->getTask() == 'order'){ ?>
    
    <div class="ccm-dashboard-header-buttons">
        <form action="<?php echo URL::to('/dashboard/store/orders/details/slip')?>" method="post" target="_blank">
            <input type="hidden" name="oID" value="<?php echo $order->getOrderID()?>">
            <button class="btn btn-primary"><?php  echo t("Print Order Slip")?></button>
        </form>
    </div>
    
    <h3><?php echo t("Customer Overview")?></h3>
    <hr>
    <div class="row">
        <div class="col-sm-12">
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

        <div class="col-sm-6">
            <h4><?php echo t("Billing Information")?></h4>
            <p>
                <?php echo $order->getAttribute("billing_first_name"). " " . $order->getAttribute("billing_last_name")?><br>
                <?php echo $order->getAttributeValueObject(StoreOrderKey::getByHandle('billing_address'))->getValue('displaySanitized', 'display'); ?>
                <br /> <br /><?php  echo t('Phone'); ?>: <?php echo $order->getAttribute("billing_phone")?>
            </p>
        </div>
        <?php  if ($order->isShippable()) { ?>
        <div class="col-sm-6">
            <?php  if ($order->getAttribute("shipping_address")->address1) { ?>
            <h4><?php echo t("Shipping Information")?></h4>
            <p>
                <?php echo $order->getAttribute("shipping_first_name"). " " . $order->getAttribute("shipping_last_name")?><br>
                <?php echo $order->getAttributeValueObject(StoreOrderKey::getByHandle('shipping_address'))->getValue('displaySanitized', 'display'); ?>
            </p>
            <?php  } ?>
        </div>
        <?php  } ?>
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
    
    <?php  } ?>
    
     <p>
        <strong><?php echo t("Subtotal")?>: </strong><?php echo Price::format($order->getSubTotal())?><br>
        <?php  if ($order->isShippable()) { ?>
        <strong><?php echo t("Shipping")?>: </strong><?php echo Price::format($order->getShippingTotal())?><br>
        <?php  } ?>
        <?php  foreach($order->getTaxes() as $tax){?>
            <strong><?php echo $tax['label']?>:</strong> <?php echo Price::format($tax['amount'] ? $tax['amount'] : $tax['amountIncluded'])?><br>
        <?php  } ?>
        <strong><?php echo t("Grand Total")?>: </strong><?php echo Price::format($order->getTotal())?>
    </p>
    <p>
        <strong><?php echo t("Payment Method")?>: </strong><?php echo $order->getPaymentMethodName()?><br>
        <?php  if ($order->isShippable()) { ?>
        <strong><?php echo t("Shipping Method")?>: </strong><?php echo $order->getShippingMethodName()?>
        <?php  } ?>
    </p>

    <h3><?php echo t("Order Status History")?></h3>
    <hr>
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><?php echo t("Update Status")?></h4>
                </div>
                <div class="panel-body">

                    <form action="<?php echo View::url("/dashboard/store/orders/updatestatus",$order->getOrderID())?>" method="post">
                        <div class="form-group">
                            <?php  echo $form->select("orderStatus",$orderStatuses,$order->getStatus());?>
                        </div>
                        <input type="submit" class="btn btn-default" value="<?php echo t("Update")?>">
                    </form>

                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th><strong><?php echo t("Status")?></strong></th>
                    <th><?php echo t("Date")?></th>
                    <th><?php echo t("User")?></th>
                </tr>
                </thead>
                <tbody>
                <?php 
                $history = $order->getStatusHistory();
                if($history){
                    foreach($history as $status){
                        ?>
                        <tr>
                            <td><?php echo $status->getOrderStatusName()?></td>
                            <td><?php echo $status->getDate()?></td>
                            <td><?php echo $status->getUserName()?></td>
                        </tr>
                    <?php 
                    }
                }
                ?>
                </tbody>
            </table>
        </div>

    </div>

    <h3><?php echo t("Manage Order")?></h3>
    <hr>
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><?php echo t("Order Options")?></h4>
                </div>
                <div class="panel-body">
                    
                    <a id="btn-delete-order" href="<?php echo View::url("/dashboard/store/orders/remove", $order->getOrderID())?>" class="btn btn-danger"><?php echo t("Delete Order")?></a>
                    
                </div>
            </div>
        </div>
    </div>
    
    
<?php  } else { ?>

    <div class="ccm-dashboard-header-buttons">
    </div>

<div class="ccm-dashboard-content-full">
    <form role="form" class="form-inline ccm-search-fields">
        <div class="ccm-search-fields-row">
            <?php  if($statuses){?>
                <ul id="group-filters" class="nav nav-pills">
                    <li><a href="<?php  echo View::url('/dashboard/store/orders/')?>"><?php echo t('All Statuses')?></a></li>
                    <?php  foreach($statuses as $status){ ?>
                        <li><a href="<?php  echo View::url('/dashboard/store/orders/', $status->getHandle())?>"><?php echo $status->getReadableHandle();?></a></li>
                    <?php  } ?>
                </ul>
            <?php  } ?>
        </div>


        <div class="ccm-search-fields-row ccm-search-fields-submit">
            <div class="form-group">
                <div class="ccm-search-main-lookup-field">
                    <i class="fa fa-search"></i>
                    <?php  echo $form->search('keywords', $searchRequest['keywords'], array('placeholder' => t('Search Orders')))?>
                </div>
            </div>
            <button type="submit" class="btn btn-primary pull-right"><?php  echo t('Search')?></button>

        </div>

    </form>

    <table class="ccm-search-results-table">
        <thead>
            <th><a><?php echo t("Order %s","#")?></a></th>
            <th><a><?php echo t("Customer Name")?></a></th>
            <th><a><?php echo t("Order Date")?></a></th>
            <th><a><?php echo t("Total")?></a></th>
            <th><a><?php echo t("Status")?></a></th>
            <th><a><?php echo t("View")?></a></th>
        </thead>
        <tbody>
            <?php 
                foreach($orderList as $order){
            ?>
                <tr>
                    <td><a href="<?php echo View::url('/dashboard/store/orders/order/',$order->getOrderID())?>"><?php echo $order->getOrderID()?></a></td>
                    <td><?php echo $order->getAttribute('billing_last_name').", ".$order->getAttribute('billing_first_name')?></td>
                    <td><?php echo $order->getOrderDate()?></td>
                <td><?php echo Price::format($order->getTotal())?></td>
                    <td><?php echo ucwords($order->getStatus())?></td>
                    <td><a class="btn btn-primary" href="<?php echo View::url('/dashboard/store/orders/order/',$order->getOrderID())?>"><?php echo t("View")?></a></td>
                </tr>
            <?php  } ?>
        </tbody>
    </table>
</div>

<?php  if ($paginator->getTotalPages() > 1) { ?>
    <?php echo  $pagination ?>
<?php  } ?>

<?php  } ?>

<style>
    @media (max-width: 992px) {
        div#ccm-dashboard-content div.ccm-dashboard-content-full {
            margin-left: -20px !important;
            margin-right: -20px !important;
        }
    }
</style>