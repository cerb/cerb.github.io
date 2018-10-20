---
title: Filtering by fulltext fields in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/fulltext/
toc:
  title: Fulltext
jumbotron:
  title: Fulltext
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

Many records provide a default **full-text** [filter](/docs/search/filters/) that's used when you type an expression without specifying a filter.

This is a more efficient way to search [records](/docs/records/) with a large amount of text (e.g. email messages, comments).

{% comment %}
* stop words
* default search
{% endcomment %}

### Terms

By default, records will be returned if they match all of the given terms.

<pre>
<code class="language-text">
{% raw %}
bug bluetooth report
{% endraw %}
</code>
</pre>

### Phrases

Enter text within quotes to search for exact phrases:

<pre>
<code class="language-text">
{% raw %}
"bug report"
{% endraw %}
</code>
</pre>

