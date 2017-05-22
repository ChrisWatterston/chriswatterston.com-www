<?php
	require_once('calendar/class/calendar.class.php');
	require_once('calendar/class/ical.class.php');
	$cal = new Calendar(array(
		'url' => array('https://outlook.office365.com/owa/calendar/ae314d8b1d7b4cc58c4c44a0e439af50@st-michaels.surrey.sch.uk/9f36ebb5777945dfa34e2a4dd1ae245b9688949607332275640/calendar.ics')
	));
	$cal->output();
?>