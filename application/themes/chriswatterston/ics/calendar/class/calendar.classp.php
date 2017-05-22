<?php
/**
 * 
 * Google Calendar Reader Class
 *
 * @version 1.4.0
 * @author  Rik de Vos (http://rikdevos.com)
 * @license Copyright (C) 2012 Rik de Vos. This is not free software!
 */
class Calendar {
	/**
	 * Version of the script
	 * @var string
	 */
	public $version = '1.6.0';

	/**
	 * Calendar settings
	 * @var array
	 */
	public $settings = array(
		'url' 						=> false,
		'cache' 					=> false,
		'cache_dir' 				=> 'calendar/cache/',
		'cache_token' 				=> 1,
		'cache_time' 				=> 3600,
		'excerpt_length' 			=> 35,
		'auto_title_width' 			=> false,
		'group_events_by_date' 		=> false,
		'group_events_animate' 		=> false,
		'scale' 					=> 'year',
		'scale_change' 				=> false,
		'date_change' 				=> false,
		'date_picker' 				=> false,
		'date_picker_keep_scale' 	=> false,
		'dst'						=> false,
		'social_links' 				=> false,
		'show_map_link' 			=> false,
		'search_form' 				=> false,
		'search_all_events' 		=> false,
		'time_format' 				=> 12,
		'extra_time' 				=> 0,
		'date_day_addition' 		=> false,
		'skin' 						=> 'light',
		'hyperlink_urls'			=> false,
		'day' 						=> false,
		'month' 					=> false,
		'year' 						=> false,
	);

	/**
	 * Labels for easy translation
	 * @var array
	 */
	public $labels = array(
		'day' 						=> 'Day',
		'month' 					=> 'Month',
		'year' 						=> 'Year',
		'map' 						=> 'map',
		'view_in_google_maps' 		=> 'View in Google Maps',
		'tweet_event' 				=> 'Tweet Event',
		'share_event' 				=> 'Share Event',
		'no_events_on' 				=> 'No events on ',
		'no_events_in' 				=> 'No events in ',
		'all_day' 					=> 'ALL DAY',
		'events' 					=> 'Events',
		'event' 					=> 'Event',
		'months' 					=> array(
										'January',
										'February',
										'March',
										'April',
										'May',
										'June',
										'July',
										'August',
										'September',
										'October',
										'November',
										'December',
									),
	);

	/**
	 * Downloaded events in ICS format
	 * @var string
	 */
	public $ics = '';

	/**
	 * Type of the downloaded format
	 * @var string
	 */
	public $type = '';

	/**
	 * Downloaded events in XML format
	 * @var string
	 */
	public $xml = '';

	public $data = array();

	/**
	 * Calendar events
	 * @var array
	 */
	public $events = array();

	/**
	 * Errors occured
	 * @var boolean
	 */
	public $error = false;

	/**
	 * Dates when for date groups
	 * @var array
	 */
	public $dates =  array();
	
	/**
	 * Constructor function
	 * @return null
	 */
	function __construct($settings = array()) {
		if(!isset($settings['url'])) {
			echo '<strong>ERROR:</strong> Missing parameter \'url\'.';
			$this->error = true;
			return;
		}

		if(!is_array($settings['url'])) {
			$settings['url'] = array($settings['url']);
		}

		//Set today's dates
		$this->settings['day'] = (int)date('j');
		$this->settings['month'] = (int)date('n');
		$this->settings['year'] = (int)date('Y');
		$this->settings['search'] = (isset($_GET['cal_search'])) ? $_GET['cal_search'] : false;
		$this->settings['cache_token'] = $this->_generate_cache_token($settings['url']);

		//Set user settings
		foreach($settings as $key=>$option) {
			$this->settings[$key] = $option;
		}

		if(!is_array($settings['url'])) {
			$settings['url'] = array($settings['url']);
		}

		//Set GET settings, if allowed
		foreach($_GET as $key=>$value) {
			if($key === 'cal_scale' && $this->settings['scale_change']) {
				$this->settings[str_replace('cal_', '', $key)] = $value;

			}elseif($key === 'cal_day' || $key === 'cal_month' || $key === 'cal_year') {

				if($this->settings['date_change']) {
					$this->settings[str_replace('cal_', '', $key)] = $value;
				}
			}
		}

		if($this->settings['search_all_events'] && isset($_GET['cal_search']) && !empty($_GET['cal_search'])) {
			$this->settings['scale'] = 'year';
		}
		if($this->settings['group_events_by_date'] && $this->settings['scale'] === 'day') {
			$this->settings['group_events_by_date'] = false;
		}
		if($this->settings['search']) {
			$this->settings['group_events_by_date'] = false;
		}

		//Retrieve event data
		if(!$this->_get_cache()) {
			if(!$this->_retrieve_data()) {
				echo '<p class="alert-warning">We have failed to retrieve data from Heathside School calendar ICS. Please visit again soon and try again.<p>';
				$this->error = true;
				return false;
			}
			if(!$this->_parse_data()) {
				echo '<p class="alert-warning">We have failed to parse data from Heathside School calendar ICS. Please visit again soon and try again.<p>';
				$this->error = true;
				return false;
			}
			if($this->settings['cache']) {
				$this->_save_cache();
			}
		}
	}

