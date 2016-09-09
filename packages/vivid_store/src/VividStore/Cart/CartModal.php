<?php  
namespace Concrete\Package\VividStore\Src\VividStore\Cart;

use \Concrete\Core\Controller\Controller as RouteController;
use View;
use \Concrete\Package\VividStore\Src\VividStore\Cart\Cart as VividCart;
use Illuminate\Filesystem\Filesystem;

defined('C5_EXECUTE') or die(_("Access Denied."));

class CartModal extends RouteController
{
        
    public function getCartModal()
    {
        $cart = VividCart::getCart();
        $total = VividCart::getSubTotal();

        if(Filesystem::exists(DIR_BASE.'/application/elements/cart_modal.php')){
            View::element('cart_modal',array('cart'=>$cart,'total'=>$total, 'actiondata'=>$this->post()));
        } else {
            View::element('cart_modal',array('cart'=>$cart,'total'=>$total,'actiondata'=>$this->post()),'vivid_store');
        }
    }
    
}
