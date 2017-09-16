<?php
  defined('C5_EXECUTE') or die("Access Denied.");

  if ($_POST['form_submit']) {

    $clientName = $_POST['name_input'];
    $clientEmail = $_POST['email_input'];
    $clientOrganisation = $_POST['organisation_input'];
    $clientProjectNo = $_POST['projectno_input'];
    $clientAgreement = $_POST['agreement_input'];
    $clientDate = date('l jS \of F Y h:i:s A');

    require_once 'api-mandrill/src/Mandrill.php';
    $mandrill = new Mandrill('Nc_KBh4-lBD4fo5g5a3NRQ');

    try {
      $message = array(
          'html' => '
                    </p>
                      <strong>Name:</strong> '.$clientName.'<br />
                      <strong>Email:</strong> '.$clientEmail.'<br />
                      <strong>Organisation:</strong> '.$clientOrganisation.'<br />
                      <strong>Project Number:</strong> '.$clientProjectNo.'<br />
                      <strong>Agreement:</strong> '.$clientAgreement.'<br />
                      <strong>Agreement Date:</strong> '.$clientDate.'
                    </p>
                  ',
          'subject' => ''.$clientProjectNo.' Terms Agreement - Form Submission',
          'from_email' => 'noreply@chriswatterston.com',
          'from_name' => 'Chris Watterston',
          'to' => array(
              array(
                  'email' => ''.$clientEmail.'',
                  'name' => ''.$clientName.'',
                  'type' => 'to'
              ),
              array(
                  'email' => 'forms@chriswatterston.com',
                  'name' => 'Chris Watterston',
                  'type' => 'cc'
              )
          ),
          'headers' => array('Reply-To' => 'noreply@chriswatterston.com'),
          'important' => false,
          'track_opens' => null,
          'track_clicks' => null,
          'auto_text' => null,
          'auto_html' => null,
          'inline_css' => null,
          'url_strip_qs' => null,
          'preserve_recipients' => null,
          'view_content_link' => null,
          'bcc_address' => '',
          'tracking_domain' => null,
          'signing_domain' => null,
          'return_path_domain' => null,
          'merge' => true,
          'merge_language' => 'mailchimp',
          'global_merge_vars' => array(
              array(
                  'name' => 'merge1',
                  'content' => 'merge1 content'
              )
          )
      );
      $async = false;
      $result = $mandrill->messages->send($message, $async);
      //print_r($result);
      /*
      Array
      (
          [0] => Array
              (
                  [email] => recipient.email@example.com
                  [status] => sent
                  [reject_reason] => hard-bounce
                  [_id] => abc123abc123abc123abc123abc123
              )

      )
      */
    } catch(Mandrill_Error $e) {
      // Mandrill errors are thrown as exceptions
      echo 'A mandrill error occurred: ' . get_class($e) . ' - ' . $e->getMessage();
      // A mandrill error occurred: Mandrill_Unknown_Subaccount - No subaccount exists with the id 'customer-123'
      throw $e;
    }
  }
?>

<div class="form-results">
  <?php
  if ($result[0][status] === 'sent') {
    echo "<p class='alert-success'>Thank you for your Terms and Conditions form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
    echo "<style>.general-form{display:none!important;}</style>";
  }
  if ($result[0][status] === 'queued') {
    echo "<p class='alert-success'>Thank you for your Terms and Conditions form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'scheduled') {
    echo "<p class='alert-success'>Thank you for your Terms and Conditions form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'rejected') {
    echo "<p class='alert-error'>Thank you for your Terms and Conditions submission, but something went wrong. Please try again, otherwise pop me an email via hello@chriswatterston.com.</p>";
  }
  if ($result[0][status] === 'invalid') {
    echo "<p class='alert-error'>Thank you for your Terms and Conditions submission, but something went wrong. Please try again, otherwise pop me an email via hello@chriswatterston.com.</p>";
  }
  ?>
</div>

<div class="general-form">

  <form method="post" class="form-grey colour-grey" name="form_submit" action="<?php echo $_SERVER['PHP_SELF']; ?>#general-form">
    <div class="cols">
      <div class="col">
          <label class="control-label" for="name_input">Full name</label>
          <input class="input-required" name="name_input" type="text" value="" required/>
      </div>
      <div class="col">
          <label class="control-label" for="email_input">Email address</label>
          <input class="input-required" name="email_input" type="email" value="" required/>
      </div>
      <div class="col">
          <label class="control-label" for="organisation_input">Organisation</label>
          <input class="input-required" name="organisation_input" type="text" value="" required/>
      </div>
      <div class="col">
          <label class="control-label" for="projectno_input">Project Number</label>
          <input class="input-required" name="projectno_input" maxlength="14" type="text" value="" required/>
      </div>
      <div class="col full">
          <label class="control-label" for="agreement_input">Agreement Type</label>
          <select name="agreement_input">
            <option value="Not Selected" selected>Select agreement...</option>
            <option value="Agree">I AGREE to terms and conditions</option>
            <option value="Disagree">I DISAGREE to terms and conditions</option>
          </select>
      </div>
      <div class="col full">
          <input type="submit" name="form_submit" value="Submit agreement decision" class="btn btn-default" />
      </div>
    </div>
  </form>

</div>
