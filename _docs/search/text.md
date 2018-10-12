---
title: Filtering by text fields in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/text/
toc:
  title: Text
jumbotron:
  title: Text
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

These expressions can be used on text-based [filters](/docs/search/filters/).

### Text

Simple text (without spaces) can be used as the entire expression:

<pre>
<code class="language-text">
{% raw %}
firstName:Kina
{% endraw %}
</code>
</pre>

### Phrases

Enclose phrases in double quotes (`"`):

<pre>
<code class="language-text">
{% raw %}
subject:"This phrase contains spaces"
{% endraw %}
</code>
</pre>

### Wildcards

Use asterisks (`*`) to denote wildcards:

<pre>
<code class="language-text">
{% raw %}
mask:abc*
{% endraw %}
</code>
</pre>

### Sets

Find records that match _any_ of the given values:

<pre>
<code class="language-text">
{% raw %}
color:[red,green,blue]
{% endraw %}
</code>
</pre>

### Negation

Prefix an expression with an exclamation point (`!`) to negate it. This returns any records that don't match.

<pre>
<code class="language-text">
{% raw %}
status:!open
{% endraw %}
</code>
</pre>
