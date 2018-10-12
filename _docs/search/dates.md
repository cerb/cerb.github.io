---
title: Search Query Date Filters
permalink: /docs/search/filters/dates/
toc:
  title: Dates
jumbotron:
  title: Dates
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

These expressions can be used on date-based [filters](/docs/search/filters/).

### Since

To filter by records with a date after a given point in time:

<pre>
<code class="language-text">
{% raw %}
created:today
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"-1 month"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"2018-01-01"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"January 1 2018"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"first day of this month"
{% endraw %}
</code>
</pre>

### Between

To filter by records with a date within a given range, provide two dates separated by the word `to`:

<pre>
<code class="language-text">
{% raw %}
created:"today to now"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"January 1 to June 30"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"-1 year to -6 months"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-text">
{% raw %}
created:"big bang to first day of this month"
{% endraw %}
</code>
</pre>
