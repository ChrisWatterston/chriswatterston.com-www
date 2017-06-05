<?php

/**
 * -----------------------------------------------------------------------------
 * Generated 2017-06-02T15:23:03+01:00
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
    'version_installed' => '8.1.0',
    'version_db_installed' => '20170123000000',
    'misc' => [
        'login_redirect' => 'HOMEPAGE',
        'access_entity_updated' => 1495465202,
        'login_redirect_cid' => 0,
        'do_page_reindex_check' => false,
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
        'full_page_lifetime' => 'default',
        'full_page_lifetime_value' => null,
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
                'password' => '-RMXpkvLNFmJO9nw4s0vdg',
                'port' => '587',
                'encryption' => 'TLS',
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
