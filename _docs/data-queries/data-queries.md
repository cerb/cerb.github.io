---
title: Data Queries
excerpt: Retrieve complex data using simple text queries and prepare the results for visualizations.
permalink: /docs/data-queries/
social_image_url: /assets/images/docs/data-queries/data-queries.png
jumbotron:
  title: Data Queries
  tagline: Retrieve complex data using simple text queries and drive visualizations
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

Data queries retrieve data with simple textual queries and prepare the results for visualizations.

These textual queries are very simple to automate in bot behaviors, dashboard widgets, or the API.

Every data query begins by specifying a type, like `type:worklist.subtotals`. Additional fields are available depending on the type of data being requested.

Data is returned in JSON format. A `format:` parameter prepares the response for different visualizations.

# Running data queries

## Dashboard widgets

Data queries can be used to build visualizations on dashboards.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-workspace-widget.png" class="screenshot">
</div>

## Bot behaviors

All bot behaviors can use the **Execute >> Data Query** action to run a data query and retrieve the results.

This is a much simpler way to exchange information between bots and APIs.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-bot-execute.png" class="screenshot">
</div>

## Setup

As an administrator, you can test data queries from **Setup >> Developers >> Data Query Tester**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-setup-tester.png" class="screenshot">
</div>

## API

Data queries can be run from the API using the [/data/query](/docs/api/endpoints/data/) endpoint. 

For a `GET` the query should be provided in the `q` query parameter. 

For a `POST` the query should be provided as text in the HTTP request body.

The results will always be in JSON format. This is now the recommended way to extract data from worklists and bots for use in other applications.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-api-post-body.png" class="screenshot">
</div>