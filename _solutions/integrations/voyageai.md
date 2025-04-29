---
title: Voyage AI
excerpt: A step-by-step guide for integrating Cerb and Voyage AI.
social_image_url: /assets/images/solutions/integrations/cerb-and-voyageai.png
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

In this guide we'll walk through the process of linking Cerb to Voyage AI. You'll be able to use Voyage AI's full API in Cerb automations for LLM embeddings.

# Get a Voyage AI API Key.

Log in to your [Voyage AI Account](https://dashboard.voyageai.com/) or sign up if you don't already have one.

Choose **API keys** in the menu and then click the "Create new secret key" button in the top left.

Name the key (eg. `cerb`) and click **Create secret key**.

Copy the API key for use later.

# Create the Voyage AI service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Voyage AI**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Text embeddings

<https://docs.voyageai.com/reference/embeddings-api>

{% highlight cerb %}
{% raw %}
start:
  http.request/embeddings:
    output: http_response
    inputs:
      method: POST
      url: https://api.voyageai.com/v1/embeddings
      headers:
        Content-Type: application/json
      authentication: cerb:connected_account:voyageai
     body:
       input: Cerb automates helpdesk inboxes and workflows. It has evolved continuously since 2002 based on the feedback of thousands of teams; from solo founders to 1,000+ person enterprises managing millions of customer requests.
       model: voyage-3-large
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Multimodal embeddings

<https://docs.voyageai.com/reference/multimodal-embeddings-api>

{% highlight cerb %}
{% raw %}
start:
  http.request/multimodal:
    output: http_response
    inputs:
      method: POST
      url: https://api.voyageai.com/v1/multimodalembeddings
      headers:
        Content-Type: application/json
      authentication: cerb:connected_account:voyageai
     body:
       inputs:
         0:
           content:
             0:
               type: text
               text: This is Cerb's logo
             1:
               type: image_base64
               image_base64: data:image/png;base64,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
       model: voyage-multimodal-3
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}