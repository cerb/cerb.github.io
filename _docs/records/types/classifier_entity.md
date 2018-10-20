---
title: Classifier Entity Records
permalink: /docs/records/types/classifier_entity/
toc:
  title: Classifier Entity
  expand: Records
jumbotron:
  title: Classifier Entity
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
| **Name (singular):** | Classifier Entity
| **Name (plural):** | Classifier Entities
| **Alias:** | classifier_entity

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in classifier entity [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `description:` | [Text](/docs/search/filters/text/) | Description
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in classifier entity [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `description` | Text | Description
| `id` | Number | Id
| `name` | Text | Name
| `params` |  | Params
| `record_url` | Text | Record Url
| `type` | Text | Type
| `updated_at` | Date | Updated
