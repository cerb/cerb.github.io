---
title: Search Query Filters
permalink: /docs/search/filters/
toc:
  title: Filters
jumbotron:
  title: Filters
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Search &raquo;
    url: /docs/search/
---

A query is a list of **filters** separated by a space. Each filter uses the format:

<pre>
<code class="language-text">
{% raw %}
filter:expression
{% endraw %}
</code>
</pre>

The possible **expressions** depend on the type of filter: text, number, date, record, etc. We'll cover all those options in the next few sections.

### Listing filters by record type

You can use the search menu to list the available filters for any record type:

<div class="cerb-screenshot">
<img src="/assets/images/docs/search/search-menu.png" class="screenshot">
</div>

After selecting a record type, click the down arrow in the search bar to reveal the filters menu:

<div class="cerb-screenshot">
<img src="/assets/images/docs/search/search-worklist-menu.png" class="screenshot">
</div>

This list includes the built-in filters for that record type, as well as any [custom fields](/docs/custom-fields/) and [fieldsets](/docs/custom-fields/) you may have added.
