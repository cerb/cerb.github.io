---
title: >-
  Bot Action: Remove recipients
permalink: /docs/bots/events/event.ticket.viewed.worker/actions/remove_recipients/
toc:
  expand: Bots
jumbotron:
  title: >-
    Remove recipients
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
      Ticket profile viewed by a worker &raquo;
    url: /docs/bots/events/event.ticket.viewed.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.ticket.viewed.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | remove_recipients
| **Event:** | event.ticket.viewed.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `recipients` | text | A comma-delimited list of email addresses to remove as recipients
