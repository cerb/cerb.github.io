---
title: Validating prompts in interactive bot behaviors
excerpt: 
permalink: /docs/bots/interactions/prompts/validation/
toc:
  title: Validation
jumbotron:
  title: Validation
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

You can **validate** a user's response to a [prompt](/docs/bots/interactions/prompts/) by running multiple tests using [bot scripting](/docs/bots/scripting/).

Any output from this template is considered to be an error that will be displayed to the user.

Cerb will take care of automatically repeating your prompt for you until valid input is given.

When the template returns no output, the response is considered to be valid and Cerb will save it to your placeholder.

## Validate a date

<pre>
<code class="language-twig">
{% raw %}
{% set ts = message|date('U') %}
{% if 0 == ts %}
Please enter a valid date. For instance, "Friday noon".
{% elseif ts < 'now'|date('U') %}
Please enter a date in the future.
{% endif %}
{% endraw %}
</code>
</pre>

## Validate a number within a range

<pre>
<code class="language-twig">
{% raw %}
{% if message is not numeric %}
Please enter a valid number.
{% elseif message < 1 or message > 100 %}
The number must be between 1 and 100.
{% endif %}
{% endraw %}
</code>
</pre>

## Validate an email address

<pre>
<code class="language-twig">
{% raw %}
{% set email = message|parse_emails|first %}
{% if message is empty %}
Please enter an email address.
{% elseif email.host == 'localhost' %}
Please enter a valid email address.
{% endif %}
{% endraw %}
</code>
</pre>