---
title: Counter - Dashboard Widgets
excerpt: A single large number drawn from a data source, with optional prefix/suffix and units.
summary: The Counter dashboard widget displays a single large number derived from a data source. It supports unit formatting (number, decimal, percentage, bytes, elapsed time), an optional prefix and suffix, and a configurable accent color.
permalink: /docs/dashboards/widgets/counter/
toc:
  title: Counter
  expand: Reference
jumbotron:
  title: Counter
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

The **Counter** widget displays a single large number drawn from a data source. It's the right widget for headline metrics like *Open tickets*, *Tasks due today*, *Active workers*, or *Storage used*.

<div class="cerb-screenshot">
<img src="/assets/images/docs/dashboards/widgets/counter.png" class="screenshot">
</div>

# Configuration

| Field | Description
|-|-
| Data from | The data source extension used to produce the value. The data source's own configuration appears below this selector.
| Display as | How to format the value: number, decimal, percentage, bytes, seconds elapsed, or minutes elapsed.
| Prepend | Optional text shown before the number (e.g. `$`).
| Append | Optional text shown after the number (e.g. ` open`).
| Color | An accent color for the widget.

<div class="cerb-box note">
<p>The supplied data sources include <a href="/docs/plugins/extensions/core.workspace.widget.datasource.manual/">Manual Input</a>, <a href="/docs/plugins/extensions/core.workspace.widget.datasource.url/">URL</a>, <a href="/docs/plugins/extensions/core.workspace.widget.datasource.worklist.metric/">Worklist (Metric)</a>, and the modern <a href="/docs/data-queries/">data query</a> datasource. New widgets should prefer the data query datasource -- the others are legacy and being phased out.</p>
</div>

For more control over layout, formatting, and combining multiple metrics into one widget, use the [Sheet](/docs/dashboards/widgets/sheet/) widget instead.
