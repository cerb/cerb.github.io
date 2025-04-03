---
title: Attachments
excerpt: This page provides information on how to download attachments using the Cerb
  API.
summary: This page provides information on how to download attachments using the Cerb
  API. It includes the specific endpoint for downloading an attachment by its ID and
  provides an example of how to execute this action using a GET request in a script.
permalink: /docs/api/endpoints/attachments/
toc:
  expand: API
jumbotron:
  title: Attachments
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Download

**GET /rest/attachments/`<id>`/download.json**

Download an attachment.

**Example:**

{% highlight http %}
GET /rest/attachments/1/download.json
Host: cerb.example
Authorization: Bearer <token>
{% endhighlight %}
