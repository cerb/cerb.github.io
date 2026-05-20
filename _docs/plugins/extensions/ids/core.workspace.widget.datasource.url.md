---
title: "Extension: URL"
permalink: /docs/plugins/extensions/core.workspace.widget.datasource.url/
toc:
  title: "URL"
  expand: Plugins
jumbotron:
  title: "URL"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
  -
    label: Extension Points &raquo;
    url: /docs/plugins/#extensions
  -
    label: Workspace Widget Datasource &raquo;
    url: /docs/plugins/extensions/points/cerberusweb.ui.workspace.widget.datasource/
---

|---
|-|-
| **Name:** | URL
| **Identifier (ID):** | core.workspace.widget.datasource.url
| **Plugin:** | [cerberusweb.core](/docs/plugins/cerberusweb.core/)
| **File:** | api/uri/internal/dashboards/widget_datasources.php
| **Class:** | WorkspaceWidgetDatasource_URL

* TOC
{:toc}

<div class="cerb-box note">
<p>This is a <b>legacy</b> workspace widget datasource. New widgets should use the <a href="/docs/data-queries/">data query</a> datasource instead. Datasource-based widgets are being phased out.</p>
</div>

# Configuration

The URL datasource fetches a given URL on a configurable refresh interval and parses the response to extract one or more `label`/`value` pairs for display in a workspace widget.

The expected shape depends on the widget type and the response's content type (or the `url_format` override).

# Single value (Counter, Gauge)

Counter and gauge widgets read a single `value` (and optional `label`).

## JSON
(`application/json`, `text/json`)

{% highlight json %}
{% raw %}
{"label":"metric","value":1234}
{% endraw %}
{% endhighlight %}

## XML
(`text/xml`)

The root element wraps `<value>` and `<label>` children:

{% highlight xml %}
{% raw %}
<metric><label>Metric</label><value>54321</value></metric>
{% endraw %}
{% endhighlight %}

## Plain text
(`text/plain`, default)

A bare numeric value with no label:

{% highlight text %}
{% raw %}
9876
{% endraw %}
{% endhighlight %}

# Series (Chart, Pie Chart, Scatterplot)

Chart widgets read multiple `value`/`label` rows.

## CSV
(`text/csv`)

One row per data point, `value,label`:

{% highlight text %}
{% raw %}
123,1
456,2
{% endraw %}
{% endhighlight %}

## JSON
(`application/json`, `text/json`)

An array of `{value, label}` objects:

{% highlight json %}
{% raw %}
[
  {"label":"A","value":123},
  {"label":"B","value":456}
]
{% endraw %}
{% endhighlight %}

## XML
(`text/xml`)

A root element with repeated children, each containing `<value>` and `<label>`:

{% highlight xml %}
{% raw %}
<metrics>
  <metric><label>A</label><value>123</value></metric>
  <metric><label>B</label><value>456</value></metric>
</metrics>
{% endraw %}
{% endhighlight %}

