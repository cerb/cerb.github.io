---
title: >-
  Bot Action: Record create
permalink: /docs/bots/events/actions/core.bot.action.record.create/
toc:
  expand: Bots
jumbotron:
  title: >-
    Record create
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
| **Identifier (ID):** | core.bot.action.record.create
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) to create
| **x** | `changeset_json` | json | The field keys and values
|  | `run_in_simulator` | bit | Create records in the simulator: `0`=no, `1`=yes
|  | `object_placeholder` | placeholder | The placeholder to set with the new record
