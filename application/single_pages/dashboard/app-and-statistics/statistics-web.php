<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	$pageTitle = 'Statistics Dashboard'
?>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script type="text/javascript" src="http://assets.freshdesk.com/widget/freshwidget.js"></script>
<script type="text/javascript">
Chart.defaults.global.customTooltips = function(tooltip) {
    var tooltipEl = $('#chartjs-tooltip');
    if (!tooltip) {
        tooltipEl.css({
            opacity: 0
        });
        return;
    }
    tooltipEl.removeClass('above below');
    tooltipEl.addClass(tooltip.yAlign);
    tooltipEl.html(tooltip.text);
    var top;
    if (tooltip.yAlign == 'above') {
        top = tooltip.y - tooltip.caretHeight - tooltip.caretPadding;
    } else {
        top = tooltip.y + tooltip.caretHeight + tooltip.caretPadding;
    }
    tooltipEl.css({
        opacity: 1,
        left: tooltip.chart.canvas.offsetLeft + tooltip.x + 'px',
        top: tooltip.chart.canvas.offsetTop + top + 'px',
        fontFamily: tooltip.fontFamily,
        fontSize: tooltip.fontSize,
        fontStyle: tooltip.fontStyle,
    });
};
</script>
<?php
	require('config/settings.php');
	session_start();
?>
<?php print $analytic_feed; ?>
<section class="cwdash-body">
	<!-- storage -->
	<?php
		$ar = getDirectorySize($client_path);
		function getDirectorySize($client_path) {
			$totalsize = 0;
			$totalcount = 0;
			$dircount = 0;
			if ($handle = opendir ($client_path)) {
				while (false !== ($file = readdir($handle))) {
					$nextpath = $client_path . '/' . $file;

					if ($file != '.' && $file != '..' && !is_link ($nextpath)) {
						if (is_dir ($nextpath)) {
							$dircount++;
							$result = getDirectorySize($nextpath);
							$totalsize += $result['size'];
							$totalcount += $result['count'];
							$dircount += $result['dircount'];
						}
						elseif (is_file ($nextpath)) {
							$totalsize += filesize ($nextpath);
							$totalcount++;
						}
					}
				}
			}
			closedir ($handle);
			$total['size'] = $totalsize;
			$total['count'] = $totalcount;
			$total['dircount'] = $dircount;
			return $total;
		}
		function sizeFormat($size) {
		    if($size<1024) {
		        return $size." bytes";
			}
		    else if($size<(1024*1024)) {
		        $size=round($size/1024,2,PHP_ROUND_HALF_UP);
		        return $size;
		    }
		    else if($size<(1024*1024*1024)) {
		        $size=round($size/(1024*1024),2,PHP_ROUND_HALF_UP);
		        return $size;
		    } else {
		        $size=round($size/(1024*1024*1024),2,PHP_ROUND_HALF_UP);
		        return $size;
		    }
		}
		$storageused = sizeFormat($ar['size']);
		$storageleft = $storage - $storageused;
	?>
	<script type="text/javascript">
	var chartStorage = [{
        value: <?php print $storageused; ?>,
        color: "#ffffff",
        highlight: "#ffffff",
        label: "Used (MB)"
    }, {
        value: <?php print $storageleft; ?>,
        color: "#54f1c8",
        highlight: "#54f1c8",
        label: "Remaining (MB)"
    }];
    window.onload = function() {
        var ctx1 = document.getElementById("chartStorage").getContext("2d");
        window.chartStoragePie = new Chart(ctx1).Doughnut(chartStorage, {
	        segmentShowStroke:false,
	        percentageInnerCutout:40
        });
    };
	</script>
