---
title: "Data Queries: Metrics Timeseries"
excerpt: Metrics aggregate, store, and compute statistics for time-based data.
permalink: /docs/data-queries/metrics/timeseries/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Metrics Timeseries
jumbotron:
  title: Metrics Timeseries
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# metrics.timeseries
{:.no_toc}

`metrics.timeseries` [data queries](/docs/data-queries/) aggregates [metrics](/docs/metrics/) statistics over a date range. This can retrieve multiple series each with a different metric and function (avg, sum, min, max, count). A series can also be aggregated or filtered by any combination of metric [dimensions](/docs/metrics/#dimensions).

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-metrics-timeseries.png" class="screenshot">
</div>

<pre>
<code class="language-cerb">
{% raw %}
type:metrics.timeseries
period:hour
range:"-24 hours to now"
series.avg:(
  label:Average
  metric:cerb.tickets.open
  function:avg
)
series.min:(
  label:Min
  metric:cerb.tickets.open
  function:min
)
series.avg:(
  label:Max
  metric:cerb.tickets.open
  function:max
)
timezone:Europe/Berlin
format:timeseries
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# period:

The [period](/docs/metrics/#periods) is the metric's level of detail:

|---
| `minute` | 5-minute statistics (up to the past 24 hours)
| `hour` | hourly statistics (up to the past 2 weeks) 
| `day` | daily statistics (no limit)
| `week` | weekly statistics (no limit)
| `month` | monthly statistics (no limit)
| `year` | yearly statistics (no limit)

# range:

The date range to show statistics for, grouped by the `period`.

|---
| `this week`
| `this month`
| `-1 year`
| `Jan 1 2025 to Dec 31 2025`

# series.*:

Each `series.*` series should provide:

|---
| Key | Description
|-|-
| `metric:` | The [metric](/docs/metrics/) name
| `by:` | A comma-separated list of [dimension](/docs/metrics/#dimensions) keys to group by
| `function:` | `sum`, `min`, `max`, `average`, `samples`
| `label:` | A human-readable label for this series
| `missing:` | How to handle missing sample periods: `null` (default), `zero` (set to 0), or `carry` (carry the last sample)
| `query:` | An optional query using [dimension](/docs/metrics/#dimensions) keys to filter samples

{% comment %}
* `label:` (human-friendly series name for visualizations)
* `of:` (record type)
* `field:` (record field using quick search keys)
* `function:` (count,min,max,average,sum)
* `metric:` (an equation to apply to each value; [9.1.6](/releases/9.1.6/) or later)
* `query:` (the query to filter the results for this series)
* `query.required:` (the required query to filter the results for this series)

Optionally, multiple functions can be specified for a series, like `functions:[sum,average]`, and multiple series will be generated automatically using the same record type, field, and query.
{% endcomment %}

# timeout:

The query will be aborted after this many milliseconds have elapsed with no response.

The default is **20000** milliseconds (20 seconds).

# timezone:

Statistics are stored in GMT/UTC. The `timezone:` location shifts timestamps when grouping metrics by `period`.

For example:

|---
| `America/Los_Angeles`
| `Europe/Berlin`
| `Asia/Tokyo`

If omitted, this defaults to the timezone of the current worker or the server.

# format:

The metric results can be returned in various formats:

|---
| Format
|-
| `timeseries` | Returns series-based data suitable for a time-series chart (with the 'x' axis values as timestamps)
