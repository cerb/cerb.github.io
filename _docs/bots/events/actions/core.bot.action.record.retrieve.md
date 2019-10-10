---
title: >-
  Bot Action: Record retrieve
permalink: /docs/bots/events/actions/core.bot.action.record.retrieve/
toc:
  expand: Bots
jumbotron:
  title: >-
    Record retrieve
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
| **Identifier (ID):** | core.bot.action.record.retrieve
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) to retrieve
| **x** | `id` | text | The ID of the record to retrieve
|  | `run_in_simulator` | bit | Create records in the simulator: `0`=no, `1`=yes
|  | `object_placeholder` | placeholder | The placeholder to set with the retrieved record
