---
title: Domain Records
permalink: /docs/records/types/domain/
toc:
  title: Domain
  expand: Records
jumbotron:
  title: Domain
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
| **Name (singular):** | Domain
| **Name (plural):** | Domains
| **Alias (uri):** | domain
| **Identifier (ID):** | cerberusweb.contexts.datacenter.domain

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this domain 
|   | `server_id` | [number](/docs/records/fields/types/number/) | The ID of the [server](/docs/records/types/server/) linked to this domain 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `created` | date | Created
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `server_` | record | [Server](/docs/records/types/server/)
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `contacts` | records | Contacts
| `contacts_list` | text | Contacts List
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in domain [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `server:` | [record](/docs/search/deep-search/) | [Server](/docs/records/types/server/)
| `server.id:` | [chooser](/docs/search/filters/choosers/) | [Server](/docs/records/types/server/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on domain [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `w_created` | Created
| `w_id` | Id
| `w_name` | Name
| `w_server_id` | Server
| `w_updated` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>