<?php
  defined('C5_EXECUTE') or die("Access Denied.");

  $c = Page::getCurrentPage();
  $pageURL = $c->getCollectionPath();
  $submitDateTime = date('l, jS Y @ G:i:sA', strtotime(now));

  if ($_POST['form_submit']) {
    //// collect posted data
      // client
      $clientName = $_POST['name_input'];
      $clientOrganisation = $_POST['organisation_input'];
      $clientEmail = $_POST['email_input'];
      $clientPhone = $_POST['phone_input'];
      $clientAbout = $_POST['about_input'];
      // project
      $projectType = $_POST['type_input'];
      $projectDeadline = $_POST['deadline_input'];
      $projectBrief = $_POST['brief_input'];
      $projectLikes = $_POST['likes_input'];
      $projectDomain = $_POST['domain_input'];
      $projectBudget = $_POST['budget_input'];
      // goal
      $goalOne = $_POST['goalone_input'];
      $goalTwo = $_POST['goaltwo_input'];
      $goalTarget = $_POST['targetaud_input'];
      $goalSupport = $_POST['support_input'];
      $goalOverview = $_POST['goaloverview_input'];
      // finally
      $finallyDecision = $_POST['decisionmaker_input'];
      $finallyNewsletter = $_POST['newsletter_input'];
      $finallyComments = $_POST['finalcomment_input'];

    require_once 'api-mandrill/src/Mandrill.php';
    $mandrill = new Mandrill('gnetzLxGtAZKjWB5FByjtA');

    try {
      $message = array(
          'html' => '
            <table align="center" border="0" cellspacing="0" cellpadding="0" style="min-width:400px;max-width:650px;width:100%;border:none;text-align:left;background-color:#fcfcfc;">
              <tr style="background-color:#44A38C;">
                <th colspan="2" style="padding:20px;"><img src="http://www.chriswatterston.com/application/themes/chriswatterston/img/brnd/chriswatterston-logo.png" style="width:200px;height:auto;border:0;" /></th>
              </tr>
              <tr>
                <td colspan="2" style="padding-top:20px;padding-right:30px;padding-bottom:5px;padding-left:30px;">
                  <h1 style="font-size:18px;color:#000000;font-family:Verdana, Geneva, sans-serif;">Thank you, '.$clientName.'.</h1>
                  <p style="font-size:13px;color:#000000;font-family:Verdana, Geneva, sans-serif;">Thank you for your recent enquiry submission for $projectType. Having now received your detail, will review and get back to you within 24 hours via the email or phone number you provided. I look forward to speaking to you in the near future!</p>
                  <p style="font-size:13px;color:#000000;font-family:Verdana, Geneva, sans-serif;">For your records, here is a digital copy of your whole enquiry submission...</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Full name -</p>
                </th>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$clientName.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Organisation name -</p>
                </td>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$clientOrganisation.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Email address -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$clientEmail.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Phone number -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$clientPhone.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">About yourself / organisation -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$clientAbout.'</p>
                </td>
              </tr>

              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:15px;padding-right:0;padding-bottom:5px;padding-left:0;">Project type -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:15px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$projectType.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Deadline -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$projectDeadline.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Brief -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$projectBrief.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Likes -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$projectLikes.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Domain / Hosting -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$projectDomain.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Budget -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$projectBudget.'</p>
                </td>
              </tr>

              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:15px;padding-right:0;padding-bottom:5px;padding-left:0;">Goal #1 -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:15px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$goalOne.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Goal #2 -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$goalTwo.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Target audience -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$goalTarget.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Support / Maintenance -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$goalSupport.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Goal overview -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$goalOverview.'</p>
                </td>
              </tr>

              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:15px;padding-right:0;padding-bottom:5px;padding-left:0;">Key decsion maker -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:15px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$finallyDecision.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Receive email updates -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$finallyNewsletter.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Final comments -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$finallyComments.'</p>
                </td>
              </tr>
              <tr>
                <td style="padding-top:30px;padding-right:0;padding-bottom:30px;padding-left:30px;width:35%;text-align:right;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;font-weight:600;text-align:right;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">Submission time / date -</p>
                </td>
                <td style="padding-top:0;padding-right:30px;padding-bottom:0;padding-left:30px;width:65%;">
                  <p style="font-size:12px;color:#000000;font-family:Verdana, Geneva, sans-serif;padding-top:2px;padding-right:0;padding-bottom:5px;padding-left:0;">'.$submitDateTime.'</p>
                </td>
              </tr>
            </table>
          ',
          'subject' => 'Project Enquiry - Form Submission',
          'from_email' => 'noreply@chriswatterston.com',
          'from_name' => 'Chris Watterston',
          'to' => array(
              array(
                  'email' => 'forms@chriswatterston.com',
                  'name' => 'Chris Watterston',
                  'type' => 'to'
              ),
              array(
                  'email' => $clientEmail,
                  'name' => $clientName,
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
    echo "<style>.enquiry-form{display:none!important;}</style>";
  }
  if ($result[0][status] === 'queued') {
    echo "<p class='alert-success'>Thank you for your Project Enquiry form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
    echo "<style>.enquiry-form{display:none!important;}</style>";
  }
  if ($result[0][status] === 'scheduled') {
    echo "<p class='alert-success'>Thank you for your Project Enquiry form submission. Once received, we'll be back in touch as soon as we can - speak soon!</p>";
    echo "<style>.enquiry-form{display:none!important;}</style>";
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
  <form method="post" class="form-grey colour-grey" id="validate-enquiry" name="form_submit" action="<?php echo $pageURL; ?>#enquiry-form">
    <div class="cols">
      <h1>Details about <strong>yourself...</strong></h1>
      <div class="col">
        <label class="control-label input-required" for="name_input">Full name</label>
        <input name="name_input" maxlength="50" type="text" value="" data-validation="required" required/>
      </div>
      <div class="col last">
        <label class="control-label" for="organisation_input">Organisation name (if applicable)</label>
        <input name="organisation_input" type="text" data-validation="required" value="" data-validation-optional="true"/>
      </div>
      <div class="col">
        <label class="control-label input-required" for="email_input">Email address</label>
        <input name="email_input" maxlength="50" type="email" value="" data-validation="email" required/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="phone_input">Phone number</label>
        <input name="phone_input" type="tel" value="" data-validation="number" required/>
      </div>
      <div class="col full">
        <label class="control-label input-required" for="about_input">About yourself or organisation (what do you do)</label>
        <textarea name="about_input" placeholder="We would love to know what you or your organisation does... what are the products and services you offer..." data-validation="required" required></textarea>
      </div>
    </div>
    <div class="cols">
      <h1>Details about <strong>project...</strong></h1>
      <div class="col">
        <label class="control-label input-required" for="type_input">Type</label>
        <select name="type_input" title="Project Type" data-validation="required" required>
          <option>Select...</option>
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
        <label class="control-label input-required" for="brief_input">Brief overview</label>
        <textarea name="brief_input" placeholder="Tell me about your project... share information like, why you're looking for something new, areas currently not working with your current solution, who are you competitors and do they stand out... tell me if have structured sitemaps and content ready..." data-validation="required" required></textarea>
      </div>
      <div class="col full">
        <label class="control-label" for="likes_input">Is there other projects in particular that you like (if applicable)</label>
        <textarea name="likes_input" placeholder="Providing an indication or links of design style that you like can help us in a big way... have you've seen a website you like, maybe even a mobile app or piece of art..."></textarea>
      </div>
      <div class="col">
        <label class="control-label" for="domain_input">Need domain name / hosting (if applicable)</label>
        <input name="domain_input" type="text" value="" data-validation-optional="true"/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="budget_input">Budget (be honest, we can then tell you what we can or can't do)</label>
        <select name="budget_input" data-validation="required" required>
          <option>Select...</option>
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
        <input name="goalone_input" type="text" value="" data-validation="required" required/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="goaltwo_input">Goal #2</label>
        <input name="goaltwo_input" type="text" value="" data-validation="required" required/>
      </div>
      <div class="col">
        <label class="control-label input-required" for="targetaud_input">Target audience</label>
        <input name="targetaud_input" type="text" value="" data-validation="required" required/>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="support_input">Support and ongoing maintenance</label>
        <select name="support_input" data-validation="required" required>
          <option>Select...</option>
          <option value="Support and Maintenance">Yes, support and maintenance</option>
          <option value="Support only">Yes, support only</option>
          <option value="Maintenance only">Yes, maintenance only</option>
          <option value="No">No</option>
        </select>
      </div>
      <div class="col full">
        <label class="control-label input-required" for="goaloverview_input">Goal overview</label>
        <textarea name="goaloverview_input" placeholder="Expand on general or specific measurable goals that the should be achieved... clear goals allow the the ability to focus on what will provide the most impact to your project in moving forward..." data-validation="required" required></textarea>
      </div>
    </div>
    <div class="cols">
      <h1>and <strong>finally...</strong></h1>
      <div class="col">
        <label class="control-label input-required" for="decisionmaker_input">Are you the key decsion maker for this project</label>
        <select name="decisionmaker_input" data-validation="required" required>
          <option>Select...</option>
          <option value="Yes">Yes</option>
          <option value="Yes plus group">Yes, plus others as a group</option>
          <option value="No">No, somebody else</option>
        </select>
      </div>
      <div class="col last">
        <label class="control-label input-required" for="newsletter_input">Can we keep you updated about news and events through email</label>
        <select name="newsletter_input" data-validation="required" required>
          <option>Select...</option>
          <option value="Yes">Yes</option>
          <option value="No">No</option>
        </select>
      </div>
      <div class="col full">
        <label class="control-label" for="finalcomment_input">Any final last comments or notes</label>
        <textarea name="finalcomment_input"></textarea>
      </div>
    </div>
    <div class="cols">
      <div class="col full">
          <input type="submit" name="form_submit" value="Submit Project Enquiry" class="btn btn-default" />
      </div>
    </div>
  </form>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>$.validate({form:"#validate-enquiry",modules:"date, security"});</script>
