---
title: Workspace Worklist Records
permalink: /docs/records/types/workspace_list/
toc:
  title: Workspace Worklist
  expand: Records
jumbotron:
  title: Workspace Worklist
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
| **Name (singular):** | Workspace Worklist
| **Name (plural):** | Workspace Worklists
| **Alias (uri):** | workspace_list
| **Identifier (ID):** | cerberusweb.contexts.workspace.list

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `columns` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value array of column names 
| **x** | **`context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of the worklist 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this workspace worklist 
|   | `options` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `params_required_query` | [text](/docs/records/fields/types/text/) | The [search query](/docs/search/) for required filters 
|   | `pos` | [number](/docs/records/fields/types/number/) | The order of the worklist on the workspace tab; `0` is first 
| **x** | **`render_limit`** | [number](/docs/records/fields/types/number/) | The number of records per page 
| **x** | **`tab_id`** | [number](/docs/records/fields/types/number/) | The ID of the [workspace tab](/docs/records/types/workspace_tab/) containing this worklist 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `columns` | object | Columns
| `context` | text | Context
| `id` | number | Id
| `name` | text | Name
| `options` | object | Options
| `params` | object | Params
| `pos` | number | Order
| `record_url` | text | Record Url
| `render_limit` | number | Render Limit
| `render_sort` | object | Sort
| `render_subtotals` | text | Subtotals
| `tab_` | record | [Tab](/docs/records/types/workspace_tab/)
| `tab_extension_` | record | Tab Type
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in workspace worklist [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `tab.id:` | [chooser](/docs/search/filters/choosers/) | [Workspace Tab](/docs/records/types/workspace_tab/)
| `tab.pos:` | [number](/docs/search/filters/numbers/) | Order
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on workspace worklist [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `w_context` | Type
| `w_id` | Id
| `w_name` | Name
| `w_updated_at` | Updated
| `w_workspace_tab_id` | Workspace Tab
| `w_workspace_tab_pos` | Order

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>