---
title: Workspace Widget Records
permalink: /docs/records/types/workspace_widget/
toc:
  title: Workspace Widget
  expand: Records
jumbotron:
  title: Workspace Widget
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
| **Name (singular):** | Workspace Widget
| **Name (plural):** | Workspace Widgets
| **Alias:** | workspace_widget

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in workspace widget [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Label
| `tab.id:` | [Chooser](/docs/search/filters/choosers/) | [Workspace Tab](/docs/records/types/workspace_tab/)
| `tab.pos:` | [Number](/docs/search/filters/numbers/) | Order
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `width:` | [Text](/docs/search/filters/text/) | Width
| `zone:` | [Text](/docs/search/filters/text/) | Zone

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in workspace widget [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `label` | Text | Label
| `pos` | Text | Order
| `params` | Map | Params
| `tab_` | Record | [Tab](/docs/records/types/workspace_widget/)
| `extension_id` | Text | Type
| `updated_at` | Date | Updated
| `width_units` | Number | Width
| `zone` | Text | Zone
