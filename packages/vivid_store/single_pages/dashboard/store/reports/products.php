<?php  
defined('C5_EXECUTE') or die("Access Denied.");
use \Concrete\Package\VividStore\Src\VividStore\Utilities\Price;
?>

<div class="ccm-dashboard-content-full">
	<form action="<?php echo URL::to('/dashboard/store/reports/products')?>" method="post" class="form form-inline ccm-search-fields">
		<div class="ccm-search-fields-row">
			<div class="form-group form-group-full">
        		<?php  echo $form->label('dateFrom', t('From'))?>
        		<div class="ccm-search-field-content ccm-search-field-content-select2">
					<?php  echo Core::make('helper/form/date_time')->date('dateFrom', $dateFrom); ?>
				</div>
			</div>
		</div>
		<div class="ccm-search-fields-row">
			<div class="form-group form-group-full">
				<?php  echo $form->label('dateFrom', t('To'))?>
				<div class="ccm-search-field-content ccm-search-field-content-select2">
					<?php  echo Core::make('helper/form/date_time')->date('dateTo', $dateTo); ?>
				</div>
			</div>
		</div>
		<div class="ccm-search-fields-row">
			<div class="form-group form-group-full">
				<?php  echo $form->label('orderBy', t('Order By'))?>
				<div class="ccm-search-field-content ccm-search-field-content-select2">
					<?php  echo $form->select('orderBy',array('quantity'=>'Quantity Sold','pricePaid'=>'Total'),$orderBy); ?>
				</div>
			</div>
		</div>
		<div class="ccm-search-fields-submit">
	        <button type="submit" class="btn btn-primary pull-right"><?php  echo t('Filter Results')?></button>
	    </div>
		
	</form>

</div>
<table class="table table-stripe">
	<thead>
		<tr>
			<th><?php echo t("Name")?></th>
			<th><?php echo t("Quantity Sold")?></th>
			<th><?php echo t("Total")?></th>
		</tr>
	</thead>
	<tbody>
		<?php  foreach($products as $product){ ?>
		<tr>
			<td><?php echo $product['name']?></td>
			<td><?php echo $product['quantity']?></td>
			<td><?php echo Price::format($product['pricePaid'])?></td>
		</tr>
		<?php  } ?>
	</tbody>
</table>

<?php  if ($paginator->getTotalPages() > 1) { ?>
    <?php echo  $pagination ?>
<?php  } ?>

