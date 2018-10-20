---
title: Custom Field Records
permalink: /docs/records/types/custom_field/
toc:
  title: Custom Field
  expand: Records
jumbotron:
  title: Custom Field
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
| **Name (singular):** | Custom Field
| **Name (plural):** | Custom Fields
| **Alias:** | custom_field

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in custom field [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [Text](/docs/search/filters/text/) | Context
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `fieldset.id:` | [Chooser](/docs/search/filters/choosers/) | [Custom Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `pos:` | [Number](/docs/search/filters/numbers/) | Order
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in custom field [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `context` | Text | Context
| `id` | Number | Id
| `name` | Text | Name
| `pos` | Number | Order
| `type` | Text | Type
| `updated_at` | Date | Updated
