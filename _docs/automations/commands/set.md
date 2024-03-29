---
title: "Automations: set"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/set/
toc:
  title: set
  expand: Automations
jumbotron:
  title: set
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **set:** command associates a value with a placeholder key.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    name: Kina
    title: Customer Support Manager
  return:
    output@text:
      {{name}} is a {{title}}
{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
output: Kina is a Customer Support Manager
</code>
</pre>

# Syntax

One or more key/value pairs may be children of the `set:` command.

### Sequential keys

You can refer to any keys set above the current one.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    a@int: 2
    b@int: {{a*2}}
    c@int: {{b*2}}
  return:
    answer@int: {{a + b + c}}{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
answer: 14
</code>
</pre>

### Dictionaries

A [dictionary](/docs/automations/#dictionaries) may be provided as the value:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    person:
      name: Kina
      role:
        title: Customer Support Manager
  return:
    output@text:
      {{person.name}} is a {{person.role.title}}{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
output: Kina is a Customer Support Manager
</code>
</pre>

### Paths

You can set a value using a key path with the [var.set](/docs/automations/commands/var.set/) command.
