---
title: "Data Queries: Metrics Timeseries"
excerpt: 
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

`metrics.timeseries` [data queries](/docs/data-queries/) aggregates metrics statistics over a date range. This can retrieve multiple series each with a different metric and function (avg, sum, min, max, count). A series can also be aggregated or filtered by any combination of metric [dimensions](/docs/metrics/#dimensions).

{% comment %}
* **[Data Queries/Metrics]** On `metrics.timeseries` data queries, a new `series.*:missing:` key configures what to do with missing samples at a time interval. The options are `null` (default), `zero` (set to 0), or `carry` (carry the last sample).
{% endcomment %}

<pre>
<code class="language-cerb">
{% raw %}
type:metrics.timeseries 
{% endraw %}
</code>
</pre>