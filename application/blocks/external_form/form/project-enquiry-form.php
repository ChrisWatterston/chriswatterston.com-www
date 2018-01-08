<?php
  defined('C5_EXECUTE') or die("Access Denied.");

  $c = Page::getCurrentPage();
  $pageURL = $c->getCollectionPath();

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
                      <strong>Full Name:</strong> '.$clientName.'<br />
                      <strong>Phone:</strong> '.$clientPhone.'<br />
                      <strong>Message:</strong> <br />'.$clientMessage.'
                    </p>
                  ',
          'subject' => 'Project Enquiry - Form Submission',
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
    echo "<p class='alert-success'>Thank you for your Project Enquiry form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
    echo "<style>.callback-form{display:none!important;}</style>";
  }
  if ($result[0][status] === 'queued') {
    echo "<p class='alert-success'>Thank you for your Project Enquiry form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'scheduled') {
    echo "<p class='alert-success'>Thank you for your Project Enquiry form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
  }
  if ($result[0][status] === 'rejected') {
    echo "<p class='alert-error'>Sorry, something went wrong. Please try again, otherwise pop us an email via hello@chriswatterston.com.</p>";
  }
  if ($result[0][status] === 'invalid') {
    echo "<p class='alert-error'>Sorry, something went wrong. Please try again, otherwise pop us an email via hello@chriswatterston.com.</p>";
  }
  ?>
</div>

<div class="enquiry-form">

  <form method="post" class="form-grey colour-grey" name="form_submit" action="<?php echo $pageURL; ?>#enquiry-form">
    <div class="cols">
      <h1>Details about <strong>yourself...</strong></h1>
      <div class="col">
        <label class="control-label" for="name_input">Full name</label>
        <input class="input-required" name="name_input" type="text" value="" required/>
      </div>
      <div class="col">
        <label class="control-label" for="organisation_input">Organisation name (if applicable)</label>
        <input name="organisation_input" type="text" value=""/>
      </div>
      <div class="col">
        <label class="control-label" for="email_input">Email address</label>
        <input class="input-required" name="email_input" maxlength="50" type="email" value="" required/>
      </div>
      <div class="col">
        <label class="control-label" for="phone_input">Phone number</label>
        <input class="input-required" name="phone_input" maxlength="11" type="tel" value="" required/>
      </div>
      <div class="col full">
        <label class="control-label" for="about_input">About yourself or organisation (what do you do)</label>
        <textarea class="input-required" name="about_input" required></textarea>
      </div>
    </div>
    <div class="cols">
      <h1>Details about <strong>project...</strong></h1>
      <div class="col">
        <label class="control-label" for="type_input">Type</label>
        <select class="input-required" name="type_input" title="Project Type" required>
          <option value="">Select...</option>
          <option value="Design and/or Branding" title="Design and/or Branding">Design and/or Branding</option>
          <option value="Website Design and/or Development " title="Website Design and/or Development ">Website Design and/or Development </option>
          <option value="Mobile App Design and/or Development " title="Mobile App Design and/or Development">Mobile App Design and/or Development </option>
          <option value="eCommerce and/or Shopify" title="eCommerce and/or Shopify">eCommerce and/or Shopify</option>
          <option value="HTML Email Design and/or Development" title="HTML Email Design and/or Development">HTML Email Design and/or Development</option>
          <option value="Monthly Maintenance and/or Management" title="Monthly Maintenance and/or Management">Monthly Maintenance and/or Management</option>
          <option value="Artwork and/or Print Design" title="Artwork and/or Print Design">Artwork and/or Print Design</option>
          <option value="Other" title="Other">Other (specify within BRIEF OVERVIEW)</option>
        </select>
      </div>
      <div class="col">
          <label class="control-label" for="deadline_input">Deadline (if applicable)</label>
          <input name="deadline_input" type="date" value=""/>
      </div>
      <div class="col full">
        <label class="control-label" for="message_input">Brief overview</label>
        <textarea class="input-required" name="message_input" required></textarea>
      </div>
      <div class="col full">
        <label class="control-label" for="likes_input">Is there other projects in particular that you like</label>
        <textarea name="likes_input" placeholder="Provide an indication of the design style that you like. What about a website, mobile app or a piece of art that you like..."></textarea>
      </div>
      <div class="col">
        <label class="control-label" for="domain_input">Domain name (if applicable)</label>
        <input name="domain_input" type="text" value=""/>
      </div>
      <div class="col">
        <label class="control-label" for="budget_input">Allocated Budget</label>
        <select class="input-required" name="budget_input" required>
          <option value="">Select...</option>
          <option value="0-2000">£0 to £2,000</option>
          <option value="2000-3500">£2,000 to £3,500</option>
          <option value="3500-5000">£3,500 to £5,000</option>
          <option value="5000-7500">£5,000 to £7,500</option>
          <option value="7500-10000">£7,500 to £10,000</option>
          <option value="10000-25000">£10,000 and £25,000</option>
          <option value="25000-over">£25,000 and over</option>
        </select>
      </div>
    </div>
    <div class="cols">
      <h1>Details about <strong>goals...</strong></h1>
      <div class="col">
        <label class="control-label" for="goalone_input">Goal #1</label>
        <input class="input-required" name="goalone_input" type="text" value="" required/>
      </div>
      <div class="col">
        <label class="control-label" for="goaltwo_input">Goal #2</label>
        <input class="input-required" name="goaltwo_input" type="text" value="" required/>
      </div>
      <div class="col">
        <label class="control-label" for="goalone_input">Goal #3 (if applicable)</label>
        <input name="goalone_input" type="text" value=""/>
      </div>
      <div class="col">
        <label class="control-label" for="goaltwo_input">Goal #4 (if applicable)</label>
        <input name="goaltwo_input" type="text" value=""/>
      </div>
      <div class="col full">
        <label class="control-label" for="goalmessage_input">Goal overview</label>
        <textarea class="input-required" name="goalmessage_input" required></textarea>
      </div>
    </div>
    <div class="cols">
      <h1>and <strong>finally...</strong></h1>
      <div class="col">
        <label class="control-label" for="decisionmaker_input">Are you the key decsion maker for this project?</label>
        <select name="decisionmaker_input" required>
          <option value="">Select...</option>
          <option value="Yes">Yes</option>
          <option value="Yes plus group">Yes, plus others as a group</option>
          <option value="No">No, somebody else</option>
        </select>
      </div>
      <div class="col"></div>
      <div class="col full">
        <label class="control-label" for="finalcomment_input">Any final last comments or notes</label>
        <textarea class="input-required" name="finalcomment_input" required></textarea>
      </div>
    </div>
    <div class="cols">
      <div class="col full">
          <input type="submit" name="form_submit" value="Submit Project Enquiry" class="btn btn-default" />
      </div>
    </div>
  </form>

</div>
