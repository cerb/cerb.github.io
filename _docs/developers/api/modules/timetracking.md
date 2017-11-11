---
title: Time Tracking
permalink: /docs/api/modules/timetracking/
jumbotron:
  title: Time Tracking
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

# List Activities

**GET /timetracking/activities.json**

Retrieve a list of activity IDs and names.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'timetracking/activities.json');
</code>
</pre>

{% include api_toc.html %}