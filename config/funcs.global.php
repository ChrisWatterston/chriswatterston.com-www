<?php
//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- DATA ORDERING ----------
// ----------
// ----------
//
function orderBlogAscending($a, $b)
{
    return ($a['articleLiveDate'] <= $b['articleLiveDate']) ? 1 : -1;
}

//
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ---------- FORMAT NUMBER ----------
// ----------
// ----------
//
function formatNumber($num)
{
    $num = number_format($num, 0, ".", ",");
    return $num;
}

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
