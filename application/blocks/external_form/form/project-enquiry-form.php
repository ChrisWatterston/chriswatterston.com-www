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
  <p>I love working on projects! It takes a lot of energy and expertise to see a project through, which is why I only work with select clients on projects that have a chance at success. If you’d like us to work together, there are a few things I need to know first. Complete my website enquiry form, as this is your opportunity to tell me a little bit about your business or organisation, and why you need a website.</p>
  <p>We need to collect this information about yourself so that we can get back to you with the information that you require, as well as providing you with an offical quotation.</p>
  <p>If there are any areas you are not sure about and are not required, just leave them blank and will try to help you with the question at a later stage.</p>

  <form method="post" class="form-grey colour-grey" name="form_submit" action="<?php echo $pageURL; ?>#enquiry-form">
    <div class="cols">
      <h1>Details about <strong>yourself...</strong></h1>
      <div class="col">
        <label class="control-label input-required" for="name_input">Full name</label>
        <input class="input-required" name="name_input" type="text" value="" required/>
      </div>
      <div class="col last">
        <label class="control-label" for="organisation_input">Organisation name (if applicable)</label>
        <input name="organisation_input" type="text" value=""/>
      </div>
      <div class="col">
        <label class="control-label input-required" for="email_input">Email address</label>
        <input class="input-required" name="email_input" maxlength="50" type="email" value="" required/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="phone_input">Phone number</label>
        <input class="input-required" name="phone_input" maxlength="11" type="tel" value="" required/>
      </div>
      <div class="col full">
        <label class="control-label input-required" for="about_input">About yourself or organisation (what do you do)</label>
        <textarea class="input-required" name="about_input" placeholder="We would love to know what you or your organisation does... what are the products and services you offer..." required></textarea>
      </div>
    </div>
    <div class="cols">
      <h1>Details about <strong>project...</strong></h1>
      <div class="col">
        <label class="control-label input-required" for="type_input">Type</label>
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
      <div class="col last">
          <label class="control-label" for="deadline_input">Deadline (if applicable)</label>
          <input name="deadline_input" type="date" value=""/>
      </div>
      <div class="col full">
        <label class="control-label input-required" for="message_input">Brief overview</label>
        <textarea class="input-required" name="message_input" placeholder="Tell me about your project... share information like, why you're looking for something new, areas currently not working with your current solution, who are you competitors and do they stand out... tell me if have structured sitemaps and content ready..." required></textarea>
      </div>
      <div class="col full">
        <label class="control-label" for="likes_input">Is there other projects in particular that you like (if applicable)</label>
        <textarea name="likes_input" placeholder="Providing an indication or links of design style that you like can help us in a big way... have you've seen a website you like, maybe even a mobile app or piece of art..."></textarea>
      </div>
      <div class="col">
        <label class="control-label" for="domain_input">Need domain name / hosting (if applicable)</label>
        <input name="domain_input" type="text" value=""/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="budget_input">Budget (be honest, we can then tell you what we can or can't do)</label>
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
        <label class="control-label input-required" for="goalone_input">Goal #1</label>
        <input class="input-required" name="goalone_input" type="text" value="" required/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="goaltwo_input">Goal #2</label>
        <input class="input-required" name="goaltwo_input" type="text" value="" required/>
      </div>
      <div class="col">
        <label class="control-label input-required" for="targetaud_input">Target audience</label>
        <input name="targetaud_input" type="text" value="" required/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="support_input">Support and ongoing maintenance</label>
        <select name="support_input" required>
          <option value="">Select...</option>
          <option value="Support and Maintenance">Yes, support and maintenance</option>
          <option value="Support only">Yes, support only</option>
          <option value="Maintenance only">Yes, maintenance only</option>
          <option value="No">No</option>
        </select>
      </div>
      <div class="col full">
        <label class="control-label input-required" for="goalmessage_input">Goal overview</label>
        <textarea class="input-required" name="goalmessage_input" placeholder="Expand on general or specific measurable goals that the should be achieved... clear goals allow the the ability to focus on what will provide the most impact to your project in moving forward...
" required></textarea>
      </div>
    </div>
    <div class="cols">
      <h1>and <strong>finally...</strong></h1>
      <div class="col">
        <label class="control-label input-required" for="decisionmaker_input">Are you the key decsion maker for this project</label>
        <select name="decisionmaker_input" required>
          <option value="">Select...</option>
          <option value="Yes">Yes</option>
          <option value="Yes plus group">Yes, plus others as a group</option>
          <option value="No">No, somebody else</option>
        </select>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="newsletter_input">Can we keep you updated about news and events through email</label>
        <select name="newsletter_input" required>
          <option value="">Select...</option>
          <option value="Yes">Yes</option>
          <option value="No">No</option>
        </select>
      </div>
      <div class="col full">
        <label class="control-label input-required" for="finalcomment_input">Any final last comments or notes</label>
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
