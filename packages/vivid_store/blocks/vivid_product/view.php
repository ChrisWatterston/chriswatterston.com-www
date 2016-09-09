<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));

if(is_object($p)){?>

<form class="product-detail-block" id="form-add-to-cart-<?php echo $p->getProductID()?>">
    
    <div class="col-container">
        <?php  if($showImage){ ?>
        <div class="vivid-store-col-2 product-image">
            <?php 
                $imgObj = $p->getProductImageObj();
                if(is_object($imgObj)){
                    $thumb = Core::make('helper/image')->getThumbnail($imgObj,500,385,true);
            ?>
            <div class="product-primary-image">
                <a href="<?php echo $imgObj->getRelativePath()?>" class="product-thumb">
                    <img src="<?php echo $thumb->src?>">
                </a>
            </div>
            <?php  } ?>

            <?php 
            $images = $p->getProductImagesObjects();
            if(count($images)>0){
                echo '<div class="product-additional-images">';
                foreach($images as $secondaryimage) {
                     if(is_object($secondaryimage)) {
                         $thumb = Core::make('helper/image')->getThumbnail($secondaryimage, 150, 150, true);
                      ?>
                      
                      <a class="product-thumb" href="<?php echo $secondaryimage->getRelativePath()?>"><img src="<?php echo $thumb->src?>"></a>
                      
                    <?php  }
                }
                echo '</div>';
            }
            ?>
        </div>
        <div class="vivid-store-col-2">
        <?php  } else { ?>
        <div class="vivid-store-col-1">
        <?php  } ?>
                   
            <?php  if($showGroups){?>
            <span class="product-group"><?php echo $p->getGroupName()?></span>
            <?php  } ?>
            
            <?php  if($showIsFeatured){
               if($p->isFeatured()){?> 
                <span class="product-featured"><?php echo t("Featured Item")?></span>
               <?php  }
            }?>
            
            <?php  if($showProductName){?>
            <h2 class="product-name"><?php echo $p->getProductName()?></h2>
            <?php } ?>                     

			<?php  if($showProductPrice){?>
            <span class="product-price">
                <?php 
                    $salePrice = $p->getProductSalePrice();
                    if(isset($salePrice) && $salePrice != ""){
                        echo '<span class="sale-price">'.t("On Sale: ").$p->getFormattedSalePrice().'</span>';
                        echo '<span class="original-price">'.$p->getFormattedPrice().'</span>';
                    } else {
                        echo $p->getFormattedPrice();
                    }
                ?>
            </span>
            <?php  } ?>

			<?php  if($showProductDetails){?>
	        <div class="product-detailed-description">
				<!-- <h2><?php echo t("Product Details")?></h2> -->
	            <?php echo $p->getProductDetail()?>
	        </div>
	        <?php  } ?>
                        
            <?php  if($showDimensions){?>
            <div class="product-dimensions">
                <strong><?php echo t("Dimensions")?>:</strong>
                <?php echo $p->getDimensions()?>
                <?php  echo Config::get('vividstore.sizeUnit'); ?>
            </div>
            <?php  } ?>
            
            <?php  if($showWeight){?>
            <div class="product-weight">
                <strong><?php echo t("Weight")?>:</strong>
                <?php echo $p->getProductWeight()?>
                <?php  echo Config::get('vividstore.weightUnit'); ?>
            </div>
            <?php  } ?>
            
            <div class="clearfix col-container product-options">
                <?php  if ($p->allowQuantity()) { ?>
                <div class="product-modal-option-group vivid-store-col-2">
<!--                     <label class="option-group-label"><?php echo t('Quantity')?></label> -->
                    <input type="number" name="quantity" class="product-qty" value="1" min="1" <?php echo ($p->allowBackOrders() ? '' :'max="' . $p->getProductQty() . '"' );?> hidden>
                </div>
                    <?php  } else { ?>
                    <input type="hidden" name="quantity" class="product-qty" value="1">
                <?php  } ?>
                <?php 
                $optionGroups = $p->getProductOptionGroups();
                $optionItems = $p->getProductOptionItems();
                foreach($optionGroups as $optionGroup){
                ?>
                <div class="product-option-group vivid-store-col-2">
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
            </div>
          
            <?php  if($showCartButton) {?>
            <div class="product-button-shell">
                <input type="hidden" name="pID" value="<?php echo $p->getProductID()?>">
                <?php  if($p->isSellable()){?>
                <a href="javascript:vividStore.addToCart(<?php echo $p->getProductID()?>,false)" class="btn btn-primary abtn"><?php echo t("ADD to Bag")?></a>
                <?php  } else { ?>
                    <span class="out-of-stock-label"><?php echo t("Out of Stock")?></span>
                <?php  } ?>
            </div>
            <?php } ?>
            
        </div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
    $('.product-thumb').magnificPopup({
        type:'image',
        gallery:{enabled:true}
    });
});
</script>
   
<?php  } else { ?>
    <div class="alert alert-info"><?php echo t("We can't seem to find this product at the moment")?></div>
<?php  } ?>
