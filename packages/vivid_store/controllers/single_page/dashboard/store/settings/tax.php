<?php 

namespace Concrete\Package\VividStore\Controller\SinglePage\Dashboard\Store\Settings;

use \Concrete\Core\Page\Controller\DashboardPageController;
use View;
use Loader;
use Core;

use \Concrete\Package\VividStore\Src\VividStore\Tax\Tax as StoreTax;
use \Concrete\Package\VividStore\Src\VividStore\Tax\TaxClass;
use \Concrete\Package\VividStore\Src\VividStore\Tax\TaxRate;

defined('C5_EXECUTE') or die("Access Denied.");

class Tax extends DashboardPageController
{
    
    public function view()
    {
        $this->set("taxRates",StoreTax::getTaxRates());
        $this->set("taxClasses",TaxClass::getTaxClasses());
    }
    public function add()
    {
        $this->set('pageTitle',t("Add Tax Rate"));
        $this->set("task",t("Add"));
        $this->set("taxRate",new TaxRate()); //shuts up errors when adding
        $this->loadFormAssets();
    }
    public function edit($trID)
    {
        $this->set('pageTitle',t("Edit Tax Rate"));
        $this->set("task",t("Update"));
        $this->set("taxRate",TaxRate::getByID($trID));
        $this->loadFormAssets();
    }
    public function delete($trID)
    {
        TaxRate::getByID($trID)->delete();
        $this->redirect('/dashboard/store/settings/tax/removed');
    }
    public function loadFormAssets()
    {
        $this->set("countries",Core::make('helper/lists/countries')->getCountries());
        $this->set("states",Core::make('helper/lists/states_provinces')->getStates());
        $this->requireAsset('javascript', 'vividStoreFunctions');
    }
    public function success()
    {
        $this->view();
        $this->set("message",t("Successfully added a new Tax Rate"));
    }
    public function updated()
    {
        $this->view();
        $this->set("message",t("Successfully updated"));
    }
    public function removed()
    {
        $this->view();
        $this->set("message",t("Successfully removed"));
    }
    public function add_rate()
    {
        $data = $this->post();
        $errors = $this->validate($data);
        $this->error = null; //clear errors
        $this->error = $errors;
        if (!$errors->has()) {
            if($this->post('taxRateID')){
                //update
                TaxRate::add($data);
                $this->redirect('/dashboard/store/settings/tax/updated');
            } else {
                //first we send the data to the shipping method type.
                TaxRate::add($data);
                $this->redirect('/dashboard/store/settings/tax/success');
            }
        } else {
            if($this->post('taxRateID')){
                $this->edit($this->post('taxRateID'));
            } else {
                //first we send the data to the shipping method type.
                $this->add();
            }
        }
    }
    public function validate($data)
    {
        $this->error = null;
        $e = Loader::helper('validation/error');
        
        if($data['taxLabel']==""){
            $e->add(t("You need a label for this Tax Rate"));
        }
        if($data['taxRate'] != ""){
            if(!is_numeric($data['taxRate'])){
                $e->add(t("Tax Rate must be a number"));
            }
        } else {
            $e->add(t("You need to enter a tax rate"));
        }
        
        return $e;
        
    }
    public function add_class()
    {
        $this->set('task',t("Add"));
        $this->set('tc',new TaxClass());
        $this->set('taxRates',StoreTax::getTaxRates());
    }
    public function edit_class($tcID)
    {
        $this->set('task',t("Update"));
        $this->set('tc', TaxClass::getByID($tcID));
        $this->set('taxRates',StoreTax::getTaxRates());
    }
    public function save_class()
    {
        $data = $this->post();
        $errors = $this->validateClass($data);
        $this->error = null; //clear errors
        $this->error = $errors;
        if($this->post('taxClassID')){
            $this->edit_class($this->post('taxClassID'));
        } else {
            $this->add_class();
        }
        if (!$errors->has()) {
            if($this->post('taxClassID')){
                //update
                $taxRate = TaxClass::getByID($this->post('taxClassID'));
                $taxRate->update($data);
                $this->redirect('/dashboard/store/settings/tax/class_updated');
            } else {
                //add.
                TaxClass::add($data);
                $this->redirect('/dashboard/store/settings/tax/class_added');
            }
        }
    }
    public function validateClass($data)
    {
        $this->error = null;
        $e = Loader::helper('validation/error');
        
        if($data['taxClassName']==""){
            $e->add(t("You need a name for this Tax Class"));
        }
        if(\Config::get('vividstore.calculation')=="extract"){
            if(count($data['taxClassRates'])>1){
                $e->add(t("You can only have one tax rate with your current tax settings"));
            }
        }
        
        return $e;
        
    }
    public function delete_class($tcID)
    {
        TaxClass::getByID($tcID)->delete();
        $this->redirect("/dashboard/store/settings/tax/class_deleted");   
    }
    public function class_deleted()
    {
        $this->set("message",t("Tax Class removed"));
        $this->view();
    }
    public function class_added()
    {
        $this->set("message",t("Tax Class Added"));
        $this->view();
    }
    
    public function class_updated()
    {
        $this->set("message",t("Tax Class updated"));
        $this->view();
    }
    
}
