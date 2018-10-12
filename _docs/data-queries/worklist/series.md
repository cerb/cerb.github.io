---
title: "Data Queries: Worklist Series"
excerpt: 
permalink: /docs/data-queries/worklist/series/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist Series
jumbotron:
  title: Worklist Series
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.series
{: .no_toc}

`worklist.series` data queries return series-based data from any worklist (e.g. tickets created by month by status). Data from multiple series of different record types can be returned in a single query.

* TOC
{:toc}

# Inputs

Each `series.*` should provide:
* `label:` (human-friendly series name for visualizations)
* `of:` (record type)
* `x:` (record field for the x-axis using quick search keys)
* `y:` (record field for the y-axis using quick search keys)
* `function:` (count,min,max,average,sum on `y:` field)
* `query:` (the query to filter the results for this series)

# Response Formats

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget.

* **timeseries** (default) returns time-based series data, suitable for display with the 'Chart: Time Series' visualization widget.

# Examples

## Return series data from a worklist

<pre>
<code class="language-text">
type:worklist.series 
series.open_tickets:(
  of:tickets 
  x:created@month 
  y:id 
  function:count 
  query:(status:o)
) 
series.closed_tickets:(
  of:tickets 
  x:created@month 
  y:id 
  function:count 
  query:(status:c)
)
format:timeseries
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-timeseries-created.png" class="screenshot">
</div>