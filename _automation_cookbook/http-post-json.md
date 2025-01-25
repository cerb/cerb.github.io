---
title: Send an HTTP POST request with a JSON payload
excerpt: Send a JSON payload to an HTTP endpoint.
summary: "This page explains how to make an HTTP POST request with a JSON payload using the 
  `http.request` command in Cerb. It shows an example of how to send a POST request to a server 
  with a formatted JSON body, including fields such as name_first, name_last, and email. The 
  code snippet demonstrates how to specify the Content-Type header as application/json and use 
  the body input field to set the payload. Additionally, the page provides an example of how to 
  implement deny policies for the `http.request` command to restrict certain types of requests 
  or URLs from being sent."
layout: automation-cookbook
jumbotron: []
---

## HTTP POST with JSON payload

You can write an HTTP request in KATA and have Cerb format and send it to the server as a JSON payload.

When using `Content-Type: application/json`, a `body:` dictionary will automatically be encoded as JSON.

{% tabs post %}

{% tab post automation %}
```cerb
start:
  http.request/post:
    output: http_response
    inputs:
      method: POST
      url: https://cerb.example/api/endpoint/
      headers:
        Content-Type: application/json
      body:
        name_first: Kina
        name_last: Halpue
        email: kina.halpue@cerb.example
```
{% endtab %}

{% tab post policy %}
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