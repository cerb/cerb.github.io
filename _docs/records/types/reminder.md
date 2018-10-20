---
title: Reminder Records
permalink: /docs/records/types/reminder/
toc:
  title: Reminder
  expand: Records
jumbotron:
  title: Reminder
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
| **Name (singular):** | Reminder
| **Name (plural):** | Reminders
| **Alias:** | reminder

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in reminder [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `closed:` | [Boolean](/docs/search/filters/booleans/) | Is Closed
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `remindAt:` | [Date](/docs/search/filters/dates/) | Remind At
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in reminder [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `is_closed` | Boolean | Is Closed
| `name` | Text | Name
| `record_url` | Text | Record Url
| `remind_at` | Date | Remind At
| `updated_at` | Date | Updated
| `worker_` | Record | [Worker](/docs/records/types/reminder/)
