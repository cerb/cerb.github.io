---
title: 'Metrics: Agent Model Cache Read Tokens'
excerpt: This page provides examples and details on the cerb.agent.model.tokens.cache_read metric
permalink: /docs/metrics/cerb.agent.model.tokens.cache_read/
toc:
  title: cerb.agent.model.tokens.cache_read
jumbotron:
  title: cerb.agent.model.tokens.cache_read
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

This counter tracks **prompt tokens served from a provider's cache** on each [agent](/docs/agents/) turn, broken down by model, agent, and the worker the turn ran for.

Compare it against [cerb.agent.model.tokens.input](/docs/metrics/cerb.agent.model.tokens.input/) to see how much of a conversation's prompt prefix is being reused rather than resent. A long conversation with a stable prefix should read mostly cache; a ratio that collapses is a sign something is changing the prefix between turns.

Not every provider supports prompt caching. One that never reports a cache read simply writes no samples here.

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
