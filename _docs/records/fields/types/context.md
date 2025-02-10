---
title: Context Record Fields
excerpt: This page provides information on context record fields in Cerb, explaining
  that a context field contains a record type identified by an ID or URI.
summary: This page provides information on context record fields in Cerb, explaining
  that a context field contains a record type identified by an ID or URI. It includes
  examples of how context fields are used in JSON packages and in PUT or POST requests
  through the Records API, specifically showing how to set a context field to a record
  type like "ticket."
permalink: /docs/records/fields/types/context/
toc:
  title: Context
  expand: Records
jumbotron:
  title: Context
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

A **context** field contains a [record type](/docs/records/types/).

The value is the `identifier` (ID) or `uri` (alias) of a record type.

### Packages

As JSON from [packages](/docs/packages/):

{% highlight json %}
{% raw %}
{
	"context": "ticket"
}
{% endraw %}
{% endhighlight %}

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

{% highlight text %}
{% raw %}
&amp;fields[context]=ticket
{% endraw %}
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/boolean/" class="prev">&lt; Boolean</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/extension/" class="next">Extension &gt;</a>
	</div>
</div>
<div class="clear"></div>