---
title: Data Queries
excerpt: Data queries retrieve data with simple textual queries and prepares the results for visualizations.
permalink: /docs/data-queries/
social_image_url: /assets/images/docs/data-queries/data-queries.png
jumbotron:
  title: Data Queries
  tagline: 
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

{% comment %}
* TOC
{:toc}
* @bins on dates (month, year, etc)
{% endcomment %}

* TOC
{:toc}

Data queries retrieve data with simple textual queries and prepares the results for visualizations.

These textual queries are much easier to automate in bot behaviors, dashboard widgets, or the API.

Every data query begins by specifying a type, like `type:worklist.subtotals`. Other fields are available depending on the type of data being requested.

Data is returned in JSON format. A `format:` parameter prepares the response for different visualizations.

# Worklist metrics

`worklist.metrics` queries return computed metrics based on worklist data (e.g. 'average ticket first response time over the past year').

### Inputs
{:.no_toc}

Each `values.*` series should provide:
* `label:` (human-friendly series name for visualizations)
* `of:` (record type)
* `field:` (record field using quick search keys)
* `function:` (count,min,max,average,sum)
* `query:` (the query to filter the results for this series)

Optionally, multiple functions can be specified for a series, like `functions:[sum,average]`, and multiple series will be generated automatically using the same record type, field, and query.

### Response Formats
{:.no_toc}

* **table** (default) returns tabular output, suitable for display with the 'Chart: Table' visualization widget. Multiple metrics are returned as rows.

### Examples
{:.no_toc}

#### Calculating the average first response time from a worklist of tickets
{:.no_toc}

<pre>
<code class="language-text">
type:worklist.metrics 
values.total:(
  of:ticket
  field:response.first 
  function:average 
  query:(
    created:"-1 year"
    response.first:>0
  )
)
format:table
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-metric-counter.png" class="screenshot">
</div>

#### Calculating multiple functions in a single query
{:.no_toc}

<pre>
<code class="language-text">
{% raw %}
type:worklist.metrics
values.response_time:(
  of:message 
  functions:[average,min,max,sum,count] 
  field:responseTime 
  query:(
    worker.id:{{record_id}} 
    created:"-1 month" 
    isOutgoing:y 
    isBroadcast:n 
    responseTime:>0
  )
)
format:table
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-metric-response_times.png" class="screenshot">
</div>

# Worklist series

`worklist.series` data queries return series-based data from any worklist (e.g. tickets created by month by status). Data from multiple series of different record types can be returned in a single query.

### Inputs
{:.no_toc}

Each `series.*` should provide:
* `label:` (human-friendly series name for visualizations)
* `of:` (record type)
* `x:` (record field for the x-axis using quick search keys)
* `y:` (record field for the y-axis using quick search keys)
* `function:` (count,min,max,average,sum on `y:` field)
* `query:` (the query to filter the results for this series)

### Response Formats
{:.no_toc}

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget.

* **timeseries** (default) returns time-based series data, suitable for display with the 'Chart: Time Series' visualization widget.

### Examples
{:.no_toc}

#### Return series data from a worklist
{:.no_toc}

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

# Worklist subtotals

`worklist.subtotals` data queries run aggregate functions against worklist data. Subtotals can be nested to any depth (e.g. _"tickets by top 10 owners by status"_).

### Inputs
{:.no_toc}

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

### Response Formats
{:.no_toc}

* **tree** (default) returns hierarchal data (a `name` and `value` for each node, and a list of `children` for branches).

* **categories** returns a series-based format suitable for bar charts.

* **pie** returns data for use in pie and donut charts. 

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget. When nested 
subtotals are used, a row is returned for each distinct result (e.g. Support -> Kina, Support -> Janey).

* **timeseries** returns series-based data suitable for a time-series chart (with the 'x' axis values as timestamps). 

### Examples
{:.no_toc}

#### Return a stacked bar chart of tickets by owner by status
{:.no_toc}

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

# Worklist X/Y

