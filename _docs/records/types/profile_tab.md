---
title: Profile Tab Records
permalink: /docs/records/types/profile_tab/
toc:
  title: Profile Tab
  expand: Records
jumbotron:
  title: Profile Tab
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
| **Name (singular):** | Profile Tab
| **Name (plural):** | Profile Tabs
| **Alias:** | profile_tab

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in profile tab [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `record:` | [Text](/docs/search/filters/text/) | Record
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in profile tab [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `name` | Text | Name
| `context` | Context | Record
| `record_url` | Text | Record Url
| `extension_id` | Extension | Type
| `updated_at` | Date | Updated
