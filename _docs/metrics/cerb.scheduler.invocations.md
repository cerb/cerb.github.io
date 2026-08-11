---
title: 'Metrics: Scheduler Invocations'
excerpt: This page provides examples and details on the cerb.scheduler.invocations metric
permalink: /docs/metrics/cerb.scheduler.invocations/
toc:
  title: cerb.scheduler.invocations
jumbotron:
  title: cerb.scheduler.invocations
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Metrics &raquo;
    url: /docs/metrics/
search_index:
  exclude: true
---

* TOC
{:toc}

# Description

This counter tracks how often each [scheduler](/docs/setup/configure/scheduler/) job runs. Use it to confirm that scheduled tasks fire on the cadence you expect (e.g. that nightly maintenance runs once a day) and to spot jobs that are running far more or less often than intended.

Available in [Cerb 11.2](/releases/11.2/) and later.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| job       | The [scheduler](/docs/setup/configure/scheduler/) job that ran |

# Related

See also [cerb.scheduler.duration](/docs/metrics/cerb.scheduler.duration/) for how long each scheduler job takes to run.
