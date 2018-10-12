---
title: Bot Scripting Variables
excerpt: 
permalink: /docs/bots/scripting/variables/
toc:
  title: Variables
jumbotron:
  title: Variables
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

Let's assume that you want to change the output of a [template](/docs/bots/scripting/) depending on who you are talking to.

This can be accomplished with **variables**.  A variable is a special token that is substituted with the current value of a particular piece of information.

Assuming we had a variable named `first_name`, we could write:

<pre>
<code class="language-twig">
{% raw %}
Hello, {{first_name}}!
{% endraw %}
</code>
</pre>

This will output something like:

```
Hello, Kina!
```

<div class="cerb-box note">
<p>A variable is indicated by a pair of double curly braces around the variable's name.</p>
</div>

# Creating variables

You can make your own variables in a template using the [set](/docs/bots/scripting/commands/#set) command:

<pre>
<code class="language-twig">
{% raw %}
{% set name = "Kina" %}
{% set quantity = 5 %}
{{name}} has {{quantity}} gold stars.
{% endraw %}
</code>
</pre>

```
Kina has 5 gold stars.
```

Variables are temporary. When you define a new variable in one action, it can't be referenced from other actions.  In programmer parlance, the **scope** of a variable is limited to the same template.

In the next section we'll introduce [placeholders](/docs/bots/scripting/placeholders/), which retain their value between different templates on the same behavior.

# Modifying variables with filters

The value of a variable may be modified by appending [filters](/docs/bots/scripting/filters/) with a  pipe (`|`) character.

When editing actions on a bot behavior, the possible filters are automatically suggested when you type `|` after a variable name.

For example, we can use the [upper](/docs/bots/scripting/filters/#upper) filter to display a variable's value in uppercase:

<pre>
<code class="language-twig">
{% raw %}
Hi, {{first_name|upper}}!
{% endraw %}
</code>
</pre>

```
Hi, KINA!
```

# Default values

You can use the [default](/docs/bots/scripting/filters/#default) filter to give a default value to empty variables:

<pre>
<code class="language-twig">
{% raw %}
{% set name = '' %}
Hi {{name|default('there')}}
{% endraw %}
</code>
</pre>

```
Hi there
```

# Stacking filters

You can send the output from one filter as the input to another filter:

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = null %}
Hi, {{first_name|default('there')|upper}}!
{% endraw %}
</code>
</pre>

```
Hi, THERE!
```
