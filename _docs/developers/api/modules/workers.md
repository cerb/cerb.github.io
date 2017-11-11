---
title: Workers
permalink: /docs/api/modules/workers/
jumbotron:
  title: Workers
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

{% include api_toc.html %}