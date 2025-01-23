---
title: Send HTTP POST request
excerpt: Make an HTTP POST request with form-encoded data and handle JSON responses.
summary: This page demonstrates how to make HTTP POST requests with form-encoded data. It shows how to set headers, send form data, and process JSON responses, making it useful for API integrations and web service interactions.
layout: integration
jumbotron:
  title: Send HTTP POST request
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses http.request/post command
* Handles form-encoded data
* Processes JSON responses
* Includes error handling
* Validates response content type
{% endcomment %}

Here is an example of making an HTTP POST request with form data and handling a JSON response.

## Making the POST request

<pre>
<code class="language-cerb">
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
</code>
</pre>

## Policy

<pre>
<code class="language-cerb">
{% raw %}
commands:
  http.request:
    deny/method@bool: {{inputs.method not in ['POST']}}
    deny/url@bool: {{inputs.url is not prefixed ('http://','https://')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
