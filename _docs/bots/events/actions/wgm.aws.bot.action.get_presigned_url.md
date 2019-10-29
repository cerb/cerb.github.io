---
title: >-
  Bot Action: Service AWS Get Pre-signed URL
permalink: /docs/bots/events/actions/wgm.aws.bot.action.get_presigned_url/
toc:
  expand: Bots
jumbotron:
  title: >-
    Service AWS Get Pre-signed URL
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
| **Identifier (ID):** | wgm.aws.bot.action.get_presigned_url
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `http_verb` | text | The HTTP request method: `GET`, `POST`, `PUT`, `DELETE`
| **x** | `http_url` | text | The HTTP request URL
| **x** | `http_headers` | text | The HTTP request `Header: Value` pairs, separated by newlines
| **x** | `http_body` | text | If `POST` or `PUT`, the HTTP request body
| **x** | `expires_secs` | number | The duration of the pre-signed URL
| **x** | `auth_connected_account_id` | id | The AWS [connected account](/docs/connected-accounts/) to use for request signing
|  | `response_placeholder` | placeholder | The placeholder to set with the presigned URL
