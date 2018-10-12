---
title: Bot Scripting Strings
excerpt: 
permalink: /docs/bots/scripting/strings/
toc:
  title: Strings
jumbotron:
  title: Strings
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

A **string** is some text within a variable.

# Literal text

You enclose a string within single (`'`) or double (`"`) quotes.

You can modify a string with filters just like a variable:

<pre>
<code class="language-twig">
{% raw %}
{{"This is literal text"|truncate(7)}}
{% endraw %}
</code>
</pre>

```
This is...
```

# Concatenation

You can join multiple strings or variables together with `~` (tilde):

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = "Kina" %}
{% set last_name = "Halpue" %}
{% set full_name = first_name ~ " " ~ last_name %}
{{full_name}}
{% endraw %}
</code>
</pre>

```
Kina Halpue
```

# Whitespace

One issue with treating all template text as output is that you can get unintended whitespace around your commands.

You can ignore whitespace at the beginning or end of a tag with a dash (`-`):

<pre>
<code class="language-twig">
{% raw %}
This text

{{-" has no leading or trailing whitespace "-}}

in it.
{% endraw %}
</code>
</pre>

```
This text has no leading or trailing whitespace in it.
```
