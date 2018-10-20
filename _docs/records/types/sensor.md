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
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Sensor
| **Name (plural):** | Sensors
| **Alias:** | sensor

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in sensor [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `change:` | [Number](/docs/search/filters/numbers/) | Change
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `fail.count:` | [Number](/docs/search/filters/numbers/) | Fail Count
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isDisabled:` | [Boolean](/docs/search/filters/booleans/) | Is Disabled
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `metric:` | [Number](/docs/search/filters/numbers/) | Metric
| `metricType:` | [Text](/docs/search/filters/text/) | Metric Type
| `name:` | [Text](/docs/search/filters/text/) | Name
| `output:` | [Text](/docs/search/filters/text/) | Output
| `status:` | Virtual | Status
| `tag:` | [Text](/docs/search/filters/text/) | Tag
| `type:` | [Text](/docs/search/filters/text/) | Type
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in sensor [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `metric_delta` | Number | Change
| `id` | Number | Id
| `metric` | Text | Metric
| `metric_type` | Text | Metric Type
| `name` | Text | Name
| `output` | Text | Output
| `status` | Text | Status
| `tag` | Text | Tag
| `updated` | Date | Updated
