---
title: Log retroactive metric values
excerpt: Log retroactive or custom values on a metric.
summary: "This page explains how to log retroactive metric values using Cerb's `metric.increment` command, which can be useful for backfilling data. The command allows users to specify a custom or retroactive value on a specific metric, and can also be used with policies to control access. Examples are provided in the documentation, including a code snippet that demonstrates how to use `metric.increment` with inputs such as a metric name, timestamp, and values, as well as a policy example to deny access unless the specified metric name matches a certain condition."
layout: integration
jumbotron:
  title: Log retroactive metric values
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

Using [metric.increment:](/docs/automations/commands/metric.increment/) you can log retroactive or custom values on a metric. This can be useful for backfilling.

<pre>
<code class="language-cerb">
{% raw %}
start:
  metric.increment:
    inputs:
      metric_name: example.metric.name
      timestamp@date: Jan 1 2025 5pm America/Los_Angeles
      values@csv: 1,2,3
{% endraw %}
</code>
</pre>

Use the policy:

<pre>
<code class="language-cerb">
{% raw %}
commands:
  metric.increment:
    deny/metric_name@bool: {{inputs.metric_name != 'example.metric.name'}}
    allow@bool: yes
{% endraw %}
</code>
</pre>

You can verify the data in **Setup >> Developers >> Data Query Tester**:

<pre>
<code class="language-cerb">
{% raw %}
type:metrics.timeseries
series.intervals:(
  metric:example.metric.name
  function:average
  missing:zero
)
period:day
range:"this month"
format:timeseries
{% endraw %}
</code>
</pre>