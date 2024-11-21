---
title: Extension Record Fields
excerpt: This page provides information on extension record fields in Cerb, which
  refer to plugin extensions that can alter the functionality of a record based on
  the selected extension.
summary: This page provides information on extension record fields in Cerb, which
  refer to plugin extensions that can alter the functionality of a record based on
  the selected extension. It includes examples of how to specify an extension using
  JSON in packages and how to use the Records API to set an extension in PUT or POST
  requests. The page is part of a larger documentation context, likely detailing how
  to manage and utilize extensions within Cerb.
permalink: /docs/records/fields/types/extension/
toc:
  title: Extension
  expand: Records
jumbotron:
  title: Extension
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Field Types &raquo;
    url: /docs/records/#fields
---

An **extension** field refers to a plugin [extension](/docs/plugins/extensions/). The functionality of a [record](/docs/records/) may change based on the selected extension.

### Packages

As JSON from [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"extension_id": "example.plugin.extension.name"
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[extension_id]=example.plugin.extension.name
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/context/" class="prev">&lt; Context</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/float/" class="next">Float &gt;</a>
	</div>
</div>
<div class="clear"></div>