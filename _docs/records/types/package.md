---
title: Package Records
excerpt: This page provides detailed information about the structure and functionality
  of Package Records in Cerb.
summary: This page provides detailed information about the structure and functionality
  of Package Records in Cerb. It outlines the fields available in the Records API,
  including required fields like name, package_json, point, and uri, as well as optional
  fields such as description, image, and links. The page also describes dictionary
  placeholders used in automations, snippets, and API responses, offering a comprehensive
  list of fields and their types. Additionally, it covers search query fields that
  can be used to filter package records and lists the columns available in package
  worklists, providing a complete guide for managing and utilizing package records
  within the Cerb platform.
permalink: /docs/records/types/package/
toc:
  title: Package
  expand: Records
jumbotron:
  title: Package
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Package
| **Name (plural):** | Packages
| **Alias (uri):** | package
| **Identifier (ID):** | cerberusweb.contexts.package.library

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `description` | [text](/docs/records/fields/types/text/) | A description of this library package's contents 
|   | `image` | [image](/docs/records/fields/types/image/) | The profile image, base64-encoded in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this package 
| **x** | **`package_json`** | [text](/docs/records/fields/types/text/) |  
| **x** | **`point`** | [text](/docs/records/fields/types/text/) | The library section containing this package 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | The unique identifier of this package 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `description` | text | Description
| `id` | number | Id
| `name` | text | Name
| `point` | text | Extension Point
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in package [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `description:` | [text](/docs/search/#text) | Description
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `point:` | [text](/docs/search/#text) | Extension Point
| `updated:` | [date](/docs/search/#dates) | Updated
| `uri:` | [text](/docs/search/#text) | Uri
	
### Worklist Columns

These columns are available on package [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `p_description` | Description
| `p_id` | Id
| `p_name` | Name
| `p_point` | Extension Point
| `p_updated_at` | Updated
| `p_uri` | Uri

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>