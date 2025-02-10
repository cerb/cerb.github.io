---
title: 'Automations: log'
excerpt: This page provides information on the "log" command used in Cerb automations
  to write data to the automation log with specified severity levels.
summary: This page provides information on the "log" command used in Cerb automations
  to write data to the automation log with specified severity levels. It details the
  syntax for logging messages, including different severity levels such as notice,
  warning, error, and alert. Each log entry records the automation name, node, creation
  date, log level, and message, which can be accessed through data queries. The page
  serves as a guide for using the log command to assist with error reporting and debugging
  in automations.
permalink: /docs/automations/commands/log/
toc:
  title: log
  expand: Automations
jumbotron:
  title: log
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **log:** command writes data to the automation log with a given severity. Automations that exit in the `error` state also create entries to assist with error reporting and debugging.

* TOC
{:toc}

{% highlight cerb %}
{% raw %}
start:
  log: This is a notice
  log.warn: This is a warning
  log.error: This is an error
  log.alert: This is an alert
{% endraw %}
{% endhighlight %}

Each log entry contains:

* automation name
* automation node
* created date
* log level (severity)
* message

Log entries are accessed with [data queries](/docs/data-queries/).

# Syntax

## inputs:

A log message.

## output:

(none)
