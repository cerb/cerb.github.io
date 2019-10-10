---
title: >-
  Bot Action: Append text to message content
permalink: /docs/bots/events/event.mail.received.app/actions/append_to_content/
toc:
  expand: Bots
jumbotron:
  title: >-
    Append text to message content
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
| **Identifier (ID):** | append_to_content
| **Event:** | event.mail.received.app

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `content` | text | The content to append to the message body
|  | `mode` | text | `sent` (only sent message), `saved` (only saved message), or omit for both
