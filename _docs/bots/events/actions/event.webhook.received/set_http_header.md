---
title: >-
  Bot Action: Respond with HTTP header
permalink: /docs/bots/events/event.webhook.received/actions/set_http_header/
toc:
  expand: Bots
jumbotron:
  title: >-
    Respond with HTTP header
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
    label: >-
      Webhook received &raquo;
    url: /docs/bots/events/event.webhook.received/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.webhook.received/#event-actions
---

|---
|-|-
| **Identifier (ID):** | set_http_header
| **Event:** | event.webhook.received

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `name` | text | The HTTP response header name
| **x** | `value` | text | The HTTP response header value
