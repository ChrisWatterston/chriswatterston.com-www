<?php 
namespace Concrete\Package\VividStore\Src\VividStore\Payment\Methods\Invoice;

use \Concrete\Package\VividStore\Src\VividStore\Payment\Method as PaymentMethod;
use Core;
use Config;

defined('C5_EXECUTE') or die(_("Access Denied."));
class InvoicePaymentMethod extends PaymentMethod
{
    public function dashboardForm()
    {
        $this->set('form',Core::make("helper/form"));
        $this->set('invoiceMinimum',Config::get('vividstore.invoiceMinimum'));
        $this->set('invoiceMaximum',Config::get('vividstore.invoiceMaximum'));
    }
    
    public function save($data)
    {
        Config::save('vividstore.invoiceMinimum',$data['invoiceMinimum']);
        Config::save('vividstore.invoiceMaximum',$data['invoiceMaximum']);
    }
    public function validate($args,$e)
    {
        
        //$e->add("error message");        
        return $e;
        
    }
    public function checkoutForm()
    {
        //nada
    }
    
    public function submitPayment()
    {
        
        //nothing to do except return true
        return true;
        
    }

    public function getPaymentMinimum() {
        $defaultMin  = 0;

        $minconfig = trim(Config::get('vividstore.invoiceMinimum'));

        if ($minconfig == '') {
            return $defaultMin;
        } else {
            return max($minconfig, $defaultMin);
        }
    }

    public function getPaymentMaximum() {
        $defaultMax  = 1000000000;

        $maxconfig = trim(Config::get('vividstore.invoiceMaximum'));
        if ($maxconfig == '') {
            return $defaultMax;
        } else {
            return min($maxconfig, $defaultMax);
        }
    }

}

return __NAMESPACE__;
