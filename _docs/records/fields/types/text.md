---
title: Text Record Fields
permalink: /docs/records/fields/types/text/
toc:
  title: Text
  expand: Records
jumbotron:
  title: Text
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

A **text** field contains free-form text.

### Packages

As JSON from [packages](/docs/packages/):

<pre>
<code class="language-json">
{% raw %}
{
	"subject": "I need some help with this software"
}
{% endraw %}
</code>
</pre>

To enter multiple lines of text, use `\n` control characters.

<pre>
<code class="language-json">
{% raw %}
{
	"subject": "Line 1\nLine 2\n"
}
{% endraw %}
</code>
</pre>

### Records API

In [PUT](/docs/api/endpoints/records/#update) or [POST](/docs/api/endpoints/records/#create) requests from the [API](/docs/api/) the text should be URL encoded.

<pre>
<code class="language-text">
{% raw %}
&amp;fields[subject]=I+need+help+with+this+software
{% endraw %}
</code>
</pre>

To enter multiple lines of text, encode `\n` as `%0A`:

<pre>
<code class="language-text">
{% raw %}
&amp;fields[subject]=Line+1%0ALine+2
{% endraw %}
</code>
</pre>

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/fields/types/object/" class="prev">&lt; Object</a>
	</div>
	<div class="right align-right">
		<a href="/docs/records/fields/types/timestamp/" class="next">Timestamp &gt;</a>
	</div>
</div>
<div class="clear"></div>