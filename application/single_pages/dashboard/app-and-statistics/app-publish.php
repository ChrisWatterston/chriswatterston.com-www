<?php

use Concrete\Core\Database\Connection\Connection;


	defined('C5_EXECUTE') or die("Access Denied.");
	$pageTitle = 'App Publish';
	require('config/settings.php');
	session_start();
	
	
	



class SKPull
{
	protected $connection;

    public function __construct(Connection $connection)
    {
        $this->connection = $connection;
    }

    public function getSKPull($id)
    {
        $SKOOLpingSetQuery = $this->connection->fetchColumn('SELECT * FROM SKOOLpingSettings', [$id]);
        return $SKOOLpingSetQuery;
    }
}

$SKOOLpingSetResults = Core::make('SKPull');
$results = $SKOOLpingSetResults->getSKPull(1);

echo $results;




/*
$SKOOLpingSetQuery = "SELECT * FROM SKOOLpingSettings";
$SKOOLpingSetResults = mysqli_query($db,$SKOOLpingSetQuery);

while($SKOOLrows = mysqli_fetch_assoc($SKOOLpingSetResults)) {
	$AppEnabled = $SKOOLrows['AppEnabled'];
	$NewsFeed = $SKOOLrows['NewsFeed'];
    $NewsFeedURL = $SKOOLrows['NewsFeedURL'];
}
*/

// echo $AppEnabled;


