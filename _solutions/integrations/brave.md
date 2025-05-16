---
title: Brave Search
excerpt: A step-by-step guide for integrating Cerb and Brave Search.
social_image_url: /assets/images/solutions/integrations/cerb-and-brave.png
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

In this guide we'll walk through the process of linking Cerb to Brave Search. You'll have full access to the API for Brave's search engine within Cerb.

# Get a Brave Search API Key.

Log in to your [Brave Search Account](https://api-dashboard.search.brave.com/) or sign up if you don't already have one.

Choose **API keys** in the menu and then click the "Add API key" button in the top right.

Name the key (eg. `cerb`), select the subscription type, and click **Add**.

Copy the API key for use later.

# Create the Brave Search service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Brave Search**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Simple web search

<https://api-dashboard.search.brave.com/app/documentation/web-search/get-started>

{% highlight cerb %}
{% raw %}
start:
  set:
    query: what is Cerb helpdesk
  
  http.request/search:
    output: http_response
    inputs:
      method: GET
      url: https://api.search.brave.com/res/v1/web/search?q={{query|url_encode}}
      headers:
        Content-Type: application/json
      authentication: cerb:connected_account:bravesearch
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Web search with location specifications

<https://api-dashboard.search.brave.com/app/documentation/web-search/get-started>

{% highlight cerb %}
{% raw %}
start:
  set:
    query: greek restaurants in Toronto
  
  http.request/search:
    output: http_response
    inputs:
      method: GET
      url: https://api.search.brave.com/res/v1/web/search?q={{query|url_encode}}&country=CA
      headers:
        Content-Type: application/json
        X-Loc-City: Toronto
      authentication: cerb:connected_account:bravesearch
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Simple image search

<https://api-dashboard.search.brave.com/app/documentation/image-search/get-started>

{% highlight cerb %}
{% raw %}
start:
  set:
    query: cerb.ai logo
  
  http.request/search:
    output: http_response
    inputs:
      method: GET
      url: https://api.search.brave.com/res/v1/images/search?q={{query|url_encode}}
      headers:
        Content-Type: application/json
      authentication: cerb:connected_account:bravesearch
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}