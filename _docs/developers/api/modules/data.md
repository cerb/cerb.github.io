---
title: Data
permalink: /docs/api/modules/data/
jumbotron:
  title: Data
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Run a data query

**GET /data/query.json**

Run a [data query](/docs/data-queries/).

### Example
{: .no_toc}

<pre>
<code class="language-php">
$query = http_build_query([
  'q' => 'type:worklist.subtotals of:tickets by:[created@year,group]',
]);
  
$out = $cerb->get($base_url . 'data/query.json?' . $query);
</code>
</pre>

{% include api_toc.html %}