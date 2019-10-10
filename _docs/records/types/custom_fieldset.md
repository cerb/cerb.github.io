---
title: Custom Fieldset Records
permalink: /docs/records/types/custom_fieldset/
toc:
  title: Custom Fieldset
  expand: Records
jumbotron:
  title: Custom Fieldset
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
| **Name (singular):** | Custom Fieldset
| **Name (plural):** | Custom Fieldsets
| **Alias (uri):** | custom_fieldset
| **Identifier (ID):** | cerberusweb.contexts.custom_fieldset

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of the fieldset 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this custom fieldset 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this custom fieldset's owner: `app`, `role`, `group`, or `worker` 
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of this custom fieldset's owner 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `context` | text | Context
| `id` | number | Id
| `name` | text | Name
| `owner_` | record | Owner
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in custom fieldset [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [text](/docs/search/filters/text/) | Context
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `owner:` | virtual | Owner
| `owner.app:` | virtual | Owner
| `owner.bot:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on custom fieldset [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `c_context` | Context
| `c_name` | Name
| `c_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>