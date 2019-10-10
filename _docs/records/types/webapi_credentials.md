---
title: Web Api Credentials Records
permalink: /docs/records/types/webapi_credentials/
toc:
  title: Web Api Credentials
  expand: Records
jumbotron:
  title: Web Api Credentials
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
| **Name (singular):** | Api Key
| **Name (plural):** | Api Keys
| **Alias (uri):** | webapi_credentials
| **Identifier (ID):** | cerberusweb.contexts.webapi.credential

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this api key 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`worker_id`** | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) who owns these API credentials 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `access_key` | text | Access Key
| `id` | number | Id
| `name` | text | Name
| `params` | object | Params
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `worker_` | record | [Worker](/docs/records/types/worker/)

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in web api credentials [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `accessKey:` | [text](/docs/search/filters/text/) | Access Key
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `name:` | [text](/docs/search/filters/text/) | Name
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `worker:` | [record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on web api credentials [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `w_access_key` | Access Key
| `w_name` | Name
| `w_updated_at` | Updated
| `w_worker_id` | Worker

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>