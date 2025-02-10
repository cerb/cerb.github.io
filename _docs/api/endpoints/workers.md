---
title: Workers
excerpt: This page provides information on how to retrieve the current worker's object
  in Cerb using the API endpoint.
summary: This page provides information on how to retrieve the current worker's object
  in Cerb using the API endpoint `GET /rest/workers/me.json`. It includes an example
  of how to make this API call using a GET request, demonstrating how to access the
  current worker's data based on the provided API credentials.
permalink: /docs/api/endpoints/workers/
toc:
  expand: API
jumbotron:
  title: Workers
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Current Worker

**GET /rest/workers/me.json**

Retrieve the object for the current worker based on the given API credentials.

### Example
{: .no_toc}

{% highlight php %}
$out = $cerb->get($base_url . 'workers/me.json');
{% endhighlight %}
