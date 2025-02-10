---
title: 'Estimate seat usage'
excerpt: Estimate seat usage from activity log data.
summary: "This page provides tips on estimating seat usage from activity log data. It suggests using data queries to retrieve raw data, such as the number of activity logs by worker over the past week, and offers examples of queries that can be run using the Data Query Tester, including filtering workers by group and showing distinct workers per day."
layout: integration
author: The Cerb Team
permalink: /tips/estimate-seat-usage/
jumbotron:
  title: 'Estimate seat usage'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---
You can use a [data query](docs/data-queries/) to get at raw data like the activity log counts by worker over the past week. This can help you estimate seat usage and if you have the correct ammount.

You can add these queries to a chart or run then in the data query tester found in **Setup >> Developers >> Data Query Tester**: 

Use the following query:

{% highlight cerb %}
{% raw %}
type:worklist.subtotals
of:activity_log
by:[actor~500]
query:(actor:worker created:"today -1 week")
format:pie
{% endraw %}
{% endhighlight %}

You can filter workers by group like this:

{% highlight cerb %}
{% raw %}
type:worklist.subtotals
of:activity_log
by:[actor~500]
query:(actor:worker created:"today -1 week" actor.worker:(group:(name:"Support")))
format:pie
{% endraw %}
{% endhighlight %}

You can also show the number of distinct workers each day in the activity logs:

{% highlight cerb %}
{% raw %}
type:worklist.subtotals
of:activity_log
by.distinct:[created@day,actor~500]
query:(actor:worker created:"today -1 week" actor.worker:(group:(name:"Support")))
format:timeseries
{% endraw %}
{% endhighlight %}

That won't tell you how long each session was, but it gives a general idea of activity per worker.