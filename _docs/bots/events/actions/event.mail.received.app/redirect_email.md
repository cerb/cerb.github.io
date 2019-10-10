---
title: >-
  Bot Action: Redirect delivery to another email address
permalink: /docs/bots/events/event.mail.received.app/actions/redirect_email/
toc:
  expand: Bots
jumbotron:
  title: >-
    Redirect delivery to another email address
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
| **Identifier (ID):** | redirect_email
| **Event:** | event.mail.received.app

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `to` | text | A comma-separated list of recipient email addresses
