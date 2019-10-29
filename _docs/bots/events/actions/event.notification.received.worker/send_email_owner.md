---
title: >-
  Bot Action: Send email to notified worker
permalink: /docs/bots/events/event.notification.received.worker/actions/send_email_owner/
toc:
  expand: Bots
jumbotron:
  title: >-
    Send email to notified worker
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
      New notification for me &raquo;
    url: /docs/bots/events/event.notification.received.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.notification.received.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | send_email_owner
| **Event:** | event.notification.received.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `to` | array | An array of worker email addresses. These must match one or more of the notification owner's registered email addresses
| **x** | `subject` | text | The subject of the message to send
| **x** | `content` | array | The body content of the message to send
