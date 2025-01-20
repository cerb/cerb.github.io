---
title: HTTP GET request
excerpt: Run a HTTP GET request
summary: "This page explains how to make an HTTP GET request using the `http.request` command in Cerb. 
  It shows an example of how to send a GET request to the Cerb API, demonstrating its 
  functionality. Additionally, the page provides an example of how to implement deny policies 
  for the `http.request` command, which can be used to restrict certain types of requests or 
  URLs from being sent."
layout: integration
jumbotron:
  title: HTTP GET request
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
You can use ```http.request``` to make a request to any server. Here's an example of a GET request.
<pre>
<code class="language-cerb">
{% raw %}:
start:
  http.request/get:
    output: http_response
    inputs:
      method: GET
      url: https://cerb.ai/
    on_success:
    on_error:
{% endraw %}
</code>
</pre>

Use this policy:
<pre>
<code class="language-cerb">
{% raw %}
commands:
  http.request:
    deny/method@bool: {{inputs.method not in ['GET']}}
    deny/url@bool: {{inputs.url is not prefixed ('http://','https://')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>