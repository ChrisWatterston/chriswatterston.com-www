<?php 

	require_once __DIR__ . '/facebook-sdk-v5/autoload.php';
	$fb = new Facebook\Facebook([
	  'app_id' => '325530257865510',
	  'app_secret' => 'abc032ef7332e05ac63cec00e4e5d40d',
	  'default_graph_version' => 'v2.9',
	  ]);
	

	$fb->setDefaultAccessToken('EAAEoEWtiOyYBAECZB80iK4SviY3XEIaCMMpzMaug3VlviEs9dN7elXOUtBZCZBZBcolXCnodVr31jl0ZB9ykPSsZABrlmARYZBTeWtKsoZCpmHgh05tiPqOU4vFMUXao6BZAM6zEZAgtFXTZB1qhZAApsirYVRKqv7EwANCePPlVCjxMRZAYZBhfS1pSiL');
	
	
	
	try {
        // Returns a `Facebook\FacebookResponse` object
        $response = $facebook->get('GET', '/chriswatterston.co/feed', $params,'fgj123fgj123fgj');
    } catch(Facebook\Exceptions\FacebookResponseException $e) {
        echo 'Graph returned an error: ' . $e->getMessage();
        exit;
    } catch(Facebook\Exceptions\FacebookSDKException $e) {
        echo 'Facebook SDK returned an error: ' . $e->getMessage();
        exit;
    }
    $graphNode = $response->getGraphNode();


    print_r($graphNode);
    
    
	
	$request = new Facebook\FacebookRequest(
		$session,
		'GET',
		'/chriswatterston.co/',
		array(
			'fields' => 'posts.limit(4){full_picture,message,type,link},link'
		)
	);
	

	$response = $request->execute();
	$graphObject = $response->getGraphObject();
	/* handle the result */


?>