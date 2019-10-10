---
title: >-
  Bot Action: Return interaction
permalink: /docs/bots/events/event.interactions.get.worker/actions/return_interaction/
toc:
  expand: Bots
jumbotron:
  title: >-
    Return interaction
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
      Get chat interactions for worker &raquo;
    url: /docs/bots/events/event.interactions.get.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.interactions.get.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | return_interaction
| **Event:** | event.interactions.get.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `behavior_id` | id | The ID of the [behavior](/docs/records/types/behavior/) to run
| **x** | `name` | text | The name of the displayed interaction
| **x** | `interaction` | text | The ID of the displayed interaction
|  | `interaction_params_json` | json | The parameters of the displayed interaction
