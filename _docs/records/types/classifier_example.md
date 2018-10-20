---
title: Classifier Example Records
permalink: /docs/records/types/classifier_example/
toc:
  title: Classifier Example
  expand: Records
jumbotron:
  title: Classifier Example
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
| **Name (singular):** | Classifier Example
| **Name (plural):** | Classifier Examples
| **Alias:** | classifier_example

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in classifier example [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `class:` | [Record](/docs/search/deep-search/) | [Class](/docs/records/types/classifier_class/)
| `class.id:` | [Chooser](/docs/search/filters/choosers/) | [Classification](/docs/records/types/classifier_class/)
| `classifier:` | [Record](/docs/search/deep-search/) | [Classifier](/docs/records/types/classifier/)
| `classifier.id:` | [Chooser](/docs/search/filters/choosers/) | [Classifier](/docs/records/types/classifier/)
| `expression:` | [Text](/docs/search/filters/text/) | Expression
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in classifier example [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `class_` | Record | [Classification](/docs/records/types/classifier_example/)
| `classifier_` | Record | [Classifier](/docs/records/types/classifier_example/)
| `classifier_owner_` | Record | Classifier Owner
| `expression` | Text | Expression
| `id` | Number | Id
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
