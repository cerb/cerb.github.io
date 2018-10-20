---
title: Draft Records
permalink: /docs/records/types/draft/
toc:
  title: Draft
  expand: Records
jumbotron:
  title: Draft
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
  -
    label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Draft
| **Name (plural):** | Drafts
| **Alias:** | draft

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in draft [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `subject:` | [Text](/docs/search/filters/text/) | Subject
| `to:` | [Text](/docs/search/filters/text/) | To
| `type:` | [Text](/docs/search/filters/text/) | Message Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in draft [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `content` | Text | Content
| `id` | Number | Id
| `subject` | Text | Subject
| `to` | Text | To
| `updated` | Date | Updated
| `worker_` | Record | [Worker](/docs/records/types/draft/)
