---
title: Feed Item Records
permalink: /docs/records/types/feed_item/
toc:
  title: Feed Item
  expand: Records
jumbotron:
  title: Feed Item
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
| **Name (singular):** | Feed Item
| **Name (plural):** | Feed Items
| **Alias:** | feed_item

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in feed item [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `feed:` | [Record](/docs/search/deep-search/) | [Feed](/docs/records/types/feed/)
| `feed.id:` | [Chooser](/docs/search/filters/choosers/) | [Feed](/docs/records/types/feed/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isClosed:` | [Boolean](/docs/search/filters/booleans/) | Is Closed
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `title:` | [Text](/docs/search/filters/text/) | Title
| `url:` | [Text](/docs/search/filters/text/) | Url
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in feed item [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `created_at` | Date | Created
| `feed_` | Record | [Feed](/docs/records/types/feed_item/)
| `guid` | Text | Guid
| `id` | Number | Id
| `is_closed` | Boolean | Is Closed
| `record_url` | Text | Record Url
| `title` | Text | Title
| `url` | Text | Url
