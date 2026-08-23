---
title: 'Scripting Reference: Operators'
excerpt: This page serves as a scripting reference for operators in Cerb, detailing
  how to use various operators to perform comparisons and assignments in expressions.
summary: This page serves as a scripting reference for operators in Cerb, detailing
  how to use various operators to perform comparisons and assignments in expressions.
  It covers assignment with the `=` operator, equality checks with `==`, inequality
  with `!=`, and comparisons using `<`, `<=`, `>`, and `>=`. Additionally, it explains
  how to check for the presence of a value in a list using `in` and `not in`. The
  page provides code examples for each operator to illustrate their usage in practical
  scenarios.
permalink: /docs/scripting/operators/
toc:
  title: Operators
  expand: Developer Guide
jumbotron:
  title: Operators
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

An **operator** makes comparisons between two values in an expression.

# Assignment

As you've seen with the [set](/docs/scripting/commands/#set) command, a single `=` (equals) character _assigns_ a value to a variable:

{% highlight twig %}
{% raw %}
{% set this = 0 %}
{% set that = 1 %}
this is {{this}} and that is {{that}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
this is 0 and that is 1
{% endhighlight %}

# Equals

To check if a variable is equal to a specific value, use two equal signs (`==`):

{% highlight twig %}
{% raw %}
{% set this = 1 %}
{% set that = 1 %}
{% if this == that %}
This and that are equal.
{% endif -%}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This and that are equal.
{% endhighlight %}

# Doesn't equal

To check that a variable isn't equal to a specific value, use `!=`:

{% highlight twig %}
{% raw %}
{% set this = 0 %}
{% set that = 1 %}
{% if this != that %}
This doesn't equal that.
{% endif -%}
{% endraw %}
{% endhighlight %}

{% highlight text %}
This doesn't equal that.
{% endhighlight %}

# Less than

To check if one variable is less than another, use `<` or `<=`:

{% highlight twig %}
{% raw %}
{% set little = 5 %}
{% set big = 1000 %}
{% if little < big %}
{{little}} is less than {{big}}
{% endif -%}
{% endraw %}
{% endhighlight %}

{% highlight text %}
5 is less than 1000
{% endhighlight %}

# Greater than

To check if one variable is greater than another, use `>` or `>=`:

{% highlight twig %}
{% raw %}
{% set little = 5 %}
{% set big = 1000 %}
{% if big > little %}
{{big}} is greater than {{little}}
{% endif -%}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1000 is greater than 5
{% endhighlight %}

# Value in list

You can check if a value exists in a list by using the `in` operator:

{% highlight twig %}
{% raw %}
{% set colors = ['blue','green','red'] %}
{% if 'red' in colors %}
One of the colors is red.
{% endif -%}
{% endraw %}
{% endhighlight %}

{% highlight text %}
One of the colors is red.
{% endhighlight %}

You can also negate it with the `not in` operator:

{% highlight twig %}
{% raw %}
{% set colors = ['blue','green','red'] %}
{% if 'orange' not in colors %}
Orange is not one of the colors.
{% endif -%}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Orange is not one of the colors.
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/conditional-logic/" class="prev">&lt; Conditional Logic</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/loops/" class="prev">Loops &gt;</a>
	</div>
</div>
<div class="clear"></div>