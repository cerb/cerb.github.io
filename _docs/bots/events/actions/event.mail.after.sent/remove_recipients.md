---
title: >-
  Bot Action: Remove recipients
permalink: /docs/bots/events/event.mail.after.sent/actions/remove_recipients/
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
      After message sent from worker &raquo;
    url: /docs/bots/events/event.mail.after.sent/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.after.sent/#event-actions
---

|---
|-|-
| **Identifier (ID):** | remove_recipients
| **Event:** | event.mail.after.sent

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `recipients` | text | A comma-delimited list of email addresses to remove as recipients
