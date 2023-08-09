---
title: Data Queries
excerpt: Retrieve complex data using simple text queries and prepare the results for visualizations.
permalink: /docs/data-queries/
redirect_from:
  - /docs/data-queries/using/
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

* TOC 
{:toc}

These textual queries are very simple to automate in [automations](/docs/automations/), [dashboard](/docs/dashboards/) widgets, or the [API](/docs/api/).

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

# Types

|---
| Type | Description
|-|-
| [attachment.manifest](/docs/data-queries/attachment/manifest/) | Iterates and filters the manifest of attachment archives (e.g. ZIP).
| [automation.invoke](/docs/data-queries/automation/invoke/) | Invoke a custom [data.query](/docs/automations/triggers/data.query/) automation.
| [calendar.availability](/docs/data-queries/calendar/availability/) | Aggregate any number of matching calenders to display availability over a date range by hour or day
| [calendar.events](/docs/data-queries/calendar/events/) | Return events and synthesized recurring events for the given calendars grouped into days
| [classifier.prediction](/docs/data-queries/classifier/prediction/) | Return a predicted classification for the given text using the given classifier
| [gpg.keyinfo](/docs/data-queries/gpg/keyinfo/) | Return details about a PGP public key
| [metrics.timeseries](/docs/data-queries/metrics/timeseries/) | Aggregates metrics statistics over a date range
| [platform.extensions](/docs/data-queries/platform/extensions/) | Return a filterable and pageable list of plugin extensions for a given point
| [record.fields](/docs/data-queries/record/fields/) | Return a filterable and pageable list of fields from a record type
| [record.types](/docs/data-queries/record/types/) | Return a filterable and pageable list of record types
| [ui.icons](/docs/data-queries/ui/icons/) | Return a filterable and pageable list of icons
| [usage.behaviors](/docs/data-queries/usage/bot-behaviors/) | Return historical usage data for bot behaviors (e.g. uses, avg. runtime, and total runtime over time)
| [usage.snippets](/docs/data-queries/usage/snippets/) | Return historical usage data for snippets (e.g. uses by worker over time)
| [worklist.geo.points](/docs/data-queries/worklist/geopoints/) | Return geolocation data from worklist records
| [worklist.metrics](/docs/data-queries/worklist/metrics/) | Return computed metrics based on worklist data (e.g. ‘average ticket first response time over the past year’)
| [worklist.records](/docs/data-queries/worklist/records/) | Retrieve record dictionaries with a search query
| [worklist.series](/docs/data-queries/worklist/series/) | Return series-based data from any worklist (e.g. tickets created by month by status)
| [worklist.subtotals](/docs/data-queries/worklist/subtotals/) | Run aggregate functions to categorize matching worklist records
| [worklist.xy](/docs/data-queries/worklist/xy/) | Plot two-dimensional data to visualize clusters or correlations
| [sample.*](/docs/data-queries/sample/) | Return simulated data
| [custom](/docs/data-queries/custom/) | Fetch custom data from a bot behavior

# Running data queries

Data queries may be utilized in several features.

## Setup

As an administrator, you can test data queries from **Setup >> Developers >> Data Query Tester**.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-setup-tester.png" class="screenshot">
</div>

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

## API

Data queries can be run from the API using the [/data/query](/docs/api/endpoints/data/) endpoint.

For a `GET` the query should be provided in the `q` query parameter.

For a `POST` the query should be provided as text in the HTTP request body.

The results will always be in JSON format. This is now the recommended way to extract data from worklists and bots for use in other applications.

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-api-post-body.png" class="screenshot">
</div>

Data is returned in JSON format.