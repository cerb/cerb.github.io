---
title: Agent Model Records
excerpt: This page provides detailed information about Agent Model records in Cerb, including their structure and usage within the system.
summary: An agent model record configures one LLM model that automations and AI agents can use -- its provider, model ID, optional API endpoint, credentials from an encrypted connected account, context window, vision support, and provider-specific parameters. Automations reference a model by name instead of repeating a provider block inline, so credentials and tuning live in one place. This page documents the Records API fields, dictionary placeholders, and search filters available on agent model records.
permalink: /docs/records/types/agent_model/
toc:
  title: Agent Model
  expand: Records
jumbotron:
  title: Agent Model
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
| **Name (singular):** | Agent Model
| **Name (plural):** | Agent Models
| **Alias (uri):** | agent_model
| **Identifier (ID):** | cerb.contexts.agent.model

* TOC
{:toc}

An **agent model** configures a single LLM model that [automations](/docs/automations/) and [AI agents](/docs/agents/) can use. It holds the provider, the model ID, an optional API endpoint override, the [connected account](/docs/records/types/connected_account/) supplying credentials, the size of the model's context window, whether it accepts images, and a block of provider-specific parameters.

<p class="youtube-video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/vF-F3vkKoCI" title="Agent models in Cerb; any provider, any model" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

Once a model exists, an automation references it **by name** rather than repeating a provider block inline:

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

### Choosing a model

You don't need to know a provider's model IDs. Once the provider and its [connected account](/docs/records/types/connected_account/) are set, the record's editor asks the provider which models that key can actually use and offers the live list.

This matters most for self-hosted OpenAI-compatible endpoints -- llama.cpp, LM Studio, vLLM, or a local Ollama -- where no hardcoded list could know what's currently loaded. For hosted providers, the live list is simply the current one.

A provider whose endpoint doesn't offer a model list falls back to a built-in set of known IDs.

### Providers

The `provider` field is one of: `anthropic`, `aws_bedrock`, `docker`, `gemini`, `groq`, `huggingface`, `ollama`, `openai`, `pinecone`, `qwen`, `together`, `voyage`, or `zai`.

A local provider such as `ollama` or `docker` needs no credentials, so `connected_account_id` is optional.

That list isn't a limit. Any service that speaks the **OpenAI API** or **Anthropic API** protocol works: set `provider` to `openai` or `anthropic` to match the protocol, then point `api_endpoint_url` at the service.

### Endpoint overrides

`api_endpoint_url` overrides the provider's default endpoint. Leave it blank to use the provider's own. When set, it **wins** over any `api_endpoint_url:` left in `params_kata`.

This is what makes an unlisted provider usable -- a self-hosted runtime like llama.cpp, LM Studio, or vLLM, or a hosted gateway, proxy, or vendor that emulates either protocol.

The field suggests endpoints as you type, drawn from the ones the selected provider is known to use. It stays free text, so an endpoint that isn't in the list still works. This matters most on `aws_bedrock`, which is addressed by **region** -- the suggestions save looking up the hostname for the region your models are in.

### Icons

Most models arrive over an OpenAI-compatible API, so the provider ID often can't name the actual vendor. `icon` and `icon_color` override the brand mark this model displays with; blank falls back to the provider's own icon. The icon must be a name from the shipped [icon set](/docs/developers/icons/) -- an unknown name renders as an empty box.

### Disabled models

A model flagged `is_disabled` can't be referenced. Disabled records are excluded from autocompletion and are skipped when an [agent model router](/docs/records/types/agent_model_router/) resolves its list.

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `api_endpoint_url` | [url](/docs/records/fields/types/url/) | An optional endpoint override; blank uses the provider default
|   | `connected_account_id` | [number](/docs/records/fields/types/number/) | The ID of the [connected account](/docs/records/types/connected_account/) supplying credentials
|   | `context_window` | [number](/docs/records/fields/types/number/) | The size of the model's context window, in tokens
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created
|   | `description` | [text](/docs/records/fields/types/text/) | A description of this model
|   | `has_vision` | [boolean](/docs/records/fields/types/boolean/) | Does this model accept images? (`0` or `1`)
|   | `icon` | [text](/docs/records/fields/types/text/) | An optional [icon](/docs/developers/icons/) name overriding the provider's brand mark
|   | `icon_color` | [text](/docs/records/fields/types/text/) | An optional color for the icon
|   | `id` | [number](/docs/records/fields/types/number/) | The ID of this agent model
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) | Is this model disabled? (`0` or `1`)
|   | `label` | [text](/docs/records/fields/types/text/) | A display label for this model
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink.
|   | `model` | [text](/docs/records/fields/types/text/) | The provider's model ID
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this agent model
|   | `params_kata` | [text](/docs/records/fields/types/text/) | Provider-specific parameters in [KATA](/docs/kata/)
| **x** | **`provider`** | [text](/docs/records/fields/types/text/) | The LLM provider ID
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified

### Search Query Fields

These [filters](/docs/search/#filters) are available in agent model [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created` | date | When the record was created
| `fieldset` | virtual | Filter by [custom fieldset](/docs/records/types/custom_fieldset/)
| `id` | number | The record ID
| `name` | text | The model name (partial match)
| `updated` | date | When the record was last modified
| `watchers` | virtual | Filter by [watchers](/docs/watchers/)
