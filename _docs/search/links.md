---
title: Filtering by links in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/links/
toc:
  title: Links
jumbotron:
  title: Links
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

These expressions can be used on link [filters](/docs/search/filters/).

### Link to record type

To filter by records with a link to a specific other [record type](/docs/records/types/), use its alias as the expression:

<pre>
<code class="language-cerb">
{% raw %}
links:ticket
{% endraw %}
</code>
</pre>

### Deep search by links

You can also use [deep search](/docs/search/deep-search/) to filter records based on any property of linked records.

Append the [record type alias](/docs/records/types/) to `links` following a period (`.`), then the expression can be any [search query](/docs/search/) for that record type:

<pre>
<code class="language-cerb">
{% raw %}
links.ticket:(mask:a*)
{% endraw %}
</code>
</pre>
