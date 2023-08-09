---
title: "Scripting Reference: Operators"
excerpt: 
permalink: /docs/scripting/operators/
toc:
  title: Operators
  expand: Developer Guide
jumbotron:
  title: Operators
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

An **operator** makes comparisons between two values in an expression.

# Assignment

As you've seen with the [set](/docs/scripting/commands/#set) command, a single `=` (equals) character _assigns_ a value to a variable:

<pre>
<code class="language-twig">
{% raw %}
{% set this = 0 %}
{% set that = 1 %}
this is {{this}} and that is {{that}}
{% endraw %}
</code>
</pre>

```
this is 0 and that is 1
```

# Equals

To check if a variable is equal to a specific value, use two equal signs (`==`):

<pre>
<code class="language-twig">
{% raw %}
{% set this = 1 %}
{% set that = 1 %}
{% if this == that %}
This and that are equal.
{% endif -%}
{% endraw %}
</code>
</pre>

```
This and that are equal.
```

# Doesn't equal

To check that a variable isn't equal to a specific value, use `!=`:

<pre>
<code class="language-twig">
{% raw %}
{% set this = 0 %}
{% set that = 1 %}
{% if this != that %}
This doesn't equal that.
{% endif -%}
{% endraw %}
</code>
</pre>

```
This doesn't equal that.
```

# Less than

To check if one variable is less than another, use `<` or `<=`:

<pre>
<code class="language-twig">
{% raw %}
{% set little = 5 %}
{% set big = 1000 %}
{% if little < big %}
{{little}} is less than {{big}}
{% endif -%}
{% endraw %}
</code>
</pre>

```
5 is less than 1000
```

# Greater than

To check if one variable is greater than another, use `>` or `>=`:

<pre>
<code class="language-twig">
{% raw %}
{% set little = 5 %}
{% set big = 1000 %}
{% if big > little %}
{{big}} is greater than {{little}}
{% endif -%}
{% endraw %}
</code>
</pre>

```
1000 is greater than 5
```

# Value in list

You can check if a value exists in a list by using the `in` test:

<pre>
<code class="language-twig">
{% raw %}
{% set colors = ['blue','green','red'] %}
{% if 'red' in colors %}
One of the colors is red.
{% endif -%}
{% endraw %}
</code>
</pre>

```
One of the colors is red.
```

You can also negate that test with `not in`:

<pre>
<code class="language-twig">
{% raw %}
{% set colors = ['blue','green','red'] %}
{% if 'orange' not in colors %}
Orange is not one of the colors.
{% endif -%}
{% endraw %}
</code>
</pre>

```
Orange is not one of the colors.
```

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/conditional-logic/" class="prev">&lt; Conditional Logic</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/loops/" class="prev">Loops &gt;</a>
	</div>
</div>
<div class="clear"></div>