---
title: Timestamp Record Fields
permalink: /docs/records/fields/types/timestamp/
toc:
  title: Timestamp
  expand: Records
jumbotron:
  title: Timestamp
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

A **timestamp** field contains a _Unix timestamp_ as a 32-bit integer, representing the number of elapsed seconds since January 1, 1970 00:00:00 GMT.

The value is text describing an absolute or relative date.

### Packages

As JSON from [packages](/docs/packages/):

#### Relative dates

<pre>
<code class="language-json">
{% raw %}
{
	"created": "-1 week 8am"
}
{% endraw %}
</code>
</pre>

#### Absolute dates

<pre>
<code class="language-json">
{% raw %}
{
	"updated": "Jan 1 2019 13:00:00 +0000"
}
{% endraw %}
</code>
</pre>

#### Unix timestamps (as seconds)

<pre>
<code class="language-json">
{% raw %}
{
	"created": 1550080259
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[timestamp]=1550080259
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/text/" class="prev">&lt; Text</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/url/" class="next">URL &gt;</a>
	</div>
</div>
<div class="clear"></div>