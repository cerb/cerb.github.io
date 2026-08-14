---
title: Agent Model Router Records
excerpt: This page provides detailed information about Agent Model Router records in Cerb, including their structure and usage within the system.
summary: An agent model router resolves to an ordered list of agent models, so an automation can ask for a model without naming one and stay portable between installations. One router can be flagged as the default, which is what resolves when no router is named. Routers are consumed by the llm.agent and llm.chat automation commands, the agentPrompt interaction element, and the llm.router command when the list is needed as data. This page documents the Records API fields and search filters available on agent model router records.
permalink: /docs/records/types/agent_model_router/
toc:
  title: Agent Model Router
  expand: Records
jumbotron:
  title: Agent Model Router
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Agent Model Router
| **Name (plural):** | Agent Model Routers
| **Alias (uri):** | agent_model_router
| **Identifier (ID):** | cerb.contexts.agent.model.router

* TOC
{:toc}

An **agent model router** resolves to a list of [agent models](/docs/records/types/agent_model/), so an [automation](/docs/automations/) can ask for a model without naming a specific one. This keeps scripts portable: an automation shared with another installation doesn't depend on that installation having a model record with a particular name.

Routers are consumed by [`llm.agent:`](/docs/automations/commands/llm.agent/), [`llm.chat:`](/docs/automations/commands/llm.chat/), and the [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) [interaction](/docs/interactions/) element. To work with the resolved list **as data**, use [`llm.router:`](/docs/automations/commands/llm.router/).

### The default router

Exactly one router can carry `is_default`. Setting it on a router clears the flag from any other.

**This is the simplest way to configure models for an entire installation.** The default router resolves whenever a call doesn't name a model, a router, or an [agent](/docs/agents/) of its own -- so one record decides what everything uses, and changing models later is a single edit in a single place.

It's also what makes automations portable: a script that names nothing works on any installation that has a default router configured, whatever models that installation happens to have.

### The models document

The `models_kata` field is a [KATA](/docs/kata/) document listing the models this router offers, in priority order. The `models:` wrapper is implied -- the document *is* the list, so model names sit at the root:

{% highlight cerb %}
{% raw %}
haiku:
sonnet:
opus:
  disabled@bool: {{worker_is_admin == 0}}
{% endraw %}
{% endhighlight %}

A per-model `disabled@bool:` condition is evaluated against the **calling automation's state**, not stored as a literal, so a router can exclude models conditionally at run time.

A new router opens pre-populated with every enabled model, in name order.

### Resolution failures

If a router resolves no usable models -- every entry is missing, or each referenced model record is disabled -- the consuming command fails with an error naming the router. Disabled models are skipped rather than causing an error on their own.

### Portability

Don't hardcode a router name in an automation you intend to share. The router name is yours, not the recipient's -- the same portability problem as hardcoding a model, one level up. Portable automations name an **agent** and let the agent carry the router.

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created
|   | `description` | [text](/docs/records/fields/types/text/) | A description of this router
|   | `id` | [number](/docs/records/fields/types/number/) | The ID of this router
|   | `is_default` | [boolean](/docs/records/fields/types/boolean/) | Is this the default router? (`0` or `1`)
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) | Is this router disabled? (`0` or `1`)
|   | `label` | [text](/docs/records/fields/types/text/) | A display label for this router
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink.
|   | `models_kata` | [text](/docs/records/fields/types/text/) | The [KATA](/docs/kata/) document listing this router's models
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this router
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified

### Search Query Fields

These [filters](/docs/search/#filters) are available in agent model router [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created` | date | When the record was created
| `fieldset` | virtual | Filter by [custom fieldset](/docs/records/types/custom_fieldset/)
| `id` | number | The record ID
| `name` | text | The router name (partial match)
| `updated` | date | When the record was last modified
| `watchers` | virtual | Filter by [watchers](/docs/watchers/)
