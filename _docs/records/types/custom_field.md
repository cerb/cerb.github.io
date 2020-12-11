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
| **x** | **`type`** | [text](/docs/records/fields/types/text/) | `C` (checkbox)<br>`D` (picklist)<br>`E` (date)<br>`F` (file)<br>`I` (files)<br>`L` (record link)<br>`M` (list)<br>`N` (number)<br>`O` (decimal)<br>`S` (single line of text)<br>`T` (multiple lines of text)<br>`U` (url)<br>`W` (worker)<br>`X` (multiple checkboxes)<br>`Y` (currency)<br> 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | The unique alias for this custom field 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `context` | text | Context
| `id` | number | Id
| `name` | text | Name
| `pos` | number | Order
| `type` | text | Type
| `type_label` | text | Type Label
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in custom field [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [text](/docs/search/filters/text/) | Context
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `fieldset.id:` | [chooser](/docs/search/filters/choosers/) | [Custom Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `pos:` | [number](/docs/search/filters/numbers/) | Order
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `uri:` | [text](/docs/search/filters/text/) | Uri
	
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