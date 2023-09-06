---
title: Portal Records
permalink: /docs/records/types/community_portal/
toc:
  title: Portal
  expand: Records
jumbotron:
  title: Portal
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
| **Name (singular):** | Portal
| **Name (plural):** | Portals
| **Alias (uri):** | community_portal
| **Identifier (ID):** | cerberusweb.contexts.portal

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `code` | [text](/docs/records/fields/types/text/) | Randomized internal ID for the portal 
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) | [Community Portal Type](/docs/plugins/extensions/points/cerb.portal/) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this portal 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | Human-friendly nickname for the portal. Must be unique. 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `code` | text | Code
| `extension_id` | text | Extension
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `uri` | text | Path

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in portal [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `code:` | [text](/docs/search/#text) | Code
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `name:` | [text](/docs/search/#text) | Name
| `path:` | [text](/docs/search/#text) | Path
| `type:` | [text](/docs/search/#text) | Extension
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on portal [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `ct_code` | Code
| `ct_extension_id` | Extension
| `ct_id` | Id
| `ct_name` | Name
| `ct_updated_at` | Updated
| `ct_uri` | Path

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>