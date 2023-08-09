---
title: Project Board Column Records
permalink: /docs/records/types/project_board_column/
toc:
  title: Project Board Column
  expand: Records
jumbotron:
  title: Project Board Column
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
| **Name (singular):** | Project Board Column
| **Name (plural):** | Project Board Columns
| **Alias (uri):** | project_board_column
| **Identifier (ID):** | cerberusweb.contexts.project.board.column

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`board_id`** | [number](/docs/records/fields/types/number/) | The [project board](/docs/records/types/project_board/) containing this column 
|   | `cards` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to add to this column 
|   | `cards_kata` | [text](/docs/records/fields/types/text/) |  
|   | `functions_kata` | [text](/docs/records/fields/types/text/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this project board column 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `toolbar_kata` | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `board_` | record | [Project Board](/docs/records/types/project_board/)
| `cards_kata` | text | Cards Kata
| `functions_kata` | text | Functions Kata
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `toolbar_kata` | text | Toolbar Kata
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
| `watchers` | watchers | [Watchers](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in project board column [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `board:` | [record](/docs/search/#deep-search) | [Board](/docs/records/types/project_board/)
| `board.id:` | [chooser](/docs/search/#choosers) | [Project Board](/docs/records/types/project_board/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `updated:` | [date](/docs/search/#dates) | Updated
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on project board column [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `p_board_id` | Project Board
| `p_id` | Id
| `p_name` | Name
| `p_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>