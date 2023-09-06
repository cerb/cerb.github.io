---
title: OAuth App Records
permalink: /docs/records/types/oauth_app/
toc:
  title: OAuth App
  expand: Records
jumbotron:
  title: OAuth App
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
| **Name (singular):** | Oauth App
| **Name (plural):** | Oauth Apps
| **Alias (uri):** | oauth_app
| **Identifier (ID):** | cerberusweb.contexts.oauth.app

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`callback_url`** | [url](/docs/records/fields/types/url/) | The OAuth2 callback URL of the app 
| **x** | **`client_id`** | [text](/docs/records/fields/types/text/) | The client identifier of the app 
| **x** | **`client_secret`** | [text](/docs/records/fields/types/text/) | The client secret of the app 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this oauth app 
|   | `scopes` | [text](/docs/records/fields/types/text/) | The app's available scopes in YAML format 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `url` | [url](/docs/records/fields/types/url/) | The app's URL 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `callback_url` | text | Callback Url
| `client_id` | text | Client Id
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `scopes` | text | Scopes
| `updated_at` | date | Updated
| `url` | text | Url

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in oauth app [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `callbackUrl:` | [text](/docs/search/#text) | Callback Url
| `clientId:` | [text](/docs/search/#text) | Client Id
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `updated:` | [date](/docs/search/#dates) | Updated
| `url:` | [text](/docs/search/#text) | Url
	
### Worklist Columns

These columns are available on oauth app [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `o_callback_url` | Callback Url
| `o_client_id` | Client Id
| `o_id` | Id
| `o_name` | Name
| `o_scopes` | Scopes
| `o_updated_at` | Updated
| `o_url` | Url

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>