---
title: Profile Tab Records
permalink: /docs/records/types/profile_tab/
toc:
  title: Profile Tab
  expand: Records
jumbotron:
  title: Profile Tab
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
| **Name (singular):** | Profile Tab
| **Name (plural):** | Profile Tabs
| **Alias (uri):** | profile_tab
| **Identifier (ID):** | cerberusweb.contexts.profile.tab

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-types) to add the profile tab to 
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) | [Profile Tab Type](/docs/plugins/extensions/points/cerb.profile.tab/) 
|   | `extension_params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this profile tab 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `context` | context | Record
| `extension_id` | extension | Type
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in profile tab [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `record:` | [text](/docs/search/filters/text/) | Record
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Workist Columns

These columns are available on profile tab [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `p_context` | Record
| `p_extension_id` | Type
| `p_id` | Id
| `p_name` | Name
| `p_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>