---
title: Object Record Fields
excerpt: This page provides information on object record fields in Cerb, which consist
  of collections of keys and their associated values.
summary: This page provides information on object record fields in Cerb, which consist
  of collections of keys and their associated values. It explains how these fields
  can be represented in JSON format within packages and how they can be utilized in
  PUT or POST requests through the Records API. The examples illustrate how to structure
  data for fields such as "color" and "quantity" using both JSON and API request formats.
permalink: /docs/records/fields/types/object/
toc:
  title: Object
  expand: Records
jumbotron:
  title: Object
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

An **object** field contains a _collection_ of **keys** and their associated **values**.

### Packages

As JSON from [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"params": {
		"color": "red",
		"quantity": 6
	}
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[params][color]=red
&amp;fields[params][quantity]=6
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/number/" class="prev">&lt; Number</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/text/" class="next">Text &gt;</a>
	</div>
</div>
<div class="clear"></div>