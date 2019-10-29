---
title: >-
  Bot Action: Open a worklist popup
permalink: /docs/bots/events/event.message.chat.worker/actions/worklist_open/
toc:
  expand: Bots
jumbotron:
  title: >-
    Open a worklist popup
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
      Chat with worker &raquo;
    url: /docs/bots/events/event.message.chat.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.message.chat.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | worklist_open
| **Event:** | event.message.chat.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) of the worklist
|  | `quick_search` | text | The [search query](/docs/search/) to filter the worklist
