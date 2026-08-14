---
title: 'Data Queries: Metrics Subtotals'
excerpt: Return flat metric subtotals read directly from samples, rather than values over time.
summary: This page documents the `metrics.subtotals` data query in Cerb. It is the inverse projection of `metrics.timeseries` -- instead of returning values plotted over time, it returns flat subtotals keyed by the raw dimension values. That makes it useful for ranking (which groups have the most open tickets), for feeding a pie or bar chart that has no time axis, and for composition, since the raw dimension values it returns can be used in a subquery worklist filter. The page covers its keys, the date range, series definition, dimension filters, and how it differs from metrics.timeseries.
permalink: /docs/data-queries/metrics/subtotals/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Metrics Subtotals
jumbotron:
  title: Metrics Subtotals
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Data Queries &raquo;
    url: /docs/data-queries/
---

# metrics.subtotals
{:.no_toc}

`metrics.subtotals` [data queries](/docs/data-queries/) return flat subtotals for a [metric](/docs/metrics/), read directly from its samples.

This is the **inverse projection** of [`metrics.timeseries`](/docs/data-queries/metrics/timeseries/). Where that query returns values plotted over time, this one collapses the time axis and returns totals keyed by the raw dimension values.

That makes it the right query when you want to:

* **Rank** -- which groups have the most open tickets, which automations run most often
* **Chart without a time axis** -- a pie or bar chart of the current distribution
* **Compose** -- because it returns the raw dimension values, the result can feed a subquery [worklist](/docs/worklists/) filter

* TOC
{:toc}

# Syntax

{% highlight cerb %}
{% raw %}
type:metrics.subtotals
range:"last 30 days"
series.open:(
  label:Open
  metric:cerb.tickets.open
  by:group_id
  function:average
)
{% endraw %}
{% endhighlight %}

| Key       | Notes
|-|-
| `range:`  | The date range to read samples from
| `series.*` | One or more series, each naming a metric and how to aggregate it
| `timeout:` | Abort after this many milliseconds
| `timezone:` | Shift timestamps when bucketing samples
| `format:` | The output shape

## series.*

| Key         | Notes
|-|-
| `metric:`   | The [metric](/docs/metrics/) name
| `by:`       | A comma-separated list of [dimension](/docs/metrics/#dimensions) keys to group by
| `function:` | `sum`, `min`, `max`, `average`, `samples`, `distinct`, and the `faceted_*` variants
| `label:`    | An optional display label
| `query:`    | An optional filter using dimension keys

### series.*.query:

Dimension filters work as they do in [`metrics.timeseries`](/docs/data-queries/metrics/timeseries/#seriesquery), including negation:

{% highlight text %}
query:(group_id:!1)
{% endhighlight %}

Record-based dimensions can use [deep search filters](/docs/search/).

# Choosing between subtotals and timeseries

|---
| Question | Query
|-|-
| How has this changed over time? | [`metrics.timeseries`](/docs/data-queries/metrics/timeseries/)
| What are the totals right now, by dimension? | `metrics.subtotals`

If the result is going into a chart with a time axis, you want `metrics.timeseries`. If it's going into a pie chart, a ranked table, or another query, you want `metrics.subtotals`.
