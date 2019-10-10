---
title: >-
  Bot Action: Reply to sender
permalink: /docs/bots/events/event.mail.received.app/actions/send_email_sender/
toc:
  expand: Bots
jumbotron:
  title: >-
    Reply to sender
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
| **Identifier (ID):** | send_email_sender
| **Event:** | event.mail.received.app

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `subject` | text | The subject of the message to send
| **x** | `content` | text | The body content of the message to send
