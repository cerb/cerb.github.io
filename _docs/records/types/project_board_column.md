---
title: Project Board Column Records
permalink: /docs/records/types/project_board_column/
toc:
  title: Project Board Column
  expand: Records
jumbotron:
  title: Project Board Column
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
| **Name (singular):** | Project Board Column
| **Name (plural):** | Project Board Columns
| **Alias:** | project_board_column

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in project board column [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `board:` | [Record](/docs/search/deep-search/) | [Board](/docs/records/types/project_board/)
| `board.id:` | [Chooser](/docs/search/filters/choosers/) | [Project Board](/docs/records/types/project_board/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in project board column [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `name` | Text | Name
| `board_` | Record | [Project Board](/docs/records/types/project_board_column/)
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
