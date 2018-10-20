---
title: Workspace Worklist Records
permalink: /docs/records/types/workspace_list/
toc:
  title: Workspace Worklist
  expand: Records
jumbotron:
  title: Workspace Worklist
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
| **Name (singular):** | Workspace Worklist
| **Name (plural):** | Workspace Worklists
| **Alias:** | workspace_list

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in workspace worklist [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `tab.id:` | [Chooser](/docs/search/filters/choosers/) | [Workspace Tab](/docs/records/types/workspace_tab/)
| `tab.pos:` | [Number](/docs/search/filters/numbers/) | Order
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in workspace worklist [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `columns` |  | Columns
| `context` | Text | Context
| `id` | Number | Id
| `name` | Text | Name
| `options` |  | Options
| `pos` | Number | Order
| `params` |  | Params
| `record_url` | Text | Record Url
| `render_limit` | Number | Render Limit
| `render_sort` |  | Sort
| `render_subtotals` | Text | Subtotals
| `tab_` | Record | [Tab](/docs/records/types/workspace_list/)
| `tab_extension_` | Record | Tab Type
| `updated_at` | Date | Updated
