---
title: OpenAI
excerpt: A step-by-step guide for integrating Cerb and OpenAI.
summary: "This page provides a comprehensive guide on integrating Cerb with OpenAI, enabling the use of OpenAI's API within Cerb automations. It includes detailed instructions on configuring both OpenAI and Cerb. For OpenAI, it covers creating a project and generating an API key. For Cerb, it explains how to connect to OpenAI using the API key. Additionally, the page references related resources, such as a guide on building a question-answering chatbot with Cerb and ChatGPT."
social_image_url: /assets/images/guides/openai/cerb-and-openai.png
redirect_from:
  - /guides/integrations/openai/
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

In this guide we'll walk through the process of linking Cerb to OpenAI. You'll be able to use OpenAI's full API from automations in Cerb.

# Configuration

## OpenAI

Log into OpenAI: <https://platform.openai.com/settings/>

### Create a project

Click on **Projects** in the left sidebar.

Click the green **+Create** button in the top right.

Name your project `Cerb` and click the green **Create** button in the popup.

### Create an API key

Click on **API keys** in the left sidebar.

Click on the green **+Create new secret key** button in the top right.

Name the key `Cerb Automations` and select the **Cerb** project.

Click the **Create secret key** button.

<div class="cerb-screenshot">
<img src="/assets/images/guides/openai/openai-new-api-key.png" class="screenshot">
</div>

Copy the secret key to your clipboard for the next step.

## Cerb

In Cerb, navigate to **Search >> Connected Services >> (+)** and select **OpenAI** from the library.

Paste your API key from above.

Click the **Create** button in the popup.

# Examples

## Create chat completion
<https://platform.openai.com/docs/api-reference/chat>

{% highlight cerb %}
{% raw %}
start:
 http.request/chat:
   output: http_response
   inputs:
     method: POST
     url: https://api.openai.com/v1/chat/completions
     headers:
       Content-Type: application/json
     authentication: cerb:connected_account:openai
     body:
       model: gpt-4o
       messages:
        0:
          role: developer
          content: you are a helpful assistant
        1:
          role: user
          content: hello
   on_success:
     set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Generate text embeddings
<https://platform.openai.com/docs/api-reference/embeddings>

{% highlight cerb %}
{% raw %}
start:
 http.request/embeddings:
   output: http_response
   inputs:
     method: POST
     url: https://api.openai.com/v1/embeddings
     headers:
       Content-Type: application/json
     authentication: cerb:connected_account:openai
     body:
       input: Cerb automates helpdesk inboxes and workflows. It has evolved continuously since 2002 based on the feedback of thousands of teams; from solo founders to 1,000+ person enterprises managing millions of customer requests.
       model: text-embedding-3-small
   on_success:
     set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

# Related Resources

* [Guide: Build a question answering chat bot with Cerb and ChatGPT](/guides/machine-learning/question-answering/faq-bot-chatgpt/)