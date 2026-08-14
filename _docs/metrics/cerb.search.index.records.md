---
title: 'Metrics: Search Index Records'
excerpt: This page provides examples and details on the cerb.search.index.records metric
permalink: /docs/metrics/cerb.search.index.records/
toc:
  title: cerb.search.index.records
jumbotron:
  title: cerb.search.index.records
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

This gauge counts the records held by each [search index](/docs/records/types/search_index/) over time, broken down by index and engine.

Use it to watch an index fill during a re-index, confirm an index is keeping pace with the records it covers, or spot one that has stopped growing.

It also backs the `records:` quick search filter and the 'Records' sparklines column on search index [worklists](/docs/worklists/).

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| index_id  | The [search index](/docs/records/types/search_index/) |
| engine    | The search index engine backing it |
