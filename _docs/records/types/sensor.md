---
title: Sensor Records
permalink: /docs/records/types/sensor/
toc:
  title: Sensor
  expand: Records
jumbotron:
  title: Sensor
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
| **Name (singular):** | Sensor
| **Name (plural):** | Sensors
| **Alias (uri):** | sensor
| **Identifier (ID):** | cerberusweb.contexts.datacenter.sensor

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `metric` | [text](/docs/records/fields/types/text/) | The metric's raw value 
|   | `metric_delta` | [text](/docs/records/fields/types/text/) | The change in the metric between the last two samples 
|   | `metric_type` | [text](/docs/records/fields/types/text/) | The metric's type 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this sensor 
|   | `output` | [text](/docs/records/fields/types/text/) | The metric's displayed value 
|   | `status` | [text](/docs/records/fields/types/text/) | `O` (OK), `W` (Warning), `C` (Critical) 
|   | `tag` | [text](/docs/records/fields/types/text/) | A human-friendly nickname for this sensor 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `id` | number | Id
| `metric` | text | Metric
| `metric_delta` | number | Change
| `metric_type` | text | Metric Type
| `name` | text | Name
| `output` | text | Output
| `status` | text | Status
| `tag` | text | Tag
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in sensor [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `change:` | [number](/docs/search/filters/numbers/) | Change
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `fail.count:` | [number](/docs/search/filters/numbers/) | Fail Count
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isDisabled:` | [boolean](/docs/search/filters/booleans/) | Is Disabled
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `metric:` | [number](/docs/search/filters/numbers/) | Metric
| `metricType:` | [text](/docs/search/filters/text/) | Metric Type
| `name:` | [text](/docs/search/filters/text/) | Name
| `output:` | [text](/docs/search/filters/text/) | Output
| `status:` | virtual | Status
| `tag:` | [text](/docs/search/filters/text/) | Tag
| `type:` | [text](/docs/search/filters/text/) | Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on sensor [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `ftcc_content` | Comment Content
| `p_extension_id` | Type
| `p_fail_count` | Fail Count
| `p_is_disabled` | Is Disabled
| `p_metric` | Metric
| `p_metric_delta` | Change
| `p_metric_type` | Metric Type
| `p_name` | Name
| `p_output` | Output
| `p_status` | Status
| `p_tag` | Tag
| `p_updated` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>