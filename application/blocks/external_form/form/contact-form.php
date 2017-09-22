<?php
  defined('C5_EXECUTE') or die("Access Denied.");

  $c = Page::getCurrentPage();
  $pageURL = $c->getCollectionPath();

  if ($_POST['form_submit']) {

    $clientName = $_POST['name_input'];
    $clientEmail = $_POST['email_input'];
    $clientPhone = $_POST['phone_input'];
    $clientLocation = $_POST['location_input'];
    $clientBudget = $_POST['budget_input'];
    $clientMessage = $_POST['message_input'];

    require_once 'api-mandrill/src/Mandrill.php';
    $mandrill = new Mandrill('Nc_KBh4-lBD4fo5g5a3NRQ');

    try {
      $message = array(
          'html' => '
                    </p>
                      <strong>Name:</strong> '.$clientName.'<br />
                      <strong>Email:</strong> '.$clientEmail.'<br />
                      <strong>Phone:</strong> '.$clientPhone.'<br />
                      <strong>Location:</strong> '.$clientLocation.'<br />
                      <strong>Budget:</strong> '.$clientBudget.'<br />
                      <strong>Message:</strong> <br />'.$clientMessage.'
                    </p>
                  ',
          'subject' => 'General Contact - Form Submission',
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
    echo "<p class='alert-success'>Thank you for your form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
    echo "<style>.general-form{display:none!important;}</style>";
  }
  if ($result[0][status] === 'queued') {
    echo "<p class='alert-success'>Thank you for your form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'scheduled') {
    echo "<p class='alert-success'>Thank you for your form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'rejected') {
    echo "<p class='alert-error'>Thank you for your submission, but something went wrong. Please try again, otherwise pop me an email via hello@chriswatterston.com.</p>";
  }
  if ($result[0][status] === 'invalid') {
    echo "<p class='alert-error'>Thank you for your submission, but something went wrong. Please try again, otherwise pop me an email via hello@chriswatterston.com.</p>";
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
          <label class="control-label" for="phone_input">Phone number</label>
          <input class="input-required" name="phone_input" maxlength="11" type="tel" value="" required/>
      </div>
      <div class="col">
          <label class="control-label" for="location_input">Location</label>
          <select name="location_input">
            <option value="Within the United Kingdom">Within the United Kingdom</option>
            <option value="Outside the United Kingdom">Outside the United Kingdom</option>
          </select>
      </div>
      <div class="col full">
          <label class="control-label" for="message_input">About your project</label>
          <textarea class="input-required" name="message_input" rows="4" required></textarea>
      </div>
      <div class="col">
          <label class="control-label" for="budget_input">Project budget</label>
          <select name="budget_input">
            <option value="0-2000">£0 to £2,000</option>
            <option value="2000-3500">£2,000 to £3,500</option>
            <option value="3500-5000">£3,500 to £5,000</option>
            <option value="5000-7500">£5,000 to £7,500</option>
            <option value="7500-10000">£7,500 to £10,000</option>
            <option value="10000-over">£10,000 and over</option>
          </select>
      </div>
      <div class="col full">
          <input type="submit" name="form_submit" value="Submit Enquiry" class="btn btn-default" />
      </div>
    </div>
  </form>

</div>
