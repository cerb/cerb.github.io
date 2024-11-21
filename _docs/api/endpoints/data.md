---
title: Data
excerpt: This page provides instructions on how to run a data query in Cerb using
  the GET method on the endpoint `/rest/data/query.json`.
summary: This page provides instructions on how to run a data query in Cerb using
  the GET method on the endpoint `/rest/data/query.json`. It includes an example of
  how to construct a query using PHP's `http_build_query` function to request subtotals
  of tickets grouped by creation year and group. The example demonstrates how to send
  the query to the Cerb API to retrieve the desired data.
permalink: /docs/api/endpoints/data/
toc:
  expand: API
jumbotron:
  title: Data
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
  - label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

# Run a data query

**GET /rest/data/query.json**

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
