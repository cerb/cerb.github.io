---
title: Hugging Face
excerpt: A step-by-step guide for integrating Cerb and Hugging Face.
summary: This page provides a step-by-step guide to integrating Cerb with Hugging Face, allowing users of Hugging Face's full API within Cerb automations. To start, create a new access token in the Hugging Face Account settings and copy it for later use, then navigate to Cerb's Connected Services and follow the prompts to add the Hugging Face service.
social_image_url: /assets/images/solutions/integrations/cerb-and-huggingface.png
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

In this guide we'll walk through the process of linking Cerb to Hugging Face. You'll be able to use Hugging Face's full API in Cerb automations.

# Get a Hugging Face API key

Log in to your [Hugging Face Account](https://huggingface.co/settings/) or sign up if you don't already have one.

Choose **Access Tokens** in the menu and then click the "Create new token" button in the top right.

Name the key (eg. `cerb`), select the proper token type and permissions for your uses, and click **Create token**.

Copy the token for use later.

# Create the Hugging Face service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **Hugging Face**.

4. Paste the access token you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Search models

<https://huggingface.co/docs/hub/api#get-apimodels>

{% highlight cerb %}
{% raw %}
start:
  set:
    params:
      search: whisper
  
  http.request/models:
    output: http_response
    inputs:
      method: GET
      url: https://huggingface.co/api/models/?{{params|url_encode}}
      authentication: cerb:connected_account:huggingface
    on_success:
      set:
        response@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}