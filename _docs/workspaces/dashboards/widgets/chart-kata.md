---
title: "Chart KATA - Dashboard Widgets"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/dashboards/widgets/chart-kata/
toc:
  title: Chart KATA
  expand: Reference
jumbotron:
  title: Chart KATA
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Workspaces &raquo;
    url: /docs/workspaces/
  -
    label: Dashboards &raquo;
    url: /docs/dashboards/
  -
    label: Widgets &raquo;
    url: /docs/dashboards/#widgets
---

The **Chart KATA** widget can build complex, dynamic charts with mixed visualizations and datasets from multiple sources. The datasets and chart schema are both defined using a [KATA](/docs/kata/) dialect.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/chart-kata/chart-kata-combined.png" class="screenshot">
</div>

# Datasets

A **dataset** is a collection of **series** data. An `/identifier` names the dataset.

Each **series** within a dataset has a unique key name containing an array of **values**.

For instance, a time-series dataset could include a series named `ts` with timestamps for the x-axis, and a second series named `values` with the y-axis values.

|---
| Type | Description
|-|-
| [automation:](#automation) | Load data from an [automation](/docs/automations/). Almost anything is possible here.
| [dataQuery:](#dataquery) | Load data from a [data query](/docs/data-queries/).
| [manual:](#manual) | Static data. This is primarily useful in [interactions](/docs/interactions/) where some chart data has already been loaded.

## automation:

Load series data from a [ui.chart.data](/docs/automations/triggers/ui.chart.data/) automation.

This can synthesize and preprocess chart data from anywhere: third-party APIs, Cerb records, business intelligence tools, etc.

<pre>
<code class="language-cerb">
{% raw %}
automation/avgInflow:
  uri: cerb:automation:example.chartData.avgTicketInflows
  inputs:
    date_range: today to +4 weeks
  disabled@bool: no
{% endraw %}
</code>
</pre>

## dataQuery:

Load data from a [data query](/docs/data-queries/).

<pre>
<code class="language-cerb">
{% raw %}
dataQuery/tickets:
  query@text:
    type:worklist.subtotals
    of:ticket
    by:[created@month,group]
    query:(created:"this year")
    format:${format}
  query_params:
    format: timeseries
{% endraw %}
</code>
</pre>

## manual:

Load static data.

<pre>
<code class="language-cerb">
{% raw %}
manual/series0:
  data:
    x@csv: 2022-01-01,2022-02-01,2022-03-01,2022-04-01
    custom@csv: 33,66,99,500
{% endraw %}
</code>
</pre>

# Chart

A {% raw %}`{{datasets.name}}`{% endraw %} placeholder is available for each defined dataset. For instance, a grid line can be rendered from a dynamically computed value.

<pre>
<code class="language-cerb">
{% raw %}
data:
  type: bar
  series:
    tickets:
      name: Tickets
      x_key: ts
    series0:
      name: Custom Series
      x_key: x
      y_axis: y2
      y_type: line
    tasks:
      name: Tasks
      x_key: ts
  stacks:
    0@csv: tickets
    1@csv: tasks

axis:
  x:
    label: Time
    type: timeseries
    tick:
      format: %Y-%m
  y:
    label: Tickets/Tasks
  y2:
    label: Custom

grid:
  y:
    lines:
      0:
        value: {{datasets.baseline.value}}
        text: Target ({{datasets.baseline.value}})
        position: start
{% endraw %}
</code>
</pre>