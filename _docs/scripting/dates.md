---
title: 'Scripting Reference: Dates'
excerpt: This page provides a scripting reference for handling dates in Cerb, focusing
  on formatting, timezones, Unix timestamps, and timestamp manipulation.
summary: This page provides a scripting reference for handling dates in Cerb, focusing
  on formatting, timezones, Unix timestamps, and timestamp manipulation. It explains
  how to use the date filter to format strings or variables as dates, with examples
  of different date formats. The page also covers specifying timezones for date formatting,
  obtaining Unix timestamps, and manipulating dates using the date_modify filter.
  The examples demonstrate practical applications of these functions, such as displaying
  current dates in various timezones and calculating future dates.
permalink: /docs/scripting/dates/
toc:
  title: Dates
  expand: Developer Guide
jumbotron:
  title: Dates
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

# Formatting dates

Use the [date](/docs/scripting/filters/#date) filter to format a [string](/docs/scripting/strings/) or [variable](/docs/scripting/variables/) as a date:

{% highlight twig %}
{% raw %}
{{'now'|date('F d, Y h:ia T')}}
{{'tomorrow 5pm'|date('D, d F Y H:i T')}}
{{'+2 weeks 08:00'|date('Y-m-d h:ia T')}}
{% endraw %}
{% endhighlight %}

Relative English date strings like these are resolved when the script runs, so their output isn't shown here. The examples below use a fixed date instead.

You can use any of the formatting options from [PHP DateTime::format](https://www.php.net/manual/en/datetime.format.php).

# Timezones

The second parameter to the [date](/docs/scripting/filters/#date) filter is the timezone the result is displayed in. It does not change the timezone a date string is _parsed_ in, so include the zone in the string itself when it matters:

{% highlight twig %}
{% raw %}
{% set time_format = 'F j, Y H:i' %}
{% set ts = date('2017-12-12 14:57 America/New_York') -%}

Bangalore: {{ts|date(time_format, 'Asia/Kolkata')}}
Berlin: {{ts|date(time_format, 'Europe/Berlin')}}
New York: {{ts|date(time_format, 'America/New_York')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Bangalore: December 13, 2017 01:27
Berlin: December 12, 2017 20:57
New York: December 12, 2017 14:57
{% endhighlight %}

# Unix timestamps

You can get a Unix timestamp (seconds since 1-Jan-1970 00:00:00 UTC) from a date value with the `|date('U')` filter:

{% highlight twig %}
{% raw %}
{{"2017-12-12 14:57 America/New_York"|date('U')}}
{{"1513108620"|date('F j, Y H:i', 'America/New_York')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1513108620
December 12, 2017 14:57
{% endhighlight %}

# Timestamp Manipulation

If you need to manipulate a date, create a date object with the [date()](/docs/scripting/functions/#date) function and use the [date_modify](/docs/scripting/filters/#date_modify) filter:

{% highlight twig %}
{% raw %}
{% set format = 'D, d M Y' %}
{% set timestamp = date('2017-12-12', 'UTC') %}
Then: {{timestamp|date(format, 'UTC')}}
+2 days: {{timestamp|date_modify('+2 days')|date(format, 'UTC')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Then: Tue, 12 Dec 2017
+2 days: Thu, 14 Dec 2017
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/arrays-objects/" class="prev">&lt; Arrays and Objects</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/conditional-logic/" class="prev">Conditional Logic &gt;</a>
	</div>
</div>
<div class="clear"></div>