---
title: Admin Quick Start
excerpt: This webpage serves as guide to Cerb's config file, including variables and defaults.
permalink: /docs/config/
toc:
  title: Quick Start
  expand: Admin Guide
jumbotron:
  title: Config
  tagline: A cheat sheet for Cerb's config file
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Admin Guide &raquo;
---

Cerb's config file has multiple variables you can set to your needs. Here is a list of variables, their default values if they have any, and a description of what they do.

## Required Variables
The following variables are required to set up Cerb.

| Variable           | Default | Description |
|--------------------|---------|-------------|
| APP_DB_DATABASE    |         |             |
| APP_DB_ENGINE      | InnoDB  |             |
| APP_DB_HOST        |         |             |
| APP_DB_PASS        |         |             |
| APP_DB_PCONNECT    | false   |             |
| APP_DB_READER_HOST |         |             |
| APP_DB_READER_PASS |         |             |
| APP_DB_READER_USER |         |             |
| APP_DB_USER        |         |             |
| DB_CHARSET_CODE    | utf-8   |             |
| LANG_CHARSET_CODE  | utf8    |             |

## Optional Variables

| Variable                                     | Default                     | Description |
|----------------------------------------------|-----------------------------|-------------|
| APP_DB_ENGINE_FULLTEXT                       | APP_DB_ENGINE               |             |
| APP_DB_OPT_CONNECTION_RECONNECTS             | 5                           |             |
| APP_DB_OPT_CONNECTION_RECONNECTS_WAIT_MS     | 2000                        |             |
| APP_DB_OPT_MASTER_CONNECT_TIMEOUT_SECS       | 3                           |             |
| APP_DB_OPT_MASTER_READ_TIMEOUT_SECS          | 30                          |             |
| APP_DB_OPT_READER_CONNECT_TIMEOUT_SECS       | 3                           |             |
| APP_DB_OPT_READER_READ_TIMEOUT_SECS          | 30                          |             |
| APP_DB_OPT_READ_MASTER_AFTER_WRITE           | 0                           |             |
| APP_DB_PORT                                  |                             |             |
| APP_DB_READER_PORT                           |                             |             |
| APP_DEFAULT_CONTROLLER                       |                             |             |
| APP_HOSTNAME                                 |                             |             |
| APP_OPT_AUTOCOMPLETE_TICKET_QUERY            |                             |             |
| APP_OPT_DEPRECATED_PORTAL_CUSTOM_TEMPLATES   | true                        |             |
| APP_OPT_DEPRECATED_PROFILE_QUICK_SEARCH      | false                       |             |
| APP_OPT_FULLTEXT_OPTIMIZE_IN_EXISTS          | true                        |             |
| APP_OPT_FULLTEXT_THRESHOLD_EXISTS            | 10000                       |             |
| APP_OPT_FULLTEXT_THRESHOLD_IDS               | 1000                        |             |
| APP_OPT_GROUP_BEHAVIOR_TRIGGERS              | false                       |             |
| APP_OPT_IIS_LEGACY_REWRITE                   | false                       |             |
| APP_OPT_SQL_SUBQUERY_TO_IDS                  | false                       |             |
| APP_OPT_SQL_SUBQUERY_TO_IDS_LIMIT            | 500                         |             |
| APP_PATH                                     | /../../                     |             |
| APP_SECURITY_CSP_DEFAULT_SRC                 |                             |             |
| APP_SECURITY_CSP_FRAME_SRC                   |                             |             |
| APP_SECURITY_CSP_IMG_SRC                     |                             |             |
| APP_SECURITY_CSP_MEDIA_SRC                   |                             |             |
| APP_SECURITY_CSP_OBJECT_SRC                  |                             |             |
| APP_SECURITY_CSP_SCRIPT_SRC                  |                             |             |
| APP_SECURITY_CSP_STYLE_SRC                   |                             |             |
| APP_SECURITY_FIREWALL_ALLOWLIST              |                             |             |
| APP_SECURITY_FRAMEOPTIONS                    |                             |             |
| APP_SESSION_NAME                             | Devblocks                   |             |
| APP_SMARTY_COMPILE_PATH                      | /templates_c                |             |
| APP_SMARTY_COMPILE_PATH_MULTI_TENANT         | false                       |             |
| APP_SMARTY_COMPILE_USE_SUBDIRS               | false                       |             |
| APP_SMARTY_SANDBOX_COMPILE_PATH              | /templates_c                |             |
| APP_SMARTY_SANDBOX_COMPILE_PATH_MULTI_TENANT | false                       |             |
| APP_STORAGE_PATH                             | /storaged                   |             |
| APP_TEMP_PATH                                | /tmp                        |             |
| AUTHORIZED_IPS_DEFAULTS                      |                             |             |
| DEVBLOCKS_CACHE_ENGINE                       | devblocks.cache.engine.disk |             |
| DEVBLOCKS_CACHE_ENGINE_OPTIONS               |                             |             |
| DEVBLOCKS_CACHE_ENGINE_PREVENT_CHANGE        | false                       |             |
| DEVBLOCKS_HTTP_PROXY                         |                             |             |
| DEVBLOCKS_LANGUAGE                           | en                          |             |
| DEVBLOCKS_PATH                               | /libs/devblocks/            |             |
| DEVBLOCKS_REWRITE                            | false                       |             |
| DEVBLOCKS_SEARCH_ENGINE_PREVENT_CHANGE       | false                       |             |
| DEVBLOCKS_STORAGE_ENGINE_PREVENT_CHANGE      | false                       |             |
| DEVELOPMENT_ARCHIVE_PARSER_MSGSOURCE         | false                       |             |
| DEVELOPMENT_MODE                             | false                       |             |
| DEVELOPMENT_MODE_ALLOW_CSRF                  | false                       |             |
| DEVELOPMENT_MODE_ALLOW_DEBUG                 | false                       |             |
| DEVELOPMENT_MODE_QUERIES                     | false                       |             |
| DEVELOPMENT_MODE_SECURITY_SCAN               | false                       |             |