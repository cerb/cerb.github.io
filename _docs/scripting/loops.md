---
title: 'Scripting Reference: Loops'
excerpt: This page provides a scripting reference for using loops in Cerb, specifically
  focusing on 'for' loops.
summary: This page provides a scripting reference for using loops in Cerb, specifically
  focusing on 'for' loops. It explains how to iterate over arrays and ranges, demonstrating
  with examples how to loop through a list of names and a range of numbers. The page
  also notes that variables defined within a loop are not accessible outside of it
  unless they are defined beforehand. Additionally, it briefly mentions operators
  and regular expressions, suggesting further topics related to scripting in Cerb.
permalink: /docs/scripting/loops/
toc:
  title: Loops
  expand: Developer Guide
jumbotron:
  title: Loops
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

# For

Arrays can be iterated with [for](/docs/scripting/commands/#for) loops:

{% highlight twig %}
{% raw %}
{% set list_of_names = ["Jeff", "Dan", "Darren"] %}
{% for name in list_of_names %}
* {{name}}
{% endfor %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
* Jeff
* Dan
* Darren
{% endhighlight %}

<div class="cerb-box note">
<p>A variable defined within a loop is not accessible outside of it. You can first define a variable before using it in the loop to change this.</p>
</div>

# Ranges

Loop through a range of values with `..`:

{% highlight twig %}
{% raw %}
{% for n in 1..5 %}
{{n}}...
{% endfor %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
1...
2...
3...
4...
5...
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/operators/" class="prev">&lt; Operators</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/regex/" class="prev">Regular Expressions &gt;</a>
	</div>
</div>
<div class="clear"></div>