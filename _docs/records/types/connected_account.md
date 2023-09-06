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
|   | `uri` | [text](/docs/records/fields/types/text/) |  

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `id` | number | Id
| `name` | text | Name
| `owner_` | record | Owner
| `record_url` | text | Record Url
| `service` | text | Service Provider
| `service_` | record | [Service](/docs/records/types/connected_service/)
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in connected account [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `owner:` | virtual | Owner
| `owner.app:` | virtual | Owner
| `owner.bot:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/group/)
| `owner.role:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/worker/)
| `service:` | [record](/docs/search/#deep-search) | [Service](/docs/records/types/connected_service/)
| `service.id:` | [chooser](/docs/search/#choosers) | [Service Provider](/docs/records/types/connected_service/)
| `updated:` | [date](/docs/search/#dates) | Updated
| `uri:` | [text](/docs/search/#text) | Uri
	
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
| `c_uri` | Uri
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>