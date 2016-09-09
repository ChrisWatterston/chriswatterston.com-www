<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>

<meta property="og:url"           content="https://www.chriswatterston.com/shop" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="#ThereIsNoCloud Magnet and Sticker" />
<meta property="og:description"   content="I've ordered my 'There Is No Cloud' magnet, have you?" />
<meta property="og:image"         content="http://chriswatterston.com-www.dev/application/files/4014/5917/1770/thereisnocloud-magnet-main.jpg" />
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<h1><?php echo t("Thanks - your order #%s is complete.",$order->getOrderID())?></h1>
<p class="alert-success"><?php echo t("Thank you for your order. A receipt should be emailed to you shortly.<br />Your order is usually shipped within two (2) days, but generally within 24 hours.")?></p>

<h3 style="margin-top:30px;">Share with others your good news</h3>
<div class="order-share">	
	<!-- Twitter -->
	<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://www.chriswatterston.com/shop" data-text="I've ordered my 'There Is No Cloud' magnet, have you?" data-via="chriswatterston" data-hashtags="ThereIsNoCloud" data-dnt="true">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

	<!-- Facebook -->
	<div class="fb-share-button" data-href="https://www.chriswatterston.com/shop" data-layout="button_count" style="margin-left:10px;margin-right:10px;"></div> 

	<!-- LinkedIn -->
	<script src="//platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
<script type="IN/Share" data-url="https://www.chriswatterston.com/shop" data-counter="right"></script>
</div>

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
        <h3><?php echo t("Your Downloads")?></h3>
        <ul class="order-downloads">
        <?php 
        foreach($downloads as $name=>$file){
            echo '<li><a href="'.$file->getDownloadURL().'">'.$name.'</a></li>';
        }?>
        </ul>
    <?php  }
    
    
/*
 *  The Order object is loaded should we wish to place receipt details here.
 *  Example:
 *  echo $order->getTaxTotal()
 *  echo $order->getShippingTotal()
 *  echo $order->getTotal()
 *  
 *  $orderItems = $order->getOrderItems();
 *  foreach($orderItems as $item){
 *      echo $item->getProductName();
 *      echo $item->getQty();
 *      echo $item->getPricePaid();
 *  }
 * 
 */
