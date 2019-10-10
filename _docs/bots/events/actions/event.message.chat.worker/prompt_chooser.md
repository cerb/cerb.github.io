---
title: >-
  Bot Action: Prompt with chooser
permalink: /docs/bots/events/event.message.chat.worker/actions/prompt_chooser/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with chooser
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
| **Identifier (ID):** | prompt_chooser
| **Event:** | event.message.chat.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) of the chooser worklist
|  | `query` | text | The [search query](/docs/search/) to filter the chooser worklist
|  | `selection` | text | `single` or `multiple`
|  | `autocomplete` | bit | `0` (autocomplete disabled) or `1` (autocomplete enabled)
| **x** | `var` | placeholder | The placeholder to set with the user's input
