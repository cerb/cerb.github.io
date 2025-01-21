---
title: HTTP GET request
excerpt: Run a HTTP GET request
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