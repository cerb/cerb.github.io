---
title: "Data Queries: Worklist Subtotals"
excerpt: 
permalink: /docs/data-queries/worklist/subtotals/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist Subtotals
jumbotron:
  title: Worklist Subtotals
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.subtotals
{: .no_toc}

`worklist.subtotals` [data queries](/docs/data-queries/) run aggregate functions to categorize matching worklist records.

<pre>
<code class="language-cerb">
{% raw %}
type:worklist.subtotals 
of:tickets 
by:[created@month,group] 
format:timeseries
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# of:

The `of:` key specifies the type of [records](/docs/records/) to subtotal.

<pre>
<code class="language-cerb">
{% raw %}
of:tickets
{% endraw %}
</code>
</pre>

# by:

The `by:` key specifies which record [fields](/docs/records/fields/) to subtotal by.

### Nested subtotals

Multiple fields can be separated with commas to generated nested subtotals (e.g. _"tickets by owners by status"_).

<pre>
<code class="language-cerb">
{% raw %}
by:[owner,status] 
{% endraw %}
</code>
</pre>

### Aggregate functions

The subtotal metric can be computed using different aggregate **functions**:

* `count` (default)
* `distinct`
* `avg`, `average`
* `sum`
* `min`
* `max`

Functions target the last field specified in the `by:` list.

The `count` function is the default when no preference is given, and it can be target any field type.

The other functions may only be used against numeric fields. For example, you can't average _group names_, but you can average _response times_.

As of [9.0.7](/releases/9.0.7/) the desired function is appended to the `by:` key following a period (`.`):

<pre>
<code class="language-cerb">
{% raw %}
by.avg:[worker,responseTime] 
{% endraw %}
</code>
</pre>

In earlier versions, a separate `function:` key was specified:

<pre>
<code class="language-cerb">
{% raw %}
function:average
by:[worker,responseTime] 
{% endraw %}
</code>
</pre>

This still works, but is deprecated.

### Date histograms

Histograms can be generated for date-based fields by appending a unit of time following an at sign (`@`):

|-|-
| Unit | Example
|-|-
| `@day` | 2025-12-31
| `@dayofmonth` | 31
| `@dayofweek` | Wednesday
| `@hour` | 2025-12-31 23:00
| `@hourofday` | 23:00
| `@hourofdayofweek` | Wednesday 16:00
| `@minute` | 2025-12-25 20:00
| `@minutes/5` | 2025-01-09 04:25:00
| `@minutes/15` | 2025-01-09 17:45:00
| `@minutes/30` | 2025-01-09 23:30:00
| `@month` | 2025-12
| `@monthofyear` | December
| `@quarter` | 2025-Q4
| `@quarterofyear` | Q2
| `@week-sun` | 2025-12-28
| `@week`, `@week-mon` | 2025-12-29
| `@year` | 2025

When using `@week` you can optionally specify if weeks should start on Sunday or Monday. The default is Monday.

<pre>
<code class="language-cerb">
{% raw %}
by:[created@month,worker] 
{% endraw %}
</code>
</pre>

### Links

The `by:` fields can specify `links` or `links.*` (e.g. `links.org`) fields. This could create a report like _"Sum of time tracking entries linked to organizations by month"_.

<pre>
<code class="language-cerb">
{% raw %}
by:[links.org] 
{% endraw %}
</code>
</pre>

### Limits

When a field has only a few possible values we say it has _"low cardinality"_. A ticket's status is one of four values: open, waiting, closed, or deleted. A checkbox is _binary_ -- it can only be `true` or `false`.

Conversely, some _"high cardinality"_ fields have potentially infinite possible values. You may have millions of unique ticket subjects. There may be thousands of organizations in your address book. Your team may have hundreds of members.

You can **limit** the cardinality of a field by appending a tilde (`~`) to any `by:` field and providing a number. This only returns that number of the most common (top) values.

