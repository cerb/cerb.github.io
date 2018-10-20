---
title: Domain Records
permalink: /docs/records/types/domain/
toc:
  title: Domain
  expand: Records
jumbotron:
  title: Domain
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
| **Name (singular):** | Domain
| **Name (plural):** | Domains
| **Alias:** | domain

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in domain [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `server:` | [Record](/docs/search/deep-search/) | [Server](/docs/records/types/server/)
| `server.id:` | [Chooser](/docs/search/filters/choosers/) | [Server](/docs/records/types/server/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in domain [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `contacts_list` | Text | Contacts List
| `created` | Date | Created
| `id` | Number | Id
| `name` | Text | Name
| `record_url` | Text | Record Url
| `server_` | Record | [Server](/docs/records/types/domain/)
| `updated` | Date | Updated
