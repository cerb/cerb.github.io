---
title: Using AND/OR filter groups in search queries
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/and-or/
toc:
  title: AND / OR
jumbotron:
  title: AND / OR
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Search &raquo;
    url: /docs/search/
---

You can group [filters](/docs/search/filters/) into `AND` and `OR` (boolean) sets.

### AND

Return records that match **all** of the given filters:

<pre>
<code class="language-cerb">
{% raw %}
status:open AND created:today AND group:support
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
status:open created:today group:support
{% endraw %}
</code>
</pre>

<div class="cerb-box note">
<p>A query automatically uses <code>AND</code> by default if you specify multiple filters and separate them with a space.</p>
</div>

### OR

Return records that match **any** of the given filters:

<pre>
<code class="language-cerb">
{% raw %}
owner.id:me OR owner.id:none
{% endraw %}
</code>
</pre>

The above example will return records that are "owned by the current worker" or "have no owner". It will exclude records owned by any other worker.

### NOT

You can prefix a boolean filter group with an exclamation mark (`!`) to negate it:

<pre>
<code class="language-cerb">
{% raw %}
!(mimetype:image/png size:<100KB)
{% endraw %}
</code>
</pre>

The above example will return everything **except** "PNGs smaller than 100KB".

### Multiple boolean filter groups

You can mix boolean filter groups by using parentheses (`()`):

<pre>
<code class="language-cerb">
{% raw %}
(mimetype:image/png size:&gt;100KB) OR (mimetype:image/jpeg size:&lt;100KB)
{% endraw %}
</code>
</pre>

The above example will return **both** "PNGs larger than 100KB" and "JPEGs smaller than 100KB".
