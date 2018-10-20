---
title: Knowledgebase Article Records
permalink: /docs/records/types/kb_article/
toc:
  title: Knowledgebase Article
  expand: Records
jumbotron:
  title: Knowledgebase Article
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
| **Name (singular):** | Knowledgebase Article
| **Name (plural):** | Knowledgebase Articles
| **Alias:** | kb_article

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in knowledgebase article [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `category.id:` | [Chooser](/docs/search/filters/choosers/) | [Knowledgebase Category](/docs/records/types/kb_category/)
| `content:` | [Fulltext](/docs/search/filters/fulltext/) | Content
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `format:` | [Text](/docs/search/filters/text/) | Format
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `title:` | [Text](/docs/search/filters/text/) | Title
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `views:` | [Number](/docs/search/filters/numbers/) | Views
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in knowledgebase article [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `content` |  | Content
| `format` | Text | Format
| `id` | Number | Id
| `record_url` | Text | Record Url
| `title` | Text | Title
| `updated` | Date | Updated
| `views` | Number | Views
