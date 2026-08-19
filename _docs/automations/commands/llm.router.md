---
title: 'Automations: llm.router'
excerpt: Resolve one or more agent model searches to a list of models from a Cerb automation.
summary: "This page describes the `llm.router` automation command in Cerb, which resolves one or more agent model searches to the list of models that `llm.agent:`, `llm.chat:`, and the agentPrompt element already consume. Nothing names a model and nothing names a router record -- the caller states what the work needs as a search, an admin states what the organization allows as another, and the two intersect. Use it when you need the model list as data, to round-robin it, weight it by cost, skip a model over a rate or spend budget, balance across credentials, or feed two commands from one resolution. This page covers the `models_query` inputs, how several queries compose, why a blank query is kept rather than dropped, the resolved output dictionary, disambiguating two calls in one block, and how automation policies scope the command."
permalink: /docs/automations/commands/llm.router/
toc:
  title: llm.router
  expand: Automations
jumbotron:
  title: llm.router
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **llm.router:** [automation](/docs/automations/) command resolves one or more [agent model](/docs/records/types/agent_model/) searches to the list of models that [`llm.agent:`](/docs/automations/commands/llm.agent/), [`llm.chat:`](/docs/automations/commands/llm.chat/), and the [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) element already consume.

Nothing here names a model, and nothing names a router record. The **caller** states what the work needs as a search; an **admin** states what the organization allows as another; the two intersect. That's what lets an automation be shared between installations -- it describes the work rather than pointing at records that have to already exist.

Use this command when you need the model list **as data** -- to round-robin through it, weight it by cost, skip a model that's over a rate or spend budget, balance across credentials, or feed two commands from a single resolution.

<div class="cerb-box note">
	<p>
		To simply <b>use</b> models, you don't need this command. Let
		<a href="/docs/automations/commands/llm.agent/"><code>llm.agent:</code></a> fall through to the
		default pool by omitting <code>model:</code> entirely.
	</p>
</div>

{% highlight cerb %}
{% raw %}
start:
  llm.router:
    output: routed
    inputs:
      models_query/work: hasVision:y

  llm.agent:
    inputs:
      model@key: routed:models
      messages:
        0:
          role: user
          content: {{prompt}}
{% endraw %}
{% endhighlight %}

* TOC
{:toc}

# Syntax

## inputs:

| Key                      | Type | Notes                                                                                             |
|--------------------------|------|---------------------------------------------------------------------------------------------------|
| `models_query:`          | text | A single [agent model](/docs/records/types/agent_model/) [search query](/docs/search/)             |
| `models_query/<name>:`   | text | A named agent model search query. Use one key per query                                            |

Every key is one search over `agent_model` records, so the whole [search grammar](/docs/search/) is available -- capabilities, ratings, context window, provider, and your own custom fields:

{% highlight cerb %}
{% raw %}
llm.router:
  output: routed
  inputs:
    # What THIS work needs
    models_query/work: hasVision:y intelligence:>=advanced
    # What the ADMIN allows, from a workflow config value
    models_query/pool: {{config.models_query}}
{% endraw %}
{% endhighlight %}

**Each query gets its own key.** The `<qualifier>/<name>:` form follows the same house convention as `record.search/ticket:` and `chooser/account_id:`, and the name is for the reader -- [KATA](/docs/kata/) only requires that sibling keys be unique. One scalar per key means the editor can autocomplete the `agent_model` filter vocabulary as you type each one, and there's never a question of whether a line break started a second query or wrapped the first.

A bare `models_query:` is accepted for the single-query case.

### How several queries compose

**The first query decides the set and its order. Every later one only reduces it.** One rule, so there's no arbitration over whose `sort:` wins. Order is the order the keys are authored in, whatever they're named.

### Omitting the input entirely

**Omitting `models_query:` is the zero-config path**: every available model, in the `priority` order an admin set on the records. This is the portable form, since the automation then names nothing installation-specific at all.

### A search can only narrow

A query can never widen the pool. Unlisted and disabled models are excluded *before* the caller's search is applied, so no search has to mention [status](/docs/records/types/agent_model/#availability) and no author can forget to. That's what makes it safe to let an automation write one -- handing a script this vocabulary grants it nothing it didn't already have.

Availability is re-checked against each record on every resolve, so unlisting a model takes it out of every pool immediately.

### Blank queries are kept, not dropped

