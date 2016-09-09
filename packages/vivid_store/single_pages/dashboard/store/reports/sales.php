<?php 
defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price;
use \Concrete\Package\VividStore\Src\VividStore\Report\SalesReport;

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
	<div class="col-xs-12 col-md-4">
		<div class="panel panel-sale">
			<?php  $ts = SalesReport::getTodaysSales(); ?>
			<div class="panel-heading">
				<h2 class="panel-title"><?php echo t("Today's Sales")?></h2>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-6 stat">
						<strong><?php echo t('Total')?> </strong> <?php echo Price::format($ts['total'])?>
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
	<div class="col-xs-12 col-md-4">
		<div class="panel panel-sale">
			<?php  $td = SalesReport::getThirtyDays(); ?>
			<div class="panel-heading">
				<h2 class="panel-title"><?php echo t('Past 30 Days')?></h2>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-6 stat">
						<strong><?php echo t('Total')?></strong> <?php echo Price::format($td['total'])?>
					</div>
					<div class="col-xs-12 col-sm-6 stat">
						<strong><?php echo t('Products')?></strong> <?php echo Price::format($td['productTotal'])?>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 stat">
						<strong><?php echo t('Tax')?> <?php echo $extraTaxLable?></strong> <?php echo Price::format($td[$taxValue])?>
					</div>
					<div class="col-xs-12 col-sm-6 stat">
						<strong><?php echo t('Shipping')?></strong> <?php echo Price::format($td['shippingTotal'])?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-md-4">
		<div class="panel panel-sale">
			<?php  $ytd = SalesReport::getYearToDate(); ?>
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
<hr>
<div id="sales-chart"></div>
<hr>
<script type="text/javascript">
$(function(){
	new Chartist.Line('#sales-chart', {
	    <?php 
            $months = array(
                new DateTime(date('Y-M', strtotime('-5 months'))),
                new DateTime(date('Y-M', strtotime('-4 months'))),
                new DateTime(date('Y-M', strtotime('-3 months'))),
                new DateTime(date('Y-M', strtotime('-2 months'))),
                new DateTime(date('Y-M', strtotime('-1 month'))),
                new DateTime(date('Y-M'))
            );
        ?>
	    
	    labels: [ <?php  for($i=0;$i<6;$i++){
                if($i!=5){
                    echo "'".$months[$i]->format("M")."',";
                } else {
                    echo "'".$months[$i]->format("M")."'";
                }
            } ?> ],
		// Our series array that contains series objects or in this case series data arrays
	    series: [
	    	[
				<?php  
                    for($i=0;$i<6;$i++){
                        $report = SalesReport::getByMonth($months[$i]->format('Y-M'));
                        if($i==5){
                            echo "{meta: '".t('Total')."', value: ".$report['total']."}";
                        } else {
                            echo "{meta: '".t('Total')."', value: ".$report['total']."},";
                        }
                    }
                ?>				
			],
			[
				<?php  
                    for($i=0;$i<6;$i++){
                        $report = SalesReport::getByMonth($months[$i]->format('Y-M'));
                        if($i==5){
                            echo "{meta: '".t('Products')."', value: ".$report['productTotal']."}";
                        } else {
                            echo "{meta: '".t('Products')."', value: ".$report['productTotal']."},";
                        }
                    }
                ?>				
			],
			[
				<?php  
                    for($i=0;$i<6;$i++){
                        $report = SalesReport::getByMonth($months[$i]->format('Y-M'));
                        if($i==5){
                            echo "{meta: '".t('Shipping')."', value: ".$report['shippingTotal']."}";
                        } else {
                            echo "{meta: '".t('Shipping')."', value: ".$report['shippingTotal']."},";
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

<div class="well">
	<div class="row">
		<div class="col-xs-12 col-sm-4">
			<h3><?php echo t("View Orders by Date")?></h3>
		</div>
		<div class="col-xs-12 col-sm-8 text-right">
			<form action="<?php echo URL::to('/dashboard/store/reports/sales')?>" method="post" class="form form-inline order-report-form">
				<div class="form-group">
					<?php  echo Core::make('helper/form/date_time')->date('dateFrom', $dateFrom); ?>
				</div>
				<div class="form-group">
					<?php  echo Core::make('helper/form/date_time')->date('dateTo', $dateTo); ?>
				</div>
				<input type="submit" class="btn btn-primary">
			</form>
		</div>
	</div>
	<hr>
	<h4><?php echo t("Summary")?></h4>
	<table class="table table-striped">
		<thead>
			<tr>
				<th><?php echo t("Products")?></th>
				<th><?php echo t("Shipping")?></th>
				<th><?php echo t("Tax")?> <?php echo $extraTaxLable?></th>
				<th><?php echo t("Total")?></th>
				<!--<th><?php echo t("Export")?></th>-->
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><?php echo Price::format($ordersTotals['productTotal'])?></td>
				<td><?php echo Price::format($ordersTotals['shippingTotal'])?></td>
				<td><?php echo Price::format($ordersTotals[$taxValue])?></td>
				<td><?php echo Price::format($ordersTotals['total'])?></td>
				<!--<td><a href="<?php echo URL::to('/dashboard/store/reports/sales/export?fromDate='.$dateFrom.'&toDate='.$dateTo)?>" class="btn btn-default"><?php echo t('Export to CSV')?></a></td>-->
			</tr>
		</tbody>
	</table>
</div>
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
<?php  if ($paginator->getTotalPages() > 1) { ?>
    <?php echo  $pagination ?>
<?php  } ?>
