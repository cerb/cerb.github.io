---
title: >-
  Bot Action: Execute HTTP request
permalink: /docs/bots/events/actions/core.va.action.http_request/
toc:
  expand: Bots
jumbotron:
  title: >-
    Execute HTTP request
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | core.va.action.http_request
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `http_verb` | text | The request method: `GET`, `POST`, `PUT`, `PATCH`, `DELETE`
| **x** | `http_url` | text | The request URL
|  | `http_headers` | text | A list of `Header: Value` pairs (e.g. `Content-Type: application/json`), separated by newlines
|  | `http_body` | text | If `POST` or `PUT`, the HTTP request body
|  | `auth` | text | `connected_account`, `placeholder`, or omitted
|  | `auth_connected_account_id` | text | When using auth=`connected_account` must return a [connected account](/docs/records/types/connected-account/] ID
|  | `auth_placeholder` | text | When using auth=`placeholder` the template must result to a [connected account](/docs/records/types/connected-account/] ID
|  | `options[ignore_ssl_validation]` | bit | `0` (validate SSL), `1` (ignore SSL validation)
|  | `options[raw_response_body]` | bit | `0` (auto-convert response by content type), `1` (keep raw response)
|  | `run_in_simulator` | bit | Make HTTP requests in the simulator: `0`=no, `1`=yes
|  | `response_placeholder` | placeholder | The placeholder to set with the HTTP response
