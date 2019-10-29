---
title: >-
  Bot Action: Use behavior
permalink: /docs/bots/events/event.interaction.chat.worker/actions/switch_behavior/
toc:
  expand: Bots
jumbotron:
  title: >-
    Use behavior
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
      Handle chat interaction with worker &raquo;
    url: /docs/bots/events/event.interaction.chat.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.interaction.chat.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | switch_behavior
| **Event:** | event.interaction.chat.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `behavior_id` | id | The [conversational behavior](/docs/bots/events/event.message.chat.worker/) to start
|  | `return` | bit | The current behavior should: `0` (exit), `1` (wait for result)
|  | `var` | placeholder | Save the behavior results to this placeholder
