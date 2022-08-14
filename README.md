# Chris Watterston's Portfolio

![Lucozade Football Sweepstake](/dist/readme/github-sweepstake-header.jpg)

[![Release](https://img.shields.io/badge/release-v1.0-lightgrey)](https://www.php.net/releases/8.0/en.php) [![PHP Support](https://img.shields.io/badge/php-v8.0.21-blue)](https://www.php.net/releases/8.0/en.php) [![Strava API](https://img.shields.io/badge/strava--api-v3-orange)](https://developers.strava.com/docs/reference/) [![Sportmonks API](https://img.shields.io/badge/sportmonks--api-v2-red)](https://docs.sportmonks.com/football/)

## What is the Football Sweepstake?

The Lucozade's Football Sweepstake is a bespoke built sweepstake web application, for Suntory Beverage & Food Europe (SBFE) GB&I.

The sweepstake was developed and first launched for the Men's Euros Football Championship in 2021. It quickly became a huge success amongst GB&I employee's, competing to become top of the leader board.

During this time, we learnt a lot, fixed a lot of bugs, and received some great user feedback.

##### _...fast forward to today_ ⏩

Today's release of the Lucozade Football Sweepstake includes all our learnings and feedback– as well as a bunch of new features!

Features which not only have the "_that's cool_" reaction, but instead built to have a much deeper meaning;

- Live Game Results
- Strava Activity Integration
- Multilingual Support
- Season Statistics
- Lucozade News
- Help & Support

The sweepstake is growing into something special. Something special which has a much bigger vision.

<!-- ## GIT Repository sites

| Type       | Domain                               | Branch    |
| ---------- | ------------------------------------ | --------- |
| Production | https://euros.sbfe.digital           | `master`  |
| Local      | http://sbfe.digital-euros.dev-local/ | `develop` | -->

## Cron Schedules

| Ordering | Dataset         | Cron Schedule   | Dir                                   | Output |
| -------- | --------------- | --------------- | ------------------------------------- | ------ |
| 1        | Users Extract   | `* * * * *`     | `/euros.sbfe.digital/cron/users.php`  | JSON   |
| 2        | Event Stats     | `0 5-23 * * *`  | `/euros.sbfe.digital/cron/stats.php`  | JSON   |
| 3        | Event Results   | `0 5-23 * * *`  | `/euros.sbfe.digital/cron/teams.php`  | JSON   |
| 4        | Strava Extract  | `0 5-23 * * *`  | `/euros.sbfe.digital/cron/strava.php` | JSON   |
| 5        | Combined Output | `10 5-23 * * *` | `/euros.sbfe.digital/cron/output.php` | JSON   |
| 6        | Live Event      | `* * * * *`     | `/euros.sbfe.digital/cron/live.php`   | JSON   |

## 🗄 Database Setup

#### Users Table

```
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `sweep_users` (
`user_id` int(5) NOT NULL,
`athlete_id` bigint(20) UNSIGNED NOT NULL,
`athlete_token` varchar(50) NOT NULL DEFAULT '0',
`user_email_address` varchar(150) NOT NULL,
`user_lang` varchar(2) NOT NULL DEFAULT 'en',
`user_fullname` varchar(50) NOT NULL,
`user_teamname` varchar(150) NOT NULL,
`user_function` varchar(50) NOT NULL,
`user_team_a` varchar(50) NOT NULL,
`user_team_b` varchar(50) NOT NULL,
`user_team_c` varchar(50) NOT NULL,
`user_team_d` varchar(50) NOT NULL,
`user_team_e` varchar(50) NOT NULL,
`user_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
`strava_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sweep_users`
ADD PRIMARY KEY (`user_id`),
ADD UNIQUE KEY `user_email_address` (`user_email_address`);

ALTER TABLE `sweep_users`
MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT;
```

#### Activity Table

```
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `strava_activity` (
`id` int(10) UNSIGNED NOT NULL,
`activity_id` bigint(20) UNSIGNED NOT NULL,
`athlete_id` bigint(20) UNSIGNED NOT NULL,
`activity_distance` int(10) DEFAULT NULL,
`activity_type` varchar(255) DEFAULT NULL,
`activity_start_date` datetime DEFAULT NULL,
`activity_elapsed_time` int(10) DEFAULT NULL,
`activity_moving_time` int(10) DEFAULT NULL,
`activity_name` varchar(255) NOT NULL,
`activity_timezone` varchar(255) NOT NULL,
`activity_location` varchar(100) NOT NULL DEFAULT '0',
`activity_elevation` float NOT NULL,
`activity_speed_avg` float NOT NULL,
`activity_speed_max` float NOT NULL,
`activity_calories` float NOT NULL,
`activity_device` varchar(255) NOT NULL DEFAULT '0',
`activity_muted` tinyint(1) NOT NULL DEFAULT 0,
`created` timestamp NOT NULL DEFAULT current_timestamp(),
`updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `strava_activity`
ADD PRIMARY KEY (`id`);

ALTER TABLE `strava_activity`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
```

## 🏃‍♂️ Strava Subscription & Webhook

The Strava API includes data on athletes, segments, routes, clubs, and gear. The API does not allow collection of data for all Strava public athletes, as you can see on the Strava platform. User [authentication](https://developers.strava.com/docs/authentication/) and [subscription](https://developers.strava.com/docs/webhooks/) is required, with the use of webhooks.

To achieve, participating users will be required to sign in with Strava, and grant the Sweepstake application certain permissions using OAuth 2.0.

Strava was introduced into the Lucozade Sweepstake for two main reasons. First, to recognises and support the health and wellbeing of all participating users, and secondly to increase continued engagement even when users had been eliminated.

> Strava API limits: 100 requests every 15 minutes, 1000 daily

Create a [Strava Application](https://www.strava.com/settings/api), or get started with the [Strava API](https://developers.strava.com/).

#### Initiate Subscription

Each application may only have one subscription, but that single subscription will allow the application to receive webhook events for all supported changes to data owned by athletes that have authorized that application.

Webhook subscriptions, also referred to as push subscriptions, are managed through the push subscription API at: `$ https://www.strava.com/api/v3/push_subscriptions`.

After your initial request to [create a subscription](https://developers.strava.com/docs/webhooks/), you will receive a HTTP GET request to the callback_url you specified. The query string of this GET request will contain a `"hub.challenge"` field that you must use to validate your callback address.

```php
$curl = curl_init();
curl_setopt_array($curl, array(
    CURLOPT_URL => "https://www.strava.com/api/v3/push_subscriptions?client_id=[CLIENT-ID]&client_secret=[CLIENT-SECRET]&callback_url=[CALLBACK-URL]&verify_token=[VERIFY-TOKEN]",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'POST',
));

$response = curl_exec($curl);
curl_close($curl);

echo $response;
```

#### View Subscription

A GET request to the Strava push subscription endpoint can be used to [view subscription details](https://developers.strava.com/docs/webhooks/#view-a-subscription).

```sh
curl -G https://www.strava.com/api/v3/push_subscriptions \
    -d client_id=[CLIENT-ID] \
    -d client_secret=[CLIENT-SECRET]
```

#### Delete Subscription

A DELETE request can be issued to the push subscriptions endpoint, with subscription ID appended, to [delete the specified subscription](https://developers.strava.com/docs/webhooks/#delete-a-subscription).

```sh
curl -X DELETE https://www.strava.com/api/v3/push_subscriptions/[SUBSCRIPTION-ID] \
    -F client_id=[CLIENT-ID] \
    -F client_secret=[CLIENT-SECRET]
```

## 📍Multilingual Support

- 🏴󠁧󠁢󠁥󠁮󠁧󠁿 English
- 🇫🇷 French
- 🇪🇸 Spanish
- 🇵🇱 Polish

## ✅ To Do

- [ ] Translate and schedule CRON weekly leader board emails.
- [ ] Design and set-up 'Is it on your Phone', inc. translations.

## 🧑‍💻 Authors

Lucozade's Football Sweepstake was designed and developed (_and maintained_) by Chris Watterston (@ChrisWatterston). The early 2021 version included contributions from freelancers, but the platform has since been rewritten.

## 🔑 License

Lucozade Football Sweepstake is GNU GENERAL PUBLIC LICENSE software project by Chris Watterston (@ChrisWatterston).

> Copyright (c) 2022-present, Lucozade Ribena Suntory. All rights reserved.
