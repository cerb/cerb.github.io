---
title: Profile Widget Records
permalink: /docs/records/types/profile_widget/
toc:
  title: Profile Widget
  expand: Records
jumbotron:
  title: Profile Widget
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
| **Name (singular):** | Profile Widget
| **Name (plural):** | Profile Widgets
| **Alias (uri):** | profile_widget
| **Identifier (ID):** | cerberusweb.contexts.profile.widget

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) | [Profile Widget Type](/docs/plugins/extensions/points/cerb.profile.widget/) 
|   | `extension_params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this profile widget 
|   | `pos` | [number](/docs/records/fields/types/number/) | The order of the widget on the profile; `0` is first (top-left) proceeding in rows then columns 
| **x** | **`profile_tab_id`** | [number](/docs/records/fields/types/number/) | The ID of the [profile tab](/docs/records/types/profile_tab/) dashboard containing this widget 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `width_units` | [number](/docs/records/fields/types/number/) | `1` (25%), `2` (50%), `3` (75%), `4` (100%) 
|   | `zone` | [text](/docs/records/fields/types/text/) | The name of the dashboard zone containing the widget; this varies by layout; generally `sidebar` and `content` 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `extension_id` | extension | Extension
| `id` | number | Id
| `name` | text | Name
| `pos` | number | Order
| `profile_tab_` | record | [Tab](/docs/records/types/profile_tab/)
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `width_units` | number | Width
| `zone` | text | Zone

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in profile widget [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `pos:` | [number](/docs/search/filters/numbers/) | Order
| `tab:` | [record](/docs/search/deep-search/) | [Tab](/docs/records/types/profile_tab/)
| `tab.id:` | [chooser](/docs/search/filters/choosers/) | [Tab](/docs/records/types/profile_tab/)
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `width:` | [number](/docs/search/filters/numbers/) | Width Units
| `zone:` | [text](/docs/search/filters/text/) | Zone
	
### Worklist Columns

These columns are available on profile widget [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `p_extension_id` | Type
| `p_id` | Id
| `p_name` | Name
| `p_pos` | Order
| `p_profile_tab_id` | Tab
| `p_updated_at` | Updated
| `p_width_units` | Width Units
| `p_zone` | Zone

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>