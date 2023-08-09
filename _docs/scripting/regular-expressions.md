---
title: "Scripting Reference: Regular Expressions"
excerpt: 
permalink: /docs/scripting/regex/
toc:
  title: Regular Expressions
  expand: Developer Guide
jumbotron:
  title: Regular Expressions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Developer Guide &raquo;
  -
    label: Scripting &raquo;
    url: /docs/scripting/
---

You can use regular expressions[^regexp] with the [regexp](/docs/scripting/filters/#regexp) filter to match or extract patterns in text:

<pre>
<code class="language-twig">
{% raw %}
{% set text = "Your Amazon Order #Z-1234-5678-9 has shipped!" %}
{% set order_id = text|regexp("/Amazon Order #([A-Z0-9\-]+)/", 1) %}
Amazon Order #: {{order_id}}
{% endraw %}
</code>
</pre>

```
Amazon Order #: Z-1234-5678-9
```

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/loops/" class="prev">&lt; Loops</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/json/" class="prev">JSON &gt;</a>
	</div>
</div>
<div class="clear"></div>

# References

[^regexp]: Wikipedia: Regular Expression - <https://en.wikipedia.org/wiki/Regular_expression>
