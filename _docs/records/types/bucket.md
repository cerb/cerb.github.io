---
title: Bucket Records
permalink: /docs/records/types/bucket/
toc:
  title: Bucket
  expand: Records
jumbotron:
  title: Bucket
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
| **Name (singular):** | Bucket
| **Name (plural):** | Buckets
| **Alias:** | bucket

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in bucket [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `group:` | [Record](/docs/search/deep-search/) | [Group](/docs/records/types/group/)
| `group.id:` | [Chooser](/docs/search/filters/choosers/) | [Group](/docs/records/types/group/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `send.as:` | [Text](/docs/search/filters/text/) | Send As
| `send.from.id:` | [Chooser](/docs/search/filters/choosers/) | [Send From](/docs/records/types/address/)
| `signature.id:` | [Chooser](/docs/search/filters/choosers/) | [Signature](/docs/records/types/email_signature/)
| `template.id:` | [Chooser](/docs/search/filters/choosers/) | [Email Template](/docs/records/types/html_template/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in bucket [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `is_default` | Boolean | Default
| `reply_html_template_` | Record | [Email Template](/docs/records/types/bucket/)
| `group_` | Record | [Group](/docs/records/types/bucket/)
| `id` | Number | Id
| `name` | Text | Name
| `record_url` | Text | Record Url
| `reply_personal` | Text | Send As
| `replyto_` | Record | [Send From](/docs/records/types/bucket/)
| `reply_signature_` | Record | [Signature](/docs/records/types/bucket/)
| `reply_signature_owner_` | Record | Signature Owner
| `updated_at` | Date | Updated
