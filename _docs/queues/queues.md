---
title: Queues
excerpt: Queues store a set of temporary messages from producers and distribute them
  to consumers in the order they were received.
summary: This page explains how queues work in Cerb -- naming conventions, message
  states, consumers, and how parallel background processing is wired up through
  the Background Queue scheduler, queue jobs, consumer extensions, and concurrency
  slots. Cerb 11.2 introduced first-class queue jobs, the Extension_QueueConsumer
  extension point, and the APP_QUEUE_CONCURRENCY_SLOTS configuration option.
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

A message can optionally belong to a [queue job](/docs/records/types/queue_job/) by setting its `job_id`. This groups related messages together so that progress can be monitored as a single unit.

# Consumers

Concurrent consumers can pop `available` messages from the queue to process them.

Each consumer is assigned a unique ID.

The number of queue consumers can be scaled up to the desired throughput.

## Consumer extensions

Each queue is associated with a **consumer extension** (`Extension_QueueConsumer`) that determines how messages are routed and processed:

|---
| Extension | Description
|-|-
| `cerb.queue.consumer.manual` | Messages are pulled by external workers (e.g. a custom script polling the API)
| `cerb.queue.consumer.internal` | Messages are routed to a built-in handler -- used by features like search indexing, bulk updates, and worklist imports/exports
| `cerb.queue.consumer.automation` | Each message invokes a configured [automation](/docs/automations/)

New consumer extensions can be added with [plugins](/docs/plugins/). A consumer extension may optionally implement `onQueueJobComplete()` to perform post-processing when an entire [queue job](/docs/records/types/queue_job/) finishes -- for example, assembling chunks into a final export attachment.

## Automation-backed queues

An **automation-backed queue** uses the built-in `cerb.queue.consumer.automation` consumer to dispatch each batch of messages to a configured [automation](/docs/automations/). Previously, draining a user-created queue required wiring up an [automation timer](/docs/records/types/automation_timer/) plus a hand-written loop -- automation-backed queues replace that boilerplate.

Each automation-backed queue has two configurable fields:

|---
| Field | Description
|-|-
| Batch size | Maximum number of messages dispatched to the automation per invocation. Use `1` for expensive operations (per-message), or `10`-`100+` to amortize batch operations.
| Automations KATA | An [event handler](/docs/automations/events/) for the [`queue.consumer`](/docs/automations/events/queue.consumer/) event. As with event listeners, the most appropriate automation can be selected programmatically based on the inputs.

The [Background Queue scheduler](#background-queue-scheduler) drains automation-backed queues -- there's no need to maintain a per-queue timer. The automation receives the [queue](/docs/records/types/queue/) record, the optional [queue job](/docs/records/types/queue_job/), and a `messages` array of `{uuid, message, available_at, job_id}` dicts.

Any non-error response is considered successful delivery for the entire batch. If the automation returns an `error:` outcome, the messages are marked failed and retried per the queue's policy.

# Success and failure

An `in_flight` queue message is retried after a period of time unless it is marked `complete` or `failed` by a consumer.

# Queue Jobs

A [queue job](/docs/records/types/queue_job/) is a first-class record that groups related queue messages so workers can monitor progress against long-running background work. Jobs are typically initiated from the UI -- for instance, exporting a worklist, importing a CSV/JSONL file, performing a bulk update, or re-indexing a search index.

Each job tracks:

* Counters for `available`, `inflight`, `done`, `failed`, and `total` messages
* The [worker](/docs/workers/) who initiated the job
* An optional `singleton_key` that prevents duplicate jobs from running concurrently
* Arbitrary metadata for consumer-specific state

Opening a queue job's card displays a **Queue Job Monitor** widget with live progress, completion notification, and linked attachments (e.g. the resulting export file).

# Background Queue scheduler

The [Background Queue](/docs/setup/configure/scheduler/#built-in-jobs) scheduler job processes messages and jobs asynchronously. It randomly round-robins through batches of available work across all queues and continues until either all work has been drained or its allotted run time is exhausted.

This scheduler also adopts worker-initiated jobs whose monitors have been closed -- for example, when a worker starts a long-running export and then navigates away. The job keeps running in the background, and the worker is notified when it completes.

# Concurrency slots

The [`APP_QUEUE_CONCURRENCY_SLOTS`](/docs/config-file/#optional-settings) configuration option (set in `framework.config.php`) determines the maximum combined concurrency of worker-initiated queue jobs. The default is `5`. This parallelizes, throttles, and timeshares queue job processing in high-volume environments to improve performance and worker experience.

Slots are reserved using the MySQL writer connection and are automatically released when the connection closes -- so an interrupted PHP request can never permanently consume a slot.

The default is sufficient for most environments. Increase the slot count when many workers run concurrent imports, exports, or bulk updates and you have the database capacity to support it.

# Post-processing chunks

Some queue jobs run their work in parallel chunks and then assemble a final artifact at completion. The `queue_job_chunk` table stores intermediate per-chunk output (e.g. one chunk per worklist export batch) so that the consumer extension can reassemble them in sorted order and produce a single file attachment when the job is `done`.

This is how parallel worklist exports (CSV, JSONL, XML) reconstruct a deterministic file regardless of the order chunks finished.

# Using queues in automations

|---
| Command
|-
| [queue.pop](/docs/automations/commands/queue.pop/) | Pop items from a queue
| [queue.push](/docs/automations/commands/queue.push/) | Push items into a queue
