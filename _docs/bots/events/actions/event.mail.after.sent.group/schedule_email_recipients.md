---
title: >-
  Bot Action: Send scheduled email to recipients
permalink: /docs/bots/events/event.mail.after.sent.group/actions/schedule_email_recipients/
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
      After message sent from group member &raquo;
    url: /docs/bots/events/event.mail.after.sent.group/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.after.sent.group/#event-actions
---

|---
|-|-
| **Identifier (ID):** | schedule_email_recipients
| **Event:** | event.mail.after.sent.group

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `content` | text | The message to send
| **x** | `delivery_date` | datetime | When to deliver the message (e.g. `now`, `+2 days`, `Friday 8am`)
