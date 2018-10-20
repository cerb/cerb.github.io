---
title: Snippet Records
permalink: /docs/records/types/snippet/
toc:
  title: Snippet
  expand: Records
jumbotron:
  title: Snippet
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
| **Name (singular):** | Snippet
| **Name (plural):** | Snippets
| **Alias:** | snippet

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in snippet [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `content:` | [Text](/docs/search/filters/text/) | Content
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `owner:` | Virtual | Owner
| `owner.app:` | Virtual | Owner
| `owner.bot:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `title:` | [Text](/docs/search/filters/text/) | Title
| `totalUses:` | [Number](/docs/search/filters/numbers/) | All Uses
| `type:` | Virtual | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `usableBy.worker:` | [Chooser](/docs/search/filters/choosers/) | [Usableby Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in snippet [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `total_uses` | Number | All Uses
| `content` | Text | Content
| `context` | Text | Context
| `id` | Number | Id
| `owner_` | Record | Owner
| `title` | Text | Title
| `updated_at` | Date | Updated