?>
<section class="cwdash-body">
	<div class="cwdash-wrap" id="cwapp">
		<div class="cwapp-inline">
			<div class="col lft">

				<section class="notifications">
					<h2>Messages & Push Notifications</h2>
					<div class="form-wrap">
						<form method="post" action="" class="messages-form">
						    <div class="form-group">
							    <label>Push New Message</label>
							    <p>It's a great idea to push your most important events, news or message this way. Push messages need to be short and sweet, why not include a URL link to a news article on your site. This way you can tell a bigger story, with more impact!</p>
							    
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="00" />
								    <label>All</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="07" />
								    <label>Year 7</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="08" />
								    <label>Year 8</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="09" />
								    <label>Year 9</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="10" />
								    <label>Year 10</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="11" />
								    <label>Year 11</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="12" />
								    <label>Year 12</label>
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" id="message-group" name="message-group[]" class="form-control" value="13" />
								    <label>Year 13</label>
							    </div>
							    
						    </div>
						    <div class="form-group">
							    <label>Message</label>
							    <p class="app-tip">Wrap URL's in messages with [link][/link] tags. Messages have a 255 characters limit.</p>
							    <textarea id="messages-enable" name="messages-enable" required="required" class="form-control" rows="2" maxlength="225" placeholder="Some fantastic new from our recent fundraising event..."></textarea>
						    </div>
						    <div class="form-group">
							    <button class="btn btn-default pull-left" type="submit" name="save">Push Message</button>
							</div>
						</form>
					</div>
				</section>

				<section class="news">
					<h2>News Feed</h2>
					<div class="form-wrap">
						<form method="post" action="#" class="calendar-form">
						    <div class="form-group">
							    <label>Enable / Disable Feed</label>
							    <p>Your news feed is usually enabled by default after integration is complete. If you want to want to temporary disable the feed for any given reason, just select 'Disable' from the options below.</p>
						        <select id="news-enable" name="news-enable" required="required" ccm-passed-value="1" class="form-control">
							        <option value="0" class="disabled" title="Disabled">Disabled</option>
							        <option value="1" class="enabled" title="Enabled">Enabled</option>
							    </select>
						    </div>
						     <div class="form-group">
							    <label>Feed Source URL</label>
							    <p>Your source URL is usually set to the direct URL of your parent new page (e.g http://www.your-domain.com/news), but this can be different per website. The easiest way to obtain your new URL, navigate through to your sites news page and copy/paste the URL that your internet browser uses into the input below.</p>
							    <input type="text" id="" name="" value="" class="form-control ccm-input-text" placeholder="http://www.your-domain.com/news-feel-url...">
							</div>
						    <div class="form-group">
							    <button class="btn btn-default pull-left" type="submit" name="save">Save Settings</button>
							</div>
						</form>
					</div>
				</section>

				<section class="calendar">
					<h2>Calendar & Events</h2>
				</section>

				<section class="documents">
					<h2>Documents</h2>
					<div class="form-wrap">
						<form method="post" action="#" class="document-form">
						    <div class="form-group">
							    <label>File Sets</label>
							    <p>Your source URL is usually set to the direct URL of your parent new page (e.g http://www.your-domain.com/news), but this can be different per website. The easiest way to obtain your new URL, navigate through to your sites news page and copy/paste the URL that your internet browser uses into the input below.</p>
							    <select id="document-select" name="document-select" required="required" class="form-control" multiple>
							        <option value="0" class="set0" title="Christmas Party">Christmas Party</option>
							        <option value="1" class="set1" title="Sports Day - 2016">Sports Day - 2016</option>
							        <option value="2" class="set1" title="Sports Day - 2016">Christmas Dinner</option>
							        <option value="3" class="set1" title="Sports Day - 2016">KS4 Learning Day</option>
							        <option value="4" class="set1" title="Sports Day - 2016">Landing on the Mood</option>
							        <option value="6" class="set1" title="Sports Day - 2016">Go-Kart Racing</option>
							        <option value="7" class="set1" title="Sports Day - 2016">On the Yellow Brick Road</option>
							    </select>
							</div>
							<div class="form-group">
							    <button class="btn btn-default pull-left" type="submit" name="save">Save Settings</button>
							</div>
						</form>
					</div>
				</section>

				<section class="social">
					<h2>Social Network</h2>
					<div class="form-wrap">
						<form method="post" action="#" class="social-form">
						    <div class="form-group">
							    <label>Social Usernames</label>
							    <p>Your source URL is usually set to the direct URL of your parent new page (e.g http://www.your-domain.com/news), but this can be different per website. The easiest way to obtain your new URL, navigate through to your sites news page and copy/paste the URL that your internet browser uses into the input below.</p>
							    <input type="text" id="" name="" value="" class="form-control ccm-input-text facebook" placeholder="Facebook unsername...">
							    <input type="text" id="" name="" value="" class="form-control ccm-input-text twitter" placeholder="Twitter unsername...">
							</div>
						    <div class="form-group">
							    <label>Social Style</label>
							    <p>Your source URL is usually set to the direct URL of your parent new page (e.g http://www.your-domain.com/news), but this can be different per website. The easiest way to obtain your new URL, navigate through to your sites news page and copy/paste the URL that your internet browser uses into the input below.</p>
						        <select id="social-type" name="social-type" required="required" class="form-control">
							        <option value="0" class="separate" title="Keep social feeds separated">Keep social feeds separated</option>
							        <option value="1" class="combine" title="Combine social feeds into a single feed">Combine social feeds into a single feed</option>
							    </select>
							</div>
	
							<div class="form-group">
							    <button class="btn btn-default pull-left" type="submit" name="save">Save Settings</button>
							</div>
						</form>
					</div>
				</section>

			</div>
			<div class="col rgt">

				<section class="details">
					<h2>Contact Details, Map & Forms</h2>
					<div class="form-wrap">
						<form method="post" action="#" class="contact-form">
						    <div class="form-group">
							    <label>Reception</label>
							    <p>Telephone number used for general enquires.</p>
							    <input type="tel" id="contact-tel" name="contact-tel" value="" class="form-control ccm-input-text" placeholder="07515163815">
							    <p>Email address used for general enquires.</p>
							    <input type="email" id="contact-email" name="contact-email" value="" class="form-control ccm-input-text" placeholder="office@your-domain.com">
							</div>
							<div class="form-group">
							    <label>Address</label>
							    <p>Address will be visibly available, as well as Google Maps integration for directions.</p>
							    <p>Address Line 1</p>
							    <input type="text" id="contact-add" name="address-line-one" value="" class="form-control ccm-input-text" placeholder="Address line 1">
							    <p>Address Line 2</p>
							    <input type="text" id="contact-add" name="address-line-two" value="" class="form-control ccm-input-text" placeholder="Address line 2">
							    <p>Town or City</p>
							    <input type="text" id="contact-add" name="address-line-twn" value="" class="form-control ccm-input-text" placeholder="Town or City">
							    <p>County</p>
							    <input type="text" id="contact-add" name="address-line-con" value="" class="form-control ccm-input-text" placeholder="County">
							    <p>Postcode</p>
							    <input type="text" id="contact-add" name="address-line-cod" value="" class="form-control ccm-input-text" placeholder="Postcode">
							</div>
							<div class="form-group">
							    <label>Form Enquiry Email Address</label>
							    <p>Reception</p>
							    <input type="email" id="contact-email" name="contact-email" value="" class="form-control ccm-input-text" placeholder="office@your-domain.com" disabled>
							    <p>Year 7 HOY</p>
							    <input type="email" id="contact-email" name="contact-form-seven" value="" class="form-control ccm-input-text" placeholder="hoy.year7@your-domain.com">
							    <p>Year 8 HOY</p>
							    <input type="email" id="contact-email-eight" name="contact-form-eight" value="" class="form-control ccm-input-text" placeholder="hoy.year8@your-domain.com">
							    <p>Year 9 HOY</p>
							    <input type="email" id="contact-email-nine" name="contact-form-nine" value="" class="form-control ccm-input-text" placeholder="hoy.year9@your-domain.com">
							    <p>Year 10 HOY</p>
							    <input type="email" id="contact-email-ten" name="contact-form-ten" value="" class="form-control ccm-input-text" placeholder="hoy.year10@your-domain.com">
							    <p>Year 11 HOY</p>
							    <input type="email" id="contact-email-eleven" name="contact-form-eleven" value="" class="form-control ccm-input-text" placeholder="hoy.year11@your-domain.com">
							    <p>Year 12 HOY</p>
							    <input type="email" id="contact-email-twelve" name="contact-form-twelve" value="" class="form-control ccm-input-text" placeholder="hoy.year12@your-domain.com">
							    <p>Year 13 HOY</p>
							    <input type="email" id="contact-email-thirteen" name="contact-form-thirteen" value="" class="form-control ccm-input-text" placeholder="hoy.year13@your-domain.com">
							    
							</div>
	
							<div class="form-group">
							    <button class="btn btn-default pull-left" type="submit" name="save">Save Settings</button>
							</div>
						</form>
					</div>
				</section>

				<section class="gallery">
					<h2>Gallery & Media</h2>
					<div class="form-wrap">
						<form method="post" action="#" class="gallery-form">
						    <div class="form-group">
							    <label>File Sets</label>
							    <p>Your source URL is usually set to the direct URL of your parent new page (e.g http://www.your-domain.com/news), but this can be different per website. The easiest way to obtain your new URL, navigate through to your sites news page and copy/paste the URL that your internet browser uses into the input below.</p>
							    <select id="gallery-select" name="gallery-select" required="required" class="form-control" multiple>
							        <option value="0" class="set0" title="Christmas Party">Christmas Party</option>
							        <option value="1" class="set1" title="Sports Day - 2016">Sports Day - 2016</option>
							        <option value="2" class="set1" title="Sports Day - 2016">Christmas Dinner</option>
							        <option value="3" class="set1" title="Sports Day - 2016">KS4 Learning Day</option>
							        <option value="4" class="set1" title="Sports Day - 2016">Landing on the Mood</option>
							        <option value="6" class="set1" title="Sports Day - 2016">Go-Kart Racing</option>
							        <option value="7" class="set1" title="Sports Day - 2016">On the Yellow Brick Road</option>
							    </select>
							</div>
							<div class="form-group">
							    <button class="btn btn-default pull-left" type="submit" name="save">Save Settings</button>
							</div>
						</form>
					</div>
				</section>
				
			</div>
		</div>
	</div>
</section>