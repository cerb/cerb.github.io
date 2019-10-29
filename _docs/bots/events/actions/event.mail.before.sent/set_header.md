---
title: >-
  Bot Action: Set message header
permalink: /docs/bots/events/event.mail.before.sent/actions/set_header/
toc:
  expand: Bots
jumbotron:
  title: >-
    Set message header
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
      Before message sent by worker &raquo;
    url: /docs/bots/events/event.mail.before.sent/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.before.sent/#event-actions
---

|---
|-|-
| **Identifier (ID):** | set_header
| **Event:** | event.mail.before.sent

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `header` | text | The email header to set
| **x** | `value` | text | The value of the email header
