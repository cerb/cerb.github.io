---
title: >-
  Bot Action: Record search
permalink: /docs/bots/events/actions/core.bot.action.record.search/
toc:
  expand: Bots
jumbotron:
  title: >-
    Record search
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
| **Identifier (ID):** | core.bot.action.record.search
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `context` | context | The [record type](/docs/records/types/) to search
| **x** | `query` | text | The [search query](/docs/search/) to perform
|  | `expand` | string | A comma-separated list of keys to expand (e.g. `custom_, owner`)
|  | `object_placeholder` | placeholder | The placeholder to set with the search results
