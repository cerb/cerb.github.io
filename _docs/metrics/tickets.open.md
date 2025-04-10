---
title: 'Metrics: Tickets Open'
excerpt: This page provides examples and details on the tickets.open metric
permalink: /docs/metrics/tickets.open/
toc:
  title: tickets.open
jumbotron:
  title: tickets.open
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Metrics &raquo;
    url: /docs/metrics/
---

* TOC
{:toc}

# Description

This metric tracks the number of tickets open over time. It can be both broken down and filtered by group and bucket. This metric is different from a regular `worklist.subtotals` query as it is sampled every 15 minutes rather than being queried in real time. When dealing with large datasets over long periods of time, this can lead to far more efficiently generated reports than realtime queries.

# Dimensions

| Dimension | Description                     |
|-----------|---------------------------------|
| group_id  | the group record of the ticket  |
| bucket_id | the bucket record of the ticket |
