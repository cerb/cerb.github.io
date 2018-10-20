---
title: Currency Records
permalink: /docs/records/types/currency/
toc:
  title: Currency
  expand: Records
jumbotron:
  title: Currency
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
| **Name (singular):** | Currency
| **Name (plural):** | Currencies
| **Alias:** | currency

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in currency [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `code:` | [Text](/docs/search/filters/text/) | Code
| `decimalPlaces:` | [Number](/docs/search/filters/numbers/) | Decimal Places
| `default:` | [Boolean](/docs/search/filters/booleans/) | Default
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `symbol:` | [Text](/docs/search/filters/text/) | Symbol
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in currency [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `code` | Text | Code
| `decimal_at` | Number | Decimal Places
| `is_default` | Boolean | Default
| `id` | Number | Id
| `name` | Text | Name
| `name_plural` | Text | Plural
| `record_url` | Text | Record Url
| `symbol` | Text | Symbol
| `updated_at` | Date | Updated
