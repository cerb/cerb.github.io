---
title: Automation Resource Records
permalink: /docs/records/types/automation_resource/
toc:
  title: Automation Resource
  expand: Records
jumbotron:
  title: Automation Resource
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
| **Name (singular):** | Automation Resource
| **Name (plural):** | Automation Resources
| **Alias (uri):** | automation_resource
| **Identifier (ID):** | cerb.contexts.automation.resource

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `mime_type` | [text](/docs/records/fields/types/text/) |  
|   | `name` | [text](/docs/records/fields/types/text/) | The name of this automation resource 
| **x** | **`token`** | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `id` | number | Id
| `mime_type` | text | Mime Type
| `name` | text | Name
| `record_url` | text | Record Url
| `size` | number | Size
| `token` | text | Token
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in automation resource [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `mimetype:` | [text](/docs/search/filters/text/) | Mime Type
| `name:` | [text](/docs/search/filters/text/) | Name
| `size:` | [number](/docs/search/filters/numbers/) | Size
| `token:` | [text](/docs/search/filters/text/) | Token
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on automation resource [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `r_id` | Id
| `r_mime_type` | Mime Type
| `r_name` | Name
| `r_storage_extension` | Common.storage_Extension
| `r_storage_key` | Common.storage_Key
| `r_storage_profile_id` | Common.storage_Profile_Id
| `r_storage_size` | Size
| `r_token` | Token
| `r_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>