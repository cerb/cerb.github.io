---
title: Calendar Recurring Event Records
permalink: /docs/records/types/calendar_recurring_event/
toc:
  title: Calendar Recurring Event
  expand: Records
jumbotron:
  title: Calendar Recurring Event
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
| **Name (singular):** | Calendar Recurring Event
| **Name (plural):** | Calendar Recurring Events
| **Alias:** | calendar_recurring_event

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in calendar recurring event [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `calendar:` | [Record](/docs/search/deep-search/) | [Calendar](/docs/records/types/calendar/)
| `calendar.id:` | [Chooser](/docs/search/filters/choosers/) | [Calendar](/docs/records/types/calendar/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Event Name
| `status:` | [Boolean](/docs/search/filters/booleans/) | Is Available
| `timezone:` | [Text](/docs/search/filters/text/) | Timezone
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in calendar recurring event [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `event_end` | Text | End
| `id` | Number | Id
| `is_available` | Boolean | Is Available
| `name` | Text | Name
| `patterns` | Text | Patterns
| `record_url` | Text | Record Url
| `recur_end` | Text | Recur End
| `recur_start` | Text | Recur Start
| `event_start` | Text | Start
| `tz` | Text | Timezone