`worklist.xy` data queries plot two dimensional data to visualize clusters or correlations.

### Inputs
{:.no_toc}

Each `series.*` should provide:
* `label:` (human-friendly series name for visualizations)
* `of:` (record type)
* `x:` field(@year,month,day,hour,minute,second)
* `y:` (field)
* `query:` (the query to filter the results for this series)

You can specify a `limit:` and `sort:` within each series `query:()`. Nested sorting is supported, and sorts can be in ascending or descending order by prefixing a minus (`-`) to the field name for descending.

### Response Formats
{:.no_toc}

* **pie** format returns data for pie and donut charts. 

* **categories** returns series-based data suitable for bar charts.

* **scatterplot** (default) returns series-based data suitable for a scatterplot chart. 

* **table** returns data in a tabular (rows/columns) format suitable for "Chart: Table" visualization widgets.

### Examples
{:.no_toc}

#### Generate a table of the top 10 quickest message response times
{:.no_toc}

<pre>
<code class="language-text">
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

# Usage: Bot Behaviors

`usage.behaviors` data queries return historical usage data for bot behaviors (e.g. uses, avg. runtime, and total runtime over time).

### Inputs
{:.no_toc}

(none)

### Response Formats
{:.no_toc}

* **table** (default) returns tabular data (columns and rows) suitable for the "Chart: Table" visualization widget.

* **timeseries** returns series-based data suitable for the "Chart: Time Series" visualization widget (the x-axis values are timestamps).

### Examples
{:.no_toc}

<pre>
<code class="language-text">
{% raw %}
type:usage.behaviors
format:timeseries
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-bot-usage.png" class="screenshot">
</div>

# Usage: Snippets

`usage.snippets` data queries return historical usage data for snippets (e.g. uses by worker over time).

### Inputs
{:.no_toc}

(none)

### Response Formats
{:.no_toc}

* **table** (default) returns tabular data (columns and rows) suitable for the "Chart: Table" visualization widget.

* **timeseries** returns series-based data suitable for the "Chart: Time Series" visualization widget (the x-axis values are timestamps).

### Examples
{:.no_toc}

<pre>
<code class="language-text">
{% raw %}
type:usage.snippets
format:timeseries
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-snippet-usage.png" class="screenshot">
</div>

# Bot-powered datasources

`behavior.*` data queries are created on the 'Data Query Datasource' event. The behavior can gather data as needed (e.g. external APIs, worklist results, etc). 

The alias configured there (e.g. `get_stock_price`) can be specified as a data query type (e.g. `type:behavior.get_stock_price`).

### Inputs
{:.no_toc}

Any arguments provided in the query are provided to the behavior as input variables. 

### Response Formats
{:.no_toc}

Responses are returned in JSON format. This makes it much simpler to request data from bot behaviors from dashboard widgets, other bot behaviors, or the API.

### Examples
{:.no_toc}

#### Fetch stock price data
{:.no_toc}

Bots can create behaviors on the 'Data Query Datasource' event. This allows data from any source (e.g. external API) to be returned from a data query. Data query parameters are sent to the bot behavior as input variables, and data is returned from the 'Return data' action as JSON.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-behavior-stock-datasource.png" class="screenshot">
</div>

The data query would look like:

<pre>
<code class="language-text">
type:behavior.get_stock_price
symbol:AAPL
</code>
</pre>

Which could be visualized as:

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-behavior-stock.png" class="screenshot">
</div>

# Running data queries

## Run data queries in bot behaviors

All bot behaviors can use the 'Execute data query' action to run a data query and retrieve the results. This is a much simpler way to exchange information between bots and APIs.

## Run data queries from the API

Data queries can be run from the API using the [/data/query](/docs/api/modules/data/) endpoint. 

For a `GET` the query should be provided in the `q` query parameter. 

For a `POST` the query should be provided as text in the HTTP request body.

The results will always be in JSON format. This is now the recommended way to extract data from worklists and bots for use in other applications.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-api-post-body.png" class="screenshot">
</div>