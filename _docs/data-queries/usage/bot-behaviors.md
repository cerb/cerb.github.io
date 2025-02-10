---
title: 'Data Queries: Bot Behavior Usage'
excerpt: This page provides information on data queries related to the historical
  usage of bot behaviors in Cerb, including metrics such as uses, average runtime,
  and total runtime over time.
summary: This page provides information on data queries related to the historical
  usage of bot behaviors in Cerb, including metrics such as uses, average runtime,
  and total runtime over time. It outlines the available response formats for these
  queries, which include a default tabular format for table visualizations and a timeseries
  format for time series visualizations. The page also includes an example of how
  to structure a query using the timeseries format.
permalink: /docs/data-queries/usage/bot-behaviors/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Bot Behavior Usage
jumbotron:
  title: Bot Behavior Usage
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Data Queries &raquo;
    url: /docs/data-queries/
---

# usage.behaviors
{: .no_toc}

`usage.behaviors` data queries return historical usage data for bot behaviors (e.g. uses, avg. runtime, and total runtime over time).

* TOC
{:toc}

# Inputs

(none)

# Response Formats

* **table** (default) returns tabular data (columns and rows) suitable for the "Chart: Table" visualization widget.

* **timeseries** returns series-based data suitable for the "Chart: Time Series" visualization widget (the x-axis values are timestamps).

# Examples

{% highlight cerb %}
{% raw %}
type:usage.behaviors
format:timeseries
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-bot-usage.png" class="screenshot">
</div>
