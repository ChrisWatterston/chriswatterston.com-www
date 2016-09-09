<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price as Price;
if($products){
    echo "<div class='product-list clearfix'>";

    $i=1;
    foreach($products as $product){
        //this is done so we can get a type of active class if there's a product list on the product page
        $class = "product-list-item vivid-store-col-".$productsPerRow;
        if(Page::getCurrentPage()->getCollectionID()==$product->getProductPageID()){
            $class = $class." on-product-page";
        }
    ?>
    
        <div class="<?php echo $class?>">
            
            <form class="product-list-item-inner" id="form-add-to-cart-<?php echo $product->getProductID()?>">
                
                <?php  
                    $imgObj = $product->getProductImageObj();
                    if(is_object($imgObj)){
                        $thumb = $ih->getThumbnail($imgObj,400,280,true);?>
                        <div class="product-list-thumbnail">
                            <?php  if($showQuickViewLink){ ?>
                            <a class="product-quick-view" href="javascript:vividStore.productModal(<?php echo $product->getProductID()?>);">
                                <?php echo t("Quick View")?>
                            </a>
                            <?php  } ?>
                            <img src="<?php echo $thumb->src?>" class="img-responsive">
                        </div>
                <?php 
                    }// if is_obj
                ?>
                <h2 class="product-list-name"><?php echo $product->getProductName()?></h2>
                <span class="product-list-price">
                    <?php 
                        $salePrice = $product->getProductSalePrice();
                        if(isset($salePrice) && $salePrice != ""){
                            echo '<span class="sale-price">'.Price::format($salePrice).'</span>';
                            echo '<span class="original-price">'.Price::format($product->getProductPrice()).'</span>';
                        } else {
                            echo Price::format($product->getProductPrice());
                        }
                    ?>
                </span>
                <?php  if($showDescription){ ?>
                <div class="product-list-description"><?php echo $product->getProductDesc()?></div>
                <?php  } ?>
                <?php  if($showPageLink){?>
                <a href="<?php echo URL::page(Page::getByID($product->getProductPageID()))?>" class="btn btn-default btn-sm btn-more-details"><?php echo t("More Details")?></a>
                <?php  } ?>
                <?php  if($showAddToCart){
                    /*
                     * If we have an add to cart button, 
                     * we at least need to have the Product ID
                     * and a default quanity (1)
                     */
                ?>

                <?php 
                $optionGroups = $product->getProductOptionGroups();
                $optionItems = $product->getProductOptionItems();
                foreach($optionGroups as $optionGroup){
                    ?>
                    <div class="product-option-group">
                        <label class="option-group-label"><?php echo $optionGroup['pogName']?></label>
                        <select name="pog<?php echo $optionGroup['pogID']?>">
                            <?php 
                            foreach($optionItems as $option){
                                if($option['pogID']==$optionGroup['pogID']){?>
                                    <option value="<?php echo $option['poiID']?>"><?php echo $option['poiName']?></option>
                                <?php  }
                            }//foreach
                            ?>
                        </select>
                    </div>
                <?php  } ?>

                <input type="hidden" name="pID" value="<?php echo $product->getProductID()?>">
                <input type="hidden" name="quantity" class="product-qty" value="1">
                <?php  if($product->isSellable()){?>
                <a href="javascript:vividStore.addToCart(<?php echo $product->getProductID()?>,false)" class="btn btn-primary btn-sm btn-add-to-cart"><?php echo t("Add to Cart")?></a>
                <?php  } else { ?>
                    <span class="out-of-stock-label"><?php echo t("Out of Stock")?></span>
                <?php  } ?>
                <?php  } ?>
            
            </form><!-- .product-list-item-inner -->
            
        </div><!-- .product-list-item -->
        
        <?php  
            if($i%$productsPerRow==0){
                echo "</div>";
                echo "<div class='product-list clearfix'>";
                //this helps to keep rows straight (products from floating under smaller height products).
            }
        
        $i++;
    
    }// foreach    
    echo "</div><!-- .product-list -->";
    
    if($showPagination){
        if ($paginator->getTotalPages() > 1) {
            echo $pagination;
        }
    }
    
} //if products
else { ?>
    <div class="alert alert-info"><?php echo t("No Products Available")?></div>
<?php  } ?>
