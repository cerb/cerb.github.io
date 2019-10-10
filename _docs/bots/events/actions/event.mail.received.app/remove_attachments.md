---
title: >-
  Bot Action: Remove attachments by filename
permalink: /docs/bots/events/event.mail.received.app/actions/remove_attachments/
toc:
  expand: Bots
jumbotron:
  title: >-
    Remove attachments by filename
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
      Filter new incoming message &raquo;
    url: /docs/bots/events/event.mail.received.app/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.received.app/#event-actions
---

|---
|-|-
| **Identifier (ID):** | remove_attachments
| **Event:** | event.mail.received.app

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `match_oper` | text | The filename match operator: `is`, `like`, `regexp`
| **x** | `match_value` | text | The value to match in the filename
