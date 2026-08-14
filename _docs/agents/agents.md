---
title: AI Agents
excerpt: Configure AI agents in Cerb using agent models, model routers, AI workers, and mountable agent filesystems.
summary: This page explains how AI agents work in Cerb. An agent is an ordinary worker record flagged as AI, so it can own tickets, be @mentioned, and hold API credentials like any other worker. Agent model records configure which LLM models are available and where their credentials come from, while agent model routers let an automation ask for a model without naming one so scripts stay portable between installations. Agent filesystems give agents named volumes of files they can read and write through a familiar command set. This page covers all of these pieces and how the llm.agent, llm.chat, and llm.router automation commands tie them together.
permalink: /docs/agents/
toc:
  title: AI Agents
  expand: Reference
jumbotron:
  title: AI Agents
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
---

* TOC
{:toc}

# Introduction

An **AI agent** in Cerb is an ordinary [worker](/docs/workers/) record with an `is_ai` flag, rather than a separate record type. That single decision explains most of how agents behave: an agent can own a [ticket](/docs/records/types/ticket/), be `@mentioned` in a comment, belong to a [group](/docs/groups/), appear in a worklist, and hold [API](/docs/api/) credentials, because those capabilities already belong to workers.

An AI worker can never sign in. Interactive logins and SSO are refused outright, and an AI worker doesn't require an email address.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/dOjF7-nofbA" title="Watch every AI agent conversation with LLM transcripts" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

<div class="cerb-box note">
	<p>
		To list only AI workers, search workers with <code>isAi:y</code>. You can also give that
		query its own entry in the <b>Search</b> menu with a
		<a href="/docs/search/">search facet</a>.
	</p>
</div>

# The pieces

Four record types work together, and you don't need all of them to get started:

|---
| Record type | Purpose
|-|-
| [Agent Model](/docs/records/types/agent_model/) | A model you can use: its provider, model ID, credentials, and context window
| [Agent Model Router](/docs/records/types/agent_model_router/) | An ordered list of models, so a script can ask for "a model" without naming one
| [Worker](/docs/records/types/worker/) (`is_ai`) | The agent's identity -- name, image, ownership, `@mention` handle
| [Agent Filesystem](/docs/records/types/agent_filesystem/) | A named volume of files an agent can read and write

## Agent models

An [agent model](/docs/records/types/agent_model/) record holds everything needed to call one model: the provider, the model ID, an optional API endpoint URL, an encrypted [connected account](/docs/records/types/connected_account/) for credentials, the size of its context window, whether it accepts images, and a block of provider-specific parameters.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/vF-F3vkKoCI" title="Agent models in Cerb; any provider, any model" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

You don't need to know model IDs by heart. Once the provider and credentials are set, the editor asks the provider which models that key can actually use and offers them as a list. That live list is also the only accurate one for a self-hosted OpenAI-compatible endpoint -- llama.cpp, LM Studio, vLLM, or a local Ollama -- where a hardcoded list can't know what's loaded.

Once a model is configured, [automations](/docs/automations/) reference it **by name** instead of repeating a provider block inline, so credentials and tuning live in one place:

{% highlight cerb %}
{% raw %}
llm.chat:
  output: results
  inputs:
    model: haiku
    messages:
      0:
        role: user
        content: Summarize this conversation in one sentence.
{% endraw %}
{% endhighlight %}

## Model routers

Naming a model directly works, but it ties the automation to your installation. An [agent model router](/docs/records/types/agent_model_router/) resolves to a list of models, so a script can ask for a capability rather than a specific model.

**Setting the default router is the simplest way to configure everything at once.** One router can carry the default flag, and it applies to anything that doesn't name a model, a router, or an agent of its own -- so a single record decides what the whole installation uses, and changing models later is one edit in one place.

The portable pattern is to name an **agent** and let the agent carry the router:

{% highlight cerb %}
{% raw %}
llm.agent:
  inputs:
    agent: @researcher
    messages:
      0:
        role: user
        content: {{prompt}}
{% endraw %}
{% endhighlight %}

When you need the model list *as data* -- to filter it, round-robin it, or feed two commands from one resolution -- use the [`llm.router:`](/docs/automations/commands/llm.router/) command instead.

## Agent filesystems

