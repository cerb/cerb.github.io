---
title: "Automations: metric.increment"
excerpt: The metric.increment command adds samples to a metric 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/metric.increment/
toc:
  title: metric.increment
  expand: Reference
jumbotron:
  title: metric.increment
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **metric.increment:** command adds new samples to a [metric](/docs/metrics/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  metric.increment:
    inputs:
      metric_name: example.workerLogin.fails
      dimensions:
        worker@int: {{worker_id}}
        ip: {{client_ip}}
      values: 1
    output: results
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

|---
| Key | 
|-|-
| `metric_name:` | The [metric](/docs/metrics/) name to add samples to
| `dimensions:` | An optional key/value dictionary for [dimensions](/docs/metrics/#dimensions)
| `values:` | A number, or array of numbers, for each sample. This defaults to `1` for counters if omitted
| `is_realtime@bool:` | If `true` the metric is updated instantly, otherwise (by default) it's queued 
| `timestamp@date:` | The optional timestamp for retroactive metrics. This defaults to `now`

## output:

Save the metrics result to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of updating the metric.

If omitted, the metric is updated during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder contains an empty dictionary on success.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.