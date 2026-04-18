---
title: Automation Event Listener Records
excerpt: This page provides detailed information about Automation Event Listener records
  in Cerb.
summary: This page provides detailed information about Automation Event Listener records
  in Cerb. It covers the fields available in the Records API, including required fields
  like `event_name` and `name`, and optional fields such as `event_kata`, `is_disabled`,
  and `priority`. The page also outlines dictionary placeholders for use in automations,
  snippets, and API responses, offering a range of fields like `event_name`, `id`,
  and `updated_at`. Additionally, it describes search query fields that can be used
  to filter automation event listener records, such as `created:`, `event:`, and `isDisabled:`.
  Lastly, it lists the worklist columns available for displaying these records, including
  `a_created_at`, `a_event_name`, and `a_priority`. This comprehensive guide is essential
  for managing and utilizing automation event listeners within Cerb.
permalink: /docs/records/types/automation_event_listener/
toc:
  title: Automation Event Listener
  expand: Records
jumbotron:
  title: Automation Event Listener
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

**Automation event listeners** bind [automations](/docs/automations/) to [events](/docs/automations/#events). When Cerb broadcasts an event (e.g. a message is received, a record changes), all non-disabled listeners for that event run their bound automations in [priority](/docs/automations/#priority) order.

See [Events](/docs/automations/#events) for a conceptual overview including the `event_kata` format and priority rules.

|---
|-|-
| **Name (singular):** | Automation Event Listener
| **Name (plural):** | Automation Event Listeners
| **Alias (uri):** | automation_event_listener
| **Identifier (ID):** | cerb.contexts.automation.event.listener

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `event_kata` | [text](/docs/records/fields/types/text/) |  
| **x** | **`event_name`** | [text](/docs/records/fields/types/text/) |  
|   | `is_disabled` | [number](/docs/records/fields/types/number/) | (0-1) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this automation event listener 
|   | `priority` | [number](/docs/records/fields/types/number/) | (0-255) 
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
| `event_kata` | text | Event Kata
| `event_name` | text | Automation Event
| `id` | number | Id
| `is_disabled` | boolean | Disabled
| `name` | text | Name
| `priority` | number | Priority
| `record_url` | text | Record Url
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

These [filters](/docs/search/#filters) are available in automation event listener [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Created
| `event:` | [text](/docs/search/#text) | Event
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `isDisabled:` | [boolean](/docs/search/#booleans) | Disabled
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `priority:` | [number](/docs/search/#numbers) | Priority
| `updated:` | [date](/docs/search/#dates) | Updated
| `workflow.id:` | [chooser](/docs/search/#choosers) | [Workflow](/docs/records/types/workflow/)
	
### Worklist Columns

These columns are available on automation event listener [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `a_created_at` | Created
| `a_event_name` | Event
| `a_id` | Id
| `a_is_disabled` | Disabled
| `a_name` | Name
| `a_priority` | Priority
| `a_updated_at` | Updated
| `a_workflow_id` | Workflow
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>