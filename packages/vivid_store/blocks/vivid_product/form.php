<?php  defined('C5_EXECUTE') or die("Access Denied."); ?>
<style type="text/css">
    #product-search { position: relative; }
    #product-search-results { position: absolute; z-index: 2; display: none; top: 57px; padding: 10px 20px;background: #fff; width: 100%; height: 90px; overflow-y: scroll; border: 1px solid #ccc; box-shadow: 0 0 10px #ccc; }
    #product-search-results.active { display: block; }
        #product-search-results ul { padding: 0; }
        #product-search-results ul li { list-style: none; padding: 2px 5px; cursor: pointer; }
        #product-search-results ul li:hover { background: #0088ff; color: #fff; }
</style>
<script type="text/javascript">
$(function(){
    //search accounts
    $("input#productSearch").on("keyup", function(e) {

        // Set Search String
        var searchString = $(this).val();
    
        // Do Search
        if(searchString.length > 0){
            $("#product-search-results").addClass("active");
            $.ajax({
                type: "post",
                url: "<?php echo URL::to('/productfinder')?>",
                data: {query: searchString},
                success: function(html){
                    $("ul#results-list").html(html);
                    $("#product-search-results ul li").click(function(){
                        var pID = $(this).attr('data-product-id'); 
                        var productName = $(this).text();
                        $("#pID").val(pID);
                        $("#product-search-results").removeClass("active");
                        $('#productSearch').val('');
                        $("#selected-product").html(productName);
                    });
                    $("*:not(#product-search-results ul li)").click(function(){
                        $("#product-search-results").removeClass("active");
                    })
                }
            });
            
        }
        else{
            $("#product-search-results").removeClass("active");
        }
    });
    
    
});  
</script>

<legend><?php echo t("Product to include")?></legend>

<div class="form-group">
    <?php echo $form->label('productLocation',t("Choose a Product to show"))?>
    <?php echo $form->select('productLocation',array('page'=>'Find product associated with this page','search'=>'Search a product'),$productLocation,array('onChange'=>'updateProductLocation();'))?>
</div>

<div class="form-group" id="product-search">
    <?php echo $form->label('productSearch','Search for a product')?>
    <?php echo $form->text('productSearch')?>
    <?php echo $form->hidden('pID',$pID)?>
    <div id="product-search-results">
        <ul id="results-list">
            
        </ul>
    </div>
    <div class="alert alert-info">
        <strong><?php echo t("Selected Product:")?></strong>
        <span id="selected-product"></span>
    </div>
   
</div>

<legend><?php echo t("What would you like to show")?></legend>

<div class="row">
    <div class="col-xs-6">
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showProductName',1,!isset($showProductName)?true:$showProductName);?>
                <?php echo t('Show Product Name')?>
            </label>
        </div>    
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showProductDescription',1,!isset($showProductDescription)?true:$showProductDescription);?>
                <?php echo t('Show Short Description')?>
            </label>
        </div> 
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showProductDetails',1,!isset($showProductDetails)?true:$showProductDetails);?>
                <?php echo t('Show Product Details')?>
            </label>
        </div>   
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showProductPrice',1,!isset($showProductPrice)?true:$showProductPrice);?>
                <?php echo t('Show Price')?>
            </label>
        </div>
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showWeight',1,$showWeight);?>
                <?php echo t('Show Weight')?>
            </label>
        </div>
    </div>
    <div class="col-xs-6">
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showImage',1,!isset($showImage)?true:$showImage);?>
                <?php echo t('Show Product Image')?>
            </label>
        </div>
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showCartButton',1,!isset($showCartButton)?true:$showCartButton);?>
                <?php echo t('Show "Add to Cart" Button')?>
            </label>
        </div>
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showIsFeatured',1,$showIsFeatured);?>
                <?php echo t('Show if it\'s featured')?>
            </label>
        </div>
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showGroups',1,!isset($showGroups)?true:$showGroups);?>
                <?php echo t('Show Group Product is in')?>
            </label>
        </div>
        <div class="checkbox">
            <label>
                <?php  echo $form->checkbox('showDimensions',1,$showDimensions);?>
                <?php echo t('Show Dimensions')?>
            </label>
        </div>
        
    </div>
</div>    

<div class="form-group">
    <?php  echo $form->label('btnText', t("Add to Cart Button Text"))?>
    <?php  echo $form->text('btnText',$btnText)?>
</div>


<script type="text/javascript">
    function updateProductLocation(){
        if ( $("#productLocation").val() == "page" ) {
            $("#product-search").hide();
        } else {
            $("#product-search").show();
        }
    };
    updateProductLocation();
</script>