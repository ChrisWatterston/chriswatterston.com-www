<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
use \Concrete\Package\VividStore\Src\VividStore\Product\Product as VividProduct;
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
?>
<div class="cart-page-cart">

    <h1><?php echo t("Shopping Basket")?></h1>

    <?php  if (isset($actiondata) and !empty($actiondata)) { ?>
        <?php  if( $actiondata['action'] =='update') { ?>
            <p class="alert alert-success"><?php echo  t('Your basket has been updated');?></p>
        <?php  } ?>

        <?php  if($actiondata['action'] == 'clear') { ?>
            <p class="alert alert-warning"><?php echo  t('Your basket has been cleared');?></p>
        <?php  } ?>

        <?php  if($actiondata['action'] == 'remove') { ?>
            <p class="alert alert-warning"><?php echo  t('Item removed');?></p>
        <?php  } ?>

        <?php  if($actiondata['quantity'] != $actiondata['added']) { ?>
            <p class="alert alert-warning"><?php echo  t('Due to stock levels your quantity has been limited');?></p>
        <?php  } ?>
    <?php  } ?>

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
                <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>">
                    <?php echo $product->getProductImageThumb()?>
                </a>
            </div>
            <div class="cart-list-product-name">
                <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>">
                    <?php echo $product->getProductName()?>
                </a>
            </div>
            
            <div class="cart-list-item-price">
                <?php  
                    $salePrice = $product->getProductSalePrice();
                    if(isset($salePrice) && $salePrice != ""){
                        echo '<span class="original-price">'.Price::format($product->getProductPrice()).'</span>';
                        echo '<span class="sale-price">'.Price::format($salePrice).'</span>';
                    } else {
                        echo Price::format($product->getProductPrice());
                    }
                ?>
            </div>
            <div class="cart-list-product-qty">
                <?php  if ($product->allowQuantity()) { ?>
                    <form method="post">
                        <input type="hidden" name="instance" value="<?php echo $k?>" />
                        <span class="cart-item-label"><?php echo t("Quantity:")?></span>
                        <input type="number" name="pQty" min="1" <?php echo ($product->allowBackOrders() ? '' :'max="' . $product->getProductQty() . '"' );?> value="<?php echo $qty?>" style="width: 50px;">
                        <button name="action" value="update" class="abtn btn-cart-list-update" type="submit"><?php echo t("Update")?></button>
                    </form>
                <?php  } ?>
            </div>
            <div class="cart-list-item-links">
                <form method="post">
                    <input type="hidden" name="instance" value="<?php echo $k?>" />
                     <button name="action" value="remove" class="abtn btn-cart-list-remove" type="submit"><?php echo t("Remove")?></button>
                </form>
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

    <?php  if ($discountsWithCodesExist) { ?>
    <h3><?php echo  t('Enter Discount Code');?></h3>
        <form method="post" action="<?php echo  View::url('/cart/');?>">
        <input type="text" name="code" />
            <input type="hidden" name="action" value="code" />
            <button type="submit" class=""><?php echo  t('Apply');?></button>
        </form>
    <?php  } ?>

    <?php  if ($codesuccess) { ?>
        <p><?php echo  t('Discount has been applied');?></p>
    <?php  } ?>

    <?php  if ($codeerror) { ?>
        <p><?php echo  t('Invalid code');?></p>
    <?php  } ?>

    <?php  if(!empty($discounts)) { ?>
    <h3><?php echo  t('Discounts');?></h3>
    <div class="cart-page-discounts">
        <ul>
        <?php  foreach($discounts as $discount) { ?>
            <li><?php  echo h($discount->getDisplay()); ?></li>
        <?php  } ?>
        </ul>
    </div>

    <?php  }?>

    <?php  if ($cart  && !empty($cart)) { ?>
    <div class="cart-page-cart-total">        
        <span class="cart-grand-total-label"><?php echo t("Sub Total")?>:</span>
        <span class="cart-grand-total-value"><?php echo Price::format($total)?></span>
    </div>
        
    <div class="cart-page-cart-links">
<!--
        <form method="post">
            <button name="action" value="clear" class="abtn sml btn-cart-list-clear" type="submit"><?php echo t("Empty basket")?></button>
        </form>
-->
        <a class="abtn btn-cart-page-checkout" href="<?php echo View::url('/checkout')?>"><?php echo t('Checkout')?></a>
    </div>
    <?php  } else { ?>
    <p class="alert alert-info"><?php echo  t('Your basket is empty');?></p>
    <?php  } ?>
    
</div>
