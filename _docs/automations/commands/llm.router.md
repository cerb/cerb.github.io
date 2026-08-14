---
title: 'Automations: llm.router'
excerpt: Resolve an agent model router to a list of models from a Cerb automation.
summary: "This page describes the `llm.router` automation command in Cerb, which resolves an agent model router record to the list of models that `llm.agent:`, `llm.chat:`, and the agentPrompt element already consume. Use it when you need the model list as data -- to filter it, round-robin it, feed two commands from one resolution, or inspect what came back. Omit the optional `router:` input to resolve the default router. To simply use a model, name an agent on the command instead. The command returns a dictionary containing the router name and its resolved models. It's also the only command in the llm family that an automation policy can scope by name, and this page covers how to write that rule so it still permits the default router."
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

The **llm.router:** [automation](/docs/automations/) command resolves an [agent model router](/docs/records/types/agent_model_router/) to the list of models that [`llm.agent:`](/docs/automations/commands/llm.agent/), [`llm.chat:`](/docs/automations/commands/llm.chat/), and the [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) element already consume.

Use this command when you need the model list **as data** -- to filter it, round-robin through it, feed two commands from a single resolution, or inspect what came back.

<div class="cerb-box note">
	<p>
		To simply <b>use</b> a model, you don't need this command. Name an
		<code>agent:</code> on <a href="/docs/automations/commands/llm.agent/"><code>llm.agent:</code></a>
		and it inherits that agent's router -- or say nothing at all and get the default router.
	</p>
</div>

{% highlight cerb %}
{% raw %}
start:
  llm.router:
    output: routed
    inputs:
      router: fast

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

| Key       | Type | Notes                                                                                                                                                 |
|-----------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `router:` | text | The optional name of an [agent model router](/docs/records/types/agent_model_router/). Omit it to resolve the **default** router. Max 255 characters. |

This is the only input the command takes. A name can also be given in URI form as `cerb:agent_model_router:<name>`.

**Omitting `router:` resolves the default router**, which is both the easiest path and the portable one, since the automation then names nothing installation-specific at all.

A named router that doesn't exist, or that's disabled, is an **error** rather than a silent fall back to the default -- running the wrong models is worse than not running.

## output:

The `output:` key is **required**. The resolved dictionary contains:

| Key      | Type | Notes                                         |
|----------|------|-----------------------------------------------|
| `router` | text | The name of the router that was resolved      |
| `models` | list | The router's usable models, in priority order |

`models` is shaped exactly like the `model:` input on [`llm.agent:`](/docs/automations/commands/llm.agent/#model) and [`llm.chat:`](/docs/automations/commands/llm.chat/#model), so it feeds straight back in as {% raw %}`model@key: routed:models`{% endraw %}. Each key is an [agent model](/docs/records/types/agent_model/) record name -- or {% raw %}`<record-name>/<alias>`{% endraw %} where the router mounts one record twice with different settings -- and each value is that entry's overrides, which are often empty.

Models whose record is missing or disabled are dropped here, with the router's order otherwise preserved, so the caller never has to re-check them.

A per-model `disabled@bool:` condition in the router's document is evaluated against the calling automation's state, so a router can exclude models conditionally at run time.

# Disambiguating multiple calls

Bare `llm.router:` is the usual form. To resolve two routers in the same block, give each call a name -- [KATA](/docs/kata/) keys must be unique among siblings, the same way `record.search/ticket:` works:

{% highlight cerb %}
{% raw %}
start:
  llm.router/fast:
    output: fast_models
    inputs:
      router: fast

  llm.router/deep:
    output: deep_models
    inputs:
      router: reasoning
{% endraw %}
{% endhighlight %}

# Errors

If the router resolves no usable models -- every entry is missing, or its model record is disabled -- the command fails with an error naming the router.

# Policies

Unlike its `llm.` siblings, this command can be scoped by **which router** it's allowed to resolve, in an automation [policy](/docs/automations/#policies). The [least-privilege generator](/docs/automations/#generating-a-policy) writes this rule for you when a script names a router:

{% highlight cerb %}
{% raw %}
commands:
  llm.router:
    deny/router@bool: {{inputs.router not in ['fast']}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}

The router name is matched with `inputs.router` in a condition. It is **not** part of the policy's command key.

<div class="cerb-box warning">
	<p>
		<b>A policy key of <code>llm.router/fast:</code> matches nothing and silently denies every
		call.</b> The suffixed form is legal in a <i>script</i>, where it
		<a href="#disambiguating-multiple-calls">disambiguates two calls</a> in one block, but a policy
		matches on the bare command id alone. Write <code>llm.router:</code> and put the name in the
		condition.
	</p>
</div>

## Policies and the default router

A policy is evaluated **before** the router is resolved, so a rule sees the raw input: absent when `router:` was omitted. It never sees `default`, and never sees the name of whichever router carries the default flag.

That matters because omitting `router:` is the recommended path. Written the way the generator writes it above, a bare `llm.router:` is **denied** -- there's no input to match, so the deny fires. Guard the deny on the input being present:

{% highlight cerb %}
{% raw %}
commands:
  llm.router:
    # Allow the default router and the `fast` router; deny any other name
    deny/router@bool: {{inputs.router and inputs.router not in ['fast']}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}

To allow **only** the default router and no named one, deny on the input's presence alone:

{% highlight cerb %}
{% raw %}
commands:
  llm.router:
    deny/router@bool: {{inputs.router}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}

The generator handles this correctly on its own: a script that names no router reads as dynamic, so it emits a plain grant rather than a name list, and the automation keeps working when an admin changes which router is the default. The hazard is in hand-written and hand-edited policies.

## The siblings

[`llm.agent:`](/docs/automations/commands/llm.agent/) and [`llm.chat:`](/docs/automations/commands/llm.chat/) can't be scoped this way, because their `model:` is a map whose keys are the model names rather than a single name to compare against. The generator emits a plain grant for them:

{% highlight cerb %}
{% raw %}
commands:
  llm.agent:
    allow@bool: yes
{% endraw %}
{% endhighlight %}

The whole inputs map is still available to a hand-written rule, so an `llm.agent:` call can be scoped by the [agent](/docs/automations/commands/llm.agent/#agent) it runs as -- a single name, which is what makes it comparable:

{% highlight cerb %}
{% raw %}
commands:
  llm.agent:
    deny/agent@bool: {{inputs.agent and inputs.agent not in ['@triage']}}
    allow@bool: yes
{% endraw %}
{% endhighlight %}

Scoping `llm.agent:` by `model:` is not worth attempting. It's a fallback chain, so a rule that inspects one entry leaves the rest unconstrained.

# Portability

Avoid hardcoding a `router:` name in an automation you intend to share with other installations. The router name is yours, not theirs. That's the same portability problem as hardcoding a model, one level up.

Portable automations name an **agent** and let the agent carry the router. See [AI agents](/docs/agents/) for the broader picture.
