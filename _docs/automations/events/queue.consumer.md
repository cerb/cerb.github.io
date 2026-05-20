---
title: queue.consumer
excerpt: This page documents the "queue.consumer" automation event used by
  automation-backed queues to process a batch of messages.
summary: This page documents the "queue.consumer" automation event in Cerb. The
  event is dispatched by the Background Queue scheduler when an
  automation-backed queue has messages available to process. Placeholders
  include the queue record, the optional queue job that owns the batch, and an
  array of message dicts with their uuid, payload, available_at, and job_id.
  The event has no outputs -- any non-error response is treated as successful
  delivery of the entire batch.
permalink: /docs/automations/events/queue.consumer/
toc:
  title: queue.consumer
  expand: Automations
jumbotron:
  title: queue.consumer
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
    url: /docs/automations/#events
---

(Added in [11.2](/releases/11.2/))

**queue.consumer** [automation](/docs/automations/) [events](/docs/automations/#events) are triggered by the [Background Queue scheduler](/docs/queues/#background-queue-scheduler) to process a batch of messages from an [automation-backed queue](/docs/queues/#automation-backed-queues).

The batch size is configured per [queue](/docs/records/types/queue/) -- use `1` for expensive per-message operations, or `10`-`100+` to amortize batch operations.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `queue_*` | record | The [queue](/docs/records/types/queue/) being consumed. Supports key expansion.
| `queue_job_*` | record | The [queue job](/docs/records/types/queue_job/) that owns this batch, if any. Supports key expansion.
| `messages` | array | An array of {% raw %}`{uuid, message, available_at, job_id}`{% endraw %} dicts for the batch.

# Outputs

(none)

Any non-error response is treated as successful delivery of the entire batch. If the automation returns an `error:` outcome, the messages remain in their current state and the queue's retry policy determines what happens next.
