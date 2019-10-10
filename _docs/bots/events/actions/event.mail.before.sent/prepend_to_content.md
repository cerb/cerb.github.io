---
title: >-
  Bot Action: Prepend text to message content
permalink: /docs/bots/events/event.mail.before.sent/actions/prepend_to_content/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prepend text to message content
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
| **Identifier (ID):** | prepend_to_content
| **Event:** | event.mail.before.sent

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `content` | text | The content to prepend to the message body
|  | `mode` | text | `sent` (only sent message), `saved` (only saved message), or omit for both
