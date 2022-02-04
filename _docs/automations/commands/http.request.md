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

The **http.request:** command sends data to an HTTP endpoint and returns the response.

The command also supports streaming large file uploads directly from attachment records, and downloads directly into attachment records.

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
      body:
        person:
          name: Kina
          title: Customer Support Manager
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

A set of HTTP headers to include with the request.

Headers should be described as a set of `name: value` pairs.

<pre>
<code class="language-cerb">
headers:
  Content-Type: application/json
  X-Requester: Cerb
</code>
</pre> 

The headers can optionally also be defined as a `@text` block.

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

If the body is defined as a dictionary of `key: value` pairs, then it will automatically be encoded based on the `Content-Type:` header:

* JSON (`application/json`)
* YAML (`application/x-yaml`/`text/yaml`)
* URL-encoded (`application/x-www-form-urlencoded`); or if the `Content-Type:` is omitted
  
This removes the need for extraneous `set:` commands to prepare the HTTP request.

<pre>
<code class="language-cerb">
{% raw %}
headers:
  Content-Type: application/json
body:
  person:
    name: Kina Halpue
    title: Customer Service Manager
{% endraw %}
</code>
</pre>

### timeout:

The optional timeout in seconds. Decimal values are allowed (e.g. `0.5` for 500ms).

<pre>
<code class="language-cerb">
{% raw %}
timeout: 0.5
{% endraw %}
</code>
</pre>

### authentication:

The optional URI of a [connected account](/docs/records/types/connected_account/) to use for authenticating this HTTP request.

For instance, an OAuth2 connected account will include a bearer token in the `Authorization:` header.

<pre>
<code class="language-cerb">
authentication: cerb:connected_account:my-oauth2-account
</code>
</pre>

## output:

Save the results in this placeholder.

### Binary responses

A binary HTTP response body is automatically converted to a base64-encoded `data:` URI.

This resolves issues with serializing automation states containing unprintable characters (e.g. simulation).

You should always use the `http.request:on_success:` handler to verify an HTTP response. When this occurs, the `output:is_data_uri:` is `true`.

### Large responses

A large HTTP response body (>1MB) will now be returned as an [automation resource](/docs/records/types/automation_resource/) record for further processing.

These bytes are streamed directly to a file to avoid memory limitations in the automation (e.g. video processing).

When this occurs:
* `output:is_cerb_uri:` is `true`
* `output:content_type:` is replaced with `application/vnd.cerb.uri`
* `output:content_type_original:` contains the original content type
* The HTTP body is a Cerb record URI (e.g. `cerb:automation_resource:c10028f0-1cad-11ec-81e5-59d4c4af2d7`)

The new [file.read:](/docs/automations/commands/file.read/) command can be used to process the file in chunks.

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

# Examples

## Stream a large upload from an attachment

The `http.request:` action can directly stream large attachment/resource uploads for PUT and POST HTTP requests.

Set the `Content-Type:` header to `application/vnd.cerb.uri` and set the HTTP body to a record URI like `cerb:attachment:123`.

The automation will take care of streaming the bytes to the HTTP endpoint, which avoids memory issues with loading large attachment content into an automation variable.

<pre>
<code class="language-cerb">
{% raw %}
start:
  http.request/post:
    output: http_response
    inputs:
      method: POST
      url: https://api.example/file/upload
      headers@text:
        Content-Type: application/vnd.cerb.uri
      body@text:
        cerb:attachment:123
{% endraw %}
</code>
</pre>