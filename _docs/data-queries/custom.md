---
title: "Data Queries: Custom Datasources"
excerpt: 
permalink: /docs/data-queries/custom/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Custom Datasources
jumbotron:
  title: Custom Datasources
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# behavior.*
{: .no_toc}

`behavior.*` data queries are created on the 'Data Query Datasource' event. The behavior can gather data as needed (e.g. external APIs, worklist results, etc). 

The alias configured there (e.g. `get_stock_price`) can be specified as a data query type (e.g. `type:behavior.get_stock_price`).

* TOC
{:toc}

# Inputs

Any arguments provided in the query are provided to the behavior as input variables. 

# Response Formats

Responses are returned in JSON format. This makes it much simpler to request data from bot behaviors from dashboard widgets, other bot behaviors, or the API.

# Examples

## Fetch stock price data

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
