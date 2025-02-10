---
title: Image Record Fields
excerpt: This page provides information on handling image fields in Cerb, specifically
  focusing on Base64-encoded images.
summary: This page provides information on handling image fields in Cerb, specifically
  focusing on Base64-encoded images. It details how images are represented in JSON
  packages and how they can be managed through the Records API using PUT or POST requests.
  Additionally, it explains the process for removing an image by setting its data
  to null.
permalink: /docs/records/fields/types/image/
toc:
  title: Image
  expand: Records
jumbotron:
  title: Image
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

An **image** field contains a Base64-encoded image.

### Packages

As JSON from [packages](/docs/packages/):

{% highlight json %}
{% raw %}
{
	"image": "data:image/png;base64,iVBORw0KGgo..."
}
{% endraw %}
{% endhighlight %}

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

{% highlight text %}
{% raw %}
&amp;fields[image]=data:image/png;base64,iVBORw0KGgo...
{% endraw %}
{% endhighlight %}

### Remove

You can remove an image by setting it to `data:null`

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/float/" class="prev">&lt; Float</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/links/" class="next">Links &gt;</a>
	</div>
</div>
<div class="clear"></div>