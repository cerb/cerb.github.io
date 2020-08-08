---
title: Dashboards
permalink: /docs/dashboards/
redirect_from:
  - /guides/dashboards/filters/
jumbotron:
  title: Dashboards
  tagline: Visual insight from highly customizable widgets
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Workspaces &raquo;
    url: /docs/workspaces/
---

**Dashboards** provide visual insight with collections of highly customizable **widgets**. Most widgets take a [data query](/docs/data-queries/) as input.

Dashboards are **responsive** -- they automatically adapt to various screen sizes on different devices. If you have a narrow screen like a smartphone held vertically, you may only be able to display a single column of widgets. On a much larger desktop display, the same dashboard could display multiple horizontal columns of widgets.

Widgets can have different sizes relative to each other. For example, a large chart may be configured to display 2X-4X as wide as the widgets adjacent to it when that much space is available.

By configuring the **layout** of a dashboard, different **zones** become available for widgets to use. For instance, two zones could be a left-hand sidebar and a larger content area to the right of it. Widgets determine their size based on the zone they are in. These zones will also collapse to a single column when a device's screen is too narrow.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/dashboards/dashboard-tutorial.png" class="screenshot">
</div>

# Prompts

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/dashboards/prompts/dashboard-filter-bar.png" class="screenshot">
</div>

As of [9.0.4](/releases/9.0.4/), user-editable custom prompts can be added to the top of workspace [dashboards](/docs/dashboards/). These prompts automatically apply to all of the dashboard’s widgets. Previously, each widget had to be filtered individually.

Each dashboard prompt is associated with a new placeholder that can be used when configuring queries widgets (e.g. [search queries](/docs/search/), [data queries](/docs/data-queries/)).

For example, a reporting dashboard can provide prompts for a date range, date grouping (e.g. year/month/day), and a specific list of workers. Its various charts and worklists will adapt in real-time to changes in those prompts from a single place.

The current state of a dashboard's prompts is remembered per worker between pages (and sessions). The owner of the dashboard configures the initial defaults for each prompt.

## Configuring dashboard prompts

Dashboard prompts are configured on a dashboard by clicking the **Edit Dashboard** button.

They are defined by using a very simple text-based format known as [KATA](/docs/kata/):

<pre>
<code class="language-cerb">
{% raw %}
date_range/input_date_range:
  label: Date range:
  default: first day of this month -12 months

picklist/input_date_subtotal_by:
  label: By:
  default: month
  params:
    options@list:
      hour
      day
      week
      month
      year

picklist/input_statuses:
  label: Statuses:
  params:
    multiple: yes
    options@list:
      open
      waiting
      closed
      deleted

chooser/input_groups:
  label: Groups:
  default@json: null
  params:
    context: group
    single: no

text/input_keywords:
  label: Keywords:
  default@json: null
{% endraw %}
</code>
</pre>

This is a tree of `key: value` pairs.

The top-level keys describe the prompts with the format: `{type}/{placeholder}:`

The possible prompt types are:

* [chooser](#chooser)
* [date_range](#date_range)
* [picklist](#picklist)
* [text](#text)

The placeholder is the name of this prompt when used in queries on dashboard widgets. This should be a lowercase string containing only letters, numbers, and underscores (`_`).

Each filter may have the following keys:

* **label**: The human-friendly name of this prompt.

* **default**: The default value of this prompt when the dashboard is viewed for the first time by a worker.

* **params**: An optional list of parameters based on the prompt type. This is another set of `key: value` pairs indented with two leading spaces.

## Prompt types

### chooser

When prompting with a chooser, the user selects one or more [records](/docs/records/) using a helper popup.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/dashboards/prompts/filter-ui-chooser.png" class="screenshot">
</div>

<pre>
<code class="language-cerb">
chooser/input_groups:
  label: Groups:
  default@json: null
  params:
    context: group
    single: no
</code>
</pre>

The available **params:** are:

* **context:** a [record type](/docs/records/types/) alias.

* **single:** `yes` for single record selection, `no` (default) for multiple.

The value of the placeholder is a comma-separated list of record IDs. You'd use it in a query like:

<pre>
<code class="language-cerb">
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

When prompting with a date range, the user enters a start and end date (inclusive). One-click presets are provided for common ranges (e.g. past day/month/year). The dates can be absolute (e.g. `2019-12-31`, `Jan 1 2019`) or relative (e.g. `-1 year`, `today`, `now`, `next Friday`, `first day of this month -1 year`).

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/dashboards/prompts/filter-ui-daterange.png" class="screenshot">
</div>

<pre>
<code class="language-cerb">
date_range/input_date_range:
  label: Date range:
  default: -1 month to now
  params:
    presets:
      1d:
        label: today
        query: today to now
      1mo:
        query: -1 month
      ytd:
        query: jan 1 to now
      all:
        query: big bang to now
</code>
</pre>

The available **params:** are:

* **presets:** an optional list of date range presets. If omitted the built-in defaults will be used.

The value of the placeholder is a text string with format `"date1 to date2"`. This is suitable for passing directly to any date-based filters. Be sure you wrap it in quotes (`" "`).

<pre>
<code class="language-cerb">
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

When prompting with a picklist, the user selects one item from a pre-defined list of options.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/dashboards/prompts/filter-ui-picklist.png" class="screenshot">
</div>

<pre>
<code class="language-cerb">
picklist/input_date_subtotal_by:
  label: By:
  default: month
  params:
    options@list:
      hour
      day
      week
      month
      year
</code>
</pre>

The available **params:** are:

* **multiple:** `yes` if multiple selection is enabled, `no` (default) otherwise.

* **options:** a list of possible values for the picklist.

	<pre>
	<code class="language-cerb">
	params:
	  options@csv: day, week, month, year
	</code>
	</pre>

	<pre>
	<code class="language-cerb">
	params:
	  options@list:
	    day
	    week
	    month
	    year
	</code>
	</pre>
	
	As of [9.1.3](/releases/9.1.3) you can also provide a map of labels and values:
	
	<pre>
	<code class="language-cerb">
	params:
	  options:
	    Open: o
	    Waiting: w
	    Closed: c
	    Deleted: d
	</code>
	</pre>

In single selection mode (`multiple: no`), the value of the placeholder is the selected option:

<pre>
<code class="language-cerb">
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

In multiple selection mode (`multiple: yes`), the value of the placeholder is an array of selected options:

<pre>
<code class="language-cerb">
{% raw %}
type:worklist.subtotals
of:tickets
by:[created@day,group~10]
query:(
	created:"first day of this month -1 year to now"
	{% if input_statuses %}
	status:[{{input_statuses|join(',')}}]
	{% endif %}
	status:[]
)
format:timeseries
{% endraw %}
</code>
</pre>

### text

When prompting with text input, the user enters freeform text.

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/dashboards/prompts/filter-ui-text.png" class="screenshot">
</div>
{% endcomment %}

<pre>
<code class="language-cerb">
text/input_subject:
  label: Search:
  default: some example text
</code>
</pre>

This prompt currently has no parameters.

The value of the placeholder is a text string. This is suitable for passing directly to any filters. Be sure you wrap it in quotes.

<pre>
<code class="language-cerb">
{% raw %}
type:worklist.records
of:tickets
query:(
	{% if input_subject %}
	subject:"{{input_subject}}"
	{% endif %}
)
format:dictionaries
{% endraw %}
</code>
</pre>