	/**
	 * Creates the HTML for the calendar
	 * @return void
	 */
	public function output() {

		if($this->error) { return; }

		$events = $this->_events_within_query($this->events);

		//print_r($events);
		$url = $this->_get_page_url();
		$day = (int)$this->settings['day'];
		$month = (int)$this->settings['month'];
		$monthh = (int)$this->settings['month'];
		$year = (int)$this->settings['year'];
		$scale = $this->settings['scale'];

		$html = '';

		if($this->settings['time_format'] == 12) {
			$time_format = 'g:ia';
		}else {
			$time_format = 'G:i';
		}

		$html .= '<div class="cal-container cal_scale_'.$this->settings['scale'].(($this->settings['auto_title_width']) ? ' auto_title_width' : '').(($this->settings['skin']) ? ' cal_skin_'.$this->settings['skin'] : '').'">';

		$html .= '<div class="cal-events">';

		if(count($events) === 0) {
			switch ($scale) {
				case 'day':
					$html .= '<div class="cal_noevents">'.$this->labels['no_events_on'].date('F jS, Y', (mktime(0, 0, 0, $month, $day, $year))).'</div>';
					break;
				case 'month':
					$html .= '<div class="cal_noevents">'.$this->labels['no_events_in'].date('F Y', (mktime(0, 0, 0, $this->settings['month'], $this->settings['day'], $this->settings['year']))).'</div>';
					break;
				case 'year':
					$html .= '<div class="cal_noevents">'.$this->labels['no_events_in'].$year.'</div>';
					break;
			}
		}

		for($i = 0; $i < count($events); $i++) {
			
			if($i==10) break; // HSS Limit

			$event = $events[$i];
			if($this->type === 'xml') {
				$xml_extra_time = 0;
			}else {
				$xml_extra_time = 1;
			}

			if($this->settings['group_events_by_date'] && !empty($this->dates)) {
				$html .= $this->_render_event_group(date('j', $event['start']), date('n', $event['start']), date('Y', $event['start']));
			}

			$html .= '<div class="cal-event'.(($this->settings['group_events_by_date']) ? ' cal_grouped_event' : '').'" data-date="'.date('j-n-Y', $event['start']).'">';

			switch ($scale) {
				case 'day':
					if($event['start'] + 86400 == $event['end'] && date('G', $event['start']) == $this->settings['extra_time']/3600*$xml_extra_time) {
						$event_label = $this->labels['all_day'];
					}else {
						$event_label = strtoupper(date($time_format, $event['start']));
					}
					
					break;
				case 'month':
					$event_label = (int)$event['day'];
					break;
				case 'year':
					$event_label = strtoupper(substr($this->_month_name(date('n', $event['start'])), 0, 3).date(' j', $event['start']));
					break;
			}


			$html .= '<div class="cal-event-day"><div class="date-icon"><div class="day">'.date('j', $event['start']).'</div><div class="month">'.date('M', $event['start']).'</div></div></div>';
			$html .= '<div class="cal-event-right"><div class="cal-event-header">';


			$date_day_addition = ($this->settings['date_day_addition'])? '' : '';
		
			$current_date = time();
		    $event_start = date('Y-m-d'.$date_day_addition, $event['start']);
		    
		    $converted_date = strtotime($event_start);
		    
		    $date_diff = $current_date - $converted_date;
		    $days_remaining = floor($date_diff/(60*60*24));
		    
		    if ($days_remaining > 1){
			  $days_remaining_result = "Few days ago";
			} elseif ($days_remaining == 1){
				$days_remaining_result = "Yesterday";
			} elseif ($days_remaining == 0){
				$days_remaining_result = "Today";
			} elseif ($days_remaining == -1){
				$days_remaining_result = "Tomorrow";
			} elseif ($days_remaining < -1){
				$days_remaining_fltrd = str_replace("-","",$days_remaining);
				$days_remaining_result = "In $days_remaining_fltrd Days";
			}
		    
			if($event['start'] + 86400 == $event['end'] && date('G', $event['start']) == abs($this->settings['extra_time']/3600*$xml_extra_time)) {
				//all day event date_day_addition
				$html .= '<div class="cal-event-date">'.date('jS F Y'.$date_day_addition, $event['start']).'</div>
							<h2 class="colour-sec-six">'. $days_remaining_result .'</h2>';

			}elseif($event['start'] + 86400 >= $event['end'] && date('G', $event['start']) < date('G', $event['end'])) {
				//event on one day
				$html .= '<div class="cal-event-date">'.date('jS F Y'.$date_day_addition.' @ '.$time_format, $event['start']).'</div>
							<h2 class="colour-sec-six">'. $days_remaining_result .'</h2>';

			}else {
				$html .= '<div class="cal-event-date">'.date('jS F Y'.$date_day_addition.' @ '.$time_format, $event['start']).'</div>
							<h2 class="colour-sec-six">'. $days_remaining_result .'</h2>';
			}
			
			$html .= '<p>'.$event['title'].'</p>';

			$excerpt = explode('\n', wordwrap(str_replace('\n',' ', $event['description']), $this->settings['excerpt_length'], '\n'));
			if($this->settings['excerpt_length'] == 0) {
				$excerpt[0] = '';
			}
			$html .= '<div class="cal-event-short-description"'.((isset($_GET['cal-event']) && $_GET['cal-event'] == $event['id']) ? ' style="display: none;"' : '').'>'.$excerpt[0];
			if($this->settings['excerpt_length'] !== 0 && !empty($event['description'])) {
				$html .= '...';
			}
			$html .= '</div></div><div class="cal-event-reveal'.((isset($_GET['cal-event']) && $_GET['cal-event'] == $event['id']) ? ' cal_event_visible" style="display: block"' : '"').'>';

			if(!empty($event['location'])) {
				$html .= '<div class="cal_event_location">'.$event['location'].(($this->settings['show_map_link']) ? '(<a href="http://maps.google.com/maps?q='.urlencode($event['location']).'" target="_blank" title="View in Google Maps" rel="nofollow">'.$this->labels['map'].'</a>)' : '').'</div>';
			}

			if($this->settings['social_links']) {
				$event_link = $url.'cal_day='.$day.'&cal_month='.$month.'&cal_year='.$year.'&cal_scale='.$scale.'&cal-event='.$event['id'].'#event_'.$event['id'];
				$extra = (strlen(str_replace('\n', '', $event['title'])) > 110) ? '...' : '';
				$link_nohash = $event_link;
			}
			
			$eventdesc = $this->_format_description($event['description']);
			

			

			$html .= '<p class="cal_event_description" id="event_'.$event['id'].'">'.preg_replace('/\v+|\\\[rn]/',' ',$eventdesc).'</p>';
			$html .= '</div></div></div>';
		}
		
		$html .= '<div class="more-btn">
				    <p><a class="abtn animated" href="http://mail.heathside.surrey.sch.uk/owa/calendar/externalcalendar@heathside.surrey.sch.uk/Calendar/calendar.ics" title="Download our Events and Dates ICS file">Download our Events & Dates ICS file</a></p>
			     </div>';
			     
		$html .= '</div></div>';

		echo $html;
		return;
	}

