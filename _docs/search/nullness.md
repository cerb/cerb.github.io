---
title: Filtering by nullness in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/nullness/
toc:
  title: Nullness
jumbotron:
  title: Nullness
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

You can match records by having, or not having, any value for a particular [filter](/docs/search/filters/).

This is particularly useful for [custom fields](/docs/custom-fields/).

### Null

Use the expression `null` to find records _without_ any value set:

<pre>
<code class="language-text">
{% raw %}
sla.level:null
{% endraw %}
</code>
</pre>

### Not null

Use the expression `!null` to find records _with_ any value set:

<pre>
<code class="language-text">
{% raw %}
checkbox:!null
{% endraw %}
</code>
</pre>

