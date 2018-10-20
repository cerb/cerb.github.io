---
title: Behavior Records
permalink: /docs/records/types/behavior/
toc:
  title: Behavior
  expand: Records
jumbotron:
  title: Behavior
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
| **Name (singular):** | Behavior
| **Name (plural):** | Behaviors
| **Alias:** | behavior

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in behavior [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `bot:` | [Record](/docs/search/deep-search/) | [Bot](/docs/records/types/bot/)
| `bot.id:` | [Chooser](/docs/search/filters/choosers/) | [Bot](/docs/records/types/bot/)
| `disabled:` | [Boolean](/docs/search/filters/booleans/) | Is Disabled
| `event:` | [Text](/docs/search/filters/text/) | Event
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `name:` | [Text](/docs/search/filters/text/) | Title
| `priority:` | [Number](/docs/search/filters/numbers/) | Priority
| `private:` | [Boolean](/docs/search/filters/booleans/) | Is Private
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `usableBy.bot:` | [Chooser](/docs/search/filters/choosers/) | [Usableby Bot](/docs/records/types/bot/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in behavior [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `bot_` | Record | [Bot](/docs/records/types/behavior/)
| `bot_owner_` | Record | Bot Owner
| `event_point` | Text | Event
| `event_point_name` | Text | Event
| `id` | Number | Id
| `is_disabled` | Boolean | Is Disabled
| `is_private` | Boolean | Is Private
| `name` | Text | Name
| `priority` | Number | Priority
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
