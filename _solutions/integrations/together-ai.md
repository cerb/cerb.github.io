---
title: Together.ai
excerpt: A step-by-step guide for integrating Cerb and Together AI.
summary: This page provides a step-by-step guide for integrating Cerb with Together.ai, a language model integration option. To start, users need to obtain a Together.ai API key by logging in to their account, navigating to Settings > API Keys, and copying the user key. Next, they must create a new connected service in Cerb by searching for "Together.ai", selecting it from the list, and pasting the copied API key. The guide also includes an example of how to use Together.ai with Cerb's chat completions feature, showcasing how to make a POST request to the Together.ai API with authentication and headers.
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

In this guide we'll walk through the process of linking Cerb to Together.ai. You'll be able to use Together.ai as a `llm.agent` option.

# Get a Together.ai API Key.

Log in to your [Together.ai Account](https://api.together.ai/) or sign up if you don't already have one.

Click your user icon in the top right and click **Settings**.

Choose **API Keys** from the left menu and copy your user key from the top of the page.


# Create the Together.ai service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Together.ai**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.


# Examples

## Chat completions

<https://docs.together.ai/docs/chat-overview>

{% highlight cerb %}
{% raw %}
start:
  http.request/completions:
    output: http_response
    inputs:
      method: POST
      url: https://api.together.xyz/v1/chat/completions
      authentication: cerb:connected_account:togetherai
      headers:
        Content-Type: application/json
      body:
        model: meta-llama/Meta-Llama-3.1-8B-Instruct-Turbo
        messages:
          0:
            role: user
            content: What is Cerb?
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}