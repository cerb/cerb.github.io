---
title: Exa
excerpt: A step-by-step guide for integrating Cerb and Exa.
social_image_url: /assets/images/solutions/integrations/cerb-and-exa.png
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

In this guide we'll walk through the process of linking Cerb to Exa. You'll be able to use Exa's full API as an LLM tool for when you don't want or need semantic search.

# Get a Exa API Key.

Log in to your [Exa Account](https://dashboard.exa.ai/) or sign up if you don't already have one.

Click **API Keys** in the menu. From there you can copy your default key or create a new one if you wish.

# Create the Exa service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Exa**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Search

<https://docs.exa.ai/reference/search>

{% highlight cerb %}
{% raw %}
start:
  http.request/search:
    output: http_response
    inputs:
      method: POST
      url: https://api.exa.ai/search
      authentication: cerb:connected_account:exa
      headers:
        Content-Type: application/json
      body:
        query: What is KATA?
        includeDomains@csv: cerb.ai
        text@bool: true
   on_success:
    set:
      response@json: {{http_response.body}}
      http_response@json: null
{% endraw %}
{% endhighlight %}

## Extract

<https://docs.exa.ai/reference/get-contents>

{% highlight cerb %}
{% raw %}
start:
  http.request/contents:
    output: http_response
    inputs:
      method: POST
      url: https://api.exa.ai/contents
      authentication: cerb:connected_account:exa
      headers:
        Content-Type: application/json
      body:
        urls@csv: https://cerb.ai/docs/kata/
        text@bool: true
   on_success:
    set:
      response@json: {{http_response.body}}
      http_response@json: null
{% endraw %}
{% endhighlight %}

## Answer

<https://docs.exa.ai/reference/answer>

{% highlight cerb %}
{% raw %}
start:
  http.request/contents:
    output: http_response
    inputs:
      method: POST
      url: https://api.exa.ai/answer
      authentication: cerb:connected_account:exa
      headers:
        Content-Type: application/json
      body:
        query: Who is Beethoven
        text@bool: true
   on_success:
    set:
      response@json: {{http_response.body}}
      http_response@json: null
{% endraw %}
{% endhighlight %}