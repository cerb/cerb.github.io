---
title: Workers
permalink: /docs/api/endpoints/workers/
toc:
  expand: API
jumbotron:
  title: Workers
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
  -
    label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Current Worker

**GET /workers/me.json**

Retrieve the object for the current worker based on the given API credentials.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workers/me.json');
</code>
</pre>
