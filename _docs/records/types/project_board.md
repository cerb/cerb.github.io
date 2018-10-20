---
title: Project Board Records
permalink: /docs/records/types/project_board/
toc:
  title: Project Board
  expand: Records
jumbotron:
  title: Project Board
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
| **Name (singular):** | Project Board
| **Name (plural):** | Project Boards
| **Alias:** | project_board

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in project board [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in project board [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `columns` | Text | Columns
| `id` | Number | Id
| `name` | Text | Name
| `params` | Map | Params
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
