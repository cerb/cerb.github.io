---
title: Filtering by boolean fields in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/booleans/
toc:
  title: Booleans
jumbotron:
  title: Booleans
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Search &raquo;
    url: /docs/search/
  -
    label: Filters &raquo;
    url: /docs/search/filters/
---

These expressions can be used on boolean [filters](/docs/search/filters/).

### True

To filter for records with a `true` boolean value, you can use the expressions:

* `yes`
* `y`
* `true`

<pre>
<code class="language-text">
{% raw %}
checkbox:y
{% endraw %}
</code>
</pre>

### False

To filter for records with a `false` boolean value, you can use the expressions:

* `no`
* `n`
* `false`

<pre>
<code class="language-text">
{% raw %}
isAdmin:n
{% endraw %}
</code>
</pre>
