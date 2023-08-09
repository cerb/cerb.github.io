---
title: "Scripting Reference: Dates"
excerpt: 
permalink: /docs/scripting/dates/
toc:
  title: Dates
  expand: Developer Guide
jumbotron:
  title: Dates
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Developer Guide &raquo;
  -
    label: Scripting &raquo;
    url: /docs/scripting/
---

# Formatting dates

Use the [date](/docs/scripting/filters/#date) filter to format a [string](/docs/scripting/strings/) or [variable](/docs/scripting/variables/) as a date:

<pre>
<code class="language-twig">
{% raw %}
{{'now'|date('F d, Y h:ia T')}}
{{'tomorrow 5pm'|date('D, d F Y H:i T')}}
{{'+2 weeks 08:00'|date('Y-m-d h:ia T')}}
{% endraw %}
</code>
</pre>

```
December 12, 2017 11:50am PST
Wed, 13 December 2017 17:00 PST
2017-12-26 08:00am PST
```

You can use any of the formatting options from [PHP DateTime::format](https://www.php.net/manual/en/datetime.format.php).

# Timezones

The second parameter to the [date](/docs/scripting/filters/#date) filter can specify a timezone to use:

<pre>
<code class="language-twig">
{% raw %}
{% set ts_now = date() -%}

Bangalore: {{ts_now|date(time_format, 'Asia/Kolkata')}}
Berlin: {{ts_now|date(time_format, 'Europe/Berlin')}}
New York: {{ts_now|date(time_format, 'America/New_York')}}
{% endraw %}
</code>
</pre>

```
Bangalore: December 13, 2017 01:27
Berlin: December 12, 2017 20:57
New York: December 12, 2017 14:57
```

# Unix timestamps

You can get a Unix timestamp (seconds since 1-Jan-1970 00:00:00 UTC) from a date value with the `|date('U')` filter:

<pre>
<code class="language-twig">
{% raw %}
It has been {{'now'|date('U')}} seconds since {{'0'|date(null, 'UTC')}}
{% endraw %}
</code>
</pre>

```
It has been 1513108417 seconds since January 1, 1970 00:00
```

# Timestamp Manipulation

If you need to manipulate a date, create a date object with the [date()](/docs/scripting/functions/#date) function and use the [date_modify](/docs/scripting/filters/#date_modify) filter:

<pre>
<code class="language-twig">
{% raw %}
{% set format = 'D, d M Y T' %}
{% set timestamp = date('now') %}
Now: {{timestamp|date(format)}}
+2 days: {{timestamp|date_modify('+2 days')|date(format)}}
{% endraw %}
</code>
</pre>

```
Now: Tue, 12 Dec 2017 PST
+2 days: Thu, 14 Dec 2017 PST
```

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/arrays-objects/" class="prev">&lt; Arrays and Objects</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/conditional-logic/" class="prev">Conditional Logic &gt;</a>
	</div>
</div>
<div class="clear"></div>