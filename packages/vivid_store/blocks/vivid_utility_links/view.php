<?php  defined('C5_EXECUTE') or die("Access Denied.");?>
<div class="vivid-store-utility-links <?php echo  ($itemCount == 0 ? 'vivid-cart-empty' : '');?>">
    <?php  if($showSignIn){
        $u = new User();
        if(!$u->isLoggedIn()){
            echo '<a href="'.URL::to('/login').'">'.t("Sign In").'</a>';
        }
    } ?>
    <?php  if($showGreeting){
        $u = new User();
        if($u->isLoggedIn()){
            $msg = '<span class="welcome-message">'.t("Welcome back").'</span>';
            $ui = UserInfo::getByID($u->getUserID());
            if($firstname = $ui->getAttribute('billing_first_name')){
                $msg = '<span class="welcome-message">'.t("Welcome back, ").'<span class="first-name">'.$firstname.'</span></span>';
            }
            echo $msg;
        }
    } ?>
    <?php  if($showCartItems){?>
    <span class="items-in-cart"><?php echo $itemsLabel?> (<span class="items-counter"><?php echo $itemCount?></span>)</span>
    <?php  } ?>
    
    <?php  if($showCartTotal){?>
    <span class="total-cart-amount"><?php echo $total?></span>
    <?php  } ?>

    <?php  if ($popUpCart) { ?>
    <a href="javascript:vividStore.displayCart()" class="cart-link abtn"><?php echo $cartLabel?></a>
    <?php  } else { ?>
    <a href="<?php echo View::url('/cart')?>" class="cart-link abtn"><?php echo $cartLabel?></a>
    <?php  } ?>

    <?php  if($showCheckout){?>
    <a href="<?php echo View::url('/checkout')?>" class="cart-link abtn"><?php echo t("Checkout")?></a>	
    <?php  } ?>
    
</div>
<?php  if(\Config::get('vividstore.cartOverlay')){?>
<script>
    $('.cart-link').click(function(e){
        e.preventDefault();
        vividStore.displayCart();
    });
</script>
<?php  } ?>