An [agent filesystem](/docs/records/types/agent_filesystem/) is a named volume of files that both agents and workers can read and write. Each volume tracks its file count and total size, and a ZIP archive can be bulk-imported in the background.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/LAy--sYJQYk" title="Agent filesystems and virtual terminal in Cerb 11.2+" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

An automation makes volumes available to an agent by listing them under `mounts:`. Doing so enables a single `agent_fs` tool covering every mounted volume -- because there's one tool regardless of how many volumes are mounted, adding a mount doesn't change the tool schema or invalidate the cached prompt prefix.

{% highlight cerb %}
{% raw %}
llm.agent:
  inputs:
    agent: @researcher
    mounts:
      handbook:
        mode: read-only
      scratch:
        mode: read-write
        create@bool: yes
{% endraw %}
{% endhighlight %}

| Key | Notes
|-|-
| `filesystem:` | The source volume, if it differs from the mountpoint key
| `mode:` | `read-only` (default) or `read-write`
| `at:` | An explicit mountpoint path, overriding the key
| `create@bool:` | Provision the volume by name on first mount

An empty `mounts:` block is a valid configuration: it mounts no volumes, but still gives the agent a `/tmp` scratch area.

### Filesystem commands

Agents and workers use the same command set, so what an agent can do and what you see in the terminal can't drift apart:

|---
| Command | Notes
|-|-
| `ls` | List one directory
| `find` | Recursive search by name, type, extension, or depth
| `cd` | Change directory
| `read` | Read a file, optionally by offset and limit
| `search` | Search file contents
| `write` | Write a file (read-write mounts only)
| `append` | Append to a file (read-write mounts only)
| `edit` | Replace an exact snippet, which must match once (read-write mounts only)
| `copy` | Copy one file
| `rm` | Delete a file (read-write mounts only)
| `pwd` | Print the working directory
| `help` | Show usage for all commands or one command

<div class="cerb-box note">
	<p>
		There is no <code>move</code> command. <code>copy</code> the file, then <code>rm</code> the source.
	</p>
</div>

Command output can be piped through a Twig filter chain, and output too large to return inline is spooled to `/tmp` and referenced by path.

Workers can browse and edit the same volumes from **Setup &raquo; Developers &raquo; Agent Filesystem Terminal**. Mount a volume there and it comes up read-only; switch it to `rw` to allow the write commands.

<div class="cerb-screenshot">
<img src="/assets/images/docs/agents/agent-filesystem-terminal.png" class="screenshot">
</div>

# Automations

Three [automation](/docs/automations/) commands work with agents:

|---
| Command | Notes
|-|-
| [`llm.agent:`](/docs/automations/commands/llm.agent/) | A multi-turn agent conversation with tools, mounts, and a transcript
| [`llm.chat:`](/docs/automations/commands/llm.chat/) | A single-turn completion with no transcript, memory, or tools
| [`llm.router:`](/docs/automations/commands/llm.router/) | Resolve a router to a list of models for use as data

Worker [interactions](/docs/interactions/) can include an [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) form element -- the composer a worker types into when an automation runs an agent conversation. It supports `@mention` completion for workers and filesystem files, image paste and attachment, model selection, and custom slash commands.

# Providers

Cerb supports thirteen LLM providers:

`anthropic`, `aws_bedrock`, `docker`, `gemini`, `groq`, `huggingface`, `ollama`, `openai`, `pinecone`, `qwen`, `together`, `voyage`, and `zai`.

Beyond that list, any provider that speaks the OpenAI API or Anthropic API protocol works too. Choose the matching provider on an [agent model](/docs/records/types/agent_model/) and change its API endpoint URL to point at the service -- that covers self-hosted runtimes like llama.cpp, LM Studio, and vLLM, as well as gateways and proxies that emulate either protocol.

Not every provider supports every capability. Chat streaming is implemented by every provider in that list, and is on by default wherever it's supported; add `stream@bool: no` to a provider's block to send a single blocking request instead. Embedding models are available from `aws_bedrock`, `huggingface`, `ollama`, `openai`, `pinecone`, `together`, and `voyage`.

# Long conversations

A conversation that outgrows the model's context window is **compacted** rather than failing: older turns fold behind a summary while recent turns are kept verbatim. By default this triggers at 90% of the context window and keeps roughly the last 5% verbatim. Both ratios are configurable per model under a `compaction:` block, and a worker can fold a session on demand with the `/compact` command.

Agent turns also use **prompt caching** by default, since a long conversation re-sends the same prefix every turn.
