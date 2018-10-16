---
title: Formatting prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/formatting/
toc:
  title: Formatting
jumbotron:
  title: Formatting
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Interactions &raquo;
    url: /docs/bots/interactions/
  -
    label: Prompts &raquo;
    url: /docs/bots/interactions/prompts/
---

You can **format** a user's response to a [prompt](/docs/bots/interactions/prompts/) before [validating](/docs/bots/interactions/prompts/validation/) or saving it.

The formatting template has access to all of Cerb's [scripting](/docs/bots/scripting/) functionality.

## Format a number

This formats a number, removing thousands separators and decimal places:

<pre>
<code class="language-twig">
{% raw %}
{{message|replace({',':''})|number_format(0, '.', '')}}
{% endraw %}
</code>
</pre>

## Format a date as a Unix timestamp

<pre>
<code class="language-twig">
{% raw %}
{{message|date('U')}}
{% endraw %}
</code>
</pre>