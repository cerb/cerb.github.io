---
title: 'Metrics: Workers Active'
excerpt: This page provides examples and details on the workers.active metric
permalink: /docs/metrics/workers.active/
toc:
  title: workers.active
jumbotron:
  title: workers.active
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

This metric tracks which workers were active over time. Use it to see the busy times in your organization, and to compare activity between individuals or teams. You can filter it by individual workers or groups of workers.

It no longer reports against a limit. Workers and simultaneous logins are unlimited on every installation, so there's no seat allocation to size this against -- what a [subscription](/docs/setup/configure/license/) raises is concurrency instead.

# Dimensions

| Dimension | Description       |
|-----------|-------------------|
| worker_id | the worker record |