<!-- analytics -->
	<?php
		require_once 'google-api-php-client/Google/autoload.php';
		$scopes = 'https://www.googleapis.com/auth/analytics.readonly';
		$client = new Google_Client();
		$client->setClientId($client_id);
		$client->setAssertionCredentials(new Google_Auth_AssertionCredentials(
		        $client_email,
		        array($scopes),
		        file_get_contents($private_key)
		    )
		);
		$service = new Google_Service_Analytics($client);

		try {
		    $realtime = $service->data_realtime->get(
		        $client_view_id,
		        'rt:activeVisitors'
		    );
		    $final_realtime = ($realtime->totalsForAllResults['rt:activeVisitors']);
		} catch(Exception $e) {
		    $error = $e->getMessage();
		}
		try {
			$pageviewsweek = $service->data_ga->get(
				$client_view_id,
				'7daysAgo',
				'today',
				'ga:sessions'
			);
			$final_pageviewsweek = ($pageviewsweek->totalsForAllResults['ga:sessions']);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		try {
			$pageviewstoday = $service->data_ga->get(
				$client_view_id,
				'today',
				'today',
				'ga:sessions'
			);
			$final_pageviewstoday = ($pageviewstoday->totalsForAllResults['ga:sessions']);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		try {
			$pageduratoday = $service->data_ga->get(
				$client_view_id,
				'today',
				'today',
				'ga:avgSessionDuration'
			);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		$hours = floor(($pageduratoday->totalsForAllResults['ga:avgSessionDuration']) / 3600);
		$minutes = floor((($pageduratoday->totalsForAllResults['ga:avgSessionDuration']) / 60) % 60);
		$seconds = ($pageduratoday->totalsForAllResults['ga:avgSessionDuration']) % 60;
		$final_pageduratoday = "$minutes\m $seconds\s";
		$pagepathweekopt = array(
			'dimensions' => 'ga:pagePath',
			'metrics' => 'ga:pageviews',
			'sort' => '-ga:pageviews',
			'max-results' => '5'
		);
		try {
			$pagepathweek = $service->data_ga->get(
				$client_view_id,
				'7daysAgo',
				'today',
				'ga:pagePath',
				$pagepathweekopt
			);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		if (count($pagepathweek->getRows()) > 0) {
			if (empty($final_pagepathweek)) $final_pagepathweek = '';
			$final_pagepathweek .= '<table class="table-default" cellpadding="0" cellspacing="0">';

			foreach ($pagepathweek->getRows() as $row) {
				$final_pagepathweek .= '<tr>';
				foreach ($row as $cell) {
					$final_pagepathweek .= '<td>'
					. htmlspecialchars($cell, ENT_NOQUOTES)
					. '</td>';
				}
				$final_pagepathweek .= '</tr>';
			}
				$final_pagepathweek .= '</table>';
			} else {
				$final_pagepathweek .= '<p>No Results</p>';
			}
		$channelweekopt = array(
			'dimensions' => 'ga:channelGrouping',
			'metrics' => 'ga:sessions',
			'sort' => '-ga:sessions',
			'max-results' => '3'
		);
		try {
			$channelweek = $service->data_ga->get(
				$client_view_id,
				'7daysAgo',
				'today',
				'ga:channelGrouping',
				$channelweekopt
			);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		if (count($channelweek->getRows()) > 0) {
			if (empty($final_channelweek)) $final_channelweek = '';
			$final_channelweek .= '<table class="table-default" cellpadding="0" cellspacing="0">';

			foreach ($channelweek->getRows() as $row) {
				$final_channelweek .= '<tr>';
				foreach ($row as $cell) {
					$final_channelweek .= '<td>'
					. htmlspecialchars($cell, ENT_NOQUOTES)
					. '</td>';
				}
				$final_channelweek .= '</tr>';
			}
				$final_channelweek .= '</table>';
			} else {
				$final_channelweek .= '<p>No Results</p>';
			}
		$deviceweekopt = array(
			'dimensions' => 'ga:deviceCategory',
			'metrics' => 'ga:sessions',
			'sort' => '-ga:sessions',
			'max-results' => '5'
		);
		try {
			$deviceweek = $service->data_ga->get(
				$client_view_id,
				'7daysAgo',
				'today',
				'ga:deviceCategory',
				$deviceweekopt
			);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		if (count($deviceweek->getRows()) > 0) {
			if (empty($final_deviceweek)) $final_deviceweek = '';
			$final_deviceweek .= '<table class="table-default" cellpadding="0" cellspacing="0">';

			foreach ($deviceweek->getRows() as $row) {
				$final_deviceweek .= '<tr>';
				foreach ($row as $cell) {
					$final_deviceweek .= '<td>'
					. htmlspecialchars($cell, ENT_NOQUOTES)
					. '</td>';
				}
				$final_deviceweek .= '</tr>';
			}
				$final_deviceweek .= '</table>';
			} else {
				$final_deviceweek .= '<p>No Results</p>';
			}
		$browserweekopt = array(
			'dimensions' => 'ga:browser',
			'metrics' => 'ga:sessions',
			'sort' => '-ga:sessions',
			'max-results' => '5'
		);
		try {
			$browserweek = $service->data_ga->get(
				$client_view_id,
				'7daysAgo',
				'today',
				'ga:browser',
				$browserweekopt
			);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		if (count($browserweek->getRows()) > 0) {
			if (empty($final_browserweek)) $final_browserweek = '';
			$final_browserweek .= '<table class="table-default" cellpadding="0" cellspacing="0">';

			foreach ($browserweek->getRows() as $row) {
				$final_browserweek .= '<tr>';
				foreach ($row as $cell) {
					$final_browserweek .= '<td>'
					. htmlspecialchars($cell, ENT_NOQUOTES)
					. '</td>';
				}
				$final_browserweek .= '</tr>';
			}
				$final_browserweek .= '</table>';
			} else {
				$final_browserweek .= '<p>No Results</p>';
			}
		$countryweekopt = array(
			'dimensions' => 'ga:country',
			'metrics' => 'ga:sessions',
			'sort' => '-ga:sessions',
			'max-results' => '5'
		);
		try {
			$countryweek = $service->data_ga->get(
				$client_view_id,
				'7daysAgo',
				'today',
				'ga:country',
				$countryweekopt
			);
		} catch (apiServiceException $e) {
			$error = $e->getMessage();
		}
		if (count($countryweek->getRows()) > 0) {
			if (empty($final_countryweek)) $final_countryweek = '';
			$final_countryweek .= '<table class="table-default" cellpadding="0" cellspacing="0">';

			foreach ($countryweek->getRows() as $row) {
				$final_countryweek .= '<tr>';
				foreach ($row as $cell) {
					$final_countryweek .= '<td>'
					. htmlspecialchars($cell, ENT_NOQUOTES)
					. '</td>';
				}
				$final_countryweek .= '</tr>';
			}
				$final_countryweek .= '</table>';
			} else {
				$final_countryweek .= '<p>No Results</p>';
			}
	?>
<!-- pingdom -->
	<?php
		$apc_response = apc_fetch("$client_siteid-response");
		if ($apc_response === false) {
		    $curl = curl_init();
		    curl_setopt($curl, CURLOPT_URL, "https://api.pingdom.com/api/2.0/checks/$client_siteid");
		    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "GET");
		    curl_setopt($curl, CURLOPT_USERPWD, $username_pingdom);
		    curl_setopt($curl, CURLOPT_HTTPHEADER, array("App-Key: $appkey_pingdom"));
		    // Ask cURL to return the result as a string
		    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		    // Execute the request and decode the json result into an associative array
		    $response = json_decode(curl_exec($curl),true);
		} else {
		    $response = $apc_response;
		}
		if (isset($response['error'])) {
		    print "Error: " . $response['error']['errormessage'] . "\n";
		    exit;
		}
		$check = $response['check']; //up, down, unconfirmed_down, unknown, paused
	?>
	<?php
		$startofyear = date('Y');
		$startofuptime = $startofyear.'-01-01T00:00:01+00:00';
		$startofuptimeunix = strtotime($startofuptime);
		$timecurrent = time();

		$apc_responseavg = apc_fetch("$client_siteid-response");
		if ($apc_responseavg === false) {
			$curlavg = curl_init();
			curl_setopt($curlavg, CURLOPT_URL, "https://api.pingdom.com/api/2.0/summary.average/$client_siteid?includeuptime=true&from=$startofuptimeunix");
			curl_setopt($curlavg, CURLOPT_CUSTOMREQUEST, "GET");
			curl_setopt($curlavg, CURLOPT_USERPWD, $username_pingdom);
			curl_setopt($curlavg, CURLOPT_HTTPHEADER, array("App-Key: $appkey_pingdom"));
			// Ask cURL to return the result as a string
			curl_setopt($curlavg, CURLOPT_RETURNTRANSFER, 1);
			// Execute the request and decode the json result into an associative array
			$responseavg = json_decode(curl_exec($curlavg),true);
		} else {
			$responseavg = $apc_responseavg;
		}
		if (isset($responseavg['error'])) {
			print "Error: " . $responseavg['error']['errormessage'] . "\n";
			exit;
		}
		$checkavg = $responseavg['summary']['status']['totalup'];

		$responseavgdiff = $startofuptimeunix - $timecurrent;
		$responseavgdiffpre = $checkavg / $responseavgdiff;
		$responseavgdiffres = $responseavgdiffpre * 100;
		$responseavgdiffres = number_format($responseavgdiffres, 2, '.', '');
		$responseavg_diffres = str_replace('-','',$responseavgdiffres);
	?>
	<div class="cwdash-wrap">
		<div class="cwdash-inline">
			<div class="cwdash-btns">
				<a href="javascript:history.go(0)" title="Refresh" class="abtn" title="Refresh"><i class="fa fa-refresh"></i> Refresh</a>
				<?php if ($client_style) { ?>
					<a href="http://styleguidelin.es/clients/<?php echo $client_style; ?>" target="_blank" class="abtn" title="Online Style Guidelines"><i class="fa fa-info"></i> Style Guidelines</a>
				<?php } ?>
				<?php if ($client_siteid) { ?>
					<a href="http://status.chriswatterston.com/4mihrmtwyh7z/<?php echo $client_siteid; ?>" target="_blank" class="abtn" title="Full uptime monitoring report"><i class="fa fa-flag"></i> Full uptime report</a>
				<?php } ?>
			</div>
			<div class="col lft narrow">
				<div class="cwdash-item col-three">
					<div>
						<span class="subject"><i class="fa fa-user-secret" title="Right Now"></i>Now</span>
						<span class="data"><?php echo $final_realtime; ?></span>
						<span class="desc">users on site now</span>
					</div>
				</div>
				<div class="cwdash-item col-two">
					<div>
						<span class="subject"><i class="fa fa-cloud-upload" title="Uptime"></i>Uptime</span>
						<span class="data"><?php echo $responseavg_diffres; ?>%</span>
						<span class="desc">since the start of <?php echo date('Y'); ?></span>
					</div>
				</div>
				<div class="cwdash-item col-one">
					<div>
						<span class="subject"><i class="fa fa-users" title="Unique Views"></i>Views</span>
						<span class="data"><?php echo $final_pageviewsweek; ?></span>
						<span class="desc">over past 7 days</span>
					</div>
				</div>
				<div class="cwdash-item col-four">
					<div>
						<span class="subject"><i class="fa fa-users" title="Unique Views"></i>Views</span>
						<span class="data"><?php echo $final_pageviewstoday; ?></span>
						<span class="desc">just today</span>
					</div>
				</div>
				<div class="cwdash-item col-five">
					<div>
						<span class="subject"><i class="fa fa-clock-o" title="Time"></i>Time</span>
						<span class="data"><?php echo gmdate($final_pageduratoday); ?></span>
						<span class="desc">average time on site today</span>
					</div>
				</div>
				<div class="cwdash-item col-three">
					<div>
						<span class="subject"><i class="fa fa-hourglass-end" title="Response"></i>Response</span>
						<span class="data"><?php if ($check['lastresponsetime'] >= 1000) { $lastresponsetime = $check['lastresponsetime'] / 1000; print "<td>" . $lastresponsetime . " s</td>";} else { print "<td>" . $check['lastresponsetime'] . " ms</td>"; } ?></span>
						<span class="desc">on last check</span>
					</div>
				</div>
				<div class="cwdash-item col-one">
					<div>
						<span class="subject"><i class="fa fa-repeat" title="Interval"></i>Interval</span>
						<span class="data"><?php echo $check['resolution']; ?></span>
						<span class="desc">minutes between checks</span>
					</div>
				</div>
				<div class="cwdash-item col-four">
					<div>
						<span class="subject"><i class="fa fa-spinner" title="Checked"></i>Checked</span>
						<span class="data"><?php echo date("g:iA", $check['lasttesttime']); ?></span>
						<span class="desc">todays latest check</span>
					</div>
				</div>
				<div class="cwdash-item large col-two">
					<div>
						<span class="subject"><i class="fa fa-globe" title="Country"></i>Country</span>
						<div class="data"><?php echo $final_countryweek; ?></div>
						<span class="desc">most popular over past 7 days</span>
					</div>
				</div>
				<div class="cwdash-item large col-five">
					<div>
						<span class="subject"><i class="fa fa-internet-explorer" title="Browser"></i>Browser</span>
						<div class="data"><?php echo $final_browserweek; ?></div>
						<span class="desc">most popular over past 7 days</span>
					</div>
				</div>
				<div class="cwdash-item large col-four">
					<div>
						<span class="subject"><i class="fa fa-rss" title="Fresh Posts"></i>Fresh Posts</span>
						<div class="data">
							<?php
								$rss = new DOMDocument();
								$rss->load('http://www.chriswatterston.com/rss/latestupdates');

								$feed = array();
								foreach ($rss->getElementsByTagName('item') as $node) {
									$item = array (
										'title' => $node->getElementsByTagName('title')->item(0)->nodeValue,
										// 'desc' => $node->getElementsByTagName('description')->item(0)->nodeValue,
										'link' => $node->getElementsByTagName('link')->item(0)->nodeValue,
										'date' => $node->getElementsByTagName('pubDate')->item(0)->nodeValue,
										);
									array_push($feed, $item);
								}
								$limit = 2;
								for($x=0;$x<$limit;$x++) {
									$title = str_replace(' & ', ' &amp; ', $feed[$x]['title']);
									$link = $feed[$x]['link'];
									// $description = $feed[$x]['desc'];
									$date = date('l F d, Y', strtotime($feed[$x]['date']));
									echo '<div class="blog-post">';
										echo '<p class="blog-title"><a href="'.$link.'" title="'.$title.'" target="_blank">'.$title.' <i class="fa fa-link"></i></a></p>';
										echo '<p class="blog-date">Posted on '.$date.'</p>';
										// echo '<p class="blog-desc">'.substr($description,0,90).'...</p>';
									echo '</div>';
								}
							?>
						</div>
						<span class="desc">our latest two blog posts</span>
					</div>
				</div>
			</div>

			<div class="col rgt">
				<div class="cwdash-item col-two">
					<div>
						<span class="subject"><i class="fa fa-balance-scale" title="Status"></i>Status</span>
						<span class="data">
							<?php //echo $check['status']; ?>
							<?php
								if ($check['status'] == 'up') {
									echo '<i class="fa fa-arrow-circle-o-up status" title="Up"></i>';
								} elseif ($check['status'] == 'down') {
									echo '<i class="fa fa-arrow-circle-o-down" title="Down"></i>';
								} elseif ($check['status'] == 'unconfirmed_down') {
									echo '<i class="fa fa-arrow-circle-o-down" title="Unconfirmed Down"></i>';
								} elseif ($check['status'] == 'paused') {
									echo '<i class="fa fa-pause-circle-o status" title="Paused"></i>';
								} else {
									echo '<i class="fa fa-dot-circle-o status" title="Unknown"></i>';
								}
							?>
						</span>
						<span class="desc">condition of site is <strong><?php echo $check['status']; ?></strong></span>
					</div>
				</div>
				<div class="cwdash-item col-three">
					<div>
						<span class="subject"><i class="fa fa-hdd-o" title="Storage"></i>Storage</span>
						<div class="data chart"><canvas class="chart" id="chartStorage" /></div>
						<span class="desc">megabytes used so far<br /><br /><strong><?php echo $ar['count']; ?></strong> files & <strong><?php echo $ar['dircount']; ?></strong> folders</span>
					</div>
				</div>
				<div class="cwdash-item large col-four">
					<div>
						<span class="subject"><i class="fa fa-thumbs-o-up" title="Popular"></i>Popular</span>
						<div class="data"><?php echo $final_pagepathweek; ?></div>
						<span class="desc">pages over past 7 days</span>
					</div>
				</div>
				<div class="cwdash-item col-three">
					<div>
						<span class="subject"><i class="fa fa-road" title="Traffic"></i>Traffic</span>
						<div class="data"><?php echo $final_channelweek; ?></div>
						<span class="desc">over past 7 days</span>
					</div>
				</div>
				<div class="cwdash-item col-five">
					<div>
						<span class="subject"><i class="fa fa-laptop" title="Devices"></i>Devices</span>
						<div class="data"><?php echo $final_deviceweek; ?></div>
						<span class="desc">over past 7 days</span>
					</div>
				</div>
				<div class="cwdash-item large col-two">
					<div>
						<span class="subject"><i class="fa fa-heartbeat" title="Monitored"></i>Monitored</span>
						<span class="data"><?php echo $check['hostname']; ?></span>
						<span class="desc">full domain name we are monitoring</span>
					</div>
				</div>
				<div class="cwdash-item large col-five">
					<div>
						<span class="subject"><i class="fa fa-ticket" title="Submit Ticket"></i>Support</span>
						<span class="data">
							<iframe title="Feedback Form" class="freshwidget-embedded-form" id="freshwidget-embedded-form" src="http://support.chriswatterston.com/widgets/feedback_widget/new?&widgetType=embedded&formTitle=Submit+Support+Enquiry&submitTitle=Submit&submitThanks=Thank+you+for+your+support+enquiry.+We'll+be+in+touch+shortly.&screenshot=no&searchArea=no" scrolling="no" height="400px" width="100%" frameborder="0" ></iframe>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="chartjs-tooltip"></div>
	<!-- credits -->
	<div class="credit-services">
		<p>ONLY supported by the the most trusted services in the industry</p>
		<p><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/chriswatterston-logo.png" alt="Chris Watterston Designs" title="Chris Watterston Designs" /><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/appsforwork-logo.png" alt="Google Apps for Work" title="Google Apps for Work" /><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/analytics-logo.png" alt="Google Analytics" title="Google Analytics" /><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/concrete5-logo.png" alt="Concrete5" title="Concrete5" /><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/freshdesk-logo.png" alt="Freshdesk" title="Freshdesk" /><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/azure-logo.png" alt="Microsoft Azure" title="Microsoft Azure" /><img src="//www.chriswatterston.com/ext-src/app-and-statistics/img/pingdom-logo.png" alt="Pingdom" title="Pingdom" /></p>
	</div>
</section>
