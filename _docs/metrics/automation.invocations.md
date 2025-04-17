---
title: 'Metrics: Automation Invocations'
excerpt: This page provides examples and details on the automation.invocations metric
permalink: /docs/metrics/automation.invocations/
toc:
  title: automation.invocations
jumbotron:
  title: automation.invocations
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

This metric tracks how often automations invoke, on what trigger they invoke and what exit state they produce with each invocation. If an automation invokes overly frequently, especially if it results in an empty `return` exit state (such as when failing a validation check), it may be worth investigating if you can narrow down the activation conditions in the event bindings.

# Dimensions

| Dimension     | Description                                                         |
|---------------|---------------------------------------------------------------------|
| automation_id | the automation record                                               |
| trigger       | the automation trigger (eg `record.changed`)                        |
| exit_state    | The exit state produced in that invocation (what it ended up doing) |
