---
title: 'Metrics: Agent Model Turns'
excerpt: This page provides examples and details on the cerb.agent.model.turns metric
permalink: /docs/metrics/cerb.agent.model.turns/
toc:
  title: cerb.agent.model.turns
jumbotron:
  title: cerb.agent.model.turns
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

This counter tracks how many [agent](/docs/agents/) turns each [agent model](/docs/records/types/agent_model/) ran, broken down by model, agent, and the provider's response status.

The status dimension is what makes this more than a volume count. Rate limits (`429`), overloaded providers (`529`), and endpoints that never answered (`0`) each form their own series alongside the successful turns, so a provider degrading is visible as a shape rather than as a support ticket.

Divide [cerb.agent.model.turns.duration](/docs/metrics/cerb.agent.model.turns.duration/) by this metric over the same range and dimensions to get an **average response time** per model.

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
