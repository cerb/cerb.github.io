---
title: "Automations: log"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/log/
toc:
  title: log
  expand: Automations
jumbotron:
  title: log
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

{% include docs/note_preview.html %}

The **log:** command writes data to the automation log with a given severity. Automations that exit in the `error` state also create entries to assist with error reporting and debugging.

* TOC
{:toc}

<pre>
<code class="language-cerb">
{% raw %}
start:
  log: This is a notice
  log.warn: This is a warning
  log.error: This is an error
  log.alert: This is an alert
{% endraw %}
</code>
</pre>

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
