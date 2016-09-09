<?php
namespace Concrete\Core\Page\Type\PublishTarget\Configuration;

use Concrete\Core\Page\Page;
use Concrete\Core\Page\Type\Type;
use Loader;
use PageType;

class PageTypeConfiguration extends Configuration
{

    protected $ptID;
    protected $selectorFormFactor;

    public function setPageTypeID($ptID)
    {
        $this->ptID = $ptID;
    }

    public function getPageTypeID()
    {
        return $this->ptID;
    }

    public function getSelectorFormFactor()
    {
        return $this->selectorFormFactor;
    }

    public function setSelectorFormFactor($selectorFormFactor)
    {
        $this->selectorFormFactor = $selectorFormFactor;
    }

    public function export($cxml)
    {
        $target = parent::export($cxml);
        $ct = PageType::getByID($this->ptID);
        if (is_object($ct)) {
            $target->addAttribute('pagetype', $ct->getPageTypeHandle());
        }
    }

    public function canPublishPageTypeBeneathTarget(Type $pagetype, Page $page)
    {
        return $page->getPageTypeID() == $this->getPageTypeID();
    }

}