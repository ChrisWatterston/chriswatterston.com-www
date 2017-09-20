<?php
  defined('C5_EXECUTE') or die("Access Denied.");

  if ($_POST['form_submit']) {

    $clientName = $_POST['name_input'];
    $clientPhone = $_POST['phone_input'];
    $clientMessage = $_POST['message_input'];

    require_once 'api-mandrill/src/Mandrill.php';
    $mandrill = new Mandrill('Nc_KBh4-lBD4fo5g5a3NRQ');

    try {
      $message = array(
          'html' => '
                    </p>
                      <strong>Email:</strong> '.$clientName.'<br />
                      <strong>Phone:</strong> '.$clientPhone.'<br />
                      <strong>Message:</strong> <br />'.$clientMessage.'
                    </p>
                  ',
          'subject' => 'Call Me Back - Form Submission',
          'from_email' => 'noreply@chriswatterston.com',
          'from_name' => 'Chris Watterston',
          'to' => array(
              array(
                  'email' => 'forms@chriswatterston.com',
                  'name' => 'Chris Watterston',
                  'type' => 'to'
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
    echo "<p class='alert-success'>Thank you for your Call Back form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
    echo "<style>.general-form{display:none!important;}</style>";
  }
  if ($result[0][status] === 'queued') {
    echo "<p class='alert-success'>Thank you for your Call Back form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'scheduled') {
    echo "<p class='alert-success'>Thank you for your Call Back form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'rejected') {
    echo "<p class='alert-error'>Thank you for your Call Back submission, but something went wrong. Please try again, otherwise pop me an email via hello@chriswatterston.com.</p>";
  }
  if ($result[0][status] === 'invalid') {
    echo "<p class='alert-error'>Thank you for your Call Back submission, but something went wrong. Please try again, otherwise pop me an email via hello@chriswatterston.com.</p>";
  }
  ?>
</div>

<div class="callback-form">

  <form method="post" class="form-grey colour-grey" name="form_submit" action="<?php echo $_SERVER['PHP_SELF']; ?>#callback-form">
    <div class="cols">
      <div class="col">
          <label class="control-label" for="name_input">Full name</label>
          <input class="input-required" name="name_input" type="text" value="" required/>
      </div>
      <div class="col">
          <label class="control-label" for="phone_input">Phone number</label>
          <input class="input-required" name="phone_input" maxlength="11" type="tel" value="" required/>
      </div>
      <div class="col full">
          <label class="control-label" for="message_input">Tell me what you're looking for</label>
          <textarea class="input-required" name="message_input" required></textarea>
      </div>
      <div class="col full">
          <input type="submit" name="form_submit" value="Submit Call Back Request" class="btn btn-default" />
      </div>
    </div>
  </form>

</div>
