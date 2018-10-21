---
title: Workspace Tab Records
permalink: /docs/records/types/workspace_tab/
toc:
  title: Workspace Tab
  expand: Records
jumbotron:
  title: Workspace Tab
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
    url: /docs/records/#record-types
---

|---
|-|-
| **Name (singular):** | Workspace Tab
| **Name (plural):** | Workspace Tabs
| **Alias (uri):** | workspace_tab
| **Identifier (ID):** | cerberusweb.contexts.workspace.tab

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) | The [plugin](/docs/plugins/) extension 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this workspace tab 
| **x** | **`page_id`** | [number](/docs/records/fields/types/number/) | The ID of the [workspace page](/docs/records/types/workspace_page/) containing this tab 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `pos` | [number](/docs/records/fields/types/number/) | The position of this tab on the workspace page; `0` is first 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `extension_` | record | Type
| `extension_id` | text | Extension Id
| `id` | number | Id
| `name` | text | Name
| `order` | number | Order
| `page_` | record | [Page](/docs/records/types/workspace_page/)
| `page_extension_` | record | Page Type
| `page_owner_` | record | Page Owner
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `widgets` | records | Widgets
| `widgets_data` | hashmap | Widgets Data
| `worklists` | records | Worklists
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in workspace tab [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `page.id:` | [chooser](/docs/search/filters/choosers/) | [Workspace Page](/docs/records/types/workspace_page/)
| `pos:` | [number](/docs/search/filters/numbers/) | Order
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Workist Columns

These columns are available on workspace tab [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `w_extension_id` | Type
| `w_id` | Id
| `w_name` | Name
| `w_pos` | Order
| `w_updated_at` | Updated
| `w_workspace_page_id` | Workspace Page

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>