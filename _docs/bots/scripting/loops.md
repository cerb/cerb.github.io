---
title: Bot Scripting Loops
excerpt: 
permalink: /docs/bots/scripting/loops/
toc:
  title: Loops
jumbotron:
  title: Loops
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Scripting &raquo;
    url: /docs/bots/scripting/
---

# For

Arrays can be iterated with [for](/docs/bots/scripting/commands/#for) loops:

<pre>
<code class="language-twig">
{% raw %}
{% set list_of_names = ["Jeff", "Dan", "Darren"] %}
{% for name in list_of_names %}
* {{name}}
{% endfor %}
{% endraw %}
</code>
</pre>

```
* Jeff
* Dan
* Darren
```

<div class="cerb-box note">
<p>A variable defined within a loop is not accessible outside of it. You can first define a variable before using it in the loop to change this.</p>
</div>

# Ranges

Loop through a range of values with `..`:

<pre>
<code class="language-twig">
{% raw %}
{% for n in 1..5 %}
{{n}}...
{% endfor %}
{% endraw %}
</code>
</pre>

```
1...
2...
3...
4...
5...
```
