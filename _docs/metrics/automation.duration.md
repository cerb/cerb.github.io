---
title: 'Metrics: Automation Duration'
excerpt: This page provides examples and details on the automation.duration metric
permalink: /docs/metrics/automation.duration/
toc:
  title: automation.duration
jumbotron:
  title: automation.duration
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

This metric tracks how long automations take to execute. If you have too many automations with very long execute times on a single event, it can slow down the UI (eg. how long a draft takes to send after pressing the send button or how long a draft editor takes to pop up). You could try to remake the automation so it is more efficient (eg. cutting down on time-expensive search queries) or narrowing down the event bindings so it invokes only when necessary. If you are experiencing UI elements taking longer to run, you should check this metric.

# Dimensions

| Dimension     | Description                                                         |
|---------------|---------------------------------------------------------------------|
| automation_id | the automation record                                               |
| trigger       | the automation trigger (eg `record.changed`)                        |
