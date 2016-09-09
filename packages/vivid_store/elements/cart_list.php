<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
use \Concrete\Package\VividStore\Src\VividStore\Product\Product as VividProduct;
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
?>
<ul class="checkout-cart-list">
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

                <li class="checkout-cart-item clearfix<?php echo $classes?>" data-instance-id="<?php echo $k?>" data-product-id="<?php echo $pID?>">
                    <div class="cart-list-thumb">
	                    <?php echo $product->getProductImageThumb()?>
	                    <!-- <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>"><?php echo $product->getProductImageThumb()?></a> -->
                    </div>
                    <div class="checkout-cart-product-name">
	                    <?php echo $product->getProductName()?>
						<!-- <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>"><?php echo $product->getProductName()?></a> -->
                    </div>

                    <div class="checkout-cart-item-price">
                    	<?php echo Price::format($product->getActivePrice())?>
                    </div>

                    <?php  if ($product->allowQuantity()) { ?>
                    <div class="checkout-cart-product-qty">
                        <span class="checkout-cart-item-label"><?php echo t("Quantity:")?></span>
                        <?php echo $qty?>
                    </div>
                    <?php  } ?>

                    <?php  if($cartItem['productAttributes']){?>
                        <div class="checkout-cart-item-attributes">
                            <?php  foreach($cartItem['productAttributes'] as $groupID => $valID){
                                $groupID = str_replace("pog","",$groupID);
                                ?>
                                <div class="cart-list-item-attribute">
                                    <span class="checkout-cart-item-attribute-label"><?php echo VividProduct::getProductOptionGroupNameByID($groupID)?>:</span>
                                    <span class="checkout-cart-item-attribute-value"><?php echo VividProduct::getProductOptionValueByID($valID)?></span>
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