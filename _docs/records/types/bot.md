---
title: Bot Records
permalink: /docs/records/types/bot/
toc:
  title: Bot
  expand: Records
jumbotron:
  title: Bot
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
| **Name (singular):** | Bot
| **Name (plural):** | Bots
| **Alias:** | bot

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in bot [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `disabled:` | [Boolean](/docs/search/filters/booleans/) | Disabled
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `mentionName:` | [Text](/docs/search/filters/text/) | @mention
| `name:` | [Text](/docs/search/filters/text/) | Name
| `owner:` | Virtual | Owner
| `owner.app:` | Virtual | Owner
| `owner.bot:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in bot [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `mention_name` | Text | @mention
| `config` |  | Configuration
| `created_at` | Date | Created
| `is_disabled` | Boolean | Disabled
| `id` | Number | Id
| `name` | Text | Name
| `owner_` | Record | Owner
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
