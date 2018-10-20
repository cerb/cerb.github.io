---
title: Custom Fieldset Records
permalink: /docs/records/types/custom_fieldset/
toc:
  title: Custom Fieldset
  expand: Records
jumbotron:
  title: Custom Fieldset
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
| **Name (singular):** | Custom Fieldset
| **Name (plural):** | Custom Fieldsets
| **Alias:** | custom_fieldset

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in custom fieldset [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [Text](/docs/search/filters/text/) | Context
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `owner:` | Virtual | Owner
| `owner.app:` | Virtual | Owner
| `owner.bot:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in custom fieldset [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `context` | Text | Context
| `id` | Number | Id
| `name` | Text | Name
| `owner_` | Record | Owner
| `updated_at` | Date | Updated
