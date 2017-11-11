---
title: Attachments
permalink: /docs/api/modules/attachments/
jumbotron:
  title: Attachments
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

<div class="cerb-box note">
<p>This module is deprecated as of <a href="/releases/8.2/">Cerb 8.2</a> and will be removed in a later version. You should use the <a href="/docs/api/modules/records/">/records</a> API instead.</p>
</div>

* TOC
{:toc}

# Download

**GET /attachments/`<id>`/download.json**

Download an attachment.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'attachments/1/download.json');
</code>
</pre>

{% include api_toc.html %}