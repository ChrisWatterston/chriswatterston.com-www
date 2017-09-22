<?php
  defined('C5_EXECUTE') or die("Access Denied.");

  $c = Page::getCurrentPage();
  $pageURL = $c->getCollectionPath();

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
                    <!DOCTYPE html>
                    <html style="font-family: Verdana,sans-serif; font-size: 100%; margin: 0; padding: 0;">
                    <head>
                    <meta name="viewport" content="width=device-width">
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>'.$clientProjectNo.' Terms Agreement - Form Submission</title>
                    </head>
                    <body bgcolor="#ffffff" style="font-family:Verdana,sans-serif; font-size:90%; -webkit-font-smoothing: antialiased; height: 100%; -webkit-text-size-adjust: none; width: 100% !important; margin: 0; padding: 0;background-color:#ffffff;">
                      <table style="width:650px;" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr>
                          <td style="padding:50px 50px 50px 50px;"><center>
                            <table style="width:100%;" cellpadding="0" cellspacing="0">
                              <tr>
                                <td style="background-color:#009788;padding:15px 10px 15px 10px;">
                                  <a style="border:none;" href="http://www.chriswatterston.com/" title="Chris Watterston" target="_blank">
                                    <img src="http://www.chriswatterston.com/application/themes/chriswatterston/img/brnd/chriswatterston-logo.svg" title="Chris Watterston" width="199" height="42" />
                                  </a>
                                </td>
                              </tr>§
                              <tr>
                                <td><hr style="border:none;border-top:3px #ebebeb solid;margin:0;" /></td>
                              </tr>
                              <tr>
                                <td style="width:100%;text-align:center;">
                                  <p style="padding:8px 15px 0 15px;color:#454851;font-size:13px;">This is an automated confirmation email stating the services Terms and Conditions decision that was submitted by <strong style="font-weight:600;"><a style="color:#454851;font-size:13px;" href="mailto:'.$clientEmail.'">'.$clientName.'</a></strong> from <strong style="font-weight:600;">'.$clientOrganisation.'</strong>, confirming that all items included within these Terms and Conditions have been received, acknowledged and Understood.</p>
                                  <p style="padding:2px 15px 15px 15px;color:#454851;font-size:13px;">Decision was made on <strong style="font-weight:600;">'.$clientDate.'</strong>.</p>
                                </td>
                              </tr>
                              <tr>
                                <td style="width:100%;text-align:center;background:#06d6a0;">
                                  <p style="padding:15px 0 0 0;color:#ffffff;font-size:12px;font-weight:600;">Decision Outcome:</p>
                                  <h1 style="padding:0 0 15px 0;color:#FFFFFF;font-size:30px;font-weight:400;text-transform:uppercase;">'.$clientAgreement.'</h1>
                                </td>
                              </tr>
                              <tr>
                                <td style="width:100%;text-align:center;background:#ebebeb;">
                                  <p style="padding:15px 0 0 0;color:#454851;font-size:12px;font-weight:600;">Proposal / Project Number:</p>
                                  <h1 style="padding:0 0 15px 0;color:#454851;font-size:25px;text-align:center;font-weight:400;text-transform:uppercase;">'.$clientProjectNo.'</h1>
                                </td>
                              </tr>
                              <td style="width:100%;text-align:center;">
                                <p style="padding:15px 15px 15px 15px;color:#454851;font-size:13px;">The full and up-to-date version of the Terms and Conditions for Services by Chris Watterston can be found at <a style="color:#454851;font-size:13px;" href="http://www.chriswatterston.com/legal-documentation/terms-and-conditions" title="Terms and Conditions" target="_blank">www.chriswatterston.com/legal-documentation/terms-and-conditions</a>.</p>
                              </td>
                              <tr>
                                <td><hr style="border:none;border-top:3px #ebebeb solid;margin:0;" /></td>
                              </tr>
                              <tr>
                                <td style="width:100%;text-align:center;">
                                  <p style="padding:8px 15px 8px 15px;color:#454851;font-size:10px;">Copyright © 2017 Chris Watterston. All rights reserved.</p>
                                </td>
                              </tr>
                              <tr>
                                <td><hr style="border:none;border-top:3px #ebebeb solid;margin:0;" /></td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </body>
                    </html>
                  ',
          'subject' => ''.$clientProjectNo.' Terms Agreement - Form Submission',
          'from_email' => 'noreply@chriswatterston.com',
          'from_name' => 'Chris Watterston',
          'to' => array(
              array(
                  'email' => ''.$clientEmail.'',
                  'name' => ''.$clientName.'',
                  'type' => 'to'
              )
          ),
          'headers' => array('Reply-To' => 'hello@chriswatterston.com'),
          'important' => true,
          'track_opens' => null,
          'track_clicks' => null,
          'auto_text' => null,
          'auto_html' => null,
          'inline_css' => null,
          'url_strip_qs' => null,
          'preserve_recipients' => null,
          'view_content_link' => null,
          'bcc_address' => 'forms@chriswatterston.com',
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

  <form method="post" class="form-grey colour-grey" name="form_submit" action="<?php echo $pageURL; ?>#general-form">
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
