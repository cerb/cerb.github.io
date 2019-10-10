---
title: Connected Account Records
permalink: /docs/records/types/connected_account/
toc:
  title: Connected Account
  expand: Records
jumbotron:
  title: Connected Account
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
| **Name (singular):** | Connected Account
| **Name (plural):** | Connected Accounts
| **Alias (uri):** | connected_account
| **Identifier (ID):** | cerberusweb.contexts.connected_account

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this connected account 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this connected account's owner: `app`, `role`, `group`, or `worker` 
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of this connected account's owner 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `service_id` | [number](/docs/records/fields/types/number/) | [Service Provider](/docs/plugins/extensions/points/cerb.connected_service.provider/) 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `id` | number | Id
| `name` | text | Name
| `owner_` | record | Owner
| `record_url` | text | Record Url
| `service` | text | Service Provider
| `service_` | record | [Service](/docs/records/types/connected_service/)
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in connected account [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `owner:` | virtual | Owner
| `owner.app:` | virtual | Owner
| `owner.bot:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `service:` | [text](/docs/search/filters/text/) | Service Provider
| `service.id:` | [chooser](/docs/search/filters/choosers/) | [Service Provider](/docs/records/types/connected_service/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on connected account [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `c_created_at` | Created
| `c_id` | Id
| `c_name` | Name
| `c_service_id` | Service Provider
| `c_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>