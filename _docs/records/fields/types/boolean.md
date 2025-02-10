---
title: Boolean Record Fields
excerpt: This page provides information on boolean record fields in Cerb, explaining
  that these fields hold true or false values represented as `1` or `0`.
summary: This page provides information on boolean record fields in Cerb, explaining
  that these fields hold true or false values represented as `1` or `0`. It includes
  examples of how boolean fields are used in JSON packages and in PUT or POST requests
  through the Records API, demonstrating how to set a boolean field to true or false
  in these contexts.
permalink: /docs/records/fields/types/boolean/
toc:
  title: Boolean
  expand: Records
jumbotron:
  title: Boolean
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

A **boolean** field contains a _true_ or _false_ value.

The value is `1` (true) or `0` (false).

### Packages

As JSON from [packages](/docs/packages/):

{% highlight json %}
{% raw %}
{
	"checkbox": 1
}
{% endraw %}
{% endhighlight %}

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

{% highlight text %}
{% raw %}
&amp;fields[checkbox]=1
{% endraw %}
{% endhighlight %}


<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#fields" class="prev">&lt; Record Fields</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/context/" class="next">Context &gt;</a>
	</div>
</div>
<div class="clear"></div>