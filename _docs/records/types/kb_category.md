---
title: Knowledgebase Category Records
permalink: /docs/records/types/kb_category/
toc:
  title: Knowledgebase Category
  expand: Records
jumbotron:
  title: Knowledgebase Category
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
| **Name (singular):** | Knowledgebase Category
| **Name (plural):** | Knowledgebase Categories
| **Alias:** | kb_category

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in knowledgebase category [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `article.id:` | [Chooser](/docs/search/filters/choosers/) | [Knowledgebase Article](/docs/records/types/kb_article/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `parent.id:` | [Chooser](/docs/search/filters/choosers/) | [Parent](/docs/records/types/kb_category/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in knowledgebase category [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `name` | Text | Name
| `parent_id` | Number | Parent
| `updated_at` | Date | Updated