<pre>
<code class="language-cerb">
{% raw %}
by:[created@month~10,org~25]
{% endraw %}
</code>
</pre>

### Limit ordering

You can also return the least common (bottom) values by providing a negative number as the limit.

<pre>
<code class="language-cerb">
{% raw %}
by:[group~-5] 
{% endraw %}
</code>
</pre>

# timeout:

The time limit of the query in milliseconds (0-60000). Default: `20000`.

# timezone:

(Available in [10.2.0](/releases/10.2.0/) or later)

The `timezone:` key generates date labels in the given timezone location for bins like `by:[created@day]`.

An option like `timezone:America/Los_Angeles` uses the offset UTC-7 or UTC-8 depending on Daylight Saving Time.

If omitted, this defaults to the timezone of the current worker or the server.

# metric:

(Available in [9.0.7](/releases/9.0.7/) or later)

The `metric:` key lets you specify an arbitrary **equation** to modify the calculated value for each row in the results.

In this equation, the metric value is represented by the placeholder `x`.

<pre>
<code class="language-cerb">
{% raw %}
metric:"x*100"
{% endraw %}
</code>
</pre>

### Mathematical operations

Basic mathematical operations are supported using `+` (addition), `-` (subtraction), `/` (division), `*` (multiplication), `**` (exponents).

<pre>
<code class="language-cerb">
{% raw %}
metric:"x**2"
{% endraw %}
</code>
</pre>

You can group operations with parentheses (`()`).

<pre>
<code class="language-cerb">
{% raw %}
metric:"(x+2)*100"
{% endraw %}
</code>
</pre>

### Filters

Numeric [filters](/docs/bots/scripting/filters/) from [bot scripting](/docs/bots/scripting/) can be appended to a result following a pipe (`|`) character.

* [abs](/docs/bots/scripting/filters/#abs)
* [number_format](/docs/bots/scripting/filters/#number_format)
* [round](/docs/bots/scripting/filters/#round)

<pre>
<code class="language-cerb">
{% raw %}
metric:"(x/4.33)|round"
{% endraw %}
</code>
</pre>

# group:

(Available in [9.0.7](/releases/9.0.7/) or later)

Occasionally you may need to treat nested subtotals as _"samples"_ and calculate statistics using them.

Suppose you want the average _weekly_ number of email replies sent per worker _over the past month_.

If you just use `created@week`:

<pre>
<code class="language-cerb">
{% raw %}
of:message
by:[worker~20,created@week]
query:(created:"-1 month")
{% endraw %}
</code>
</pre>

...then you'll get back a row for every worker for every week in the past month. If there are 20 workers with 4 weekly samples, that's 80 rows.

You can use `group:` to flatten those results with a function:

<pre>
<code class="language-cerb">
{% raw %}
of:message
by:[worker~20,created@week]
query:(created:"-1 month")
group.avg:[worker]
{% endraw %}
</code>
</pre>

This returns only a single row per worker, with the average count of their weekly samples over the past month.

The available functions are:

* `sum` (default)
* `avg`, `average`
* `min`
* `max`

Like the [by](#by) field, the function is appended to the `group` key following a period (`.`).

# format:

The subtotaled worklist results can be returned in various formats:

* **tree** (default) returns hierarchal data (a `name` and `value` for each node, and a list of `children` for branches).

* **dictionaries** returns a table-based format suitable for sheets and API results.

* **categories** returns a series-based format suitable for bar charts.

* **pie** returns data for use in pie and donut charts. 

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget. When nested 
subtotals are used, a row is returned for each distinct result (e.g. Support -> Kina, Support -> Janey).

* **timeseries** returns series-based data suitable for a time-series chart (with the 'x' axis values as timestamps). 

# Examples

## Return a stacked bar chart of tickets by owner by status

<pre>
<code class="language-cerb">
type:worklist.subtotals
of:tickets 
by:[owner~10,status] 
query:(owner.id:any) 
format:categories
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-subtotals-owner-status.png" class="screenshot">
</div>
