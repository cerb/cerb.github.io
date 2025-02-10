---
title: 'Scripting Reference: Regular Expressions'
excerpt: This page provides a scripting reference for using regular expressions with
  the regexp filter in Cerb to match or extract patterns from text.
summary: This page provides a scripting reference for using regular expressions with
  the regexp filter in Cerb to match or extract patterns from text. It includes an
  example of extracting an order ID from a string using a regular expression. Additionally,
  it references an external link to Wikipedia for further information on regular expressions.
permalink: /docs/scripting/regex/
toc:
  title: Regular Expressions
  expand: Developer Guide
jumbotron:
  title: Regular Expressions
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

You can use regular expressions[^regexp] with the [regexp](/docs/scripting/filters/#regexp) filter to match or extract patterns in text:

{% highlight twig %}
{% raw %}
{% set text = "Your Amazon Order #Z-1234-5678-9 has shipped!" %}
{% set order_id = text|regexp("/Amazon Order #([A-Z0-9\-]+)/", 1) %}
Amazon Order #: {{order_id}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Amazon Order #: Z-1234-5678-9
{% endhighlight %}

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