<div class="cerb-box warning">
	<p>
		A key whose value resolves to <b>blank</b> is kept as an empty query, which means "every available
		model". It adds no narrowing, but it is still reported in <code>queries</code>, and if it is
		<b>first</b> it still decides the set and its order.
	</p>
</div>

It is deliberately not dropped. A `models_query/pool: {% raw %}{{config.models_query}}{% endraw %}` that an admin hasn't filled in would otherwise quietly stop narrowing, and a restriction that vanishes when a setting happens to be blank looks exactly like one being honored.

To genuinely drop a key when its value is empty, annotate it. That's an explicit authoring choice rather than a default:

{% highlight cerb %}
{% raw %}
llm.router:
  output: routed
  inputs:
    models_query/pool@optional: {{config.models_query}}
{% endraw %}
{% endhighlight %}

An array or object value is an authoring mistake -- almost certainly a list block, which is the shape this input deliberately does not take -- and fails with an error naming the key.

## output:

The `output:` key is **required**. The resolved dictionary contains:

| Key       | Type | Notes                                                     |
|-----------|------|-------------------------------------------------------------|
| `queries` | dict | The queries that were run, keyed by the input key that carried each |
| `models`  | list | The resolved models, in the first query's order             |

`models` is shaped exactly like the `model:` input on [`llm.agent:`](/docs/automations/commands/llm.agent/#model) and [`llm.chat:`](/docs/automations/commands/llm.chat/#model), so it feeds straight back in as {% raw %}`model@key: routed:models`{% endraw %}. Each key is an [agent model](/docs/records/types/agent_model/) record name and each value is that entry's settings, which are often empty.

`queries` is what an automation reads when it needs to report or log what it actually asked for -- a blank value there is the case above, and it means the query narrowed nothing.

# Disambiguating multiple calls

Bare `llm.router:` is the usual form. To resolve two pools in the same block, give each call a name -- [KATA](/docs/kata/) keys must be unique among siblings, the same way `record.search/ticket:` works:

{% highlight cerb %}
{% raw %}
start:
  llm.router/fast:
    output: fast_models
    inputs:
      models_query/work: speed:>=fast cost:<=cheap

  llm.router/deep:
    output: deep_models
    inputs:
      models_query/work: intelligence:>=frontier hasThinking:y
{% endraw %}
{% endhighlight %}

# Errors

If the queries resolve **no** available models, the command fails with an error naming the searches it ran -- or, when no query was given at all, reporting that every agent model is unlisted, disabled, or missing.

An `on_error:` branch on the node catches it, and the output var carries the message.

# Policies

Like its `llm.` siblings, this command is either allowed or it isn't. There's no dimension to scope it on: the searches are the caller's own text, and they can only ever narrow a pool an admin already bounded, so allowing the command grants no more than the [agent model](/docs/records/types/agent_model/) records already permit.

The [least-privilege generator](/docs/automations/#generating-a-policy) emits a plain grant:

{% highlight cerb %}
{% raw %}
commands:
  llm.router:
    allow@bool: yes
{% endraw %}
{% endhighlight %}

<div class="cerb-box warning">
	<p>
		<b>A policy key of <code>llm.router/fast:</code> matches nothing and silently denies every
		call.</b> The suffixed form is legal in a <i>script</i>, where it
		<a href="#disambiguating-multiple-calls">disambiguates two calls</a> in one block, but a policy
		matches on the bare command id alone. Write <code>llm.router:</code>.
	</p>
</div>

## The siblings

An [`llm.agent:`](/docs/automations/commands/llm.agent/) call can still be scoped by the [agent](/docs/automations/commands/llm.agent/#agent) it runs as -- a single name, which is what makes it comparable:

{% highlight cerb %}
{% raw %}
commands:
  llm.agent:
    deny/agent@bool: {{inputs.agent and inputs.agent not in ['@triage']}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}

Scoping `llm.agent:` by `model:` is not worth attempting. It's a fallback chain, so a rule that inspects one entry leaves the rest unconstrained. Constrain the [agent model](/docs/records/types/agent_model/) records instead -- that's the boundary the whole design puts in an admin's hands.

# Portability

An automation you intend to share should describe **what the work needs**, not which records exist where it runs.

A capability query travels: `hasVision:y` means the same thing on every installation, because it's Cerb's own vocabulary rather than a name someone chose. A model name doesn't travel, and neither does the name of a workflow config value you haven't shipped.

See [AI agents](/docs/agents/) for the broader picture.
