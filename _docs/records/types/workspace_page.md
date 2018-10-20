---
title: Workspace Page Records
permalink: /docs/records/types/workspace_page/
toc:
  title: Workspace Page
  expand: Records
jumbotron:
  title: Workspace Page
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
| **Name (singular):** | Workspace Page
| **Name (plural):** | Workspace Pages
| **Alias:** | workspace_page

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in workspace page [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `name:` | [Text](/docs/search/filters/text/) | Name
| `owner:` | Virtual | Owner
| `owner.app:` | Virtual | Owner
| `owner.bot:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in workspace page [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `extension_id` | Text | Extension Id
| `id` | Number | Id
| `name` | Text | Name
| `owner_` | Record | Owner
| `record_url` | Text | Record Url
| `extension_` | Record | Type
| `updated_at` | Date | Updated
