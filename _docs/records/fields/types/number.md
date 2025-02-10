---
title: Number Record Fields
excerpt: This page provides information on number record fields in Cerb, which are
  used to store integer (whole number) values.
summary: This page provides information on number record fields in Cerb, which are
  used to store integer (whole number) values. It includes examples of how these fields
  are represented in JSON format for packages and how they can be utilized in PUT
  or POST requests through the Records API. The page serves as a guide for implementing
  and managing number fields within Cerb's system.
permalink: /docs/records/fields/types/number/
toc:
  title: Number
  expand: Records
jumbotron:
  title: Number
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

A **number** field contains an _integer_ (whole number) value.

The value is an integer.

### Packages

As JSON from [packages](/docs/packages/):

{% highlight json %}
{% raw %}
{
	"importance": 50
}
{% endraw %}
{% endhighlight %}

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

{% highlight text %}
{% raw %}
&amp;fields[importance]=50
{% endraw %}
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/links/" class="prev">&lt; Links</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/object/" class="next">Object &gt;</a>
	</div>
</div>
<div class="clear"></div>