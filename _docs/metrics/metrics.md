---
title: Metrics
excerpt: Metrics...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/metrics/
toc:
title: Metrics
jumbotron:
  title: Metrics
  tagline:
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

**Metrics** aggregate time-based samples for statistics.

Metrics have a unique name like `cerb.workers.active` and store statistics in multiple resolutions: 5 mins, 1 hour, and 1 day.

Samples collected within the same period are aggregated into a statistic set with the number of samples, sum, min value, max value, and average.

By default, 5 minute samples are retained for 1 day, 1 hour samples for 2 weeks, and daily samples are stored indefinitely.

Metric samples are buffered until the end of the current request and then are efficiently enqueued for asynchronous processing by a new scheduler job.

Metrics statistics can be retrieved with [data queries](/docs/data-queries/metrics/timeseries/).

* TOC
{:toc}

# Dimensions

Metrics may be further partitioned with optional key/value pairs called "dimensions".

For example, the `cerb.automation.invocations` metric has dimensions for the `automation` and `event`; which allows for reporting across all automations, specific automations, specific events, or any combination thereof.

Dimensions may have the following types: `extension`, `number`, `record`, or `text`.
