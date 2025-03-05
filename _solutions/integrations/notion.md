---
title: Notion
excerpt: A step-by-step guide for integrating Cerb and Notion.
summary: This page provides a step-by-step guide for integrating Cerb with Notion, a collaborative notebook and planner. To get started, users must log in to their Notion account, create an internal integration on the integrations page, and copy the API key. Then, they navigate to Cerb's connected services section, select "Notion", paste the API key, and click "Create". The guide includes examples of how to use the Notion API for automations in Cerb, such as listing users with a GET request and searching documents with a POST request.
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

In this guide we'll walk through the process of linking Cerb to Notion, a collaborative notebook and planner. You'll be able to use Notion's full API for any automations you wish to make.

# Get a Notion API Key.

Log in to your [Notion Account](https://www.notion.so) or sign up if you don't already have one.

Go to your [integrations page](https://www.notion.so/profile/integrations) and click **New integration**.

Name the integration and select the associated workspace and type (internal). You can also add a logo if you'd like.

Click **Show** and then **Copy** to the right of the **Internal Integration Secret** box.

# Create the Notion service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Notion**.

4. Paste the key you copied earlier in the **Integration Secret** field.

5. Click the **Create** button.

# Examples

## List users

<https://developers.notion.com/reference/get-users>

{% highlight cerb %}
{% raw %}
start:
  http.request/listUsers:
    output: http_response
    inputs:
      method: GET
      url: https://api.notion.com/v1/users
      authentication: cerb:connected_account:notion
      headers:
        Notion-Version: 2022-02-22
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}

## Search

<https://developers.notion.com/reference/search>

{% highlight cerb %}
{% raw %}
start:
  http.request/search:
    output: http_response
    inputs:
      method: POST
      url: https://api.notion.com/v1/search
      authentication: cerb:connected_account:notion
      headers:
        Content-Type: application/json
        Notion-Version: 2022-06-28
      body:
        query: Docs
        filter:
          value: page
          property: object
        sort:
          direction: ascending
          timestamp: last_edited_time
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}