---
title: Custom Field Records
permalink: /docs/records/types/custom_field/
toc:
  title: Custom Field
  expand: Records
jumbotron:
  title: Custom Field
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
| **Name (singular):** | Custom Field
| **Name (plural):** | Custom Fields
| **Alias (uri):** | custom_field
| **Identifier (ID):** | cerberusweb.contexts.custom_field

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-type) to add the field to 
|   | `custom_fieldset_id` | [number](/docs/records/fields/types/number/) | The ID of the parent [custom fieldset](/docs/records/types/custom_fieldset/); if any 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this custom field 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `pos` | [number](/docs/records/fields/types/number/) | Display order; positive integer; `0` is first 
| **x** | **`type`** | [text](/docs/records/fields/types/text/) | `C` (checkbox), `D` (picklist), `E` (date), `F` (file), `I` (files), `L` (record link), `M` (list), `N` (number), `O` (decimal), `S` (single line of text), `T` (multiple lines of text), `U` (url), `W` (worker), `X` (multiple checkboxes), `Y` (currency) 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | The unique alias for this custom field 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `context` | text | Context
| `id` | number | Id
| `name` | text | Name
| `pos` | number | Order
| `search_filter` | text | Search Filter Name
| `type` | text | Type
| `type_label` | text | Type Label
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in custom field [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [text](/docs/search/#text) | Context
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `fieldset.id:` | [chooser](/docs/search/#choosers) | [Custom Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `pos:` | [number](/docs/search/#numbers) | Order
| `type:` | [text](/docs/search/#text) | Type
| `updated:` | [date](/docs/search/#dates) | Updated
| `uri:` | [text](/docs/search/#text) | Uri
	
### Worklist Columns

These columns are available on custom field [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_context` | Context
| `c_custom_fieldset_id` | Custom Fieldset
| `c_id` | Id
| `c_name` | Name
| `c_pos` | Order
| `c_type` | Type
| `c_updated_at` | Updated
| `c_uri` | Uri

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>