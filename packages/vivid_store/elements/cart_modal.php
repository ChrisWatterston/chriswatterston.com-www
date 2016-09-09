<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
use \Concrete\Package\VividStore\Src\VividStore\Product\Product as VividProduct;
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
?>
<div class="cart-modal clearfix ecoms" id="cart-modal">
    <a href="javascript:vividStore.exitModal()" class="product-modal-exit">x</a>
    <div class="cart-page-cart">
        <?php  if (isset($actiondata) and !empty($actiondata)) { ?>

            <?php  if($actiondata['action'] == 'add') { ?>
                <p class="alert alert-success"><strong><?php echo  $actiondata['product']['pName']; ?></strong> <?php echo  t('has been added to your cart');?></p>
            <?php  } ?>

            <?php  if( $actiondata['action'] =='update') { ?>
                <p class="alert alert-success"><?php echo  t('Your cart has been updated');?></p>
            <?php  } ?>

            <?php  if($actiondata['action'] == 'clear') { ?>
                <p class="alert alert-warning"><?php echo  t('Your cart has been cleared');?></p>
            <?php  } ?>

            <?php  if($actiondata['action'] == 'remove') { ?>
                <p class="alert alert-warning"><?php echo  t('Item removed');?></p>
            <?php  } ?>

            <?php  if($actiondata['quantity'] != $actiondata['added']) { ?>
                <p class="alert alert-warning"><?php echo  t('Due to stock levels your quantity has been limited');?></p>
            <?php  } ?>

        <?php  } ?>

        <h2><?php echo t("Shopping Cart")?></h2>

        <input id='cartURL' type='hidden' data-cart-url='<?php echo View::url("/cart/")?>'>

        <ul class="cart-page-cart-list">
            <?php 
            if($cart){
                $i=1;
                foreach ($cart as $k=>$cartItem){
                    $pID = $cartItem['product']['pID'];
                    $qty = $cartItem['product']['qty'];
                    $product = VividProduct::getByID($pID);
                    if($i%2==0){$classes=" striped"; }else{ $classes=""; }
                    if(is_object($product)){
                        ?>

                        <li class="cart-page-cart-list-item clearfix<?php echo $classes?>" data-instance-id="<?php echo $k?>" data-product-id="<?php echo $pID?>">
                            <div class="cart-list-thumb">
	                            <?php echo $product->getProductImageThumb()?>
<!--
                                <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>">
                                    <?php echo $product->getProductImageThumb()?>
                                </a>
-->
                            </div>
                            <div class="cart-list-product-name">
	                             <?php echo $product->getProductName()?>
<!--
                                <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>">
                                    <?php echo $product->getProductName()?>
                                </a>
-->
                            </div>

                            <div class="cart-list-item-price">
                                <?php echo Price::format($product->getActivePrice())?>
                            </div>

                            <div class="cart-list-product-qty">
                                <?php  if ($product->allowQuantity()) { ?>
                                <span class="cart-item-label"><?php echo t("Quantity:")?></span><br />
                                <input type="number" <?php echo  ($product->allowBackOrders() || $product->isUnlimited() ? '' : 'max="'.$product->getProductQty() . '"');?> min="1" value="<?php echo $qty?>" style="width: 50px;">
                                <?php  } ?>
                            </div>
                            <div class="cart-list-item-links">
                                <?php  if ($product->allowQuantity()) { ?>
                                <a class="abtn sml btn-cart-list-update" href="javascript:vividStore.updateItem(<?php echo $k?>, true);" style="color:#009C8D;"><?php echo t("Update")?></a>
                                <?php  } ?>
                                <a class="abtn sml btn-cart-list-remove"  href="javascript:vividStore.removeItem(<?php echo $k?>, true);"><?php echo t("Remove")?></a>
                            </div>
                            <?php  if($cartItem['productAttributes']){?>
                                <div class="cart-list-item-attributes">
                                    <?php  foreach($cartItem['productAttributes'] as $groupID => $valID){
                                        $groupID = str_replace("pog","",$groupID);
                                        ?>
                                        <div class="cart-list-item-attribute">
                                            <span class="cart-list-item-attribute-label"><?php echo VividProduct::getProductOptionGroupNameByID($groupID)?>:</span>
                                            <span class="cart-list-item-attribute-value"><?php echo VividProduct::getProductOptionValueByID($valID)?></span>
                                        </div>
                                    <?php  }  ?>
                                </div>
                            <?php  } ?>


                        </li>

                        <?php 
                    }//if is_object
                    $i++;
                }//foreach
            }//if cart
            ?>
        </ul>


        <?php  if ($cart  && !empty($cart)) { ?>
        <div class="cart-page-cart-total">
            <span class="cart-grand-total-label"><?php echo t("Sub Total")?>:</span>
            <span class="cart-grand-total-value"><?php echo Price::format($total)?></span>
        </div>
        <?php  } else { ?>
        <p class="alert alert-info"><?php echo  t('Your basket is empty'); ?></p>
        <?php  } ?>


        <div class="cart-page-cart-links">
            <a class="abtn btn-cart-modal-continue black" href="javascript:vividStore.exitModal()"><?php echo t("Continue Shopping")?></a>
            <?php  if ($cart  && !empty($cart)) { ?>
            <a class="abtn btn-cart-modal-clear red" href="javascript:vividStore.clearCart(true)"><?php echo t('Empty Basket')?></a>
            <a class="abtn btn-cart-modal-checkout" href="<?php echo View::url('/checkout')?>"><?php echo t('Checkout')?></a>
            <?php  } ?>
        </div>

    </div>
</div>
