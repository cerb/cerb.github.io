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

(Added in [11.1](/releases/11.1/))

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
        model: claude-3-5-haiku-latest
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

| Key              | Type | Notes                                  |
|------------------|------|----------------------------------------|
| `llm:`           | list | The LLM provider and model to use.     |
| `messages:`      | list | A list of new messages to send.        |
| `system_prompt:` | text | The optional instructions for the LLM. |
| `tools:`         | list | An optional list of tools.             |

### llm:

The LLM provider is one of:

{% highlight cerb %}
{% raw %}
llm:
  anthropic:
    model: claude-3-5-haiku-latest
    authentication: cerb:connected_account:anthropic
  aws_bedrock:
    model: anthropic.claude-3-5-haiku-20241022-v1:0
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
  together:
    model: meta-llama/Llama-3.3-70B-Instruct-Turbo
    authentication: cerb:connected_account:together-ai
{% endraw %}
{% endhighlight %}

The `model:` key is the name of the model to use. This must be a chat model, and must support function calling if `tools:` are defined. 

The `authentication:` key is a connected account in URI format (e.g. `cerb:connected_account:name`) for API authentication. This may be omitted for local models like Ollama.

The optional `api_endpoint_url:` key overrides the default endpoint. For instance, this can be used with the `openai:` provider for any compatible API (e.g. SambaNova), or a locally hosted Ollama server.

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

## output:

The key specified in `output:` is set to a dictionary with the following structure:

| Key         | Description                                                                                                                                                                               |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `messages`  | A list of new agent messages.                                                                                                                                                             |

Each message has the following schema:

| Key       | Description                                 |
|-----------|---------------------------------------------|
| `content` | The Markdown-formatted text of the message. |
| `type`    | Currently only `text` is supported.         |

{% highlight cerb %}
{% raw %}
output:
  messages:
    0:
      type: text
      content: The weather in Paris is 14 degrees Celsius and cloudy
{% endraw %}
{% endhighlight %}
