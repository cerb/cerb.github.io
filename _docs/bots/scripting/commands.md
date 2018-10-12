---
title: "Bot Scripting Reference: Commands"
excerpt: A reference of the template commands in bot scripting.
permalink: /docs/bots/scripting/commands/
toc:
  title: Commands
jumbotron:
  title: "Reference: Commands"
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

These commands are available in bot scripts and snippets:

* TOC
{:toc}

## do

Evaluate a variable or expression without outputting anything:

<pre>
<code class="language-twig">
{% raw %}
{% do "This won't print" %}
{% endraw %}
</code>
</pre>

This is primarily useful for expanding placeholders in dictionaries before serializing the object to [JSON](/docs/bots/scripting/#json) or [XML](/docs/bots/scripting/#xml):

<pre>
<code class="language-twig">
{% raw %}
{% do ticket_custom_ %}
{% endraw %}
</code>
</pre>

## filter

Apply the given filters to the enclosed block of text:

<pre>
<code class="language-twig">
{% raw %}
{% filter upper %}
All of this text will be uppercase.
{% endfilter %}
{% endraw %}
</code>
</pre>

```
ALL OF THIS TEXT WILL BE UPPERCASE.
```

## for

Arrays can be iterated with **for** loops:

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

## if

Conditional logic can display different content based on the result of any number of **expressions**:

<pre>
<code class="language-twig">
{% raw %}
{% set sla_expiration = '+2 weeks'|date('U') %}
{% if sla_expiration >= 'now'|date('U') %}
Your SLA coverage is active.
{% else %}
Your SLA coverage has expired.
{% endif %}
{% endraw %}
</code>
</pre>

```
Your SLA coverage is active.
```

## set

You can make your own variables in a template using the **set** command:

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


## spaceless

Remove whitespace between HTML tags in the enclosed block of text with **spaceless**:

<pre>
<code class="language-twig">
{% raw %}
{% spaceless %}
&lt;div&gt;
  &lt;span&gt;This will all be on a single line.&lt;/span&gt;
&lt;/div&gt;
{% endspaceless %}
{% endraw %}
</code>
</pre>

```
<div><span>This will all be on a single line.</span></div>
```

<div class="cerb-box note">
<p>This is also useful when you're using a lot of template commands (if, for) to mark up text. You won't have to add <tt>-</tt> to every tag.</p>
</div>

## verbatim

You can avoid parsing template syntax by enclosing the code in **verbatim** tags:

<pre>
<code class="language-twig">
{% raw %}
{% verbatim %}
You can print a variable by typing {{variable_name}}
{% endverbatim %}
{% endraw %}
</code>
</pre>

```
You can print a variable by typing {%raw %}{{variable_name}}{% endraw %}
```

## with

Create a separate variable scope using the **with** command:

<pre>
<code class="language-twig">
{% raw %}
{% with %}
{% set name = 'Kina' -%}
Hi, {{name}}!
{% endwith %}
{% if name is empty %}
Where did you go?
{% endif %}
{% endraw %}
</code>
</pre>

```
Hi, Kina!
Where did you go?
```
