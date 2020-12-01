---
title: "Automations: http.request"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/http.request/
toc:
  title: http.request
  expand: Automations
jumbotron:
  title: http.request
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

{% include docs/note_preview.html %}

The **http.request:** command sends data to an HTTP endpoint and returns the response.

A simple `GET` request:

<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request/get:
    output: http_response
    inputs:
      url: https://api.example/employee/123
    on_success:
      return:
        body@key: http_response:body
{% endraw %}
</code>
</pre>

A more complex `POST` request:

<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request/post:
    output: http_response
    inputs:
      method: POST
      url: https://api.example/employee/add
      headers@text:
        Content-Type: application/json
      body@text:
        {
          "person": {
            "name": "Kina",
            "title": "Customer support manager"
          }
        }
    on_simulate:
      set:
        http_response:
          status_code@int: 200
          content_type: application/json
          body@text:
            { "status": true, "id": 123 }
  set:
    body@key,json: http_response:body
  return:
    employee_id@int: {{body.id}}
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

### method:

The HTTP method to use for the request.

| Method | Body
|-|:-:
| `DELETE` | 
| `GET` | 
| `HEAD` | 
| `OPTIONS` | 
| `PATCH` | √
| `POST` | √
| `PUT` | √

<pre>
<code class="language-cerb">
method: POST
</code>
</pre>
### url:

The URL of the HTTP endpoint to use for the request.

<pre>
<code class="language-cerb">
url: https://api.example/employee/123
</code>
</pre> 

### headers:

A text block of HTTP headers to include with the request.

<pre>
<code class="language-cerb">
headers@text:
  Content-Type: application/json
  X-Requester: Cerb
</code>
</pre> 

### body:

The body of the HTTP request (if applicable).

<pre>
<code class="language-cerb">
{% raw %}
body@text:
  This is the body content
  on multiple indented lines.
{% endraw %}
</code>
</pre> 

### connected_account:

The optional URI of a [connected account](/docs/records/types/connected_account/) to use for authenticating this HTTP request.

For instance, an OAuth2 connected account will include a bearer token in the `Authorization:` header.

<pre>
<code class="language-cerb">
connected_account: cerb:connected_account:my-oauth2-account
</code>
</pre>

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of the HTTP request.

If omitted, the HTTP request is executed during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `status_code` | The HTTP status code (e.g. `200`)
| `url` | The URL of the HTTP endpoint.
| `content_type` | The content type of the HTTP response (e.g. `application/json`).
| `headers` | A dictionary of headers from the HTTP response. Keys are lowercase, with dashes as underscores (e.g. `content_type`).
| `body` | The body of the HTTP response. 

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `status_code` | The HTTP status code (e.g. `500`)
| `url` | The URL of the HTTP endpoint.
| `error` | The error message.
