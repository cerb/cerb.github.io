---
title: >-
  Bot Action: Send email relay to workers
permalink: /docs/bots/events/event.mail.after.sent.group/actions/relay_email/
toc:
  expand: Bots
jumbotron:
  title: >-
    Send email relay to workers
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
| **Identifier (ID):** | relay_email
| **Event:** | event.mail.after.sent.group

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `to` | text | An array of [email addresses](/docs/records/types/address/) recipients. These must match registered worker email addresses
|  | `to_owner` | text | Any value enables this option to include the ticket owner as a recipient
|  | `to_watchers` | text | Any value enables this option to include the ticket watchers as recipients
| **x** | `subject` | text | The subject of the relayed message
| **x** | `content` | text | The body of the relayed message
|  | `include_attachments` | bit | `0` (do not include attachments) or `1` (include attachments)
