<?php

/* ///////////// Functions // --------------------- // */
	function truncate($text, $chars = 25) {
	    $text = $text." ";
	    $text = substr($text,0,$chars);
	    $text = substr($text,0,strrpos($text,' '));
	    $text = $text."...";
	    return $text;
	}

/* ///////////// Facebook API // --------------------- // */
	require_once __DIR__ . '/facebook-sdk-v5/autoload.php';
	$fb = new Facebook\Facebook([
	  'app_id' => '325530257865510',
	  'app_secret' => 'abc032ef7332e05ac63cec00e4e5d40d',
	  'default_graph_version' => 'v2.9',
	  ]);
	$fb->setDefaultAccessToken('325530257865510|vH6x5V1fiN3ziFiuMnyD-TpeA0E');

	// Getting all posts published by user
	try {
		$posts_request = $fb->get('/chriswatterston.co/posts?fields=type,description,message,permalink_url&limit=2');
	} catch(Facebook\Exceptions\FacebookResponseException $e) {
		// When Graph returns an error
		echo 'Graph returned an error: ' . $e->getMessage();
		exit;
	} catch(Facebook\Exceptions\FacebookSDKException $e) {
		// When validation fails or other local issues
		echo 'Facebook SDK returned an error: ' . $e->getMessage();
		exit;
	}

	// Start getting the details from the posts and build an array
	$total_posts = array();
	$posts_response = $posts_request->getGraphEdge();
	if($fb->next($posts_response)) {
		$response_array = $posts_response->asArray();
		$total_posts = array_merge($total_posts, $response_array);

		// Display each array item
		foreach ($total_posts as $post) {
			if($post['type'] == 'link') {
				$type = 'Link Post';
				$desc = truncate($post['description'], 150);
				$link = $post['permalink_url'];
				echo '
					<div class="col facebook-post-wrap">
						<p class="description colour-facebook">'.$desc.'</p>
						<p class="date-tag colour-facebook type-semibold type-uppercase"><a href="'.$link.'" class="post-link" target="_blank" title="Join me and view my full Facebook Link">Continue reading</a> <span class="type-closetag"></span> '.$type.'</p>
					</div>
				';
			} else if($post['type'] == 'status') {
				$type = 'Status Update';
				$desc = truncate($post['message'], 150);
				$link = $post['permalink_url'];
				echo '
					<div class="col facebook-post-wrap">
						<p class="description colour-facebook">'.$desc.'</p>
						<p class="date-tag colour-facebook type-semibold type-uppercase"><a href="'.$link.'" class="post-link" target="_blank" title="Join me and view my full Facebook status">Continue reading</a> <span class="type-closetag"></span> '.$type.'</p>
					</div>
				';
			} else if($post['type'] == 'photo') {
				$type = 'Photo Post';
				$desc = truncate($post['message'], 150);
				$link = $post['permalink_url'];
				echo '
					<div class="col facebook-post-wrap">
						<p class="description colour-facebook">'.$desc.'</p>
						<p class="date-tag colour-facebook type-semibold type-uppercase"><a href="'.$link.'" class="post-link" target="_blank" title="Join me and view my full Facebook photo">Continue reading</a> <span class="type-closetag"></span> '.$type.'</p>
					</div>
				';
			} else {
				echo 'Something weird with this post type...';
			}
		}

	} else {
		$posts_response = $posts_request->getGraphEdge()->asArray();
		print_r($posts_response);
	}

?>
