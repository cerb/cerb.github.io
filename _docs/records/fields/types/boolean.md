---
title: Boolean Record Fields
permalink: /docs/records/fields/types/boolean/
toc:
  title: Boolean
  expand: Records
jumbotron:
  title: Boolean
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

A **boolean** field contains a _true_ or _false_ value.

The value is `1` (true) or `0` (false).

### Bots and Packages

As JSON from [bots](/docs/bots/) and [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"checkbox": 1
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[checkbox]=1
{% endraw %}
</code>
</pre>


<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#fields" class="prev">&lt; Record Fields</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/context/" class="next">Context &gt;</a>
	</div>
</div>
<div class="clear"></div>