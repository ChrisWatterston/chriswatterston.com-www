<?php 
namespace Concrete\Package\VividStore;
use Package;

use \Concrete\Package\VividStore\Src\VividStore\Payment\Method as PaymentMethod;
use \Concrete\Package\VividStore\Src\VividStore\Shipping\MethodType as ShippingMethodType;
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Installer;
use Route;
use Asset;
use AssetList;

class Controller extends Package
{
    protected $pkgHandle = 'vivid_store';
    protected $appVersionRequired = '5.7.3';
    protected $pkgVersion = '3.0.1';
    protected $pkgAutoloaderRegistries = array(
        'src/AuthorizeNet' => '\AuthorizeNet',
        'src/Omnipay' => '\Omnipay'
    );
    public function getPackageDescription()
    {
        return t("Add a Store to your Site");
    }

    public function getPackageName()
    {
        return t("Vivid Store");
    }

    public function installStore()
    {
        $pkg = Package::getByHandle('vivid_store');
        if (version_compare($pkg->getPackageVersion(), '2.1', '<')) {
            Installer::renameDatabaseTables($pkg);
        }
        if (version_compare(APP_VERSION, '5.7.4', '<')) {
    	   Installer::refreshDatabase($pkg);
        }
        Installer::installSinglePages($pkg);
        Installer::installProductParentPage($pkg);
        Installer::installStoreProductPageType($pkg);
        Installer::updateConfigStorage($pkg);
        Installer::setDefaultConfigValues($pkg);
        Installer::installPaymentMethods($pkg);
        Installer::installShippingMethods($pkg);
        Installer::installBlocks($pkg);
        Installer::setPageTypeDefaults($pkg);
        Installer::installCustomerGroups($pkg);
        Installer::installUserAttributes($pkg);
        Installer::installOrderAttributes($pkg);
        Installer::installProductAttributes($pkg);
        Installer::createDDFileset($pkg);
        Installer::installOrderStatuses($pkg);
        Installer::installDefaultTaxClass($pkg);
        if (version_compare($pkg->getPackageVersion(), '3.0', '<')) {
            Installer::migrateOldShippingMethod($pkg);
            Installer::migrateOldTaxRates($pkg);   
        }
    }

    public function install()
    {
        $pkg = parent::install();
        $this->installStore();
    }

    public function upgrade()
    {
        $pkg = Package::getByHandle('vivid_store');
        Installer::upgrade($pkg);
    	$this->installStore();
        
    }



    public function registerRoutes()
    {
        Route::register('/cart/getSubTotal', '\Concrete\Package\VividStore\Src\VividStore\Cart\CartTotal::getSubTotal');
        Route::register('/cart/getTaxTotal', '\Concrete\Package\VividStore\Src\VividStore\Cart\CartTotal::getTaxTotal');
        Route::register('/cart/getTotal', '\Concrete\Package\VividStore\Src\VividStore\Cart\CartTotal::getTotal');
        Route::register('/cart/getShippingTotal','\Concrete\Package\VividStore\Src\VividStore\Cart\CartTotal::getShippingTotal');
        Route::register('/cart/getTotalItems', '\Concrete\Package\VividStore\Src\VividStore\Cart\CartTotal::getTotalItems');
        Route::register('/cart/getmodal', '\Concrete\Package\VividStore\Src\VividStore\Cart\CartModal::getCartModal');
        Route::register('/productmodal', '\Concrete\Package\VividStore\Src\VividStore\Product\ProductModal::getProductModal');
        Route::register('/checkout/getstates', '\Concrete\Package\VividStore\Src\VividStore\Utilities\States::getStateList');
        Route::register('/checkout/getShippingMethods','\Concrete\Package\VividStore\Src\VividStore\Utilities\Checkout::getShippingMethods');
        Route::register('/checkout/updater','\Concrete\Package\VividStore\Src\VividStore\Utilities\Checkout::updater');
        Route::register('/productfinder','\Concrete\Package\VividStore\Src\VividStore\Utilities\ProductFinder::getProductMatch');
        Route::register('/checkout/paypalresponse','\Concrete\Package\VividStore\Src\VividStore\Payment\Methods\PaypalStandard\PaypalStandardPaymentMethod::validateCompletion');
        Route::register('/dashboard/store/orders/details/slip','\Concrete\Package\VividStore\Src\VividStore\Utilities\OrderSlip::renderOrderPrintSlip');
    }
    public function on_start()
    {
        $this->registerRoutes();

        $al = AssetList::getInstance();
        $al->register( 'css', 'vivid-store', 'css/vivid-store.css', array('version' => '1', 'position' => Asset::ASSET_POSITION_HEADER, 'minify' => false, 'combine' => false), $this );
        $al->register( 'css', 'vividStoreDashboard', 'css/vividStoreDashboard.css', array('version' => '1', 'position' => Asset::ASSET_POSITION_HEADER, 'minify' => false, 'combine' => false), $this );
        $al->register( 'javascript', 'vivid-store', 'js/vivid-store.js', array('version' => '1', 'position' => Asset::ASSET_POSITION_FOOTER, 'minify' => false, 'combine' => false), $this );
        $al->register( 'javascript', 'vividStoreFunctions', 'js/vividStoreFunctions.js', array('version' => '1', 'position' => Asset::ASSET_POSITION_FOOTER, 'minify' => false, 'combine' => false), $this );

        $al->register( 'javascript', 'chartist', 'js/chartist.js', array('version' => '0.9.4', 'position' => Asset::ASSET_POSITION_FOOTER, 'minify' => false, 'combine' => false), $this );
        $al->register( 'css', 'chartist', 'css/chartist.css', array('version' => '0.9.4', 'position' => Asset::ASSET_POSITION_HEADER, 'minify' => false, 'combine' => false), $this );
        $al->registerGroup('chartist',
            array(
                array('javascript', 'chartist'),
                array('css', 'chartist'),
            )
        );
    }
    public function uninstall()
    {
        $authnetpm = PaymentMethod::getByHandle('auth_net');
        if(is_object($authnetpm)){
            $authnetpm->delete();
        }
        $invoicepm = PaymentMethod::getByHandle('invoice');
        if(is_object($invoicepm)){
            $invoicepm->delete();
        }
        $paypalpm = PaymentMethod::getByHandle('paypal_standard');
        if(is_object($paypalpm)){
            $paypalpm->delete();
        }
        
        $shippingMethodType = ShippingMethodType::getByHandle('flat_rate');
        if(is_object($shippingMethodType)) {
            $shippingMethodType->delete();
        }
        $shippingMethodType = ShippingMethodType::getByHandle('free_shipping');
        if(is_object($shippingMethodType)) {
            $shippingMethodType->delete();
        }
        parent::uninstall();
    }


}
?>
