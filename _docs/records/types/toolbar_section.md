---
title: Toolbar Section Records
permalink: /docs/records/types/toolbar_section/
toc:
  title: Toolbar Section
  expand: Records
jumbotron:
  title: Toolbar Section
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
| **Name (singular):** | Toolbar Section
| **Name (plural):** | Toolbar Sections
| **Alias (uri):** | toolbar_section
| **Identifier (ID):** | cerb.contexts.toolbar.section

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this toolbar section 
|   | `priority` | [number](/docs/records/fields/types/number/) | (0-255) 
|   | `toolbar_kata` | [text](/docs/records/fields/types/text/) |  
| **x** | **`toolbar_name`** | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `workflow_id` | [number](/docs/records/fields/types/number/) |  

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created_at` | date | Created
| `id` | number | Id
| `name` | text | Name
| `priority` | text | Priority
| `record_url` | text | Record Url
| `toolbar_kata` | text | Toolbar Kata
| `toolbar_name` | text | Toolbar
| `updated_at` | date | Updated
| `workflow_id` | number | Common.workflow.id

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in toolbar section [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `isDisabled:` | [boolean](/docs/search/#booleans) | Disabled
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `priority:` | [number](/docs/search/#numbers) | Priority
| `toolbar:` | [text](/docs/search/#text) | Toolbar
| `updated:` | [date](/docs/search/#dates) | Updated
| `workflow.id:` | [chooser](/docs/search/#choosers) | [Workflow](/docs/records/types/workflow/)
	
### Worklist Columns

These columns are available on toolbar section [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `t_created_at` | Created
| `t_id` | Id
| `t_is_disabled` | Disabled
| `t_name` | Name
| `t_priority` | Priority
| `t_toolbar_name` | Toolbar
| `t_updated_at` | Updated
| `t_workflow_id` | Workflow

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>