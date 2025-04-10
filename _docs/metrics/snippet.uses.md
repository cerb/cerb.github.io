---
title: 'Metrics: Snippet Uses'
excerpt: This page provides examples and details on the snippet.uses metric
permalink: /docs/metrics/snippet.uses/
toc:
  title: snippet.uses
jumbotron:
  title: snippet.uses
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

This metric tracks the number of times snippets are used, both by the snippet and by the worker using them. This way, you can track if certain snippets are being used more or less than others, potentially identifying snippets that may need improving.

# Dimensions

| Dimension  | Description                    |
|------------|--------------------------------|
| snippet_id | The snippet records            |
| worker_id  | the workers using the snippets |

# Examples