---
title: 'Metrics: Webhook Invocations'
excerpt: This page provides examples and details on the webhook.invocations metric
permalink: /docs/metrics/webhook.invocations/
toc:
  title: webhook.invocations
jumbotron:
  title: webhook.invocations
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

This metric tracks how often your webhooks are hit. This metric provides an easy way to find your most and least used webhooks. With that information, you can remove any webhooks that are no longer used.

# Dimensions

| Dimension  | Description                                 |
|------------|---------------------------------------------|
| webhook_id | the webhook listener record                 |
| client_ip  | the ip of the services pinging the webhooks |
