<?php

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- CURL / API REQUEST ----------
// ----------
// ----------
//
function apiRequestGET($url, $curl)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
    ));
    $a = curl_exec($curl);
    return $a;
    curl_close($curl);
};

function apiRequestHeaderAuthGET($key, $url, $curl)
{
    $curlHeaders = array(
        'Cache-Control: no-cache',
        'Accept-Encoding: gzip, deflate, br',
        'Authorization: Bearer ' . $key . '',
    );

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_HEADER => 0,
        CURLOPT_HTTPHEADER => $curlHeaders,
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
    ));
    $a = curl_exec($curl);
    return $a;
    curl_close($curl);
};

function apiRequestPOST($url, $curl)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
    ));
    $a = curl_exec($curl);
    return $a;
    curl_close($curl);
};


//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- DATA ORDERING ----------
// ----------
// ----------
//
function orderMatchesAscending($a, $b)
{
    return ($a['stage_timestamp'] >= $b['stage_timestamp']) ? 1 : -1;
}

function orderUserToRank($a, $b)
{
    return ($a['teams_total_combined_points'] <= $b['teams_total_combined_points']) ? 1 : -1;
}

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- TIME SECONDS TO HOURS & MINUTES ----------
// ---------- (convertSecondsTime($currentWeekTime, '%d Hrs %d Mins');)
// ----------
//
function convertSecondsTime($s, $f = '%02d:%02d')
{

    if (empty($s) || !is_numeric($s)) {
        return false;
    }

    $m = round($s / 60);
    $h = floor($m / 60);
    $r = ($m % 60);

    return sprintf($f, $h, $r);
}

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- DISTANCE METERS TO KMS ----------
// ----------
// ----------
//
function convertMeterKms($v, $d)
{
    $a = ($v / 1000);
    $x = number_format($a, $d);
    return $x;
};

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- DURATION TO POINTS ----------
// ----------
// ----------
//
function convertTimeToPoints($p, $d)
{
    $d = ($d / 1800); // 30 minutes = 1800 seconds
    $v = floor($d);
    return ($p * $v);
};
