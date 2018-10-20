---
title: Email Template Records
permalink: /docs/records/types/html_template/
toc:
  title: Email Template
  expand: Records
jumbotron:
  title: Email Template
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
| **Name (singular):** | Email Template
| **Name (plural):** | Email Templates
| **Alias:** | html_template

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in email template [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `content:` | [Text](/docs/search/filters/text/) | Content
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `signature:` | [Text](/docs/search/filters/text/) | Signature
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in email template [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `content` | Text | Content
| `id` | Number | Id
| `name` | Text | Name
| `record_url` | Text | Record Url
| `signature` | Text | Signature
| `updated_at` | Date | Updated
