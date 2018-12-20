---
title: Configure dashboard filters
excerpt: 
layout: integration
topic: Dashboards
jumbotron:
  title: Configure dashboard filters
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Guides &raquo;
    url: /resources/guides/
  -
    label: Dashboards &raquo;
    url: /resources/guides/#dashboards
---

* TOC
{:toc}

# Introduction

<div class="cerb-screenshot">
<img src="/assets/images/guides/dashboards/filters/dashboard-filter-bar.png" class="screenshot">
</div>

As of [9.0.4](/releases/9.0.4/), user-editable custom filters can be added to the top of workspace [dashboards](/docs/dashboards/). These filters automatically apply to all of the dashboard’s widgets. Previously, each widget had to be filtered individually.

Each dashboard filter is associated with a new placeholder that can be used when configuring queries widgets (e.g. [search queries](/docs/search/), [data queries](/docs/data-queries/)).

For example, a reporting dashboard can provide filters for a date range, date grouping (e.g. year/month/day), and a specific list of workers. Its various charts and worklists will adapt in real-time to changes in those filters from a single place.

The current state of a dashboard's filters is remembered per worker between pages (and sessions). The owner of the dashboard configures the initial defaults for each filter.

# Configuring dashboard filters

Dashboard filters are configured on a dashboard by clicking the **Edit Dashboard** button.

They are defined by using a very simple text-based format known as YAML[^yaml]:

<pre>
<code class="language-yaml">
{% raw %}
---
placeholder: input_date_range
label: "Date range:"
type: date_range
default: first day of this month -12 months
---
placeholder: input_date_subtotal_by
label: "By:"
type: picklist
default: month
params:
  options: [day, week, month, year]
--- 
placeholder: input_groups
label: "Groups:"
type: chooser
default:
params:
  context: group
  single: false
{% endraw %}
</code>
</pre>

This is a collection of `key: value` pairs, with each record starting with `---` on its own line.

Each filter may have the following keys:

* **placeholder**: The name of this dashboard filter when used in queries on widgets. This should be a lowercase string containing only letters, numbers, and underscores (`_`).

* **label**: The human-friendly name of this filter.

* **type**: The type of the filter. This is covered in more detail below.

* **default**: The default value of this filter when the dashboard is viewed for the first time by a worker.

* **params**: An optional list of parameters based on the filter type. This is another set of `key: value` pairs indented with two leading spaces.

## Filter types

### chooser

When filtering with a chooser, the user selects one or more [records](/docs/records/) using a helper popup.

<div class="cerb-screenshot">
<img src="/assets/images/guides/dashboards/filters/filter-ui-chooser.png" class="screenshot">
</div>

<pre>
<code class="language-yaml">
{% raw %}
--- 
placeholder: input_groups
label: "Groups:"
type: chooser
default:
params:
  context: group
  single: false
{% endraw %}
</code>
</pre>

The available **params:** are:

* **context:** a [record type](/docs/records/#record-types) alias.

* **single:** `true` for single record selection, `false` (default) for multiple.

The value of the placeholder is a comma-separated list of record IDs. You'd use it in a query like:

<pre>
<code class="language-text">
{% raw %}
type:worklist.subtotals
of:tickets
by:[created@month,group]
query:(
	created:"-1 year to now"
	{% if input_groups %}
	group.id:[{{input_groups}}]
	{% endif %}
)
format:timeseries
{% endraw %}
</code>
</pre>

### date_range

When filtering with a date range, the user enters a start and end date (inclusive). One-click presets are provided for common ranges (e.g. past day/month/year). The dates can be absolute (e.g. `2019-12-31`, `Jan 1 2019`) or relative (e.g. `-1 year`, `today`, `now`, `next Friday`, `first day of this month -1 year`).

<div class="cerb-screenshot">
<img src="/assets/images/guides/dashboards/filters/filter-ui-daterange.png" class="screenshot">
</div>

<pre>
<code class="language-yaml">
{% raw %}
---
placeholder: input_date_range
label: "Date range:"
type: date_range
default: first day of this month -12 months
{% endraw %}
</code>
</pre>

This filter doesn't currently have any configurable parameters.

The value of the placeholder is a text string with format `"date1 to date2"`. This is suitable for passing directly to any date-based filters. Be sure you wrap it in quotes (`" "`).

<pre>
<code class="language-text">
{% raw %}
type:worklist.subtotals
of:tickets
by:[created@month,group~10]
query:(
	created:"{{input_date_range}}"
)
format:timeseries
{% endraw %}
</code>
</pre>

### picklist

When filtering by picklist, the user selects one item from a pre-defined list of options.

<div class="cerb-screenshot">
<img src="/assets/images/guides/dashboards/filters/filter-ui-picklist.png" class="screenshot">
</div>

<pre>
<code class="language-yaml">
{% raw %}
---
placeholder: input_date_subtotal_by
label: "By:"
type: picklist
default: month
params:
  options: [day, week, month, year]
{% endraw %}
</code>
</pre>

The available **params:** are:

* **options:** a list of possible values for the picklist.

	<pre>
	<code class="language-yaml">
	{% raw %}
	params:
	  options: [day, week, month, year]
	{% endraw %}
	</code>
	</pre>

	<pre>
	<code class="language-yaml">
	{% raw %}
	params:
	  options:
		- day
		- week
		- month
		- year
	{% endraw %}
	</code>
	</pre>

The value of the placeholder is the name of the selected option.

<pre>
<code class="language-text">
{% raw %}
type:worklist.subtotals
of:tickets
by:[created@{{input_date_subtotal_by}},group~10]
query:(
	created:"first day of this month -1 year to now"
)
format:timeseries
{% endraw %}
</code>
</pre>

# References

[^yaml]: Wikipedia: YAML - <https://en.wikipedia.org/wiki/YAML>