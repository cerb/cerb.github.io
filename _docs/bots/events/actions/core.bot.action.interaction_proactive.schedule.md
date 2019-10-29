---
title: >-
  Bot Action: Schedule proactive interaction
permalink: /docs/bots/events/actions/core.bot.action.interaction_proactive.schedule/
toc:
  expand: Bots
jumbotron:
  title: >-
    Schedule proactive interaction
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
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | core.bot.action.interaction_proactive.schedule
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `on` | placeholder | The placeholder/variable containing the target record
| **x** | `behavior_id` | id | The ID of the [behavior](/docs/records/types/behavior/) to execute
| **x** | `interaction` | text | The name of the [chat interaction](/docs/bots/interactions/chat/) to trigger
| **x** | `interaction_params_json` | json | The initial interaction keys and values
|  | `expires` | datetime | The date/time to expire an unread proactive interaction (e.g. `now`, `+2 days`, `Friday 8am`)
|  | `run_in_simulator` | bit | Trigger proactive interactions in the simulator: `0`=no, `1`=yes
