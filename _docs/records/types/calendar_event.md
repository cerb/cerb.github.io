---
title: Calendar Event Records
permalink: /docs/records/types/calendar_event/
toc:
  title: Calendar Event
  expand: Records
jumbotron:
  title: Calendar Event
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
| **Name (singular):** | Calendar Event
| **Name (plural):** | Calendar Events
| **Alias:** | calendar_event

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in calendar event [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `calendar:` | [Record](/docs/search/deep-search/) | [Calendar](/docs/records/types/calendar/)
| `calendar.id:` | [Chooser](/docs/search/filters/choosers/) | [Calendar](/docs/records/types/calendar/)
| `endDate:` | [Date](/docs/search/filters/dates/) | End Date
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `startDate:` | [Date](/docs/search/filters/dates/) | Start Date
| `status:` | [Boolean](/docs/search/filters/booleans/) | Is Available

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in calendar event [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `calendar_` | Record | [Calendar](/docs/records/types/calendar_event/)
| `calendar_owner_` | Record | Calendar Owner
| `date_end` | Date | End Date
| `id` | Number | Id
| `is_available` | Boolean | Is Available
| `name` | Text | Name
| `record_url` | Text | Record Url
| `date_start` | Date | Start Date
