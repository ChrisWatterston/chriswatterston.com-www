<?php

return [
    'default-connection' => 'concrete',
    'connections' => [
        'concrete' => [
            'driver' => 'c5_pdo_mysql',
            'server' => 'phpmyadmin.dev-local',
            'database' => 'chriswatterston_www',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8',
        ],
    ],
];
