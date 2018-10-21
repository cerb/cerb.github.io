---
title: Number Record Fields
permalink: /docs/records/fields/types/number/
toc:
  title: Number
  expand: Records
jumbotron:
  title: Number
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

A **number** field contains an _integer_ (whole number) value.

The value is an integer.

### Bots and Packages

As JSON from [bots](/docs/bots/) and [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"importance": 50
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[importance]=50
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/links/" class="prev">&lt; Links</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/object/" class="next">Object &gt;</a>
	</div>
</div>
<div class="clear"></div>