---
title: >-
  Bot Action: Record upsert
permalink: /docs/bots/events/actions/core.bot.action.record.upsert/
toc:
  expand: Bots
jumbotron:
  title: >-
    Record upsert
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
| **Identifier (ID):** | core.bot.action.record.upsert
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) to upsert
| **x** | `query` | text | The [search query](/docs/search/) to determine if the record exists (update) or not (insert)
| **x** | `changeset_json` | json | The field keys and values
|  | `run_in_simulator` | bit | Upsert records in the simulator: `0`=no, `1`=yes
|  | `object_placeholder` | placeholder | The placeholder to set with the record
