<?php
if (getenv('ENVIRONMENT_STATE') === 'production') {
    echo '<script async defer src="https://scripts.withcabin.com/hello.js"></script>';
}
