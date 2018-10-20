---
title: Feedback Records
permalink: /docs/records/types/feedback/
toc:
  title: Feedback
  expand: Records
jumbotron:
  title: Feedback
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
| **Name (singular):** | Feedback
| **Name (plural):** | Feedback
| **Alias:** | feedback

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in feedback [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [Date](/docs/search/filters/dates/) | Log Date
| `email:` | [Record](/docs/search/deep-search/) | [Email](/docs/records/types/address/)
| `email.id:` | [Chooser](/docs/search/filters/choosers/) | [Author Email](/docs/records/types/address/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `mood:` | [Text](/docs/search/filters/text/) | Mood
| `quote:` | [Text](/docs/search/filters/text/) | Quote
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in feedback [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `author_` | Record | [Author](/docs/records/types/feedback/)
| `id` | Number | Id
| `url` | Text | Link
| `created` | Date | Log Date
| `quote_mood` | Text | Mood
| `quote_text` | Text | Quote
| `worker_` | Record | [Worker](/docs/records/types/feedback/)
