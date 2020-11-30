---
title: "webhook.respond"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/webhook.respond/
toc:
  title: webhook.respond
jumbotron:
  title: webhook.respond
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

{% include docs/note_preview.html %}

**webhook.respond** [automations](/docs/automations/) are triggered by a [webhook listener](/docs/webhooks/) that receives an HTTP request.

This trigger uses [event handler](/docs/automations/#event-handlers) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `request_body` | string | The request body as text.
| `request_client_ip` | string | The client IP making the requst (e.g. `1.2.3.4`).
| `request_headers` | dictionary | The request headers. Keys are lowercase with dashes as underscores (e.g. `content_type`).
| `request_method` | string | Method name in uppercase (e.g. `POST`).
| `request_params` | dictionary | The query string parameters. Keys are lowercase with dashes as underscores (e.g. `query_string`).
| `request_path` | string | The request path (e.g. `some/folder/file.ext`).

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `body:` | string | The body content to return. Use `body@base64:` for binary.
| `headers:` | dictionary | A set of `key: value` paris (e.g. `Content-Type: application/json`).
| `status_code:` | integer | HTTP status code (e.g. `200`=OK, `403`=Forbidden, `404`=Not Found, `500`=Error). 
