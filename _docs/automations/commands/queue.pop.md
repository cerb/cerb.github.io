---
title: "Automations: queue.pop"
excerpt: The queue.pop command reads messages from a queue. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/queue.pop/
toc:
  title: queue.pop
  expand: Reference
jumbotron:
  title: queue.pop
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

The **queue.pop:** command reads messages from a [queue](/docs/queues/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  queue.pop:
    inputs:
      queue_name: example.queue.name
      limit: 1
    output: results
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

|---
| Key | 
|-|-
| `queue_name:` | The [queue](/docs/queues/) name to read messages from
| `limit:` | The maximum number of messages to retrieve at once

## output:

Save the metrics result to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of reading messages from the queue.

If omitted, messages are read from the queue during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `consumer_id` | The unique consumer ID key used to reserve the read messages. This is used to mark queue messages as successful or failed.
| `messages` | An array of messages. The key is the unique queue message ID and the value is a dictionary with keys for `queue:` and `data:`

For example:

<pre>
<code class="language-cerb">
{% raw %}
results:
  consumer_id: "0x1ec8aee9cb856fd48e0a8d3225229102"
  messages:
    1ec8aedf82d0642e858367a0b25a73aa:
      queue: example.queue.name
      data:
        id: message0
        priority: high
{% endraw %}
</code>
</pre>

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.