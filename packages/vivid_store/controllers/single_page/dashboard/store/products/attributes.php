<?php 

namespace Concrete\Package\VividStore\Controller\SinglePage\Dashboard\Store\Products;

use \Concrete\Core\Page\Controller\DashboardPageController;
use View;
use Loader;
use \Concrete\Core\Attribute\Key\Category as AttributeKeyCategory;
use \Concrete\Core\Attribute\Type as AttributeType;

use \Concrete\Package\VividStore\Src\Attribute\Key\StoreProductKey;

defined('C5_EXECUTE') or die("Access Denied.");

class Attributes extends DashboardPageController
{
    
    public function view() {
        $this->set('category', AttributeKeyCategory::getByHandle('store_product'));
        $attrTypes = AttributeType::getList('store_product');
        $types = array();
        foreach($attrTypes as $at) {
            $types[$at->getAttributeTypeID()] = $at->getAttributeTypeName();
        }
        $attrList = StoreProductKey::getList();
        $this->set('attrList',$attrList);
        $this->set('types', $types);
    }
    
    public function update_attributes() {
        $uats = $_REQUEST['akID'];
        StoreProductKey::updateAttributesDisplayOrder($uats);
        exit;
    }
        
    public function removed() {
        $this->set('message', t('Attribute Deleted.'));
        $this->view();
    }
    
    public function success() {
        $this->set('message', t('Attribute Created.'));
        $this->view();
    }

    public function updated() {
        $this->set('message', t('Attribute Updated.'));
        $this->view();
    }
    
    public function delete($akID, $token = null){
        try {
            $ak = StoreProductKey::getByID($akID);
                
            if(!($ak instanceof StoreProductKey)) {
                throw new Exception(t('Invalid attribute ID.'));
            }
    
            $valt = Loader::helper('validation/token');
            if (!$valt->validate('delete_attribute', $token)) {
                throw new Exception($valt->getErrorMessage());
            }
            
            $ak->delete();
            
            $this->redirect("/dashboard/store/products/attributes", 'removed');
        } catch (Exception $e) {
            $this->set('error', $e);
        }
    }

    public function select_type() {
        $atID = $this->request('atID');
        $at = AttributeType::getByID($atID);
        $this->set('type', $at);
        $this->set('category', AttributeKeyCategory::getByHandle('store_product'));
    }
    
    public function add() {
        $this->select_type();
        $type = $this->get('type');
        $cnt = $type->getController();
        $e = $cnt->validateKey($this->post());
        if ($e->has()) {
            $this->set('error', $e);
        } else {
            $type = AttributeType::getByID($this->post('atID'));
            $args = array(
                'akHandle' => $this->post('akHandle'),
                'akName' => $this->post('akName'),
                'akIsSearchable' => $this->post('akIsSearchable'),
                'akIsSearchableIndexed' => $this->post('akIsSearchableIndexed'),
                'akIsAutoCreated' => 0,
                'akIsEditable' => 1
            );
            $ak = StoreProductKey::add($type, $this->post());
            $this->redirect('/dashboard/store/products/attributes/', 'success');
        }
    }
    
    public function edit($akID = 0) {
        if ($this->post('akID')) {
            $akID = $this->post('akID');
        }
        $key = StoreProductKey::getByID($akID);
        $type = $key->getAttributeType();
        $this->set('key', $key);
        $this->set('type', $type);
        $this->set('category', AttributeKeyCategory::getByHandle('store_product'));
        
        if ($this->isPost()) {
            $cnt = $type->getController();
            $cnt->setAttributeKey($key);
            $e = $cnt->validateKey($this->post());
            if ($e->has()) {
                $this->set('error', $e);
            } else {
                $type = AttributeType::getByID($this->post('atID'));
                $args = array(
                    'akHandle' => $this->post('akHandle'),
                    'akName' => $this->post('akName'),
                    'akIsSearchable' => $this->post('akIsSearchable'),
                    'akIsSearchableIndexed' => $this->post('akIsSearchableIndexed'),
                    'akIsAutoCreated' => 0,
                    'akIsEditable' => 1
                );
                $key->update($this->post());
                $this->redirect('/dashboard/store/products/attributes', 'updated');
            }
        }
    }
}
