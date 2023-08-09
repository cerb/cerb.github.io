---
title: Float Record Fields
permalink: /docs/records/fields/types/float/
toc:
  title: Float
  expand: Records
jumbotron:
  title: Float
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
  -
    label: Field Types &raquo;
    url: /docs/records/#fields
---

A **float** field contains a number with decimal precision.

The value is a floating point number.

### Packages

As JSON from [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"spam_score": 0.9999
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[spam_score]=0.9999
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/extension/" class="prev">&lt; Extension</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/image/" class="next">Image &gt;</a>
	</div>
</div>
<div class="clear"></div>