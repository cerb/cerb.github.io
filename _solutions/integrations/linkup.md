---
title: Linkup
excerpt: A step-by-step guide for integrating Cerb and Linkup.
social_image_url: /assets/images/solutions/integrations/cerb-and-linkup.png
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

In this guide we'll walk through the process of linking Cerb to Linkup. You'll be able to use Linkup's full API as an LLM tool for when you don't want or need semantic search.

# Get a Linkup API Key.

Log in to your [Linkup Account](https://app.linkup.so/home) or sign up if you don't already have one.

Your API key should be available on your Linkup home page. Click the copy button to copy it to your clipboard.

# Create the Linkup service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Linkup**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Search

<https://docs.linkup.so/pages/documentation/api-reference/endpoint/post-search>

{% highlight cerb %}
{% raw %}
start:
  
start:
  http.request/search:
    output: http_response
    inputs:
      method: POST
      url: https://api.linkup.so/v1/search
      authentication: cerb:connected_account:linkup
      headers:
        Content-Type: application/json
      body:
        q: Who is Beethoven
        depth: standard
        outputType: sourcedAnswer
   on_success:
    set:
      response@json: {{http_response.body}}
      http_response@json: null
{% endraw %}
{% endhighlight %}
