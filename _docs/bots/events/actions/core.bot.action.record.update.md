---
title: >-
  Bot Action: Record update
permalink: /docs/bots/events/actions/core.bot.action.record.update/
toc:
  expand: Bots
jumbotron:
  title: >-
    Record update
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
| **Identifier (ID):** | core.bot.action.record.update
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) to update
| **x** | `id` | text | The ID of the record to update
| **x** | `changeset_json` | json | The field keys and values
|  | `run_in_simulator` | bit | Update records in the simulator: `0`=no, `1`=yes
|  | `object_placeholder` | placeholder | The placeholder to set with the updated record
