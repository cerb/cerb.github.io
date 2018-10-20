---
title: Workspace Tab Records
permalink: /docs/records/types/workspace_tab/
toc:
  title: Workspace Tab
  expand: Records
jumbotron:
  title: Workspace Tab
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
| **Name (singular):** | Workspace Tab
| **Name (plural):** | Workspace Tabs
| **Alias:** | workspace_tab

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in workspace tab [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `page.id:` | [Chooser](/docs/search/filters/choosers/) | [Workspace Page](/docs/records/types/workspace_page/)
| `pos:` | [Number](/docs/search/filters/numbers/) | Order
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in workspace tab [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `extension_id` | Text | Extension Id
| `id` | Number | Id
| `name` | Text | Name
| `order` | Number | Order
| `page_` | Record | [Page](/docs/records/types/workspace_tab/)
| `page_owner_` | Record | Page Owner
| `page_extension_` | Record | Page Type
| `extension_` | Record | Type
| `updated_at` | Date | Updated
