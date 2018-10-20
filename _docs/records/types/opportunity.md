---
title: Opportunity Records
permalink: /docs/records/types/opportunity/
toc:
  title: Opportunity
  expand: Records
jumbotron:
  title: Opportunity
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
| **Name (singular):** | Opportunity
| **Name (plural):** | Opportunities
| **Alias:** | opportunity

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in opportunity [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `amount:` | [Number](/docs/search/filters/numbers/) | Amount
| `closedDate:` | [Date](/docs/search/filters/dates/) | Closed Date
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `currency.id:` | [Chooser](/docs/search/filters/choosers/) | [Currency](/docs/records/types/currency/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Title
| `status:` | [Number](/docs/search/filters/numbers/) | Status
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in opportunity [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `amount` | Currency | Amount
| `created` | Date | Created
| `amount_currency_` | Record | [Currency](/docs/records/types/opportunity/)
| `id` | Number | Id
| `record_url` | Text | Record Url
| `status` | Text | Status
| `title` | Text | Title
| `updated` | Date | Updated
