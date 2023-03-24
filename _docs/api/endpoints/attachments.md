---
title: Attachments
permalink: /docs/api/endpoints/attachments/
toc:
  expand: API
jumbotron:
  title: Attachments
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

# Download

**GET /rest/attachments/`<id>`/download.json**

Download an attachment.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'attachments/1/download.json');
</code>
</pre>
