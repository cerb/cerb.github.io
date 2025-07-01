---
title: 'Automations: llm.chat'
excerpt: Send single-turn chat completion requests to Large Language Models (LLMs) from Cerb automations.
summary: "This page describes the `llm.chat` automation command in Cerb, which interfaces with Large Language Models (LLMs) for single-turn chat completions without transcripts, memory, or tools. The command automatically handles authentication and API calls. To use this command, you provide a `system_prompt`, a single message, and the LLM provider configuration. The LLM provider can be one of several options, including Anthropic, Groq, Hugging Face, Ollama, OpenAI, and Together. The `model:` key specifies the model to use, while the `authentication:` key provides a connected account for API authentication. This command is useful for text classification, summarization, and other single-turn AI tasks."
permalink: /docs/automations/commands/llm.chat/
toc:
  title: llm.chat
  expand: Automations
jumbotron:
  title: llm.chat
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **llm.chat:** [automation](/docs/automations/) command interfaces with Large Language Model (LLM) providers for single-turn chat completions without transcripts, memory, or tools.

(Added in [11.1.3](/releases/11.1.3/))

Authentication and API calls are automatically handled by the command.

You simply provide a `system_prompt` with instructions, one or more `messages`, and the LLM provider configuration. The final message must be a user turn.

This is useful for text classification, summarization, and other single-turn AI tasks.

{% highlight cerb %}
{% raw %}
start:
  llm.chat:
    output: results
    inputs:
      llm:
        anthropic:
          model: claude-3-5-haiku-latest
          authentication: cerb:connected_account:anthropic
      system_prompt@text:
        You are a helpful AI assistant that classifies customer messages 
        as positive, negative, or neutral. Return only the classification.
      messages:
        0:
          role: user
          content: Thank you for the quick response! This solved my problem perfectly.
    on_success:
      return:
        classification@key: results:messages:0:content
{% endraw %}
{% endhighlight %}

* TOC
{:toc}

# Syntax

## inputs:

| Key              | Type | Notes                                  |
|------------------|------|----------------------------------------|
| `llm:`           | list | The LLM provider and model to use.     |
| `messages:`      | list | The messages to send.                  |
| `system_prompt:` | text | The optional instructions for the LLM. |

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

The `model:` key is the name of the model to use. This must be a chat model.

The `authentication:` key is a connected account in URI format (e.g. `cerb:connected_account:name`) for API authentication. This may be omitted for local models like Ollama.

The optional `api_endpoint_url:` key overrides the default endpoint. For instance, this can be used with the `openai:` provider for any compatible API (e.g. SambaNova), or a locally hosted Ollama server.

### system_prompt:

{% highlight cerb %}
{% raw %}
system_prompt@text:
  You are a helpful AI assistant that classifies customer support messages.
  Classify each message as positive, negative, or neutral.
  Return only the classification word.
{% endraw %}
{% endhighlight %}

### messages:

The messages to send to the LLM. Each message has `role:` and `content:` keys. The final message must have a `role:` of `user`.

For a simple single-turn completion:

{% highlight cerb %}
{% raw %}
messages:
  0:
    role: user
    content: Thank you so much for your help! The issue is now resolved.
{% endraw %}
{% endhighlight %}

For few-shot prompting with examples:

{% highlight cerb %}
{% raw %}
messages:
  0:
    role: user
    content: "Great service! Very helpful staff."
  1:
    role: assistant
    content: positive
  2:
    role: user
    content: "This product is terrible and doesn't work."
  3:
    role: assistant
    content: negative
  4:
    role: user
    content: "Thank you for the quick response! This solved my problem perfectly."
{% endraw %}
{% endhighlight %}

## output:

The key specified in `output:` is set to a dictionary with the following structure:

| Key        | Description                                 |
|------------|---------------------------------------------|
| `messages` | An array of response messages from the LLM. |

Each message in the `messages` array has the following structure:

| Key       | Description                                 |
|-----------|---------------------------------------------|
| `content` | The text response from the LLM.            |
| `type`    | Currently only `text` is supported.        |

{% highlight cerb %}
{% raw %}
output:
  messages:
    0:
      type: text
      content: positive
{% endraw %}
{% endhighlight %}

# Examples

## Text classification

{% highlight cerb %}
{% raw %}
start:
  llm.chat:
    output: classification_result
    inputs:
      llm:
        anthropic:
          model: claude-3-5-haiku-latest
          authentication: cerb:connected_account:anthropic
      system_prompt@text:
        Classify customer messages as: positive, negative, or neutral.
        Return only the classification.
      messages:
        0:
          role: user
          content: {{ticket_latest_message_content}}
    on_success:
      return:
        sentiment@key: classification_result:messages:0:content
{% endraw %}
{% endhighlight %}

## Text summarization

{% highlight cerb %}
{% raw %}
start:
  llm.chat:
    output: summary_result
    inputs:
      llm:
        openai:
          model: gpt-4o-mini
          authentication: cerb:connected_account:openai
      system_prompt@text:
        Summarize the following text in 2-3 sentences. 
        Focus on the key points and main outcomes.
      messages:
        0:
          role: user
          content@text:
            Please summarize this conversation:
            
            {{ticket_conversation_history}}
    on_success:
      return:
        summary@key: summary_result:messages:0:content
{% endraw %}
{% endhighlight %}

## Content generation

{% highlight cerb %}
{% raw %}
start:
  llm.chat:
    output: response_result
    inputs:
      llm:
        gemini:
          model: gemini-2.0-flash
          authentication: cerb:connected_account:gemini
      system_prompt@text:
        You are a helpful customer support agent. Generate a professional
        and friendly response to the customer's question. Keep it concise
        and actionable.
      messages:
        0:
          role: user
          content: Customer asked: "How do I reset my password?"
    on_success:
      return:
        suggested_response@key: response_result:messages:0:content
{% endraw %}
{% endhighlight %} 