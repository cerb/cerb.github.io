---
title: "Data Queries: Worklist Subtotals"
excerpt: 
permalink: /docs/data-queries/worklist/subtotals/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist Subtotals
jumbotron:
  title: Worklist Subtotals
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.subtotals
{: .no_toc}

`worklist.subtotals` data queries run aggregate functions against worklist data. Subtotals can be nested to any depth (e.g. _"tickets by top 10 owners by status"_).

* TOC
{:toc}

# Inputs

Histograms can be created for date-based fields by appending a unit of time (e.g. `@year`, `@month`, `@day`) to the field name.

<pre>
<code class="language-text">
{% raw %}
type:worklist.subtotals 
of:tickets 
by:[created@month,group] 
format:timeseries
{% endraw %}
</code>
</pre>

The `by:` fields can specify a 'limit' and 'order'. These can be different for each set of nested subtotals. For instance, `by:[created@month~10,org~25]` returns records grouped by the top 10 created months, subgrouped by top 25 organizations for each month. Similarly, `by:[group~-3]` returns the "bottom" 3 groups (least frequently used).

The `by:` fields can specify `links` or `links.*` (e.g. `links.org`) fields. This could create a report like _"Sum of time tracking entries linked to organizations by month"_.

A `function:` field may be provided with one of the following options: `count`, `avg`, `sum`, `min`, `max`. Count is the default. This affects the metric returned in the last subtotaled group (e.g. _"Average first response time by worker by month"_).

# Response Formats

* **tree** (default) returns hierarchal data (a `name` and `value` for each node, and a list of `children` for branches).

* **categories** returns a series-based format suitable for bar charts.

* **pie** returns data for use in pie and donut charts. 

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget. When nested 
subtotals are used, a row is returned for each distinct result (e.g. Support -> Kina, Support -> Janey).

* **timeseries** returns series-based data suitable for a time-series chart (with the 'x' axis values as timestamps). 

# Examples

## Return a stacked bar chart of tickets by owner by status

<pre>
<code class="language-text">
type:worklist.subtotals
of:tickets 
by:[owner~10,status] 
query:(owner.id:any) 
format:categories
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-subtotals-owner-status.png" class="screenshot">
</div>
