---
title: Queues
excerpt: Queues store a set of temporary messages from producers and distribute them
  to consumers in the order they were received.
summary: "This page provides an overview of queues in Cerb, detailing their function
  as temporary storage for messages from producers, which are then distributed to
  consumers in the order received. It covers key aspects such as naming conventions
  for queues, where each queue has a unique identifier often based on a reverse domain
  name to ensure global uniqueness. The page explains the states of messages within
  a queue\u2014available, in_flight, failed, or complete\u2014and how consumers interact
  with these messages. It also discusses the retry mechanism for in_flight messages
  and the conditions for marking messages as complete or failed. Additionally, the
  page outlines how queues can be utilized in automations, with specific commands
  for popping and pushing items in a queue."
permalink: /docs/queues/
toc: ~
jumbotron:
  title: Queues
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
---

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

**Queues** store a set of temporary messages from producers and distribute them to consumers in the order they were received.

* TOC
{:toc}

# Names

Each queue has a unique, namespaced identifier (e.g. `cerb.queue.name`) using dot-notation.

The `cerb.` prefix is reserved for built-in queues. You can create your queues with any other prefix.

By convention, the prefix is most often a domain name you own in reverse order (e.g. `com.example.queue.name`) to ensure global uniqueness. This makes it easier to combine and share queues across multiple Cerb environments.

# Messages

Messages with arbitrary payloads can be pushed into a queue. 

A message is always in one of four states: `available`, `in_flight`, `failed`, or `complete`.

For instance, every historical ticket can be reviewed by pushing ranges of IDs into a queue as messages.

# Consumers

Concurrent consumers can pop `available` messages from the queue to process them.

Each consumer is assigned a unique ID.

The number of queue consumers can be scaled up to the desired throughput.

# Success and failure

An `in_flight` queue message is retried after a period of time unless it is marked `complete` or `failed` by a consumer.

# Using queues in automations

|---
| Command
|-
| [queue.pop](/docs/automations/commands/queue.pop/) | Pop items from a queue
| [queue.push](/docs/automations/commands/queue.push/) | Push items into a queue
