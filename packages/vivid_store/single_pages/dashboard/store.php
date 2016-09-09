<?php  defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price;

$taxCalc = Config::get('vividstore.calculation');

if ($taxCalc == 'extract') {
    $taxValue = 'includedTaxTotal';
    $extraTaxLable =  t('Incl.');
} else {
    $taxValue = 'taxTotal';
    $extraTaxLable = '';
}
?>

<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div class="panel panel-sale">
            <?php  $ts = $sr->getTodaysSales(); ?>
            <div class="panel-heading">
                <h2 class="panel-title"><?php echo t("Today's Sales")?></h2>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Total')?></strong> <?php echo Price::format($ts['total'])?>
                    </div>
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Products')?></strong> <?php echo Price::format($ts['productTotal'])?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Tax')?> <?php echo $extraTaxLable?></strong> <?php echo Price::format($ts[$taxValue])?>
                    </div>
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Shipping')?></strong> <?php echo Price::format($ts['shippingTotal'])?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6">
        <div class="panel panel-sale">
            <?php  $ytd = $sr->getYearToDate(); ?>
            <div class="panel-heading">
                <h2 class="panel-title"><?php echo t("Year to Date")?></h2>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Total')?></strong> <?php echo Price::format($ytd['total'])?>
                    </div>
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Products')?></strong> <?php echo Price::format($ytd['productTotal'])?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Tax')?> <?php echo $extraTaxLable?></strong> <?php echo Price::format($ytd[$taxValue])?>
                    </div>
                    <div class="col-xs-12 col-sm-6 stat">
                        <strong><?php echo t('Shipping')?></strong> <?php echo Price::format($ytd['shippingTotal'])?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <hr>
        <h3><?php echo t("Sales this Week")?></h3>
        <div id="sales-chart"></div>
        <hr>
        <script type="text/javascript">
        $(function(){
            new Chartist.Line('#sales-chart', {
                <?php 
                    $months = array(
                        new DateTime(date('Y-M-d', strtotime('-6 days'))),
                        new DateTime(date('Y-M-d', strtotime('-5 days'))),
                        new DateTime(date('Y-M-d', strtotime('-4 days'))),
                        new DateTime(date('Y-M-d', strtotime('-3 days'))),
                        new DateTime(date('Y-M-d', strtotime('-2 days'))),
                        new DateTime(date('Y-M-d', strtotime('-1 day'))),
                        new DateTime(date('Y-M-d'))
                    );
                ?>
                
                labels: [ <?php  for($i=0;$i<7;$i++){
                        if($i!=6){
                            echo "'".$months[$i]->format("m/d")."',";
                        } else {
                            echo "'".$months[$i]->format("m/d")."'";
                        }
                    } ?> ],
                // Our series array that contains series objects or in this case series data arrays
                series: [
                    [
                        <?php  
                            for($i=0;$i<7;$i++){
                                $date = $months[$i]->format('Y-m-d');
                                $report = $sr->getTotalsByRange($date,$date);
                                if($i==6){
                                    echo "{meta: '".t('Total')."', value: ".$report['total']."}";
                                } else {
                                    echo "{meta: '".t('Total')."', value: ".$report['total']."},";
                                }
                            }
                        ?>              
                    ]
                ]
            },
            {
                axisY: {
                    offset: 80,
                    labelInterpolationFnc: function(value) {
                      return "$" + value;
                    }
                },
                plugins: [
                    Chartist.plugins.tooltip()
                ],
                lineSmooth: Chartist.Interpolation.none()
            }
            );
            
        
        });
        </script>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3><?php echo t("Recent Orders")?></h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th><?php echo t("Order #")?></th>
                    <th><?php echo t("Date")?></th>
                    <th><?php echo t("Products")?></th>
                    <th><?php echo t("Shipping")?></th>
                    <th><?php echo t("Tax")?> <?php echo $extraTaxLable?></th>
                    <th><?php echo t("Total")?></th>
                </tr>
            </thead>
            <tbody>
                <?php  foreach($orders as $o){?>
                <tr>
                    <td><a href="<?php echo URL::to('/dashboard/store/orders/order',$o->getOrderID())?>"><?php echo $o->getOrderID()?></a></td>
                    <td><?php echo $o->getOrderDate()?></td>
                    <td><?php echo Price::format($o->getSubTotal())?></td>
                    <td><?php echo Price::format($o->getShippingTotal())?></td>
                    <td>
                        <?php 
                        $tax = $o->getTaxTotal();
                        $includedTax = $o->getIncludedTaxTotal();
                        if ($tax) {
                            echo Price::format($tax);
                        } elseif ($includedTax) {
                            echo Price::format($includedTax);
                        }
                        ?>
                    </td>
                    <td><?php echo Price::format($o->getTotal())?></td>
                </tr>
                <?php  } ?>
            </tbody>
        </table>

    </div>
</div>
