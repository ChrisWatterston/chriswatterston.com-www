<?php

/**
 * -----------------------------------------------------------------------------
<<<<<<< HEAD
 * Generated 2018-01-08T14:51:39+00:00
=======
 * Generated 2017-12-15T08:13:28+00:00
>>>>>>> 2433b622b38d1ee8a019b3bbc5f8e84d0974fd78
 *
 * DO NOT EDIT THIS FILE DIRECTLY
 *
 * @item      misc.do_page_reindex_check
 * @group     concrete
 * @namespace null
 * -----------------------------------------------------------------------------
 */
return [
    'locale' => 'en_GB',
    'version_installed' => '8.2.1',
    'version_db_installed' => '20170802000000',
    'misc' => [
        'login_redirect' => 'HOMEPAGE',
        'access_entity_updated' => 1495465202,
        'login_redirect_cid' => 0,
        'do_page_reindex_check' => false,
        'latest_version' => '8.2.1',
    ],
    'accessibility' => [
        'toolbar_titles' => false,
        'toolbar_tooltips' => false,
        'toolbar_large_font' => false,
        'display_help_system' => false,
    ],
    'cache' => [
        'blocks' => false,
        'assets' => false,
        'theme_css' => false,
        'overrides' => false,
        'pages' => '0',
        'full_page_lifetime' => '0',
        'full_page_lifetime_value' => null,
        'clear' => [
            'thumbnails' => true,
        ],
    ],
    'theme' => [
        'compress_preprocessor_output' => false,
        'generate_less_sourcemap' => false,
    ],
    'maintenance' => [
        'version_job_page_num' => 0,
    ],
    'security' => [
        'ban' => [
            'ip' => [
                'enabled' => 1,
                'attempts' => '3',
                'time' => '300',
                'length' => 0,
            ],
        ],
    ],
    'user' => [
        'registration' => [
            'email_registration' => true,
            'type' => 'disabled',
            'captcha' => false,
            'enabled' => false,
            'notification' => false,
        ],
    ],
    'mail' => [
        'method' => 'smtp',
        'methods' => [
            'smtp' => [
                'server' => 'smtp.mandrillapp.com',
                'username' => 'hello@chriswatterston.com',
                'password' => 'Nc_KBh4-lBD4fo5g5a3NRQ',
                'port' => '587',
                'encryption' => 'TLS',
                'messages_per_connection' => null,
            ],
        ],
    ],
    'debug' => [
        'detail' => 'debug',
        'display_errors' => true,
    ],
    'log' => [
        'errors' => 1,
        'emails' => 1,
        'queries' => [
            'log' => 0,
            'clear_on_reload' => 0,
        ],
    ],
    'white_label' => [
        'background_image' => 'none',
    ],
    'updates' => [
        'enable_permissions_protection' => true,
    ],
    'external' => [
        'news_overlay' => false,
        'news' => false,
    ],
    'upload' => [
        'extensions' => '*.jpg;*.gif;*.jpeg;*.docx;*.png;*.doc;*.txt;*.xls;*.xlsx;*.csv;*.pdf;*.svg',
    ],
    'seo' => [
        'exclude_words' => '',
    ],
];
