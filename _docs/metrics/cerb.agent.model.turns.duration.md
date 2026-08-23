---
title: 'Metrics: Agent Model Turn Duration'
excerpt: This page provides examples and details on the cerb.agent.model.turns.duration metric
permalink: /docs/metrics/cerb.agent.model.turns.duration/
toc:
  title: cerb.agent.model.turns.duration
jumbotron:
  title: cerb.agent.model.turns.duration
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

This counter accumulates the **duration in milliseconds** of [agent](/docs/agents/) turns, broken down by model, agent, and the provider's response status.

It's a counter of accumulated milliseconds rather than a gauge of one turn's latency, so it's read against [cerb.agent.model.turns](/docs/metrics/cerb.agent.model.turns/): dividing this by the turn count over the same range and dimensions gives the average response time.

Duration measures the **provider request itself**, not time the turn spent waiting for a concurrency slot in the [queue](/docs/queues/). A busy queue therefore never reads as a slow model.

A failed turn still records its duration. Filtering on the `status` dimension separates how long a successful turn takes from how long it takes to fail.

# Dimensions

| Dimension | Description                                                                                                       |
|-----------|-------------------------------------------------------------------------------------------------------------------|
| model_id  | The [agent model](/docs/records/types/agent_model/) that ran the turn                                              |
| status    | The provider's HTTP response status. `200` on success, `429` for a rate limit, `529` for an overloaded provider, and `0` when no response arrived at all -- a DNS failure, a refused connection, or a timeout |
| agent_id  | The AI [worker](/docs/records/types/worker/) the turn ran as                                                       |

There is no `worker_id` dimension on this metric. Use the [token metrics](/docs/metrics/cerb.agent.model.tokens.input/) for a per-worker breakdown.

# What is counted

Interactive and background turns are both recorded, as is the compaction pass that summarizes a long conversation.

Unlike the token metrics, a **failed** turn is counted here. That's the point of the `status` dimension: a turn that was rate limited, refused, or never answered has no usage to report but is exactly the event you want a series for.

[`llm.chat:`](/docs/automations/commands/llm.chat/) and the model connection test are excluded. Neither has an agent session behind it, so every dimension would be zero.

# Related

* [cerb.agent.model.tokens.input](/docs/metrics/cerb.agent.model.tokens.input/) -- uncached prompt tokens
* [cerb.agent.model.tokens.output](/docs/metrics/cerb.agent.model.tokens.output/) -- completion tokens
* [cerb.agent.model.tokens.cache_read](/docs/metrics/cerb.agent.model.tokens.cache_read/) -- prompt tokens served from cache
* [cerb.agent.model.tokens.cache_write](/docs/metrics/cerb.agent.model.tokens.cache_write/) -- prompt tokens written to cache
* [cerb.agent.model.turns](/docs/metrics/cerb.agent.model.turns/) -- turn counts by response status
* [cerb.agent.model.turns.duration](/docs/metrics/cerb.agent.model.turns.duration/) -- cumulative turn latency
