---
title: >-
  Bot Action: Move to bucket
permalink: /docs/bots/events/event.mail.received/actions/move_to/
toc:
  expand: Bots
jumbotron:
  title: >-
    Move to bucket
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
      New message added to ticket &raquo;
    url: /docs/bots/events/event.mail.received/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.received/#event-actions
---

|---
|-|-
| **Identifier (ID):** | move_to
| **Event:** | event.mail.received

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `group_id` | text | The [group](/docs/records/types/group/) to move the ticket into
| **x** | `bucket_id` | text | The [bucket](/docs/records/types/bucket/) to move the ticket into
