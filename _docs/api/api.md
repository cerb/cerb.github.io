---
title: API Reference
permalink: /docs/api/
excerpt: Programmatically interact with Cerb from other apps and services.
toc:
  title: Intro
jumbotron:
  title: API
  tagline: Programmatically interact with Cerb from other apps and services.
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

The REST-based[^rest] Web API[^api] provides the ability to remote control Cerb for automation, synchronization, and integration. For example, you can use the API from other applications and services to create tickets, search records, monitor notifications, manage tasks, and interact with [bots](/docs/bots/).

The API uses per-application credentials and per-worker permissions to authorize API requests. It supports returning data in XML or JSON.

Before continuing, [follow these instructions](/guides/api/configure-plugin/) to enable the Web API plugin and generate a key-pair.

# References

[^api]: Wikipedia - <http://en.wikipedia.org/wiki/API>
[^rest]: Wikipedia - <http://en.wikipedia.org/wiki/REST>