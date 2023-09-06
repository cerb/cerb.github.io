---
title: Attachment Records
permalink: /docs/records/types/attachment/
toc:
  title: Attachment
  expand: Records
jumbotron:
  title: Attachment
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
| **Name (singular):** | Attachment
| **Name (plural):** | Attachments
| **Alias (uri):** | attachment
| **Identifier (ID):** | cerberusweb.contexts.attachment

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `attach` | [links](/docs/records/fields/types/links/) | An array of `type:id` tuples to attach this file to 
|   | `content` | [text](/docs/records/fields/types/text/) | The optional content of this file. For binary, base64-encode in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme). For `application/vnd.cerb.uri` this should be a URI like `cerb:automation_resource:3ed620aa-a4b5-11ec-89ea-6b1bb00ef554`
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `mime_type` | [text](/docs/records/fields/types/text/) | The MIME type of this file (e.g. `image/png`); defaults to `application/octet-stream`. Can be `application/vnd.cerb.uri` for an [automation resource](/docs/records/types/automation_resource/) URI in `content`.
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The filename 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `id` | number | Id
| `mime_type` | text | Mime Type
| `name` | text | Name
| `size` | number | Size (Bytes)
| `storage_extension` | text | Storage Extension
| `storage_key` | text | Storage Key
| `storage_sha1hash` | text | Sha-1 Hash
| `updated` | date | Updated
| `url_download` | text | Url

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in attachment [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `bundle:` | [record](/docs/search/#deep-search) | [Bundle](/docs/records/types/file_bundle/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Attachment Id
| `links:` | [links](/docs/search/#links) | Record Links
| `mimetype:` | [text](/docs/search/#text) | Mime Type
| `name:` | [text](/docs/search/#text) | Name
| `on:` | [text](/docs/search/#text) | On Type
| `on.<type>:` | [record](/docs/search/#deep-search) | On
| `size:` | [number](/docs/search/#numbers) | Size
| `storage.extension:` | [text](/docs/search/#text) | Storage Extension
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on attachment [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `a_id` | Attachment Id
| `a_mime_type` | Mime Type
| `a_name` | Name
| `a_storage_extension` | Storage Extension
| `a_storage_key` | Storage Key
| `a_storage_profile_id` | Storage Profile
| `a_storage_sha1hash` | Sha-1 Hash
| `a_storage_size` | Size
| `a_updated` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>