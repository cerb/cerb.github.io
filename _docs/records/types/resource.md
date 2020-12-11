---
title: Resource Records
permalink: /docs/records/types/resource/
toc:
  title: Resource
  expand: Records
jumbotron:
  title: Resource
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

{% include docs/note_preview.html %}

|---
|-|-
| **Name (singular):** | Resource
| **Name (plural):** | Resources
| **Alias (uri):** | resource
| **Identifier (ID):** | cerb.contexts.resource

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `automation_kata` | [text](/docs/records/fields/types/text/) |  
|   | `description` | [text](/docs/records/fields/types/text/) |  
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) |  
|   | `is_dynamic` | [boolean](/docs/records/fields/types/boolean/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this resource 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `automation_kata` | text | Automation
| `description` | text | Description
| `extension_id` | text | Type
| `id` | number | Id
| `is_dynamic` | boolean | Is Dynamic
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
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in resource [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `description:` | [text](/docs/search/filters/text/) | Description
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isDynamic:` | [boolean](/docs/search/filters/booleans/) | Is Dynamic
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `size:` | [number](/docs/search/filters/numbers/) | Size
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on resource [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `r_description` | Description
| `r_extension_id` | Type
| `r_id` | Id
| `r_is_dynamic` | Is Dynamic
| `r_name` | Name
| `r_storage_extension` | Common.storage_Extension
| `r_storage_key` | Common.storage_Key
| `r_storage_profile_id` | Common.storage_Profile_Id
| `r_storage_size` | Size
| `r_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>