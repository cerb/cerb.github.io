---
title: Classifier Classification Records
permalink: /docs/records/types/classifier_class/
toc:
  title: Classifier Classification
  expand: Records
jumbotron:
  title: Classifier Classification
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
| **Name (singular):** | Classification
| **Name (plural):** | Classifications
| **Alias:** | classifier_class

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in classifier classification [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `classifier:` | [Record](/docs/search/deep-search/) | [Classifier](/docs/records/types/classifier/)
| `classifier.id:` | [Chooser](/docs/search/filters/choosers/) | [Classifier](/docs/records/types/classifier/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in classifier classification [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `classifier_` | Record | [Classifier](/docs/records/types/classifier_class/)
| `classifier_owner_` | Record | Classifier Owner
| `id` | Number | Id
| `name` | Text | Name
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
