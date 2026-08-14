---
title: 'Metrics: Processed Queue Messages'
excerpt: This page provides examples and details on the cerb.queue.messages.processed metric
permalink: /docs/metrics/cerb.queue.messages.processed/
toc:
  title: cerb.queue.messages.processed
jumbotron:
  title: cerb.queue.messages.processed
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

This counter tracks each [queue](/docs/queues/) message that finishes processing, broken down by queue, [job](/docs/records/types/queue_job/), and final status (done or failed). Use it to measure throughput, watch for a rising share of failures, and confirm that work is draining at the rate you expect.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| queue_id  | The [queue](/docs/queues/) the message belonged to |
| job_id    | The [queue job](/docs/records/types/queue_job/) the message belonged to (`0` when not part of a job) |
| status_id | The final message status: done or failed |

# Related

See also [cerb.queue.messages.open](/docs/metrics/cerb.queue.messages.open/) for available and in-flight message counts.
