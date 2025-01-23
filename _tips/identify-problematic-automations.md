---
title: 'Identity problematic automations or behaviors'
excerpt: Find automations or behaviors that invoke too often or take too long to run.
summary: "This page provides tips on identifying problematic automations or behaviors in Cerb, which can be optimized to run less frequently or more efficiently. To find automations that have run too often or take too long to execute, users can use data queries to track automation and behavior invocations over the past month, and then visualize the results using a chart or data query tester. By analyzing these metrics, users can identify slowest automations and behaviors and optimize them with better conditions in their automation events."
layout: integration
author: The Cerb Team
permalink: /tips/identify-problematic-automations/
jumbotron:
  title: 'Identify problematic automations or behaviors'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---
You can use a [data query](docs/data-queries/) to identify which automations or behaviors have run in the past month and how many times. If an automation runs too often, you can optimize it with better `disabled@bool:` conditions in the automation event.

You can add these queries to a chart or run then in the data query tester found in **Setup >> Developers >> Data Query Tester**: 

<pre>
<code class="language-cerb">
{% raw %}
type:metrics.timeseries
series.automations:(
  metric:cerb.automation.invocations
  by:[automation_id]
)
series.behaviors:(
  metric:cerb.behavior.invocations
  by:[behavior_id]
)
range:"-1 month"
period:year
format:dictionaries
{% endraw %}
</code>
</pre>

You can find the slowest automations and behaviors (in milliseconds) with this query:

<pre>
<code class="language-cerb">
{% raw %}
type:metrics.timeseries
series.automations:(
  metric:cerb.automation.invocations
  by:[automation_id]
)
series.behaviors:(
  metric:cerb.behavior.invocations
  by:[behavior_id]
)
range:"-1 month"
period:year
format:dictionaries
{% endraw %}
</code>
</pre>