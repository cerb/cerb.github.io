---
title: 'Metrics: Worker Session Seat Kick Duration'
excerpt: This page provides examples and details on the cerb.sessions.seat.kicks.duration metric
permalink: /docs/metrics/cerb.sessions.seat.kicks.duration/
toc:
  title: cerb.sessions.seat.kicks.duration
jumbotron:
  title: cerb.sessions.seat.kicks.duration
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

This counter accumulates the idle age (in seconds) of [worker](/docs/workers/) sessions that were ended to free up a license seat. Combined with [cerb.sessions.seat.kicks](/docs/metrics/cerb.sessions.seat.kicks/), this lets you see how long sessions had been idle when they were kicked -- useful for tuning your session expiration policy.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| worker_id | The [worker](/docs/workers/) whose session was ended |
