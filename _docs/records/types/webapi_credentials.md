---
title: Web Api Credentials Records
permalink: /docs/records/types/webapi_credentials/
toc:
  title: Web Api Credentials
  expand: Records
jumbotron:
  title: Web Api Credentials
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
| **Name (singular):** | Api Key
| **Name (plural):** | Api Keys
| **Alias:** | webapi_credentials

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in web api credentials [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `accessKey:` | [Text](/docs/search/filters/text/) | Access Key
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in web api credentials [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `access_key` | Text | Access Key
| `id` | Number | Id
| `name` | Text | Name
| `params` |  | Params
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
| `worker_` | Record | [Worker](/docs/records/types/webapi_credentials/)
