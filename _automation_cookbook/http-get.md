---
title: Send an HTTP GET request
excerpt: Fetch data from an HTTP endpoint.
summary: This page explains how to make an HTTP GET request using the `http.request`
  command in Cerb. It shows an example of how to send a GET request to the Cerb API,
  demonstrating its functionality. Additionally, the page provides an example of how
  to implement deny policies for the `http.request` command, which can be used to
  restrict certain types of requests or URLs from being sent.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/http-get.png
---

## Basic GET request

You can use [http.request:](https://cerb.ai/docs/automations/commands/http.request/) to make a request to any server. Here's an example of a GET request.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  http.request/get:
    output: http_response
    inputs:
      method: GET
      url: https://cerb.ai/
    on_success:
    on_error:
{% endraw %}
```
{% endtab %}

{% tab example policy %}
```cerb
{% raw %}
commands:
  http.request:
    deny/method@bool: {{inputs.method not in ['GET']}}
    deny/url@bool: {{inputs.url is not prefixed ('http://','https://')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}
