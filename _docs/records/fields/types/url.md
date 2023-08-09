---
title: URL Record Fields
permalink: /docs/records/fields/types/url/
toc:
  title: URL
  expand: Records
jumbotron:
  title: URL
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

A **URL** field contains a hyperlink to a web page in the format:

<pre>
<code class="language-text">
{% raw %}
&lt;protocol&gt;://&lt;host:port&gt;/&lt;path-to-resource&gt;
{% endraw %}
</code>
</pre>	

### Packages

As JSON from [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"website": "https://cerb.ai/docs/"
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/), the URL should be encoded:

<pre>
<code class="language-text">
{% raw %}
&amp;fields[website]=https%3A%2F%2Fcerb.ai%2Fdocs%2F
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/timestamp/" class="prev">&lt; Timestamp</a>
	</div>
</div>
<div class="clear"></div>