---
title: Image Record Fields
permalink: /docs/records/fields/types/image/
toc:
  title: Image
  expand: Records
jumbotron:
  title: Image
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

An **image** field contains a Base64-encoded image.

### Bots and Packages

As JSON from [bots](/docs/bots/) and [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"image": "data:image/png;base64,iVBORw0KGgo..."
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[image]=data:image/png;base64,iVBORw0KGgo...
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/float/" class="prev">&lt; Float</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/links/" class="next">Links &gt;</a>
	</div>
</div>
<div class="clear"></div>