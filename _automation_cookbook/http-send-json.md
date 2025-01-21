---
title: HTTP POST request with a JSON payload
excerpt: Send a JSON payload as an HTTP Request in KATA
summary: 
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
You can write an HTTP request in KATA and have Cerb format and send it to the server as a JSON payload.
<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request/get:
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
    deny/method@bool: {{inputs.method not in ['POST']}}
    deny/url@bool: {{inputs.url is not prefixed ('http://','https://')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>