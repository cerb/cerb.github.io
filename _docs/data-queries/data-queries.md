---
title: Data Queries
excerpt: Retrieve complex data using simple text queries and prepare the results for visualizations.
permalink: /docs/data-queries/
social_image_url: /assets/images/docs/data-queries/data-queries.png
jumbotron:
  title: Data Queries
  tagline: A text-based grammar for querying and transforming data to drive visualizations
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

{% comment %}
* @bins on dates (month, year, etc)
{% endcomment %}

**Data queries** are a purpose-built, text-based query language to retrieve, transform, and format data for visualizations.

These textual queries are very simple to automate in [bot](/docs/bots/) behaviors, [dashboard](/docs/dashboards/) widgets, or the [API](/docs/api/).

A data query is a collection of `key:value` pairs.

Every query must include a `type:` key:

<pre>
<code class="language-cerb">
type:worklist.subtotals
</code>
</pre>

Additional keys are available depending on the type of data being requested.

A `format:` key prepares the response for different visualizations:

<pre>
<code class="language-cerb">
format:dictionaries
</code>
</pre>

Data is returned in JSON format.
