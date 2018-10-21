---
title: Links Record Fields
permalink: /docs/records/fields/types/links/
toc:
  title: Links
  expand: Records
jumbotron:
  title: Links
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

A **links** field contains a list of `context:id` pairs pointing to other records.

The value is an array of `type:id` pairs.

### Bots and Packages

As JSON from [bots](/docs/bots/) and [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"links": [
		"ticket:123",
		"org:456"
	]
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[links][]=ticket:123
&amp;fields[links][]=org:456
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/image/" class="prev">&lt; Image</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/number/" class="next">Number &gt;</a>
	</div>
</div>
<div class="clear"></div>