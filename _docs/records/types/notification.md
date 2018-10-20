---
title: Notification Records
permalink: /docs/records/types/notification/
toc:
  title: Notification
  expand: Records
jumbotron:
  title: Notification
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
| **Name (singular):** | Notification
| **Name (plural):** | Notifications
| **Alias:** | notification

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in notification [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `activity:` | [Text](/docs/search/filters/text/) | Activity
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isRead:` | [Boolean](/docs/search/filters/booleans/) | Is Read
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in notification [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `activity_point` | Text | Activity
| `assignee_` | Record | [Assignee](/docs/records/types/notification/)
| `created` | Date | Created
| `event_json` | Text | Event Json
| `id` | Number | Id
| `is_read` | Boolean | Is Read
| `message` | Text | Message
| `message_html` | Text | Message (Html)
| `target_` | Record | Target
| `url` | Text | Url