	private function _format_description($description) {
		if($this->settings['hyperlink_urls']) {
			$description = $this->_make_clickable($description);
		}
		$description = nl2br($description);
		return $description;
	}

	private function _render_event_group($date_day, $date_month, $date_year) {
		$date = $date_day.'-'.$date_month.'-'.$date_year;

		if(!isset($this->dates[$date])) {
			return '';
		}

		$html = '';
		$html .= '<div class="cal-event cal_grouped_group" data-date="'.$date.'" data-animate="'.(($this->settings['group_events_animate']) ? 'true' : 'false').'" style="cursor: pointer">';

		if($this->settings['scale'] == 'month') {
			$html .= '<div class="cal-event-day"><div class="date-icon"><div class="day">'.$date_day.'</div><div class="month">'.$date_month.'</div></div></div>';
		}elseif($this->settings['scale'] == 'year') {
			$html .= '<div class="cal-event-day"><div class="date-icon">'.(strtoupper(substr($this->_month_name($date_month), 0, 3).' '.$date_day)).'</div></div>';
		}

		$html .= '<div class="cal-event-right">';
		$html .= '<div class="cal-event-header">';
		$html .= '<h2>'.count($this->dates[$date]).' '.((count($this->dates[$date]) !== 1) ? $this->labels['events'] : $this->labels['event']).'</h2>';
		$html .= '<div class="cal-event-reveal"></div>';
		$html .= '';
		$html .= '';
		$html .= '</div>';
		$html .= '</div>';
		$html .= '</div>';

		unset($this->dates[$date]);
		return $html;
	}

