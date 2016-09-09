<?php 

namespace Concrete\Package\VividStore\Controller\SinglePage\Dashboard\Store\Reports;

use \Concrete\Core\Page\Controller\DashboardPageController;
use Package;

use \Concrete\Package\VividStore\Src\VividStore\Orders\OrderList;
use \Concrete\Package\VividStore\Src\VividStore\Report\SalesReport;

defined('C5_EXECUTE') or die("Access Denied.");
class Sales extends DashboardPageController
{

    public function view()
    {
        $sr = new SalesReport();
        $this->set('sr',$sr);
        $pkg = Package::getByHandle('vivid_store');
        $packagePath = $pkg->getRelativePath();
        $this->requireAsset('chartist');
        $today = date('Y-m-d');
        $thirtyDaysAgo = date('Y-m-d', strtotime('-30 days'));
        $this->set('defaultFromDate',$thirtyDaysAgo);
        $this->set('defaultToDate',$today);
        
        $dateFrom = $this->post('dateFrom');
        $dateTo = $this->post('dateTo');
        if(!$dateFrom){ $dateFrom = $thirtyDaysAgo; }
        if(!$dateTo){ $dateTo = $today; }
        $this->set('dateFrom',$dateFrom);
        $this->set('dateTo',$dateTo);
        
        $ordersTotals = $sr::getTotalsByRange($dateFrom,$dateTo);
        $this->set('ordersTotals',$ordersTotals);
        
        $orders = new OrderList();
        $orders->setFromDate($dateFrom);
        $orders->setToDate($dateTo);
        $orders->setItemsPerPage(10);

        $paginator = $orders->getPagination();
        $pagination = $paginator->renderDefaultView();
        $this->set('orders',$paginator->getCurrentPageResults());
        $this->set('pagination',$pagination);
        $this->set('paginator', $paginator);

        $this->requireAsset('css', 'vividStoreDashboard');
     
    }
    public function export()
    {
        $from = $this->get('fromDate');
        $to = $this->get('toDate');
        
    }
    
}
