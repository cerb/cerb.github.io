---
title: Snippet Records
permalink: /docs/records/types/snippet/
toc:
  title: Snippet
  expand: Records
jumbotron:
  title: Snippet
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
    url: /docs/records/#record-types
---

|---
|-|-
| **Name (singular):** | Snippet
| **Name (plural):** | Snippets
| **Alias (uri):** | snippet
| **Identifier (ID):** | cerberusweb.contexts.snippet

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`content`** | [text](/docs/records/fields/types/text/) | The [template](/docs/bots/scripting/) of the snippet 
|   | `context` | [text](/docs/records/fields/types/text/) | The [record type](/docs/records/#record-types) to add the profile tab to 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-types) of this snippet's owner: `app`, `role`, `group`, or `worker` 
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of this snippet's owner 
|   | `placeholders` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
| **x** | **`title`** | [text](/docs/records/fields/types/text/) | The name of the snippet 
|   | `total_uses` | [number](/docs/records/fields/types/number/) | The total number of times this snippet has been used by all workers 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `content` | text | Content
| `context` | text | Context
| `id` | number | Id
| `owner_` | record | Owner
| `title` | text | Title
| `total_uses` | number | All Uses
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in snippet [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `content:` | [text](/docs/search/filters/text/) | Content
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `owner:` | virtual | Owner
| `owner.app:` | virtual | Owner
| `owner.bot:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `title:` | [text](/docs/search/filters/text/) | Title
| `totalUses:` | [number](/docs/search/filters/numbers/) | All Uses
| `type:` | virtual | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `usableBy.worker:` | [chooser](/docs/search/filters/choosers/) | [Usableby Worker](/docs/records/types/worker/)
	
### Workist Columns

These columns are available on snippet [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `s_context` | Type
| `s_title` | Title
| `s_total_uses` | All Uses
| `s_updated_at` | Updated
| `suh_my_uses` | My Uses

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>