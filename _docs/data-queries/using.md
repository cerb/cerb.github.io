---
title: Using Data Queries
permalink: /docs/data-queries/using/
jumbotron:
  title: Using Data Queries
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Querues &raquo;
    url: /docs/data-queries/
---

Data queries may be utilized in several features.

# Setup

As an administrator, you can test data queries from **Setup >> Developers >> Data Query Tester**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-setup-tester.png" class="screenshot">
</div>

# Dashboard widgets

Data queries can be used to build visualizations on dashboards.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-workspace-widget.png" class="screenshot">
</div>

# Bot behaviors

All bot behaviors can use the **Execute >> Data Query** action to run a data query and retrieve the results.

This is a much simpler way to exchange information between bots and APIs.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-bot-execute.png" class="screenshot">
</div>

# API

Data queries can be run from the API using the [/data/query](/docs/api/endpoints/data/) endpoint. 

For a `GET` the query should be provided in the `q` query parameter. 

For a `POST` the query should be provided as text in the HTTP request body.

The results will always be in JSON format. This is now the recommended way to extract data from worklists and bots for use in other applications.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-api-post-body.png" class="screenshot">
</div>