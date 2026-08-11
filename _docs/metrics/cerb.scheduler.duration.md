---
title: 'Metrics: Scheduler Duration'
excerpt: This page provides examples and details on the cerb.scheduler.duration metric
permalink: /docs/metrics/cerb.scheduler.duration/
toc:
  title: cerb.scheduler.duration
jumbotron:
  title: cerb.scheduler.duration
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

This counter tracks how long each [scheduler](/docs/setup/configure/scheduler/) job runs, in milliseconds. Use it to find jobs that are getting slower over time, to size your scheduler interval against the work it has to do, and to catch a job that is starting to exceed its window.

Available in [Cerb 11.2](/releases/11.2/) and later.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| job       | The [scheduler](/docs/setup/configure/scheduler/) job that ran |

# Related

See also [cerb.scheduler.invocations](/docs/metrics/cerb.scheduler.invocations/) for how often each scheduler job runs.
