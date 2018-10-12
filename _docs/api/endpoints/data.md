---
title: Data
permalink: /docs/api/endpoints/data/
jumbotron:
  title: Data
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
