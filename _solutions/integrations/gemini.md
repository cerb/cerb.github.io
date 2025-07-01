---
title: Gemini
excerpt: Integrate Cerb with Google Gemini AI models for text generation, classification, and other AI-powered automation tasks.
summary: This guide walks through connecting Cerb to Google's Gemini AI platform, including setting up API access, configuring connected services, and examples of making chat completion requests for text classification and other AI tasks.
social_image_url: /assets/images/solutions/integrations/cerb-and-gemini.png
layout: solution
jumbotron:
  breadcrumbs:
    - label: Resources &raquo;
      url: /resources/
    - label: Solutions Hub &raquo;
      url: /solutions/
    - label: Integrations &raquo;
      url: /solutions/#integrations
---

* TOC
{:toc}

# Introduction

In this guide we'll walk through the process of linking Cerb to [Google Gemini](https://ai.google.dev/gemini-api/docs).

# Gemini API

### Create an API key

Log in to [Google AI Studio](https://aistudio.google.com/apikey) with your Google account.

Click the blue **Create API key** button in the top right.

Create the key in a new or existing project.

Copy the API key to your clipboard for use in Cerb.

# Configure Cerb

### Create the connected service

(Added in [11.1.3](/releases/11.1.3/))

Navigate to **Search >> Connected Services**.

Click **(+)** button in the right of the gray bar above the worklist.

In the **Library** tab, select the **Gemini** package.

Paste your **API Key** you generated above.

# Examples

## Chat completion

<https://ai.google.dev/gemini-api/docs/openai>

This example shows how to make a chat completion request to the Gemini API using the raw `http.request:` command.

{% highlight cerb %}
{% raw %}
start:
  http.request/chat:
    output: gemini_response
    inputs:
      method: POST
      url: https://generativelanguage.googleapis.com/v1beta/openai/chat/completions
      headers:
        Content-Type: application/json
      authentication: cerb:connected_account:gemini
      body:
        model: gemini-2.0-flash
        messages:
          0:
            role: user
            content: Classify this customer message as positive, negative, or neutral: 'Thank you for the quick response! This solved my problem perfectly.'
    on_success:
      set:
        response@key,json: gemini_response:body
      return:
        classification@text: {{response.choices.0.message.content}}
    on_error:
      return:
        error@key: gemini_response:error
{% endraw %}
{% endhighlight %}
