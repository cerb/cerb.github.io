---
title: PGP Public Key Records
permalink: /docs/records/types/gpg_public_key/
toc:
  title: PGP Public Key
  expand: Records
jumbotron:
  title: PGP Public Key
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
| **Name (singular):** | Pgp Public Key
| **Name (plural):** | Pgp Public Keys
| **Alias (uri):** | gpg_public_key
| **Identifier (ID):** | cerberusweb.contexts.gpg_public_key

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `expires_at` | [timestamp](/docs/records/fields/types/timestamp/) | The expiration date of the public key 
| **x** | **`fingerprint`** | [text](/docs/records/fields/types/text/) | The fingerprint of the public key 
| **x** | **`key_text`** | [text](/docs/records/fields/types/text/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this pgp public key 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `expires_at` | date | Expires
| `fingerprint` | text | Fingerprint
| `id` | number | Id
| `key_text` |  | Key
| `name` | text | Name
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in pgp public key [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `expires:` | [date](/docs/search/filters/dates/) | Expires
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `fingerprint:` | virtual | Fingerprint
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `uid:` | virtual | Uid
| `uid.email:` | virtual | Uid.email
| `uid.name:` | virtual | Uid.name
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on pgp public key [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_uid` | Uid
| `*_uid_email` | Uid.email
| `*_uid_name` | Uid.name
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `g_expires_at` | Expires
| `g_fingerprint` | Fingerprint
| `g_id` | Id
| `g_name` | Name
| `g_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>