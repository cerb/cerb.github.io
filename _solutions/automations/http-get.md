---
title: Send an HTTP GET request
excerpt: Fetch data from an HTTP endpoint.
summary: This page explains how to make an HTTP GET request using the `http.request:`
  command in Cerb automations. It supports various authentication methods (OAuth,
  HTTP Basic, Bearer, API keys). The response headers and content are stored in a
  variable for further processing.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/http-get.png
redirect_from:
- /automation/cookbook/http-get/
---

## Basic GET request

You can use [http.request:](https://cerb.ai/docs/automations/commands/http.request/) to make a request to any server. Here's an example of a GET request.

{% tabs http_get %}

{% tab http_get automation %}
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

{% tab http_get policy %}
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
