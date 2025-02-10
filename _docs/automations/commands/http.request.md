---
title: 'Automations: http.request'
excerpt: This page provides a detailed guide on using the `http.request` command in
  Cerb automations to send data to HTTP endpoints and handle responses.
summary: This page provides a detailed guide on using the `http.request` command in
  Cerb automations to send data to HTTP endpoints and handle responses. It explains
  how to perform both simple and complex HTTP requests, including `GET` and `POST`
  methods, and how to manage headers, body content, and authentication. The page also
  covers handling binary and large responses, streaming large file uploads directly
  from attachment records, and downloading into attachment records. It includes syntax
  details for various inputs like method, URL, headers, body, timeout, and authentication,
  as well as output handling and error management. Examples demonstrate practical
  applications, such as streaming large uploads from attachments, ensuring efficient
  data handling without memory limitations.
permalink: /docs/automations/commands/http.request/
toc:
  title: http.request
  expand: Automations
jumbotron:
  title: http.request
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **http.request:** command sends data to an HTTP endpoint and returns the response.

The command also supports streaming large file uploads directly from attachment records, and downloads directly into attachment records.

A simple `GET` request:

{% highlight cerb %}
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
{% endhighlight %}

A more complex `POST` request:

{% highlight cerb %}
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
{% endhighlight %}

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

{% highlight cerb %}
method: POST
{% endhighlight %}

### url:

The URL of the HTTP endpoint to use for the request.

{% highlight cerb %}
url: https://api.example/employee/123
{% endhighlight %} 

### headers:

A set of HTTP headers to include with the request.

Headers should be described as a set of `name: value` pairs.

{% highlight cerb %}
headers:
  Content-Type: application/json
  X-Requester: Cerb
{% endhighlight %} 

The headers can optionally also be defined as a `@text` block.

{% highlight cerb %}
headers@text:
  Content-Type: application/json
  X-Requester: Cerb
{% endhighlight %} 

### body:

The body of the HTTP request (if applicable).

{% highlight cerb %}
{% raw %}
body@text:
  This is the body content
  on multiple indented lines.
{% endraw %}
{% endhighlight %}

If the body is defined as a dictionary of `key: value` pairs, then it will automatically be encoded based on the `Content-Type:` header:

* JSON (`application/json`)
* YAML (`application/x-yaml`/`text/yaml`)
* URL-encoded (`application/x-www-form-urlencoded`); or if the `Content-Type:` is omitted
  
This removes the need for extraneous `set:` commands to prepare the HTTP request.

{% highlight cerb %}
{% raw %}
headers:
  Content-Type: application/json
body:
  person:
    name: Kina Halpue
    title: Customer Service Manager
{% endraw %}
{% endhighlight %}

### timeout:

The optional timeout in seconds. Decimal values are allowed (e.g. `0.5` for 500ms).

{% highlight cerb %}
{% raw %}
timeout: 0.5
{% endraw %}
{% endhighlight %}

### authentication:

The optional URI of a [connected account](/docs/records/types/connected_account/) to use for authenticating this HTTP request.

For instance, an OAuth2 connected account will include a bearer token in the `Authorization:` header.

{% highlight cerb %}
authentication: cerb:connected_account:my-oauth2-account
{% endhighlight %}

### response:

If set, the response will always be returned as an [automation resource](/docs/records/types/automation_resource/) regardless of its size.

|---
| Key | Description
|-|-
| `expires` | The expiration of the automation resource record.

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
| `headers` | A dictionary of headers from the HTTP response. Keys are lowercase, dashes are preserved (e.g. `content-type`).
| `body` | The body of the HTTP response. 

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
| `status_code` | The HTTP status code (e.g. `500`)
| `url` | The URL of the HTTP endpoint.
| `content_type` | The content type of the HTTP response (e.g. `application/json`).
| `headers` | A dictionary of headers from the HTTP response. Keys are lowercase, dashes are preserved (e.g. `content-type`).
| `body` | The body of the HTTP response.

# Examples

## Stream a large upload from an attachment

The `http.request:` action can directly stream large attachment/resource uploads for PUT and POST HTTP requests.

Set the `Content-Type:` header to `application/vnd.cerb.uri` and set the HTTP body to a record URI like `cerb:attachment:123`.

The automation will take care of streaming the bytes to the HTTP endpoint, which avoids memory issues with loading large attachment content into an automation variable.

{% highlight cerb %}
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
{% endhighlight %}