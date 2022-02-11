---
title: "Automations: queue.push"
excerpt: The queue.push command adds messages to a queue. 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/queue.push/
toc:
  title: queue.push
  expand: Reference
jumbotron:
  title: queue.push
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

The **queue.push:** command adds new messages to a [queue](/docs/queues/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  queue.push:
    inputs:
      queue_name: example.queue.name
      messages:
        0:
          id: message0
          priority: high
        1:
          id: message1
          priority: low
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
| `queue_name:` | The [queue](/docs/queues/) name to add messages to
| `messages:` | An array of messages to add. These can be strings or objects

## output:

Save the queue push result to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of pushing messages to the queue.

If omitted, messages are pushed to the queue during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder contains an array of unique queue message IDs. These can be reused to look up eventual message processing success or failure.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.