	/**
	 * Checks if events are within given time limits
	 * @param  array  $events Events
	 * @return array Allowed events
	 */
	private function _events_within_query($events) {
		$all_events = $events;

		switch ($this->settings['scale']) {
			case 'day':
				$start_time = mktime(0, 0, 0, $this->settings['month'], $this->settings['day'], $this->settings['year']);
				$end_time = mktime(23, 59, 59, $this->settings['month'], $this->settings['day'], $this->settings['year']);
				break;
			
			case 'month':
				$start_time = mktime(0, 0, 0, $this->settings['month'], 1, $this->settings['year']);
				$end_time = mktime(23, 59, 59, $this->settings['month'], date('t', (mktime(0, 0, 0, $this->settings['month'], $this->settings['day'], $this->settings['year']))), $this->settings['year']);
				break;

			case 'year':
				$start_time = mktime(0, 0, 0, 1, 1, $this->settings['year']);
				$end_time = mktime(23, 59, 59, 12, 31, $this->settings['year']);
				break;
		}

		$new_events = array();

		for($i = 0; $i < count($events); $i++) {

			if($events[$i]['start'] >= $start_time && $events[$i]['start'] <= $end_time) {
				$new_events[] = $events[$i];
			}elseif($events[$i]['start'] <= $start_time && $events[$i]['end'] >= $start_time && $this->settings['scale'] == 'day' ) {
				if ( $events[$i]['start'] + 86400 != $events[$i]['end'] ) {
					$new_events[] = $events[$i];
				}
			}elseif($events[$i]['start'] + 86400 == $events[$i]['end'] && $events[$i]['start'] == $start_time) {
				$new_events[] = $events[$i];
			}
		}

		if(!$this->settings['group_events_by_date']) {
			return $new_events;
		}

		//calculate needed event divs
		$dates = array();

		if($this->settings['scale'] == 'month' || $this->settings['scale'] == 'year') {
			foreach($new_events as $event) {
				$dates[date('j-n-Y', $event['start'])][] = array();
			}
		}
		
		$this->dates = $dates;
		return $new_events;
	}

	private function _retrieve_data() {
		foreach($this->settings['url'] as $url) {
			$this->_download_data($url);
		}
		return true;
	}

	/**
	 * Downloads the data from the URL
	 * @return boolean Success of fail
	 */
	private function _download_data($xml_url) {
		$extern = (strpos($xml_url, 'http') === 0 || strpos($xml_url, 'ftp') === 0) ? true : false;
		
		if(function_exists('curl_init') && $extern) {
			$ch = curl_init($xml_url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_TIMEOUT, 10);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			$download_data = curl_exec($ch);
			curl_close($ch);
		}else {
			$download_data = @file_get_contents($xml_url);
		}

		if(strpos($download_data, 'BEGIN:VCALENDAR') === 0) {

			//ics
			$this->data[] = array(
				'type' => 'ics',
				'data' => $download_data,
			);
			return true;

		}
		return false;
	}

	/**
	 * Parses the data
	 * @return boolean Success or fail
	 */
	private function _parse_data() {
		$events = array();
		foreach($this->data as $data) {
			if($data['type'] === 'xml') {
				$events = array_merge($this->_parse_data_xml($data['data']), $events);
			}elseif($data['type'] === 'ics') {
				$events = array_merge($this->_parse_data_ics($data['data']), $events);
			}
		}
		usort($events, array($this, '_sort_by_order'));
		$this->events = $events;
		return true;
	}

