---
title: >-
  Bot Action: Switch behavior
permalink: /docs/bots/events/event.message.chat.worker/actions/switch_behavior/
toc:
  expand: Bots
jumbotron:
  title: >-
    Switch behavior
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
| **Identifier (ID):** | switch_behavior
| **Event:** | event.message.chat.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `behavior_id` | id | The [behavior](/docs/records/types/behavior/) to start
|  | `var_*` | mixed | Variable inputs to the target behavior
|  | `return` | bit | `0` (exit the current behavior) or `1` (resume the current behavior after completion)
| **x** | `var` | placeholder | The placeholder to set with the behavior's results
