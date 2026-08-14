---
title: 'Metrics: Service Token Uses'
excerpt: This page provides examples and details on the cerb.service.token.uses metric
permalink: /docs/metrics/cerb.service.token.uses/
toc:
  title: cerb.service.token.uses
jumbotron:
  title: cerb.service.token.uses
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

This counter tracks each authentication using a [service token](/docs/records/types/service_token/) -- anonymous, privileged access to endpoints like `/cron`, `/debug`, and `/update`.

Use this metric to monitor cron health (e.g. confirm `cron:maint` is invoked once a day), spot misconfigured monitoring tools that share a single token across many checks, or detect unexpected traffic on a particular scope.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| token_id  | The [service token](/docs/records/types/service_token/) that authenticated |
| scope     | The endpoint scope used by the token (e.g. `cron:maint`, `debug:status`, `update`) |
| client_ip | The IP address of the client presenting the token             |
