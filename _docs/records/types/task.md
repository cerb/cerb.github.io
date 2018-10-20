---
title: Task Records
permalink: /docs/records/types/task/
toc:
  title: Task
  expand: Records
jumbotron:
  title: Task
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
| **Name (singular):** | Task
| **Name (plural):** | Tasks
| **Alias:** | task

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in task [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `completed:` | [Date](/docs/search/filters/dates/) | Completed Date
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `due:` | [Date](/docs/search/filters/dates/) | Due Date
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `importance:` | [Number](/docs/search/filters/numbers/) | Importance
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `owner:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `owner.id:` | [Chooser](/docs/search/filters/choosers/) | [Owner](/docs/records/types/worker/)
| `reopen:` | [Date](/docs/search/filters/dates/) | Reopen At
| `status:` | Virtual | Status
| `title:` | [Text](/docs/search/filters/text/) | Title
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in task [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `completed` | Date | Completed Date
| `created` | Date | Created
| `due` | Date | Due Date
| `id` | Number | Id
| `importance` | Number | Importance
| `owner_` | Record | [Owner](/docs/records/types/task/)
| `record_url` | Text | Record Url
| `reopen` | Date | Reopen At
| `status` | Text | Status
| `title` | Text | Title
| `updated` | Date | Updated
