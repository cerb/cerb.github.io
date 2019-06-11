---
title: Filtering by record choosers in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/choosers/
toc:
  title: Choosers
jumbotron:
  title: Choosers
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

**Chooser** [filters](/docs/search/filters/) match fields that contain [record](/docs/records/) IDs.

By convention, these filter names usually have an `.id` suffix (e.g. `bucket.id:`).

Chooser filters support all [numeric](/docs/search/filters/numbers/) expressions.

### ID

To find records with a single matching record ID:

<pre>
<code class="language-cerb">
{% raw %}
group.id:1
{% endraw %}
</code>
</pre>

### IDs

To find records matching any of a list of record IDs:

<pre>
<code class="language-cerb">
{% raw %}
group.id:[1,2,3]
{% endraw %}
</code>
</pre>

### Chooser Helper

In the search menu, these filters offer a **(chooser)** helper:

<div class="cerb-screenshot">
<img src="/assets/images/docs/search/filters/search-filters-menu-choosers.png" class="screenshot">
</div>

This opens a [worklist](/docs/worklists/) popup where records can be filtered and selected.

After clicking the **Save Changes** button on the popup, the filter's expression is automatically set to the list of selected record IDs.

