---
title: 'Metrics: Open Queue Messages'
excerpt: This page provides examples and details on the cerb.queue.messages.open metric
permalink: /docs/metrics/cerb.queue.messages.open/
toc:
  title: cerb.queue.messages.open
jumbotron:
  title: cerb.queue.messages.open
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

This gauge snapshots the number of available and in-flight messages in each [queue](/docs/queues/), broken down by queue, [job](/docs/records/types/queue_job/), and status. Use it to spot stalled queues and backpressure -- a queue whose open count climbs and never drains is a sign that its consumer can't keep up or has failed.

Available in [Cerb 11.2](/releases/11.2/) and later.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| queue_id  | The [queue](/docs/queues/) the messages belong to |
| job_id    | The [queue job](/docs/records/types/queue_job/) the messages belong to (`0` when not part of a job) |
| status_id | The message status: available or in-flight |

# Related

See also [cerb.queue.messages.processed](/docs/metrics/cerb.queue.messages.processed/) for completed and failed message counts.
