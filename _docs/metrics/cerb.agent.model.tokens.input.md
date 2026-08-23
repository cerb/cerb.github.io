---
title: 'Metrics: Agent Model Input Tokens'
excerpt: This page provides examples and details on the cerb.agent.model.tokens.input metric
permalink: /docs/metrics/cerb.agent.model.tokens.input/
toc:
  title: cerb.agent.model.tokens.input
jumbotron:
  title: cerb.agent.model.tokens.input
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

This counter tracks **uncached prompt tokens** sent to a model on each [agent](/docs/agents/) turn, broken down by model, agent, and the worker the turn ran for.

Use it to see which models an installation actually spends on, and where that spend comes from -- per model, per agent, or per person.

Prompt tokens served from a provider's cache are counted separately in [cerb.agent.model.tokens.cache_read](/docs/metrics/cerb.agent.model.tokens.cache_read/), so this metric is the portion billed at the full input rate.

# Dimensions

| Dimension | Description                                                                                                       |
|-----------|-------------------------------------------------------------------------------------------------------------------|
| model_id  | The [agent model](/docs/records/types/agent_model/) that ran the turn                                              |
| agent_id  | The AI [worker](/docs/records/types/worker/) the turn ran as                                                       |
| worker_id | The [worker](/docs/records/types/worker/) the turn ran for. This is `0` when the conversation belongs to a portal visitor rather than a worker |

# What is counted

Interactive and background turns are both recorded, as is the compaction pass that summarizes a long conversation, so the totals reconcile with a [transcript](/docs/setup/developers/llm-agent-transcripts/)'s own token accounting.

A turn that **failed** contributes nothing here. The provider's usage report never arrives, so there are no tokens to count -- but the turn is still counted in [cerb.agent.model.turns](/docs/metrics/cerb.agent.model.turns/) with its status and latency. Token totals will therefore read slightly low on an installation with frequent provider errors.

[`llm.chat:`](/docs/automations/commands/llm.chat/) and the model connection test are excluded. Neither has an agent session behind it, so every dimension would be zero.

A token kind a provider reports as zero is skipped rather than written, so a provider that never uses a prompt cache doesn't accumulate empty samples.

# Related

* [cerb.agent.model.tokens.input](/docs/metrics/cerb.agent.model.tokens.input/) -- uncached prompt tokens
* [cerb.agent.model.tokens.output](/docs/metrics/cerb.agent.model.tokens.output/) -- completion tokens
* [cerb.agent.model.tokens.cache_read](/docs/metrics/cerb.agent.model.tokens.cache_read/) -- prompt tokens served from cache
* [cerb.agent.model.tokens.cache_write](/docs/metrics/cerb.agent.model.tokens.cache_write/) -- prompt tokens written to cache
* [cerb.agent.model.turns](/docs/metrics/cerb.agent.model.turns/) -- turn counts by response status
* [cerb.agent.model.turns.duration](/docs/metrics/cerb.agent.model.turns.duration/) -- cumulative turn latency
