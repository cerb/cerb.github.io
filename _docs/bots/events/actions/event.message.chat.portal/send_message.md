---
title: >-
  Bot Action: Respond with message
permalink: /docs/bots/events/event.message.chat.portal/actions/send_message/
toc:
  expand: Bots
jumbotron:
  title: >-
    Respond with message
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
      Chat with portal visitor &raquo;
    url: /docs/bots/events/event.message.chat.portal/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.message.chat.portal/#event-actions
---

|---
|-|-
| **Identifier (ID):** | send_message
| **Event:** | event.message.chat.portal

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `message` | text | The message to send to the user
|  | `format` | text | `markdown`, `html`, or omit for plaintext
|  | `delay_ms` | text | The typing delay to simulate (in milliseconds)
