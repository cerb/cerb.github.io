---
title: Sorting results in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/sorting/
toc:
  title: Sorting
jumbotron:
  title: Sorting
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Search &raquo;
    url: /docs/search/
---

A special `sort:` [filter](/docs/search/filters/) is available on every record type. In the worklist search menu, you'll find the available sort filters in the **(sort)** submenu.

### Sort ascending

To sort matching records in ascending order (e.g. A-Z, oldest-newest), specify a filter name:

<pre>
<code class="language-cerb">
{% raw %}
sort:subject
{% endraw %}
</code>
</pre>

### Sort descending

To sort matching records in descending order (e.g. Z-A, newest-oldest), prefix the filter name with a dash (`-`):

<pre>
<code class="language-cerb">
{% raw %}
sort:-updated
{% endraw %}
</code>
</pre>

### Nested sorting

You can also sort by multiple fields by separating filter names with a comma (`,`).

For example, to return the most important and oldest issues first:

<pre>
<code class="language-cerb">
{% raw %}
sort:-importance,created
{% endraw %}
</code>
</pre>

If multiple records shared `importance:90`, they would be sub-sorted by `created` so the oldest record is first and newest is last.

You can perform nested sorting to any depth, but results will take longer to return the deeper you go.