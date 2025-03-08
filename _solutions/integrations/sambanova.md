---
title: SambaNova
excerpt: A step-by-step guide for integrating Cerb and SambaNova.
summary: "This page provides a step-by-step guide for integrating Cerb and SambaNova, a platform that enables the automation of helpdesk inboxes and workflows. To begin, users must log into their SambaNova account, generate a new API key, and then create a new connected service in Cerb using this key. Once set up, users can leverage SambaNova's full API within Cerb automations, as demonstrated by the provided example of integrating chat completions with Meta-Llama-3.1-70B-Instruct model."
social_image_url: /assets/images/solutions/integrations/cerb-and-sambanova.png
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

In this guide we'll walk through the process of linking Cerb to SambaNova. You'll be able to use SambaNova's full API in Cerb automations.

# Get a SambaNova API Key.

Log in to your [SambaNova Account](https://cloud.sambanova.ai/) or sign up if you don't already have one.

Choose **APIs** in the menu and then click the "Generate New API Key" button.

Copy the API key for use later.

# Create the SambaNova service in Cerb

1. Navigate to **Search >> Connected Services**.

2. Click the **(+)** icon in the top right of the list.

3. Select **SambaNova**.

4. Paste the key you copied earlier in the **API Key** field.

5. Click the **Create** button.

# Examples

## Chat completions

{% highlight cerb %}
{% raw %}
start:
  http.request/chat:
    output: http_response
    inputs:
      method: POST
      url: https://api.sambanova.ai/v1/chat/completions
      authentication: cerb:connected_account:sambanova
      headers:
        Content-Type: application/json
      body:
        stream@bool: false
        model: Meta-Llama-3.1-70B-Instruct
        messages:
          0:
            role: system
            content: You are a helpful assistant for Cerb, an app to automate helpdesk inboxes and workflows
          1:
            role: user
            content: What is Cerb?
    on_success:
      set:
        response_json@json: {{http_response.body}}
        http_response@json: null
{% endraw %}
{% endhighlight %}