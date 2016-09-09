<?php  
namespace Concrete\Package\VividStore\Src\VividStore\Utilities;

use Controller;
use User;
use Database;

defined('C5_EXECUTE') or die(_("Access Denied."));

class ProductFinder extends Controller
{
        
    public function getProductMatch()
    {
        $u = new User();
        if (!$u->isLoggedIn()) {
          echo "Access Denied";
          exit;
        }
        if(!$_POST['query']){
            echo "Access Denied";
            exit;
        } else {
            $query = $_POST['query'];
            $db = Database::get();
            $results = $db->query('SELECT * FROM VividStoreProducts WHERE pName LIKE "%'.$query.'%"');
            
            if($results){
            foreach($results as $result){ ?>
        
                <li data-product-id="<?php echo $result['pID']?>"><?php echo $result['pName']?></li>
        
            <?php  } //for each
            } else { //if no results ?>
                <li><?php echo t("I can't find a product by that name")?></li>
            <?php  }
        }
        
        
    }
    
}
