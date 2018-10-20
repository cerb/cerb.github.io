---
title: Public Key Records
permalink: /docs/records/types/gpg_public_key/
toc:
  title: Public Key
  expand: Records
jumbotron:
  title: Public Key
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
| **Name (singular):** | Public Key
| **Name (plural):** | Public Keys
| **Alias:** | gpg_public_key

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in public key [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `expires:` | [Date](/docs/search/filters/dates/) | Expires
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `fingerprint:` | [Text](/docs/search/filters/text/) | Fingerprint
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in public key [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `expires_at` | Date | Expires
| `fingerprint` | Text | Fingerprint
| `id` | Number | Id
| `name` | Text | Name
| `record_url` | Text | Record Url
| `updated_at` | Date | Updated
