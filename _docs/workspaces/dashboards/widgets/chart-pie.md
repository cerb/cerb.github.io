---
title: "Chart: Pie - Dashboard Widgets"
excerpt: A pie or donut chart for visualizing proportions of a whole.
summary: The Chart Pie dashboard widget renders a pie or donut chart from a data query, with one slice per category. The legend, donut style, and chart height are configurable.
permalink: /docs/dashboards/widgets/chart-pie/
toc:
  title: "Chart: Pie"
  expand: Reference
jumbotron:
  title: "Chart: Pie"
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Workspaces &raquo;
    url: /docs/workspaces/
  - label: Dashboards &raquo;
    url: /docs/dashboards/
  - label: Widgets &raquo;
    url: /docs/dashboards/#widgets
---

The **Chart: Pie** widget displays a pie or donut chart from a [data query](/docs/data-queries/), where each slice represents one category's share of the total. It's useful for visualizing how a single total breaks down -- tickets by status, time spent by group, opportunities by stage, etc.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/chart-pie.png" class="screenshot">
</div>

# Configuration

| Field | Description
|-|-
| Run this data query | A [data query](/docs/data-queries/) that returns one value per category. Each row becomes a slice.
| Cache | Number of seconds to cache the query results before refetching.
| Display the chart as | `pie` (filled circle) or `donut` (ring with hollow center).
| Chart height | Height in pixels. Leave blank for automatic sizing.
| Show legend | When checked, the legend lists each category and its color.

For richer chart layouts (multiple series, custom colors, mixed visualizations), use [Chart KATA](/docs/dashboards/widgets/chart-kata/) instead.
