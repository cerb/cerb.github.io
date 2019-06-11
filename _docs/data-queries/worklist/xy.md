---
title: "Data Queries: Worklist X/Y"
excerpt: 
permalink: /docs/data-queries/worklist/xy/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist X/Y
jumbotron:
  title: Worklist X/Y
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.xy
{: .no_toc}

`worklist.xy` data queries plot two dimensional data to visualize clusters or correlations.

* TOC
{:toc}

# Inputs

Each `series.*` should provide:
* `label:` (human-friendly series name for visualizations)
* `of:` (record type)
* `x:` field(@year,month,day,hour,minute,second)
* `x.metric:` (an equation to apply to each x-axis value; [9.1.6](/releases/9.1.6/) or later)
* `y:` (field)
* `y.metric:` (an equation to apply to each y-axis value; [9.1.6](/releases/9.1.6/) or later)
* `query:` (the query to filter the results for this series)
* `query.required:` (the required query to filter the results for this series)

You can specify a `limit:` and `sort:` within each series `query:()`. Nested sorting is supported, and sorts can be in ascending or descending order by prefixing a minus (`-`) to the field name for descending.

# Response Formats

* **pie** format returns data for pie and donut charts. 

* **categories** returns series-based data suitable for bar charts.

* **scatterplot** (default) returns series-based data suitable for a scatterplot chart. 

* **table** returns data in a tabular (rows/columns) format suitable for "Chart: Table" visualization widgets.

# Examples

## Generate a table of the top 10 quickest message response times

<pre>
<code class="language-cerb">
type:worklist.xy
series.replies:(
  of:messages 
  x:worker
  y:responseTime 
  query:(
  	responseTime:>0
    sort:responseTime
    limit:10
  )
)
format:table
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-xy-replies.png" class="screenshot">
</div>
