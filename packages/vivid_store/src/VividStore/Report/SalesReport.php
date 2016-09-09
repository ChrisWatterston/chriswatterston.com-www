<?php  
namespace Concrete\Package\VividStore\Src\VividStore\Report;

use \Concrete\Package\VividStore\Src\VividStore\Orders\OrderList;

defined('C5_EXECUTE') or die(_("Access Denied."));

class SalesReport extends OrderList
{
    
    public function __construct()
    {
        parent::__construct();
        $this->setFromDate();
        $this->setToDate();
        $this->setLimit(0);
    }
    public static function getTotalsByRange($from,$to,$limit=0)
    {
        $sr = new SalesReport();
        $sr->setFromDate($from);
        $sr->setToDate($to);
        $sr->setLimit($limit);
        
        $total = 0;
        $productTotal = 0;
        $taxTotal = 0;
        $includedTaxTotal = 0;
        $shippingTotal = 0;
        foreach($sr->getResults() as $order){
            $total = $total + $order->getTotal();
            $productTotal = $productTotal + $order->getSubTotal();
            $taxTotal = $taxTotal + $order->getTaxTotal();
            $includedTaxTotal = $includedTaxTotal + $order->getIncludedTaxTotal();
            $shippingTotal = $shippingTotal + $order->getShippingTotal();
        }
        
        $totals = array(
            "total" => $total,
            "productTotal" => $productTotal,
            "taxTotal" => $taxTotal,
            "includedTaxTotal" => $includedTaxTotal,
            "shippingTotal" => $shippingTotal,
            "orders" => $sr
        );
        return $totals;
    }
    public static function getTodaysSales()
    {
        $today = date('Y-m-d');
        return self::getTotalsByRange($today,$today,0);
    }
    public static function getThirtyDays()
    {
        $today = date('Y-m-d');
        $thirtyDaysAgo = date('Y-m-d', strtotime('-30 days'));
        return self::getTotalsByRange($thirtyDaysAgo,$today,0);
    }
    public function getYearToDate()
    {
        $today = date('Y-m-d');
        $jan1 = new \DateTime(date("Y")."-01-01");
        $jan1 = $jan1->format("Y-m-d");
        return self::getTotalsByRange($jan1,$today,0);
    }
    public function getByMonth($date)
    {
        $from = date('Y-m-01', strtotime($date));
        $to = date('Y-m-t', strtotime($date));
        return self::getTotalsByRange($from,$to,0);
    }
    
}
