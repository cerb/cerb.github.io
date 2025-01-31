---
title: Send an HTTP POST request with a form payload
excerpt: Make an HTTP POST request with form-encoded data.
summary: This page demonstrates how to make HTTP POST requests with form-encoded data.
  It shows how to set headers, send form data, and process JSON responses, making
  it useful for API integrations and web service interactions.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/http-post-form.png
---

{% comment %}
* Uses http.request/post command
* Handles form-encoded data
* Processes JSON responses
* Includes error handling
* Validates response content type
{% endcomment %}

## HTTP POST with form-encoded payload

Here is an example of making an HTTP POST request with form-encoded data and handling a JSON response.

When using `Content-Type: application/x-www-form-urlencoded`, a `body:` dictionary will automatically be encoded as form data.

{% tabs http_post_form %}

{% tab http_post_form automation %}
```cerb
{% raw %}
start:
  http.request/post:
    output: http_response
    inputs:
      method: POST
      url: https://api.cerb.cloud/docs/search
      headers:
        Content-Type: application/x-www-form-urlencoded
      body:
        query: How much does it cost?
        limit: 10
    on_success:
      outcome/200:
        if@bool: {{200 == http_response.status_code and 'application/json' == http_response.content_type}}
        then:
          set:
            status_code@int: {{http_response.status_code}}
            http_response@json: {{http_response.body}}
    on_error:
{% endraw %}
```
{% endtab %}

{% tab http_post_form policy %}
```cerb
{% raw %}
commands:
  http.request:
    deny/method@bool: {{inputs.method not in ['POST']}}
    deny/url@bool: {{inputs.url is not prefixed ('http://','https://')}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}
