---
title: Profile Widget Records
permalink: /docs/records/types/profile_widget/
toc:
  title: Profile Widget
  expand: Records
jumbotron:
  title: Profile Widget
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
| **Name (singular):** | Profile Widget
| **Name (plural):** | Profile Widgets
| **Alias:** | profile_widget

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in profile widget [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `pos:` | [Number](/docs/search/filters/numbers/) | Order
| `tab:` | [Record](/docs/search/deep-search/) | [Tab](/docs/records/types/profile_tab/)
| `tab.id:` | [Chooser](/docs/search/filters/choosers/) | [Tab](/docs/records/types/profile_tab/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `width:` | [Number](/docs/search/filters/numbers/) | Width Units
| `zone:` | [Text](/docs/search/filters/text/) | Zone

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in profile widget [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `extension_id` | Extension | Extension
| `id` | Number | Id
| `name` | Text | Name
| `pos` | Number | Order
| `record_url` | Text | Record Url
| `profile_tab_` | Record | [Tab](/docs/records/types/profile_widget/)
| `updated_at` | Date | Updated
| `width_units` | Number | Width
| `zone` | Text | Zone
