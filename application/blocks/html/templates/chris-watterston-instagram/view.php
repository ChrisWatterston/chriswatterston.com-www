<?php defined('C5_EXECUTE') or die("Access Denied."); ?>
<script type="text/javascript" src="<?php echo $view->getThemePath()?>/js/instafeed.min.js"></script>
<script type="text/javascript">
    var feed = new Instafeed({
		    get: 'user',
		    limit: '4',
		    userId: '3422386301',
		    accessToken: '3422386301.1677ed0.88235c51522143ba86647d6cabe7818c',
		    template:'<a href={{link}} target="_blank" title="Follow me to find out what im up to on Instagram"><span>{{likes}}</span><img src={{image}} alt=""/></a>'
    });
    feed.run();
</script>
<div id="instafeed"></div>
