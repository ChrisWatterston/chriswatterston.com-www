<?php
  $form = Loader::helper('form');
  defined('C5_EXECUTE') or die("Access Denied.");
  if (isset($response)) { ?>
	   <div class="alert alert-info"><?php echo $response?></div>
<?php } ?>

<div class="landing-form">

  <form method="post" action="<?php echo $view->action('landing_search')?>">
    <div class="cols">
      <div class="col">
          <label class="control-label"><?php echo t('Full name')?></label>
          <?php echo $form->text('name_input')?>
      </div>

      <div class="col">
          <label class="control-label"><?php echo t('Email address')?></label>
          <?php echo $form->text('email_input')?>
      </div>

      <div class="col">
          <label class="control-label"><?php echo t('Phone number')?></label>
          <?php echo $form->text('phone_input')?>
      </div>

      <div class="col">
          <label class="control-label"><?php echo t('Project budget')?></label>
          <?php echo $form->select('budget_input', array('1' => '£2,000 to £3,500', '2' => '£3,500 to £5,000', '3' => '£5,000 to £7,500', '4' => '£7,500 to £10,000', '5' => '£10,000 and over')); ?>
      </div>

      <div class="col full">
          <label class="control-label"><?php echo t('About your project')?></label>
          <?php echo $form->textarea('message_input')?>
      </div>

      <div class="col full">
          <input type="submit" name="submit" value="Submit" class="btn btn-default" />
      </div>
    </div>
  </form>

</div>
