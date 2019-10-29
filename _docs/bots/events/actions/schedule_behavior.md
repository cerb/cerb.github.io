---
title: >-
  Bot Action: Behavior schedule
permalink: /docs/bots/events/actions/_schedule_behavior/
toc:
  expand: Bots
jumbotron:
  title: >-
    Behavior schedule
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
| **Identifier (ID):** | _schedule_behavior
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `on` | placeholder | The placeholder/variable containing the target record
| **x** | `behavior_id` | id | The ID of the [behavior](/docs/records/types/behavior/) to execute
|  | `var_*` | mixed | Input variables for the target behavior
|  | `run_date` | template | When to run the scheduled behavior (e.g. `now`, `+2 days`, `Friday 8am`)
|  | `on_dupe` | text | `first` (only schedule earliest), `last` (only schedule latest), or omit to allow multiple occurrences
