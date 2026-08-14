---
title: 'Automations: llm.agent'
excerpt: Interact with Large Language Models (LLMs) from Cerb automations.
summary: "This page describes the `llm.agent` automation command in Cerb, which interfaces with Large Language Models (LLMs) to maintain conversation history and manage tool use. The command automatically handles authentication, API calls, chat history, and tool invocation. To use this command, you provide a `system_prompt`, one or more new conversational messages turns, and an optional list of tools. The LLM provider can be one of several options, including Anthropic, Groq, Hugging Face, Ollama, OpenAI, and Together. The `model:` key specifies the model to use, while the `authentication:` key provides a connected account for API authentication. The `messages` section defines new messages to append to the conversation, with each message having a `role:` and `content:` key. Tools can be either automation tools that link to LLM tool automation functions or custom tools that run code in the `llm.agent:on_tool:` event."
permalink: /docs/automations/commands/llm.agent/
toc:
  title: llm.agent
  expand: Automations
jumbotron:
  title: llm.agent
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **llm.agent:** [automation](/docs/automations/) command interfaces with Large Language Model (LLM) providers to maintain a conversation history and manage [tool](/docs/automations/triggers/llm.tool/) use. 

Authentication, API calls, chat history, and tool invocation are all automatically handled by the command.

You simply provide a `system_prompt` with instructions, one or more new conversational `messages` turns, and an optional list of `tools`.

<p class="youtube-video-container"><iframe width="1040" height="585" src="https://www.youtube.com/embed/dkpaBooNNGc" title="" frameBorder="0"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe></p>

{% highlight cerb %}
{% raw %}
llm.agent:
  output: results
  inputs:
    llm:
      anthropic:
        model: claude-haiku-4-5
        authentication: cerb:connected_account:anthropic
    system_prompt@raw:
      You are a helpful AI assistant for Cerb, a web-based platform for 
      automating helpdesk inboxes and workflows. Use your tools to answer 
      user questions.
    messages:
      message:
        role: user
        content@text: What is Cerb?
    tools:
      automation/docs_search:
        uri: cerb:automation:example.llm.tool.docs.search
      tool/license_renew:
        description: Renew or change seats on a Cerb license.
  on_tool:
    decision/tool:
      outcome/license_renew:
        if@bool: {{'license_renew' == __tool.name}}
        then:
          await:
            interaction:
              output: results
              uri: cerb:automation:ai.cerb.website.agent.licenses.renew
          tool.return:
            content: Request received!
{% endraw %}
{% endhighlight %}

* TOC
{:toc}

# Syntax

## inputs:

| Key              | Type | Notes                                                                         |
|------------------|------|-------------------------------------------------------------------------------|
| `agent:`         | text | An optional [AI worker](/docs/agents/) to run the turn as.                    |
| `commands:`      | list | Optional built-in `/commands` this agent honors.                              |
| `llm:`           | list | The LLM provider and model to use.                                            |
| `messages:`      | list | A list of new messages to send.                                               |
| `model:`         | text | An optional [agent model](/docs/records/types/agent_model/) by name.          |
| `mounts:`        | list | Optional [agent filesystems](/docs/records/types/agent_filesystem/) to mount. |
| `session_id:`    | text | An optional existing session to join.                                         |
| `system_prompt:` | text | The optional instructions for the LLM.                                        |
| `tools:`         | list | An optional list of tools.                                                    |

### agent:

Run the turn as an [AI worker](/docs/agents/). This attributes the turn to that agent -- its name and image appear in the transcript -- and sources its models from the agent's [model router](/docs/records/types/agent_model_router/).

It accepts an `@mention`, a bare handle, a worker ID, or a `cerb:worker:<id>` URI. A human or disabled worker is rejected.

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

An explicit `model:` or `llm:` still wins. Naming an agent is what lets a **portable** automation avoid naming models at all -- omit everything and the default router is used.

### model:

Reference an [agent model](/docs/records/types/agent_model/) record by name, which is the recommended way to source the provider block: swapping models becomes one edit on the record instead of one edit per automation.

