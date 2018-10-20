---
title: Email Signature Records
permalink: /docs/records/types/email_signature/
toc:
  title: Email Signature
  expand: Records
jumbotron:
  title: Email Signature
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
| **Name (singular):** | Email Signature
| **Name (plural):** | Email Signatures
| **Alias:** | email_signature

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in email signature [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isDefault:` | [Boolean](/docs/search/filters/booleans/) | Default
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `owner:` | Virtual | Owner
| `signature:` | [Text](/docs/search/filters/text/) | Signature
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in email signature [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `is_default` | Boolean | Is Default
| `name` | Text | Name
| `owner_` | Record | Owner
| `record_url` | Text | Record Url
| `signature` | Text | Signature
| `updated_at` | Date | Updated
