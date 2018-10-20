---
title: Call Records
permalink: /docs/records/types/call/
toc:
  title: Call
  expand: Records
jumbotron:
  title: Call
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
| **Name (singular):** | Call
| **Name (plural):** | Calls
| **Alias:** | call

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in call [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isClosed:` | [Boolean](/docs/search/filters/booleans/) | Is Closed
| `isOutgoing:` | [Boolean](/docs/search/filters/booleans/) | Is Outgoing
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `phone:` | [Text](/docs/search/filters/text/) | Phone
| `subject:` | [Text](/docs/search/filters/text/) | Subject
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in call [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `created` | Date | Created
| `id` | Number | Id
| `is_closed` | Boolean | Is Closed
| `is_outgoing` | Boolean | Is Outgoing
| `phone` | Text | Phone
| `record_url` | Text | Record Url
| `subject` | Text | Subject
| `updated` | Date | Updated
