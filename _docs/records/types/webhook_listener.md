---
title: Webhook Listener Records
permalink: /docs/records/types/webhook_listener/
toc:
  title: Webhook Listener
  expand: Records
jumbotron:
  title: Webhook Listener
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
| **Name (singular):** | Webhook
| **Name (plural):** | Webhooks
| **Alias:** | webhook_listener

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in webhook listener [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `extension:` | [Text](/docs/search/filters/text/) | Extension
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `guid:` | [Text](/docs/search/filters/text/) | Url
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in webhook listener [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `extension_id` | Text | Extension
| `guid` | Text | Guid
| `id` | Number | Id
| `name` | Text | Name
| `extension_params` | Map | Params
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
