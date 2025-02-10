---
title: 'Scripting Reference: Tests'
excerpt: A reference of the template tests in bot scripting.
summary: This webpage serves as a scripting reference for tests in Cerb, detailing
  various boolean expressions that can be used in bot scripts and snippets. It explains
  how to perform tests using the `is` and `is not` operators, which return `true`
  or `false` values. The page covers a range of tests including checking if a variable
  is empty, even, iterable, null, numeric, odd, matches a pattern, is prefixed or
  suffixed, is of a specific record type, or is the same as another variable. Each
  test is accompanied by examples demonstrating its usage and expected output, providing
  a comprehensive guide for users to implement these tests effectively in their scripts.
permalink: /docs/scripting/tests/
toc:
  title: Tests
  expand: Developer Guide
jumbotron:
  title: 'Reference: Tests'
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

A **test** is an expression that returns a boolean value (`true` or `false`).

Tests are performed using the `is` and `is not` operators.

When used as output, a test returns `1` for `true`, and nothing for `false`.

These tests are available in bot scripts and snippets:

* TOC
{:toc}

## empty

The **empty** test checks if a variable is an empty string, empty array, empty object, false, or null.

{% highlight twig %}
{% raw %}
"": {{"" is empty}}
[]: {{[] is empty}}
{}: {{{ } is empty}}
false: {{false is empty}}
not something: {{"something" is not empty}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
"": 1
[]: 1
{}: 1
false: 1
not something: 1 
{% endhighlight %}

## even

The **even** test checks if a numeric variable is even.

{% highlight twig %}
{% raw %}
1: {{1 is even ? 'even' : 'odd'}}
2: {{2 is even ? 'even' : 'odd'}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1: odd
2: even
{% endhighlight %}

## iterable

The **iterable** test checks if a variable is an array or iterable object.

{% highlight twig %}
{% raw %}
123: {{123 is iterable ? 'iterable' : 'not iterable'}}
[1,2,3]: {{[1,2,3] is iterable ? 'iterable' : 'not iterable'}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
123: not iterable
[1,2,3]: iterable
{% endhighlight %}

## null

The **null** test checks if a variable is `null`.

{% highlight twig %}
{% raw %}
undefined: {{unknownVariable is null ? 'null' : 'defined'}}
123: {{123 is null ? 'null' : 'constant'}}
{% set name = 'Kina Halpue' %}
name: {{name is null ? 'null' : 'defined'}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
undefined: null
123: constant
name: defined
{% endhighlight %}

## numeric

The **numeric** test checks if a variable is numeric.

{% highlight twig %}
{% raw %}
123: {{123 is numeric ? 'numeric' : 'not numeric'}}
abc: {{"abc" is numeric ? 'numeric' : 'not numeric'}}
[1,2,3]: {{[1,2,3] is numeric ? 'numeric' : 'not numeric'}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
123: numeric
abc: not numeric
[1,2,3]: not numeric
{% endhighlight %}

## odd

The **odd** test checks if a numeric variable is odd.

{% highlight twig %}
{% raw %}
1: {{1 is even ? 'even' : 'odd'}}
2: {{2 is even ? 'even' : 'odd'}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1: odd
2: even
{% endhighlight %}

## pattern

The **pattern** test checks if a variable matches any pattern in a set.

The variable can be a string or an array. The test accepts one or more patterns where asterisks (`*`) denote wildcards.

{% highlight twig %}
{% raw %}
{% set recipient = "support@cerb.example" %}
{{recipient is pattern ("support@*", "*@example.com")}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

## prefixed

The **prefixed** test checks if a string variable starts with any pattern in a set.

The test accepts one or more patterns.

{% highlight twig %}
{% raw %}
{% set subject = "[Bugs] New issue reported" %}
{{subject is prefixed ("[Bugs]")}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

## record type

The **record type** test checks if an expression matches any of a list of record types. Record types can be specified as extension IDs (e.g. `cerberusweb.contexts.ticket`) or URIs (e.g. `ticket`).

{% highlight twig %}
{% raw %}
{% set record__context = 'cerberusweb.contexts.task' %}
{{record__context is record type ('task','ticket')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

## same as

The **same as** test checks if two variables are of the same exact type and value. This avoids type coercion (e.g. converting strings to numbers).

{% highlight twig %}
{% raw %}
{% set number = 1 %}
{% set string = "1" %}
{{number is same as string ? 'same' : 'not same'}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
not same
{% endhighlight %}

## suffixed

The **suffixed** test checks if a string variable ends with any pattern in a set.

The test accepts one or more patterns.

{% highlight twig %}
{% raw %}
{% set domain = "cerb.ai" %}
{{domain is suffixed (".ai", ".com")}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/filters/" class="prev">&lt; Filters</a>
	</div>
	<div class="right align-right">
		<a href="/docs/plugins/" class="prev">Plugins &gt;</a>
	</div>
</div>
<div class="clear"></div>