List several names to provide a fallback chain -- the first enabled record wins. Optional overrides ride under the name in that model's provider grammar.

The list doesn't have to be written by hand. Resolve a router with [`llm.router:`](/docs/automations/commands/llm.router/) and pass its models here, or name an [`agent:`](#agent) and inherit the list from that agent's [model router](/docs/records/types/agent_model_router/).

**Leaving `model:` out entirely is the easiest path**: the [default model router](/docs/records/types/agent_model_router/) resolves the list, so one record decides what the whole installation uses.

It also doesn't need to be set when sharing a [`session_id:`](#session_id) with an [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) element. Submitting the prompt records the worker's chosen model on the transcript, and `llm.agent:` inherits it from there.

An explicit `llm:` block wins for the call and `model:` is ignored.

### mounts:

Mount [agent filesystems](/docs/records/types/agent_filesystem/) and give the agent an `agent_fs` tool to browse them. Each key is a filesystem name. See [agent filesystems](/docs/records/types/agent_filesystem/#mounting-a-volume) for the full mount grammar.

Leaving the block empty mounts nothing but `/tmp` -- a scratch pad plus the scripting pipeline, so the agent can park and transform text without spending context on it.

### commands:

The built-in `/commands` this agent honors, opted in by bare key:

{% highlight cerb %}
{% raw %}
commands:
  compact:
{% endraw %}
{% endhighlight %}

A command is only acted on when it **leads** the user's message, and it replaces that turn rather than preceding it -- the message is never added to the conversation and no answer is generated.

Commands are off by default and per-node: an undeclared `/whatever` reaches the model as ordinary text.

`/compact` accepts `hard` (the default) or `soft`. See [long conversations](#long-conversations).

### session_id:

Join an existing agent session instead of the one this node would start on its own. Mint an ID once and pass the same one to the [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) element and the [`llmTranscript`](/docs/automations/triggers/interaction.worker/elements/llmTranscript/) element, so all three work on one conversation:

{% highlight cerb %}
{% raw %}
set:
  session_id: {{uuid()}}
{% endraw %}
{% endhighlight %}

Render the [`agentPrompt`](/docs/automations/triggers/interaction.worker/elements/agentPrompt/) **before** the turn runs. Submitting it primes the session with the chosen model and the worker's message, so the agent resumes a conversation that already exists.

### llm:

<div class="cerb-box note">
	<p>
		<b>Prefer an <a href="/docs/records/types/agent_model/">agent model</a> record over an inline
		<code>llm:</code> block.</b> A model record keeps credentials and tuning in one place, offers
		the provider's live model list so nobody has to remember an ID, and makes a model swap one edit
		instead of one per automation. Setting a
		<a href="/docs/records/types/agent_model_router/">default model router</a> goes further --
		it applies to every call that doesn't configure something of its own, so most automations can
		omit <code>llm:</code>, <code>model:</code>, and <code>agent:</code> entirely.
	</p>
</div>

The LLM provider is one of:

{% highlight cerb %}
{% raw %}
llm:
  anthropic:
    model: claude-haiku-4-5
    authentication: cerb:connected_account:anthropic
  aws_bedrock:
    model: us.anthropic.claude-haiku-4-5-20251001-v1:0
    api_endpoint_url: https://bedrock-runtime.us-east-1.amazonaws.com
    authentication: cerb:connected_account:aws
  docker:
    api_endpoint_url: http://model-runner.docker.internal/
    model: ai/llama3.2
  gemini:
    model: gemini-2.0-flash
    authentication: cerb:connected_account:gemini
  groq:
    model: gemma2-9b-it
    authentication: cerb:connected_account:groq
  huggingface:
    model: google/gemma-2-2b-it
    authentication: cerb:connected_account:huggingface
  ollama:
    api_endpoint_url: http://host.docker.internal:11434
    model: llama3.2
  openai:
    model: gpt-4o
    authentication: cerb:connected_account:openai
  qwen:
    model: qwen3.7-plus
    authentication: cerb:connected_account:qwen
  together:
    model: meta-llama/Llama-3.3-70B-Instruct-Turbo
    authentication: cerb:connected_account:together-ai
  zai:
    model: glm-4.6
    authentication: cerb:connected_account:zai
{% endraw %}
{% endhighlight %}

The `model:` key is the name of the model to use. This must be a chat model, and must support function calling if `tools:` are defined. 

The `authentication:` key is a connected account in URI format (e.g. `cerb:connected_account:name`) for API authentication. This may be omitted for local models like Ollama.

The optional `api_endpoint_url:` key overrides the default endpoint. For instance, this can be used with the `openai:` provider for any compatible API (e.g. SambaNova), or a locally hosted Ollama server.

#### Reasoning

Reasoning is configured with one canonical `effort:` key plus an optional grouped `thinking:` block, so a single authoring form drives every provider that supports reasoning.

| Key       | Values                                       | Description                                                                                              
|-----------|----------------------------------------------|----------------------------------------------------------------------------------------------------------
| `effort:` | e.g. `low`, `medium`, `high`, `xhigh`, `max` | How much compute to spend on reasoning. Higher levels improve quality at the cost of tokens and latency. 

{% highlight cerb %}
{% raw %}
llm:
  anthropic:
    model: claude-sonnet-4-6
    authentication: cerb:connected_account:anthropic
    effort: medium
{% endraw %}
{% endhighlight %}

The level is passed through to the provider verbatim -- Anthropic translates it to `output_config.effort`, while OpenAI and Gemini translate it to `reasoning_effort`. Cerb doesn't clamp or whitelist the value, because the levels a model accepts vary by model and version; the provider's API validates it.

The optional `thinking:` block controls whether the model's reasoning is returned:

| Key        | Values                            | Description                                      |
|------------|-----------------------------------|--------------------------------------------------|
| `type:`    | `enabled`, `disabled`, `adaptive` | Whether extended thinking is used                |
| `display:` | `summarized`, `omitted`           | Whether thinking content appears in the response |

{% highlight cerb %}
{% raw %}
llm:
  anthropic:
    model: claude-sonnet-4-6
    authentication: cerb:connected_account:anthropic
    effort: high
    thinking:
      type: adaptive
      display: summarized
{% endraw %}
{% endhighlight %}

On older models that require an explicit token budget (`type: enabled`), the budget is derived from `effort:` rather than being set by hand.

<div class="cerb-box note">
	<p>
		The older provider-specific authoring keys -- Gemini's <code>thinking_level:</code> and
		OpenAI's <code>reasoning_effort:</code> -- were <b>removed</b> in Cerb 11.2 in favor of
		<code>effort:</code> and <code>thinking:</code>. Gemini's
		<code>thinking_include@bool:</code> is still accepted.
	</p>
</div>

### system_prompt:

{% highlight cerb %}
{% raw %}
system_prompt@text:
  You are a friendly weather agent. Use your tools to serve user requests.
  Temperatures should be in Fahrenheit for locations in the United States,
  and Celsius otherwise.
{% endraw %}
{% endhighlight %}

### messages:

The new messages to append to the conversation. The `llm.agent:` command automatically manages the conversation history for you, as well as returning the results of tools.

Each message has `role:` and `content:` keys. The `role:` must be either `user` or `assistant`.

For a conversation, include the next `user` turn.

{% highlight cerb %}
{% raw %}
messages:
  message:
    role: user
    content: What is the weather today in Paris?
{% endraw %}
{% endhighlight %}

For a one-shot workflow you can provide sample `assistant` and `user` turns.

{% highlight cerb %}
{% raw %}
messages:
  0:
    role: user
    content: What is the weather today in Paris?
  1:
    role: assistant
    content: 16 degrees Celsius and rainy.
  2:
    role: user
    content: How about Berlin?
{% endraw %}
{% endhighlight %}

The message keys must be unique but are arbitrary.

### tools:

There are two types of tools.

An `automation` tool links to an [llm.tool](/docs/automations/triggers/llm.tool/) automation function. Its description and inputs will be automatically described to the model for you, and its output will automatically be sent back to the model.

{% highlight cerb %}
{% raw %}
tools:
  automation/docs_search:
    uri: cerb:automation:example.llm.tool.docs.search
  automation/docs_fetch:
    uri: cerb:automation:example.llm.tool.docs.fetch
{% endraw %}
{% endhighlight %}

Alternatively, a custom `tool` runs the code in the `llm.agent:on_tool:` event when utilized. Use the `tool.return:` command to return the tool's output.

This approach is particularly useful to seamlessly transition to structured form-based interaction (e.g. signups, renewals, authentication). Afterward, control is returned to the `llm.agent:`.

{% highlight cerb %}
{% raw %}
tools:
  tool/tool_name:
    description: This is a detailed description of the tool.
    parameters:
      string/input_name:
        description: A description of this parameter
        required@bool: no
        # An optional list of allowed values
        enum@csv: option1, option2, option3
{% endraw %}
{% endhighlight %}

Tools can carry display metadata for the transcript, which the model never sees:

| Key       | Notes                                                                                    
|-----------|------------------------------------------------------------------------------------------
| `labels:` | Display phrasings -- `summary:` (completed) and `active:` (in progress)                  
| `icon:`   | A [cerb-icons](/docs/developers/icons/) name shown beside the tool. Defaults to `hammer` 

{% highlight cerb %}
{% raw %}
tools:
  automation/docs_search:
    uri: cerb:automation:example.llm.tool.docs.search
    icon: search
    labels:
      summary: Searched the knowledge base
      active: Searching the knowledge base
{% endraw %}
{% endhighlight %}

With these set, a tool call reads as "Searching the knowledge base" rather than as a raw function
name.

Individual tools can be conditionally disabled using the `disable@bool:` key. When `yes`, the tool is omitted from the model's available tool list for that invocation. This enables per-worker tool permissions and dynamic tool selection based on context.

{% highlight cerb %}
{% raw %}
tools:
  automation/admin_tool:
    uri: cerb:automation:example.llm.tool.admin
    disable@bool: {{not worker_is_superuser}}
  automation/docs_search:
    uri: cerb:automation:example.llm.tool.docs.search
  tool/restricted_action:
    disable@bool: {{worker_role != 'manager'}}
    description: Perform a restricted action.
    parameters:
      string/reason:
        description: The reason for the action.
        required@bool: yes
{% endraw %}
{% endhighlight %}

Implement your tool logic in the `on_tool:` event.

The current tool's details are stored in the `__tool` dictionary.

|---
|-|-|-
| **__tool.name** | text | The name of the tool, defined in `tools:tool/name:`
| **__tool.id** | text | The ID of the tool call (varies by model)
| **__tool.parameters** | list | A list of parameters sent to the tool as key/value pairs.

{% highlight cerb %}
{% raw %}
on_tool:
  decision/tool:
    outcome/license_renew:
      if@bool: {{'license_renew' == __tool.name}}
      then:
        await:
          interaction:
            output: results
            uri: cerb:automation:ai.cerb.website.agent.licenses.renew
        tool.return:
          content: Request received!
{% endraw %}
{% endhighlight %}

## Branches

Alongside `on_tool:`, the command supports the same branches as an action:

| Branch         | Runs when                                                               
|----------------|-------------------------------------------------------------------------
| `on_tool:`     | The model invokes a custom `tool/` -- return output with `tool.return:` 
| `on_success:`  | The turn completed                                                      
| `on_error:`    | The turn failed                                                         
| `on_simulate:` | The automation is running in simulation                                 

# Long conversations

A conversation that outgrows the model's context window is **compacted** rather than failing: older turns fold behind a summary while recent turns are kept verbatim.

Compaction is configured per model, under the model's provider block:

| Key              | Default | Notes                                                                                                                
|------------------|---------|----------------------------------------------------------------------------------------------------------------------
| `context_ratio:` | `0.9`   | Compact once the conversation passes this fraction of the context window. `0` always compacts.                       
| `tail_ratio:`    | `0.05`  | Keep roughly this fraction of the context window as verbatim recent turns. `0` keeps none -- a pure summary handoff. 

{% highlight cerb %}
{% raw %}
llm:
  anthropic:
    model: claude-sonnet-4-6
    authentication: cerb:connected_account:anthropic
    compaction:
      context_ratio: 0.9
      tail_ratio: 0.05
{% endraw %}
{% endhighlight %}

A worker can also fold a session on demand with the `/compact` command, when it's declared under [`commands:`](#commands). `/compact hard` (the default) summarizes and drops the verbatim tail; `/compact soft` keeps the session's configured tail.

Agent turns also use **prompt caching** by default, since a long conversation re-sends the same prefix on every turn.

## output:

The `output:` key is **required**. It's set to a dictionary with the following structure:

| Key             | Description
|-----------------|-------------
| `session_id`    | The session the turn ran in -- the one the command resolved or created, which isn't necessarily the one you passed
| `messages`      | A list of new agent messages
| `finish_reason` | Why the turn ended: `stop`, `length`, `tool_calls`, `interrupted`, or a provider-specific value
| `provider`      | The provider that served the turn
| `model`         | The provider's model string that served the turn
| `router`        | The router that model came from, when **this** turn resolved one. Empty when the turn resumed a session, or when `llm:` or `model:` named the model outright

Each message has the following schema:

| Key       | Description                                 |
|-----------|---------------------------------------------|
| `content` | The Markdown-formatted text of the message. |
| `type`    | Currently only `text` is supported.         |

Only text blocks appear here. Tool calls and thinking content are recorded on the session rather than returned in `messages`.

{% highlight cerb %}
{% raw %}
output:
  session_id: 8a1f9c2e-5d3b-4a76-9f10-2c8e7b4d6a53
  messages:
    0:
      type: text
      content: The weather in Paris is 14 degrees Celsius and cloudy
  finish_reason: stop
  provider: cerb.llm.provider.anthropic
  model: claude-sonnet-4-6
  router: default
{% endraw %}
{% endhighlight %}

`provider` and `model` are read back off the session, so they report what actually ran even when the automation named nothing and the turn simply resumed an existing conversation.

<div class="cerb-box note">
	<p>
		<b>Most interactive automations never read this output.</b> A turn appends its replies to the
		transcript by <a href="#session_id"><code>session_id</code></a> on its own, so the
		<a href="/docs/automations/triggers/interaction.worker/elements/llmTranscript/"><code>llmTranscript</code></a>
		element already shows them. Reading <code>messages</code> is for one-offs --
		summarization, classification, a single scripted answer -- and those are usually better
		served by <a href="/docs/automations/commands/llm.chat/"><code>llm.chat:</code></a>, which has
		no session or transcript to carry.
	</p>
</div>

The turn also sets `__llm_token_usage` on the automation's dictionary: the size of the conversation's current context, in tokens.

### Command turns

A turn consumed by a [`/command`](#commands) returns the same keys, with `messages` empty -- a command replaces the turn rather than answering it -- plus:

| Key         | Description                              |
|-------------|------------------------------------------|
| `command`   | The name of the command that ran         |
| `compacted` | Whether the session was actually folded  |

### Errors

On `on_error:`, the output variable is **replaced** rather than extended, so nothing from a successful turn is readable there -- no `messages`, no `finish_reason`:

| Key            | Description                                                                     |
|----------------|---------------------------------------------------------------------------------|
| `error`        | The error message                                                               |
| `error_status` | The provider's HTTP status, or `0`                                              |
| `retryable`    | Whether the status is worth retrying (timeouts, rate limits, `5xx`)             |
| `retry_prompt` | The user prompt that failed, so the automation can re-offer it                  |
| `retry_after`  | How many seconds the provider asked you to wait, or `0` if it didn't say        |

The last four are only present when a provider turn failed. Any other failure returns `error` alone.
