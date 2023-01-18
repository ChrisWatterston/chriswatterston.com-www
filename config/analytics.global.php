<?php
if (getenv('ENVIRONMENT_STATE') === 'production') {
    // echo '
    //     <script async src="https://www.googletagmanager.com/gtag/js?id=G-V9KJ4D564B"></script>
    //     <script>
    //         window.dataLayer = window.dataLayer || [];

    //         function gtag() {
    //             dataLayer.push(arguments);
    //         }
    //         gtag(\'js\', new Date());

    //         gtag(\'config\', \'G-V9KJ4D564B\');
    //     </script>
    // ';
    echo '<script async defer src="https://scripts.withcabin.com/hello.js"></script>';
}
