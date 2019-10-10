---
title: >-
  Bot Action: Record delete
permalink: /docs/bots/events/actions/core.bot.action.record.delete/
toc:
  expand: Bots
jumbotron:
  title: >-
    Record delete
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
| **Identifier (ID):** | core.bot.action.record.delete
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) to delete
| **x** | `id` | text | The ID of the record to delete
|  | `run_in_simulator` | bit | Delete records in the simulator: `0`=no, `1`=yes
