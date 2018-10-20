---
title: Saved Search Records
permalink: /docs/records/types/saved_search/
toc:
  title: Saved Search
  expand: Records
jumbotron:
  title: Saved Search
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
| **Name (singular):** | Saved Search
| **Name (plural):** | Saved Searches
| **Alias:** | saved_search

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in saved search [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [Text](/docs/search/filters/text/) | Context
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `name:` | [Text](/docs/search/filters/text/) | Name
| `query:` | [Text](/docs/search/filters/text/) | Query
| `tag:` | [Text](/docs/search/filters/text/) | Tag
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in saved search [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `name` | Text | Name
| `owner_` | Record | Owner
| `query` | Text | Query
| `record_url` | Text | Record Url
| `tag` | Text | Tag
| `context` | Text | Type
| `updated_at` | Date | Updated
