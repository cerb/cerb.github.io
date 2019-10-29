---
title: >-
  Bot Action: Send scheduled email to recipients
permalink: /docs/bots/events/event.macro.ticket/actions/schedule_email_recipients/
toc:
  expand: Bots
jumbotron:
  title: >-
    Send scheduled email to recipients
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
      Record custom behavior on ticket &raquo;
    url: /docs/bots/events/event.macro.ticket/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.macro.ticket/#event-actions
---

|---
|-|-
| **Identifier (ID):** | schedule_email_recipients
| **Event:** | event.macro.ticket

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `content` | text | The message to send
| **x** | `delivery_date` | datetime | When to deliver the message (e.g. `now`, `+2 days`, `Friday 8am`)
