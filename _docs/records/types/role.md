---
title: Role Records
permalink: /docs/records/types/role/
toc:
  title: Role
  expand: Records
jumbotron:
  title: Role
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
| **Name (singular):** | Role
| **Name (plural):** | Roles
| **Alias (uri):** | role
| **Identifier (ID):** | cerberusweb.contexts.role

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `editor_query_worker` | [text](/docs/records/fields/types/text/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `member_query_worker` | [text](/docs/records/fields/types/text/) |  
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this role 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `privs_mode` | [text](/docs/records/fields/types/text/) | ["", all, itemized] 
|   | `reader_query_worker` | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `editor_query_worker` | text | Editor Query
| `id` | number | Id
| `member_query_worker` | text | Member Query
| `name` | text | Name
| `privs_mode` | text | Privileges Mode
| `reader_query_worker` | text | Reader Query
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in role [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `editor:` | [record](/docs/search/deep-search/) | [Editor](/docs/records/types/worker/)
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `member:` | [record](/docs/search/deep-search/) | [Member](/docs/records/types/worker/)
| `name:` | [text](/docs/search/filters/text/) | Name
| `privsMode:` | [text](/docs/search/filters/text/) | Privileges Mode
| `reader:` | [record](/docs/search/deep-search/) | [Reader](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on role [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `w_editor_query_worker` | Editor Query
| `w_id` | Id
| `w_member_query_worker` | Member Query
| `w_name` | Name
| `w_privs_mode` | Privileges Mode
| `w_reader_query_worker` | Reader Query
| `w_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>