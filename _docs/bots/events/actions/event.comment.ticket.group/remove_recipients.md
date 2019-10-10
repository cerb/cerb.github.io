---
title: >-
  Bot Action: Remove recipients
permalink: /docs/bots/events/event.comment.ticket.group/actions/remove_recipients/
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
      New comment on ticket in group &raquo;
    url: /docs/bots/events/event.comment.ticket.group/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.comment.ticket.group/#event-actions
---

|---
|-|-
| **Identifier (ID):** | remove_recipients
| **Event:** | event.comment.ticket.group

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `recipients` | text | A comma-delimited list of email addresses to remove as recipients
