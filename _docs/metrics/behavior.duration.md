---
title: 'Metrics: Behavior Duration'
excerpt: This page provides examples and details on the behavior.duration metric
permalink: /docs/metrics/behavior.duration/
toc:
  title: behavior.duration
jumbotron:
  title: behavior.duration
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

This metric tracks how long your bot behaviors take to execute. Lots of behaviors that take a long time to execute can slow down processes. If you find you have a lot of behaviors with long execution times, especially all on a single event, it may be worth seeing if you can remake them more efficiently as an automation.

# Dimensions

| Dimension   | Description                          |
|-------------|--------------------------------------|
| behavior_id | The bot behavior records             |
| event       | the event that triggers the behavior |
