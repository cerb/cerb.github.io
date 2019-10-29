---
title: >-
  Bot Action: Remove recipients
permalink: /docs/bots/events/event.mail.after.sent.group/actions/remove_recipients/
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
      After message sent from group member &raquo;
    url: /docs/bots/events/event.mail.after.sent.group/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.after.sent.group/#event-actions
---

|---
|-|-
| **Identifier (ID):** | remove_recipients
| **Event:** | event.mail.after.sent.group

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `recipients` | text | A comma-delimited list of email addresses to remove as recipients
