---
title: >-
  Bot Action: Behavior run
permalink: /docs/bots/events/actions/_run_behavior/
toc:
  expand: Bots
jumbotron:
  title: >-
    Behavior run
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
| **Identifier (ID):** | _run_behavior
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `on` | placeholder | The placeholder/variable containing the target record
| **x** | `behavior_id` | id | The ID of the [behavior](/docs/records/types/behavior/) to execute
|  | `var_*` | mixed | Input variables for the target behavior
|  | `run_in_simulator` | bit | Run the target behavior in the simulator: `0`=no, `1`=yes
|  | `var` | placeholder | Save the behavior results to this placeholder
