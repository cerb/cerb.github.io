---
title: Context Record Fields
permalink: /docs/records/fields/types/context/
toc:
  title: Context
  expand: Records
jumbotron:
  title: Context
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

A **context** field contains a [record type](/docs/records/types/).

The value is the `identifier` (ID) or `uri` (alias) of a record type.

### Packages

As JSON from [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"context": "ticket"
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/):

<pre>
<code class="language-text">
{% raw %}
&amp;fields[context]=ticket
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/boolean/" class="prev">&lt; Boolean</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/extension/" class="next">Extension &gt;</a>
	</div>
</div>
<div class="clear"></div>