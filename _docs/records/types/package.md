---
title: Package Records
permalink: /docs/records/types/package/
toc:
  title: Package
  expand: Records
jumbotron:
  title: Package
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
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this package 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
| **x** | **`point`** | [text](/docs/records/fields/types/text/) | The library section containing this package 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | The unique identifier of this package 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `description` | text | Description
| `id` | number | Id
| `name` | text | Name
| `point` | text | Extension Point
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in package [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `description:` | [text](/docs/search/filters/text/) | Description
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `point:` | [text](/docs/search/filters/text/) | Extension Point
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `uri:` | [text](/docs/search/filters/text/) | Uri
	
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