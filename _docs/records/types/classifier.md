---
title: Classifier Records
permalink: /docs/records/types/classifier/
toc:
  title: Classifier
  expand: Records
jumbotron:
  title: Classifier
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
| **Name (singular):** | Classifier
| **Name (plural):** | Classifiers
| **Alias:** | classifier

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in classifier [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `owner:` | Virtual | Owner
| `owner.app:` | Virtual | Owner
| `owner.bot:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in classifier [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `created_at` | Date | Created
| `id` | Number | Id
| `name` | Text | Name
| `owner_` | Record | Owner
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
