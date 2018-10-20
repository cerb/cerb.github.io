---
title: Time Tracking Records
permalink: /docs/records/types/time_entry/
toc:
  title: Time Tracking
  expand: Records
jumbotron:
  title: Time Tracking
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
| **Name (singular):** | Time Tracking Entry
| **Name (plural):** | Time Tracking Entries
| **Alias:** | time_entry

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in time tracking [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `activity.id:` | [Chooser](/docs/search/filters/choosers/) | [Activity](/docs/records/types/timetracking_activity/)
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [Date](/docs/search/filters/dates/) | Log Date
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isClosed:` | [Boolean](/docs/search/filters/booleans/) | Is Closed
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `timeSpent:` | [Number](/docs/search/filters/numbers/) | Time Spent
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in time tracking [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `is_closed` | Boolean | Is Closed
| `log_date` | Date | Log Date
| `record_url` | Text | Record Url
| `summary` | Text | Summary
| `mins` | Minutes | Time Spent
| `worker_` | Record | [Worker](/docs/records/types/time_entry/)
