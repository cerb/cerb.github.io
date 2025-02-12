---
title: Find month end dates
excerpt: Use the `|date_modify` filter to find the last day of each month.
summary: This page demonstrates how to use the `|date_modify` filter to 
  find the last day of each month in a given year. It shows how to iterate 
  through months and format the output as readable dates.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/find-month-end.png
---

{% comment %}
* Uses `|date_modify` filter
* Iterates through months
* Finds last day of each month
* Handles leap years automatically
* Formats dates consistently
{% endcomment %}

## Finding last day of each month

Here is an example of using the [date()](/docs/scripting/functions/#date) function to create date objects and the [\|date_modify](/docs/scripting/filters/#date_modify) filter to find the last day of each month in a given year.

{% tabs find-month-end %}
{% tab find-month-end automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      {% for mo in range(1,12) %}
      {{date('2028-' ~ mo)|date_modify('last day of this month')|date('r')}}
      {% endfor %}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab find-month-end output %}
{% highlight yaml %}
{% raw %}
__return:
  output: |
    Mon, 31 Jan 2028 00:00:00 -0800
    Tue, 29 Feb 2028 00:00:00 -0800
    Fri, 31 Mar 2028 00:00:00 -0700
    Sun, 30 Apr 2028 00:00:00 -0700
    Wed, 31 May 2028 00:00:00 -0700
    Fri, 30 Jun 2028 00:00:00 -0700
    Mon, 31 Jul 2028 00:00:00 -0700
    Thu, 31 Aug 2028 00:00:00 -0700
    Sat, 30 Sep 2028 00:00:00 -0700
    Tue, 31 Oct 2028 00:00:00 -0700
    Thu, 30 Nov 2028 00:00:00 -0800
    Sun, 31 Dec 2028 00:00:00 -0800
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}