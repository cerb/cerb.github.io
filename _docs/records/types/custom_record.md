---
title: Custom Record Records
permalink: /docs/records/types/custom_record/
toc:
  title: Custom Record
  expand: Records
jumbotron:
  title: Custom Record
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
| **Name (singular):** | Custom Record
| **Name (plural):** | Custom Records
| **Alias:** | custom_record

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in custom record [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `name.plural:` | [Text](/docs/search/filters/text/) | Plural
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `uri:` | [Text](/docs/search/filters/text/) | Uri

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in custom record [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `name` | Text | Name
| `name_plural` | Text | Plural
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
| `uri` | Text | Uri
