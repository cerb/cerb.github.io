---
title: Filtering by watcher fields in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/watchers/
toc:
  title: Watchers
jumbotron:
  title: Watchers
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

These expressions can be used on watcher [filters](/docs/search/filters/).

### Names

To filter for records watched by specific workers, enter partial names:

<pre>
<code class="language-text">
{% raw %}
watchers:kina,karl
{% endraw %}
</code>
</pre>

### Me

To filter for records you're watching, use the `me` expression:

<pre>
<code class="language-text">
{% raw %}
watchers:me
{% endraw %}
</code>
</pre>

### Any

To filter for records watched by any workers, use the `any` expression:

<pre>
<code class="language-text">
{% raw %}
watchers:any
{% endraw %}
</code>
</pre>

### None

To filter for records **not** watched by any workers, use the `none` expression:

<pre>
<code class="language-text">
{% raw %}
watchers:none
{% endraw %}
</code>
</pre>

### IDs

To filter for records watched by specific worker IDs, enter a comma-separated list of IDs:

<pre>
<code class="language-text">
{% raw %}
watchers:1,2,3
{% endraw %}
</code>
</pre>