	/**
	 * Parses the .ics data
	 * @return boolean Success or fail
	 */
	private function _parse_data_ics($data) {
		$ical = new ical($data, $this->settings['dst']);
		$events_ical = $ical->events();
		$events = array();

		for($i = 0; $i < count($events_ical); $i++) {

			$start = $ical->iCalDateToUnixTimestamp($events_ical[$i]['DTSTART']) + $this->settings['extra_time'];

			$events[$i] = array(
				'id' => (isset($events_ical[$i]['UID'])) ? md5('s34s0_#'.$events_ical[$i]['UID'].$this->settings['cache_token']) : md5($events_ical[$i]['SUMMARY'].$this->settings['cache_token']),
				'title' => str_replace('\\,', ',', (isset($events_ical[$i]['SUMMARY'])) ? $events_ical[$i]['SUMMARY'] : ''),
				// 'description' => str_replace('\\,', ',', $events_ical[$i]['DESCRIPTION']),
				'description' => str_replace('\\,', ',', (isset($events_ical[$i]['DESCRIPTION'])) ? $events_ical[$i]['DESCRIPTION'] : ''),
				'start' => $start,
				'end' => $ical->iCalDateToUnixTimestamp($events_ical[$i]['DTEND']) + $this->settings['extra_time'],
				'location' => str_replace('\\,', ',', (isset($events_ical[$i]['LOCATION'])) ? $events_ical[$i]['LOCATION'] : ''),
				'day' => date('j', $start),
				'month' => date('n', $start),
				'year' => date('Y', $start),
			);
		}
		return $events;
	}

	/**
	 * Saves the events in a cache file
	 * @return boolean Success or fail
	 */
	public function _save_cache() {
		$data = serialize($this->events);
		return @file_put_contents($this->settings['cache_dir'].$this->settings['cache_token'].'.txt', time().'<<{time|_|data}>>'.$data);
	}

	/**
	 * Reads the events from the cache file
	 * @return boolean Success or fail
	 */
	public function _get_cache() {
		if(!$this->settings['cache']) { return false; }

		$file = @file_get_contents($this->settings['cache_dir'].$this->settings['cache_token'].'.txt');
		if(!$file) { return false; }

		$data = explode('<<{time|_|data}>>', $file);
		if($data[0] + $this->settings['cache_time'] < time()) {
			return false;
		}else {
			$this->events = @unserialize($data[1]);
			if($this->events === false) { return false; }
			return true;
		}
	}

	/**
	 * Sort function
	 * @param  int    $a
	 * @param  int    $b 
	 * @return int
	 */
	private function _sort_by_order($a, $b) {
		return $a['start'] - $b['start'];
	}

	/**
	 * Generates a unique cache token for all feeds
	 * @return string Cache token
	 */
	private function _generate_cache_token($urls) {
		$all_urls = '';
		foreach($urls as $url) {
			$all_urls = $all_urls.$url;
		}
		return md5($all_urls.$this->version.'v3@#dfyt');
	}

	/**
	 * Returns the page URL without given $_GET's
	 * @return string Page URL
	 */
	private function _get_page_url() {
		if(function_exists('get_permalink')) {
			return get_permalink().'?';
		}

		 $pageURL = 'http';
		 $pageURL .= "://";
		 $pageURL .= $_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"];

		 if(empty($_GET)) {
		 	if($pageURL[strlen($pageURL)-1] !== '?') {
		 		$pageURL .= '?';
		 	}
		 }else {
		 	
			$url = explode('?', $pageURL.'...');
		 	$pageURL = $url[0].'?';

		 	//add previous vars
		 	$vars = $_GET;
		 	if(isset($_GET['cal_day'])) { unset($vars['cal_day']); }
		 	if(isset($_GET['cal_month'])) { unset($vars['cal_month']); }
		 	if(isset($_GET['cal_year'])) { unset($vars['cal_year']); }
		 	if(isset($_GET['cal_scale'])) { unset($vars['cal_scale']); }
		 	if(isset($_GET['cal_search'])) { unset($vars['cal_search']); }

		 	foreach($vars as $key=>$var) {
		 		$pageURL .= $key.'='.urlencode($var).'&';
		 	}
		}
		return $pageURL;
	}
	private function _month_name($month) {
		return $this->labels['months'][$month-1];
	}
}
?>