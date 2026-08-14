---
title: 'Metrics: Worker Session Seat Kicks'
excerpt: This page provides examples and details on the cerb.sessions.seat.kicks metric
permalink: /docs/metrics/cerb.sessions.seat.kicks/
toc:
  title: cerb.sessions.seat.kicks
jumbotron:
  title: cerb.sessions.seat.kicks
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

This counter tracks how often a [worker](/docs/workers/) session is terminated by Cerb to free up a license seat. A spike here may indicate that you have more concurrent workers than available seats -- workers with the oldest idle sessions are kicked first to make room.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| worker_id | The [worker](/docs/workers/) whose session was ended |

# Related

See also [cerb.sessions.seat.kicks.duration](/docs/metrics/cerb.sessions.seat.kicks.duration/) for the cumulative idle time of kicked sessions.
