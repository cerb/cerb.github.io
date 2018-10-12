---
title: Search Query Number Filters
permalink: /docs/search/filters/numbers/
toc:
  title: Numbers
jumbotron:
  title: Numbers
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

These expressions can be used on numeric [filters](/docs/search/filters/).

### Equal

To filter by records with an exact numeric value, use a number as the expression:

<pre>
<code class="language-text">
{% raw %}
age:35
{% endraw %}
</code>
</pre>

### Not Equal

Find all records that don't match a value by prefixing the expression with an exclamation point (`!`):

<pre>
<code class="language-text">
{% raw %}
priority:!1
{% endraw %}
</code>
</pre>

### Greater than

To filter by records with a value greater than the expression, use `>` or `>=`:

<pre>
<code class="language-text">
{% raw %}
age:&gt;21
{% endraw %}
</code>
</pre>

### Less than

To filter by records with a value less than the expression, use `<` or `<=`:

<pre>
<code class="language-text">
{% raw %}
order:&lte;100
{% endraw %}
</code>
</pre>

### Between

Find records with a value within a range by using `...`:

<pre>
<code class="language-text">
{% raw %}
importance:25...75
{% endraw %}
</code>
</pre>

### Sets

Find records that match _any_ of the given values:

<pre>
<code class="language-text">
{% raw %}
importance:[0,50,75]
{% endraw %}
</code>
</pre>
