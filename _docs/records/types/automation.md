---
title: Automation Records
permalink: /docs/records/types/automation/
toc:
  title: Automation
  expand: Records
jumbotron:
  title: Automation
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
| **Name (singular):** | Automation
| **Name (plural):** | Automations
| **Alias (uri):** | automation
| **Identifier (ID):** | cerb.contexts.automation

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `description` | [text](/docs/records/fields/types/text/) |  
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) |  
|   | `is_unlisted` | [boolean](/docs/records/fields/types/boolean/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `name` | [text](/docs/records/fields/types/text/) | The name of this automation 
|   | `policy_kata` | [text](/docs/records/fields/types/text/) |  
|   | `script` | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created_at` | date | Created
| `description` | text | Description
| `extension_id` | text | Trigger
| `extension_params` |  | Trigger Params
| `id` | number | Id
| `is_unlisted` | boolean | Unlisted
| `name` | text | Name
| `policy_kata` | text | Policy
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in automation [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isUnlisted:` | [boolean](/docs/search/filters/booleans/) | Unlisted
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `trigger:` | [text](/docs/search/filters/text/) | Extension
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on automation [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `a_created_at` | Created
| `a_description` | Description
| `a_extension_id` | Extension
| `a_id` | Id
| `a_is_unlisted` | Unlisted
| `a_name` | Name
| `a_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>